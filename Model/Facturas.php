<?php
    class Factura extends DB {
        
        private $idFactura;
        private $idRegistroVentas;
        private $idProducto;
        private $cantidad;
        private $descripcion;
        private $costeTotal;

        function __construct($idFactura = null, $idRegistroVentas = null, $idProducto = null, $cantidad = null, $descripcion = null, $costeTotal = null){
            $this->idFactura = $idFactura;
            $this->idRegistroVentas = $idRegistroVentas;
            $this->idProducto = $idProducto;
            $this->cantidad = $cantidad;
            $this->descripcion = $descripcion;
            $this->costeTotal = $costeTotal;
            DB::__construct();
        }

        function search($n=0,$limite=9, $order=' f.idFactura ASC '){
            $query = "SELECT
            f.*,
            rv.fecha as fecha,
            p.nombre as nombre_producto,
            cl.nombre as cliente_nombre,
            cl.apellido as cliente_apellido,
            cl.documento as cliente_documento,
            cl.cedula as cliente_cedula,
            u.nombre as vendedor
            FROM facturas as f 
            JOIN registroventas as rv ON rv.idRegistroVentas=f.idRegistroVentas
            JOIN caja as ca ON ca.id=rv.idCaja
            JOIN productos as p ON p.idProducto=f.idProducto
            JOIN clientes as cl ON cl.id=rv.idCliente
            JOIN usuarios as u ON u.id=ca.id_usuario
            "; 

            $lista = [];

            if ($this->idFactura != null){
                array_push($lista,'idFactura');
            }
            if ($this->idRegistroVentas != null){
                array_push($lista, 'idRegistroVentas');
            }
            if ($lista) {
                foreach ($lista as $e){
                    $query .= ' AND f.'.$e.'=:'.$e;
                }
            }
            $query .= " ORDER BY $order  LIMIT :l OFFSET :n";

            $query = $this->conn->prepare($query);

            $query->bindParam(':l', $limite, PDO::PARAM_INT);
            $query->bindParam(':n', $n, PDO::PARAM_INT);
            if ($this->idFactura != null) {
                $query->bindParam(':idFactura', $this->idFactura, PDO::PARAM_INT);
            }
            if ($this->idRegistroVentas != null){
                $query->bindParam(':idRegistroVentas', $this->idRegistroVentas, PDO::PARAM_INT);
            }

            $query->execute();
            return $query->fetchAll();
        }

        function search_mountFact(){
            $query = $this->conn->prepare("SELECT montoFinal - IVA AS subtotal,IVA,montoFinal FROM registroventas WHERE idRegistroVentas = :idRegistroVentas");
            $query->bindParam(':idRegistroVentas', $this->idRegistroVentas);
            $query->execute();
            return $query->fetchAll();
        }

        function agregar(){
            $query = $this->conn->prepare("INSERT INTO facturas VALUES(null, :idRegistroVentas, :idProducto, :cantidad, :descripcion, :costeTotal)");
            $query->bindParam(':idRegistroVentas', $this->idRegistroVentas);
            $query->bindParam(':idProducto', $this->idProducto);
            $query->bindParam(':cantidad', $this->cantidad);
            $query->bindParam(':descripcion', $this->descripcion);
            $query->bindParam(':costeTotal', $this->costeTotal);
            $query->execute();
        }

        function borrar(){
            if ($this->id_registro_ventas) {
                $query = $this->conn->prepare("DELETE FROM entradas WHERE id_registro_ventas=:id_registro");
                $query->bindParam(':id_registro', $this->id_registro_ventas);
                $query->execute();
            } else {
                throw new Exception("Error, debe pasar el id del registro asociado", 1);
            }
        }

        function search_pagos(){
            $query = $this->conn->prepare("SELECT 
            m.nombre,
            p.monto
            FROM pagos p
            INNER JOIN metodo_pago m ON m.id = p.id_metodo_pago
            INNER JOIN registroventas r ON p.id_venta = r.idRegistroVentas
            WHERE r.idRegistroVentas = :idRegistroVentas");

            $query->bindParam(':idRegistroVentas', $this->idRegistroVentas);
            $query->execute();
            return $query->fetchAll();
        }

        function search_ProductFact(){
            $query = $this->conn->prepare("
                        SELECT cantidad,
                        (SELECT nombre FROM productos WHERE facturas.idProducto = idProducto) AS descripcion, 
                        (costeTotal / cantidad) AS valor_unit, 
                        cantidad * (SELECT precio FROM productos WHERE facturas.idProducto = idProducto) AS Total 
                        FROM facturas WHERE idRegistroVentas = :idRegistroVentas");
            $query->bindParam(':idRegistroVentas', $this->idRegistroVentas);
            $query->execute();
            return $query->fetchAll();
        }
    }
?>