<?php
    class Credito extends DB {
    private $idCredito;
    private $idRegistroVentas;
    private $fechaLimite;
    private $montoCredito;
    private $montoFinal;
    private $status;
       
   function __construct($id=null,$id_rv=null,$fecha_limite=null,$monto_credito=null,$monto_final=null,$status=null){
        $this->id = $id;
        $this->id_rv = $id_rv;
        $this->fecha_limite = $fecha_limite;
        $this->monto_credito = $monto_credito;
        $this->monto_final = $monto_final;
        $this->status = $status;


        DB::__construct();
    }

    function agregar($usuario){
        $query = $this->conn->prepare("INSERT INTO credito (idRegistroVentas, fechaLimite, montoCredito, montoFinal, status) VALUES(:idRegistroVentas, :fechaLimite, :montoCredito, :montoFinal, 1)");
        $query->bindParam(':idRegistroVentas',$this->idRegistroVentas, PDO::PARAM_INT);
        $query->bindParam(':fechaLimite',$this->fechaLimite, PDO::PARAM_STR);
        $query->bindParam(':montoCredito',$this->montoCredito, PDO::PARAM_STR);
        $query->bindParam(':montoFinal',$this->montoFinal, PDO::PARAM_STR);
        $query->execute();
        $this->add_bitacora($usuario,"Credito","Registrar","Credito Registrado");
    }

    function desactivar($usuario){
        $query = $this->conn->prepare('UPDATE credito SET status=0 WHERE idCredito=:idCredito');
        $query->bindParam(':idCredito',$this->idCredito);
        $query->execute();
        $this->add_bitacora($usuario,"Credito","Desactivado","Credito".$this->idCredito." Eliminado");
    }

    function actualizar($usuario){
        $query = $this->conn->prepare("UPDATE credito SET fechaLimite=:fechaLimite, idRegistroVentas=:idRegistroVentas, montoCredito=:montoCredito, montoFinal=:montoFinal, status=:status WHERE idCredito=:idCredito");
        $query->bindParam(':fechaLimite',$this->fechaLimite, PDO::PARAM_STR);
        $query->bindParam(':idRegistroVentas',$this->idRegistroVentas, PDO::PARAM_INT);
        $query->bindParam(':montoCredito',$this->montoCredito, PDO::PARAM_STR);
        $query->bindParam(':montoFinal',$this->montoFinal, PDO::PARAM_STR);
        $query->bindParam(':status',$this->status, PDO::PARAM_INT);
        $query->bindParam(':idCredito',$this->idCredito, PDO::PARAM_INT);
        $query->execute();
        $this->add_bitacora($usuario,"Credito","Modificar","Credito Modificado");
    }

    function COUNT(){
        return $this->conn->query("SELECT COUNT(*) as 'total' FROM credito")->fetch()['total'];
    }

    function pagar($usuario,$pagos){
        $query = $this->conn->prepare("UPDATE credito SET status=0 WHERE idCredito=:idCredito");
        $query->bindParam(':idCredito',$this->idCredito);
        $query->execute();
        
        for ($i = 0; $i < count($pagos); $i++) {
            $lista = $pagos[$i];
            $clase_f = new Pago(null, $this->idRegistroVentas, $lista["metodo"], $lista['monto']);
            $clase_f->agregar($usuario);
        }
        $this->add_bitacora($usuario,"Credito","Pagar","Credito".$this->idCredito." Pagado");
    }

    function search($n=0,$limite=9){
        $query = "SELECT 
        cr.idCredito,
        rv.id idRegistroVentas,
        rv.fecha fecha_inicio,
        cr.fechaLimite,
        cr.montoCredito,
        cr.montoFinal,
        c.nombre,
        c.apellido,
        cr.status
        FROM credito cr
        INNER JOIN registro_ventas rv ON cr.idRegistroVentas = rv.id
        INNER JOIN caja j ON rv.id_caja = j.id
        INNER JOIN usuarios u ON j.id_usuario = u.id
        INNER JOIN clientes c ON rv.id_cliente = c.id
        WHERE 1
        ";

        if ($this->idCredito != null){
            $query = $query." and cr.idCredito=:idCredito";
        }
        $n = $n*$limite;
        

        $query = $query . " LIMIT :l OFFSET :n";
        $consulta = $this->conn->prepare($query);


        $consulta->bindParam(':l',$limite, PDO::PARAM_INT);
        $consulta->bindParam(':n',$n, PDO::PARAM_INT);
        
        if ($this->idCredito != null){
            $consulta->bindParam(':idCredito',$this->idCredito, PDO::PARAM_INT);
        }
        $consulta->execute();
        return $consulta->fetchAll();
    }
}
?>