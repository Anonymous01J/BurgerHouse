<?php
    class Metodo_pago extends DB{
        private $idMetodoPago;
        private $nombre;
        private $active;

        function __construct($idMetodoPago=null, $nombre=null, $active=null){           
            $this->idMetodoPago = $idMetodoPago;
            $this->nombre = $nombre;
            $this->active = $active;
            DB::__construct();

        }

        function agregar($usuario){
            $query = $this->conn->prepare("INSERT INTO metodopago VALUES(null, :nombre, 1)");
            $query->bindParam(':nombre', $this->nombre);
            $query->execute();
            $this->add_bitacora($usuario,"Metodos de Pago","Registrar","Metodo de Pago Registrado");
        }

        function desactivar($usuario){
            $query = $this->conn->prepare('UPDATE metodopago SET active=0 WHERE idMetodoPago=:id');
            $query->bindParam(':id', $this->idMetodoPago);
            $query->execute();
            $this->add_bitacora($usuario,"Metodo de Pago","Eliminar","Metodo de Pago".$this->idMetodoPago. " Eliminado");
        }
        function search($n=0,$limite=9){
            $query = "SELECT * FROM metodopago";

            if ($this->idMetodoPago != null){
                $query = $query." WHERE idMetodoPago=:id";
            }
            $n = $n*$limite;
            

            $query = $query . " LIMIT :l OFFSET :n";
            $consulta = $this->conn->prepare($query);


            $consulta->bindParam(':l', $limite, PDO::PARAM_INT);
            $consulta->bindParam(':n', $n, PDO::PARAM_INT);
            
            if ($this->idMetodoPago != null){
                $consulta->bindParam(':id', $this->idMetodoPago, PDO::PARAM_INT);
            }
            $consulta->execute();
            return $consulta->fetchAll();
        }
        function actualizar($usuario){
            $query = 'UPDATE metodopago SET nombre=:nombre WHERE idMetodoPago=:id';
            $query = $this->conn->prepare($query);
            $query->bindParam(':nombre', $this->nombre);
            $query->bindParam(':id', $this->idMetodoPago);
            $query->execute();
			$this->add_bitacora($usuario,"Metodo de Pago","Modificar","Metodo de Pago ".$this->id." Modificado");
        }

        function COUNT(){
            return $this->conn->query("SELECT COUNT(*) 'total' FROM metodo_pago")->fetch()['total'];
        }
    }
?>