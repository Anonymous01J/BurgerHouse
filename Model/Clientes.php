<?php

class Cliente extends DB {
    private $idCliente;
    private $nombre;
    private $cedula;
    private $telefono;
    private $like_nombre;
    private $like_cedula;

    function __construct($idCliente=null, $nombre=null,$cedula=null,$telefono=null,$like_nombre='',$like_cedula=''){
        $this->idCliente = $idCliente;
        $this->nombre = $nombre;
        $this->cedula = $cedula;
        $this->telefono = $telefono;
        $this->like_nombre = $like_nombre;
        $this->like_cedula = $like_cedula;
        DB::__construct();
    }

    function agregar($usuario){
        $query = $this->conn->prepare("INSERT INTO clientes (nombre, cedula, telefono) VALUES(:nombre, :cedula, :telefono)");
        $query->bindParam(':nombre',$this->nombre, PDO::PARAM_STR);
        $query->bindParam(':cedula',$this->cedula, PDO::PARAM_STR);
        $query->bindParam(':telefono',$this->telefono, PDO::PARAM_STR);
        $query->execute();
        $this->add_bitacora($usuario,"Cliente","Registrar","Cliente Registrado");
    }

    function desactivar($usuario){
        $query = $this->conn->prepare('UPDATE clientes SET active=0 WHERE idCliente=:idCliente');
        $query->bindParam(':idCliente',$this->idCliente);
        $query->execute();
        $this->add_bitacora($usuario,"Cliente","Eliminar","Cliente".$this->idCliente." Eliminado");
    }

    function actualizar($usuario){
        $query = $this->conn->prepare("UPDATE clientes SET nombre=:nombre, cedula=:cedula,telefono=:telefono WHERE idCliente=:idCliente");
        $query->bindParam(':nombre',$this->nombre);
        $query->bindParam(':cedula',$this->cedula);
        $query->bindParam(':telefono',$this->telefono);
        $query->bindParam(':idCliente',$this->idCliente);
        $this->add_bitacora($usuario,"Cliente","Modificar","Cliente ".$this->idCliente." Modificado");
        return $query->execute(); 
    }

    function search($n=0,$limite=9){
        $query = "SELECT * FROM clientes WHERE 
        nombre LIKE :like_nombre AND 
        cedula LIKE :like_cedula";

        if ($this->idCliente != null){
            $query = $query." AND idCliente=:idCliente";
        }
        $n = $n*$limite;
            

        $query = $query . " LIMIT :l OFFSET :n";
        $consulta = $this->conn->prepare($query);

                
        $consulta->bindParam(':l',$limite, PDO::PARAM_INT);
        $consulta->bindParam(':n',$n, PDO::PARAM_INT);
                
        $this->like_nombre = '%'.$this->like_nombre.'%';
        $consulta->bindParam(':like_nombre',$this->like_nombre, PDO::PARAM_STR);
                
        $this->like_cedula = '%'.$this->like_cedula.'%';
        $consulta->bindParam(':like_cedula',$this->like_cedula, PDO::PARAM_STR);

        if ($this->idCliente != null){
?>