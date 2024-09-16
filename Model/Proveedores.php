<?php
    class Proveedor extends DB{
        private $idProvedor;
        private $nombre;
        private $razonSocial;
        private $rif;
        private $telefono;
        private $correo;
        private $active;
        private $like;

        function __construct($idProvedor=null, $nombre=null, $razonSocial=null, $rif=null, $telefono=null, $correo=null, $active=null, $like=''){
            DB::__construct();
            $this->idProvedor = $idProvedor;
            $this->nombre = $nombre;
            $this->razonSocial = $razonSocial;
            $this->rif = $rif;
            $this->telefono = $telefono;
            $this->correo = $correo;
            $this->active = $active;
            $this->like = $like;
        }

        function agregar($usuario) {
            $query = $this->conn->prepare("INSERT INTO proveedores VALUES(null, :nombre, :razon, :rif, :tel, :correo, 1)");

            $query->bindParam(':nombre',$this->nombre);
            $query->bindParam(':razon',$this->razonSocial);
            $query->bindParam(':rif',$this->rif);
            $query->bindParam(':tel',$this->telefono);
            $query->bindParam(':correo',$this->correo);
            $query->execute();
            $this->add_bitacora($usuario,"Proveedores","Registrar","Proveedor Registrado");
        }

        function desactivar($usuario) {
            $query = $this->conn->prepare('UPDATE proveedores SET active=0 WHERE idProvedor=:id');

            $query->bindParam(':id',$this->idProvedor);
            $query->execute();
            $this->add_bitacora($usuario,"Proveedor","Desactivado","Proveedor".$this->idProvedor." Eliminado");
        }

        function actualizar($usuario) {
            $query = $this->conn->prepare("UPDATE proveedores SET nombre=:nombre, razonSocial=:razon, rif=:rif, telefono=:tel, correo=:correo WHERE idProvedor=:id");

            $query->bindParam(':nombre',$this->nombre);
            $query->bindParam(':razon',$this->razonSocial);
            $query->bindParam(':rif',$this->rif);
            $query->bindParam(':tel',$this->telefono);
            $query->bindParam(':correo',$this->correo);
            $query->bindParam(':id',$this->idProvedor);
            $query->execute();
            $this->add_bitacora($usuario,"Proveedor","Modificar","Proveedor ".$this->idProvedor." Modificado");
        }

        // Con esta otra funcion se busca entre los productos en la base de datos
        function search($n=0,$limite=9){
            $query = "SELECT * FROM proveedores WHERE razonSocial LIKE :como";

            if ($this->idProvedor != null){
                $query = $query." AND idProvedor=:id";
            }
            if ($this->active != null){
                $query = $query." AND active=:active ";
            }
            $n = $n*$limite;

            $query = $query . " LIMIT :l OFFSET :n";

            $consulta = $this->conn->prepare($query);

            $consulta->bindParam(':l',$limite, PDO::PARAM_INT);
            $consulta->bindParam(':n',$n, PDO::PARAM_INT);
            $this->like = '%'.$this->like.'%';
            $consulta->bindParam(':como',$this->like, PDO::PARAM_STR);

            if ($this->idProvedor != null){
                $consulta->bindParam(':id',$this->idProvedor, PDO::PARAM_INT);
            }
            if ($this->active != null){
                $consulta->bindParam(':active',$this->active, PDO::PARAM_STR);
            }

            $consulta->execute();
            return $consulta->fetchAll();
        }
                
        function COUNT(){
            $query = $this->conn->prepare("SELECT COUNT(*) as 'total' FROM proveedores");
            $query->execute();
            return $query->fetch()['total'];
        }
    }
?>