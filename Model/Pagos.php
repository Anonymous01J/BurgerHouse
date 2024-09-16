<?php
	class Pago extends DB {
	    private $idPagos;
	    private $idRegistroVentas;
	    private $idMetodoPago;
	    private $monto;
	    private $fecha;

	    function __construct($idPagos=null, $idRegistroVentas=null, $idMetodoPago=null, $monto=null, $fecha=null){
	        DB::__construct();
	        $this->idPagos = $idPagos;
	        $this->idRegistroVentas = $idRegistroVentas;
	        $this->idMetodoPago = $idMetodoPago;
	        $this->monto = $monto;
	        $this->fecha = $fecha;
	    }

	    function agregar($usuario){
	        $query = $this->conn->prepare('INSERT INTO pagos (idRegistroVentas,idMetodoPago,monto,fecha) VALUES (:idRegistroVentas,:idMetodoPago,:monto,:fecha)');
	        $query->bindParam(':idRegistroVentas',$this->idRegistroVentas);
	        $query->bindParam(':idMetodoPago',$this->idMetodoPago);
	        $query->bindParam(':monto',$this->monto);
	        $query->bindParam(':fecha',$this->fecha);
	        $query->execute();
	    }

	    function search($n=0, $limite=9, $order=' p.idPagos DESC '){
	        $query = "SELECT
	        p.monto as monto,
	        mp.nombre as metodo,
	        rv.fecha as fecha_pago
	        FROM pagos as p
	        JOIN metodo_pago as mp ON mp.idMetodoPago=p.idMetodoPago
	        JOIN registroventas as rv ON rv.idRegistroVentas=p.idRegistroVentas
	        WHERE 1
	        "; 

	        $lista = [];

	        if ($this->idPagos != null){
	            array_push($lista,'idPagos');
	        }
	        if ($this->idMetodoPago != null){
	            array_push($lista, 'idMetodoPago');
	        }
	        if ($this->idRegistroVentas != null){
	            array_push($lista, 'idRegistroVentas');
	        }
	        if ($lista) {
	            foreach ($lista as $e){
	                $query .= ' AND p.'.$e.'=:'.$e;
	            }
	        }
	        $query .= " ORDER BY $order  LIMIT :l OFFSET :n";
	        $query = $this->conn->prepare($query);

	        $n = $n*$limite;
	        $query->bindParam(':l', $limite, PDO::PARAM_INT);
	        $query->bindParam(':n', $n, PDO::PARAM_INT);
	        if ($this->idPagos != null) {
	            $query->bindParam(':idPagos', $this->idPagos, PDO::PARAM_INT);
	        }
	        if ($this->idMetodoPago != null){
	            $query->bindParam(':idMetodoPago', $this->idMetodoPago, PDO::PARAM_INT);
	        }
	        if ($this->idRegistroVentas != null){
	            $query->bindParam(':idRegistroVentas', $this->idRegistroVentas, PDO::PARAM_INT);
	        }

	        $query->execute();
	        return $query->fetchAll();
	    }
	}
?>