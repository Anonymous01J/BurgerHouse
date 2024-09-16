<?php
	class Unidad extends DB {
	    private $idUnidad;
	    private $nombre;

	    function __construct($idUnidad=null, $nombre=null){
	        DB::__construct();
	        $this->idUnidad = $idUnidad;
	        $this->nombre = $nombre;
	    }

	    function search($n=0, $limite=9){
	        $query = "SELECT * FROM unidades";
	        return $this->conn->query($query)->fetchAll();
	    }

	    function agregar($usuario){
	        $query = $this->conn->prepare('INSERT INTO unidades (nombre) VALUES (:nombre)');
	        $query->bindParam(':nombre',$this->nombre);
	        $query->execute();
	        $this->add_bitacora($usuario,"Unidades","Registrar","Unidad Registrada");
	    }

	    function borrar($usuario){
	        $query = $this->conn->prepare('DELETE FROM unidades WHERE idUnidad = :id');
	        $query->bindParam(':id',$this->idUnidad);
	        $query->execute();
	        $this->add_bitacora($usuario,"Unidades","Eliminar","Unidad".$this->idUnidad." Eliminada");
	    }

	    function actualizar($usuario){
	        $query = 'UPDATE unidades SET nombre=:nombre WHERE idUnidad=:id';
	        $query = $this->conn->prepare($query);
	        $query->bindParam(':nombre',$this->nombre);
	        $query->bindParam(':id',$this->idUnidad);
	        $query->execute(); 
	        $this->add_bitacora($usuario,"Unidades","Modificar","Unidad ".$this->idUnidad." Modificada");
	    }

	    function COUNT(){
	        $query = $this->conn->query("SELECT COUNT(*) as 'total' FROM unidades");
	        return $query->fetch()['total'];
	    }
	}
?>