<?php
class Categoria extends DB {

    private $idCategoria;
    private $nombre;
    private $tipo;
    private $active;

    function __construct($idCategoria=null, $nombre=null, $tipo=null, $active=null){
        DB::__construct();
        $this->idCategoria = $idCategoria;
        $this->nombre = $nombre;
        $this->tipo = $tipo;
        $this->active = $active;
    }

    function agregar($usuario){
        $query = $this->conn->prepare("INSERT INTO categorias (nombre, tipo, active) VALUES (:nombre, :tipo, :active)");
        $query->bindParam(':nombre',$this->nombre);
        $query->bindParam(':tipo',$this->tipo);
        $query->bindParam(':active',$this->active);
        $query->execute();
        $this->add_bitacora($usuario,"Categorias","Registrar","Categoria Registrada");
    }

    function search($n=0,$limite=100){
        $query = "SELECT * FROM categorias";

        if ($this->idCategoria != null){
            $query = $query." WHERE idCategoria=:idCategoria";
        }
        $n = $n*$limite;

        $query = $query . " LIMIT :l OFFSET :n";

        $consulta = $this->conn->prepare($query);

        $consulta->bindParam(':l',$limite, PDO::PARAM_INT);
        $consulta->bindParam(':n',$n, PDO::PARAM_INT);
        if ($this->idCategoria != null){
            $consulta->bindParam(':idCategoria',$this->idCategoria, PDO::PARAM_INT);
        }    
        $consulta->execute();
        return $consulta->fetchAll();
    }

    function borrar($usuario){
        $query = $this->conn->prepare('DELETE FROM categorias WHERE idCategoria = :idCategoria');
        $query->bindParam(':idCategoria',$this->idCategoria);
        $query->execute();
        $this->add_bitacora($usuario,"Categorias","Eliminar","Categoria".$this->idCategoria." Eliminada");
    }

    function actualizar($usuario){
        $query = 'UPDATE categorias SET nombre=:nombre, tipo=:tipo, active=:active WHERE idCategoria=:idCategoria';
        $query = $this->conn->prepare($query);
        $query->bindParam(':nombre',$this->nombre);
        $query->bindParam(':tipo',$this->tipo);
        $query->bindParam(':active',$this->active);
        $query->bindParam(':idCategoria',$this->idCategoria);
        $query->execute(); 
        $this->add_bitacora($usuario,"Categorias","Modificar","Categoria ".$this->idCategoria." Modificada");
    }

    function COUNT(){
        return $this->conn->query("SELECT COUNT(*) 'total' FROM categorias")->fetch()['total'];
    }
}
?>