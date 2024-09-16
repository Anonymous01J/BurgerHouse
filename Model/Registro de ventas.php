<?php
	class Registro_ventas extends DB {
        private $idRegistroVentas;
        private $idCaja;
        private $idCliente;
        private $IVA;
        private $IGTF;
        private $montoFinal;
        private $montoDivisa;
        private $tasa;
        private $fecha;
        private $referenciaPago;
        private $comprobantePago;
        private $direccion;
        private $active;

        function __construct($idRegistroVentas=null, $idCaja=null, $idCliente=null, $IVA=null, $IGTF=null, $montoFinal=null, $montoDivisa=null, $tasa=null, $fecha=null, $referenciaPago=null, $comprobantePago=null, $direccion=null, $active=null){
            DB::__construct();
            $this->idRegistroVentas = $idRegistroVentas;
            $this->idCaja = $idCaja;
            $this->idCliente = $idCliente;
            $this->IVA = $IVA;
            $this->IGTF = $IGTF;
            $this->montoFinal = $montoFinal;
            $this->montoDivisa = $montoDivisa;
            $this->tasa = $tasa;
            $this->fecha = $fecha;
            $this->referenciaPago = $referenciaPago;
            $this->comprobantePago = $comprobantePago;
            $this->direccion = $direccion;
            $this->active = $active;
        }
        
		function search($n=0,$limite=9,$order='idRegistroVentas DESC'){
            $query = "SELECT 
            a.idRegistroVentas,
            a.montoFinal,
            a.fecha,
            b.nombre cliente_nombre,
            b.apellido cliente_apellido,
            b.documento cliente_documento,
            b.cedula cliente_cedula,
            d.nombre vendedor,
            a.IVA,
            c.id id_caja,
            a.active
            FROM registroventas a 
            INNER JOIN clientes b ON b.id = a.idCliente
            INNER JOIN caja c ON c.id = a.idCaja
            INNER JOIN usuarios d ON d.id = c.id_usuario
            WHERE 1";

            $lista = [];
            
            if ($this->idRegistroVentas != null){
                array_push($lista,'idRegistroVentas');
            }
            if ($this->active != null){
                array_push($lista, 'active');
            }
            if ($lista) {
                foreach ($lista as $e){
                    $query .= ' AND a.'.$e.'=:'.$e;
                }
            }

            $query .= " ORDER BY a.$order  LIMIT :l OFFSET :n";
            $query = $this->conn->prepare($query);

            $n = $n*$limite;
            $query->bindParam(':l',$limite, PDO::PARAM_INT);
            $query->bindParam(':n',$n, PDO::PARAM_INT);

            if ($this->idRegistroVentas != null){
                $query->bindParam(':idRegistroVentas',$this->idRegistroVentas, PDO::PARAM_INT);
            }
            if ($this->active != null){
                $query->bindParam(':active',$this->active, PDO::PARAM_INT);
            }

            $query->execute();
            return $query->fetchAll();
        }

        function agregar($usuario, $datos, $pagos, $credito, $fecha_inicio, $fecha_vencimiento,$monto_dolar) {
            try {

                $this->conn->beginTransaction();
                for ($i = 0; $i < count($datos); $i++) {
                    $lista = $datos[$i];
                    $clase_l = new Entrada(null, $lista->id_product, cantidad: $lista->cantidad);
                    if ($clase_l->descontar() != 1){
                        throw new Exception("Algo paso, nose", 1);
                    }
                }
                $this->conn->commit();

                $query = $this->conn->prepare("INSERT INTO registroventas (idCaja, idCliente, IVA, IGTF, montoFinal, montoDivisa, tasa, fecha, referenciaPago, comprobantePago, direccion, active) VALUES(:id1, :id2, :iva, :igt, :monto, :montoD, :tasa, :fecha, :ref, :comp, :dir, :active)");
                $query->bindParam(':id1', $this->idCaja, PDO::PARAM_INT);
                $query->bindParam(':id2', $this->idCliente, PDO::PARAM_INT);
                $query->bindParam(':iva', $this->IVA, PDO::PARAM_STR);
                $query->bindParam(':igt', $this->IGTF, PDO::PARAM_STR);
                $query->bindParam(':monto', $this->montoFinal, PDO::PARAM_STR);
                $query->bindParam(':montoD', $this->montoDivisa, PDO::PARAM_STR);
                $query->bindParam(':tasa', $this->tasa, PDO::PARAM_STR);
                $query->bindParam(':fecha', $this->fecha, PDO::PARAM_STR);
                $query->bindParam(':ref', $this->referenciaPago, PDO::PARAM_STR);
                $query->bindParam(':comp', $this->comprobantePago, PDO::PARAM_STR);
                $query->bindParam(':dir', $this->direccion, PDO::PARAM_STR);
                $query->bindParam(':active', $this->active, PDO::PARAM_STR);
                $query->execute();


                $registro = $this->search(order: 'idRegistroVentas DESC')[0];

                for ($i = 0; $i < count($datos); $i++) {
                    $lista = $datos[$i];
                    $clase_f = new Factura(null, $registro['idRegistroVentas'], $lista->id_product, $lista->cantidad, $lista->precio);
                    $clase_f->agregar();
                }

                if ($credito == true) {
                    $clase5 = new Credito(null, $registro['idRegistroVentas'], $fecha_vencimiento, $monto_dolar);
                    $clase5->agregar($usuario);
                }
                else {
                    for ($i = 0; $i < count($pagos); $i++) {
                        $lista = $pagos[$i];
                        $clase_f = new Pago(null, $registro['idRegistroVentas'], $lista->metodo, $lista->monto);
                        $clase_f->agregar($usuario);
                    }
                }

                $this->add_bitacora($usuario, "registrar_ventas", "agregar", "se agrego una venta");
                return 1;
            } catch (Exception $e) {
                $this->conn->rollBack();
                return 0;
            }
        }

        function desactivar(){
            $query = $this->conn->prepare("UPDATE registroventas SET active=0 WHERE idRegistroVentas=:id");
            $query->bindParam(':id',$this->idRegistroVentas, PDO::PARAM_INT);

            $query->execute();
        }

        function COUNT(){
            $query = $this->conn->prepare("SELECT COUNT(*) as 'total' FROM registroventas");
            $query->execute();
            return $query->fetch()['total'];
        }
	}
?>