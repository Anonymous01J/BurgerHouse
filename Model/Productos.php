<?php 
    class Producto extends DB{
        private $idProducto;
        private $idCategoria;
        private $nombre;
        private $detalles;
        private $imagen;
        private $precio;
        private $active;
        
        function __construct($idProducto=null, $idCategoria=null, $nombre=null, $detalles=null, $imagen=null, $precio=null, $active=null){
            DB::__construct();
            $this->idProducto = $idProducto;
            $this->idCategoria = $idCategoria;
            $this->nombre = $nombre;
            $this->detalles = $detalles;
            $this->imagen = $imagen;
            $this->precio = $precio;
            $this->active = $active;
        }
        // esta funcion agrega a la tabla productos un objeto con los valores que se le estan pasando
        function agregar(){
            $query = $this->conn->prepare("INSERT INTO productos VALUES(null, :idCategoria, :nombre, :detalles, :imagen, :precio, 1)");
            $query->bindParam(':idCategoria',$this->idCategoria);
            $query->bindParam(':nombre',$this->nombre);
            $query->bindParam(':detalles',$this->detalles);
            $query->bindParam(':imagen',$this->imagen);
            $query->bindParam(':precio',$this->precio);
            return $query->execute();
        }

        function toggle_active() {
            $query = $this->conn->prepare('UPDATE productos SET active=(NOT active) WHERE idProducto=:id');
            $query->bindParam(':id',$this->idProducto);
            $query->execute();
        }

        function borrar() {
            $query = $this->conn->prepare('DELETE FROM productos WHERE idProducto=:id');
            $query->bindParam(':id',$this->idProducto);
            $query->execute();
        }

        // Con esta funcion podremos cambiar un producto segun su ID con los valores que le pasemos
        function actualizar(){
            $query = "UPDATE productos SET idCategoria=:idCategoria, nombre=:nombre, detalles=:detalles, imagen=:imagen, precio=:precio WHERE idProducto=:id";
            $query = $this->conn->prepare($query);
            $query->bindParam(':idCategoria',$this->idCategoria);
            $query->bindParam(':nombre',$this->nombre);
            $query->bindParam(':detalles',$this->detalles);
            $query->bindParam(':imagen',$this->imagen);
            $query->bindParam(':precio',$this->precio);
            $query->bindParam(':id',$this->idProducto);
            return $query->execute();
        }

        // Con esta otra funcion se busca entre los productos en la base de datos
        function search($n=0,$limite=9, $order=' nombre ASC '){
            $query = "SELECT * FROM productos WHERE 1 ";

            $lista = [];

            if ($this->idProducto){
                array_push($lista,'idProducto');
            }
            if ($this->idCategoria){
                array_push($lista, 'idCategoria');
            }
            if ($this->active){
                array_push($lista, 'active');
            }
            if ($lista) {
                foreach ($lista as $e){
                    $query .= ' AND '.$e.'=:'.$e;
                }
            }
            $query .= " ORDER BY $order  LIMIT :l OFFSET :n";
            $query = $this->conn->prepare($query);

            $n = $n*$limite;
            $query->bindParam(':l', $limite, PDO::PARAM_INT);
            $query->bindParam(':n', $n, PDO::PARAM_INT);
            if ($this->idProducto){
                $query->bindParam(':idProducto', $this->idProducto, PDO::PARAM_INT);
            }
            if ($this->idCategoria){
                $query->bindParam(':idCategoria', $this->idCategoria, PDO::PARAM_INT);
            }
            if ($this->active){
                $query->bindParam(':active', $this->active, PDO::PARAM_INT);
            }

            $query->execute();
            return $query->fetchAll();
        }


        function search_inventario(){
            $query = "SELECT p.id, p.nombre, 
                       (SELECT SUM(e.cantidad) FROM entradasmp e WHERE e.idMateriaPrima = p.idProducto) AS entradas,
                       (SELECT SUM(e.cantidad) - (SELECT SUM(e.existencia) FROM entradasmp e WHERE e.idMateriaPrima = p.idProducto) FROM entradasmp e WHERE e.idMateriaPrima = p.idProducto) AS salidas,
                       (SELECT SUM(e.existencia) FROM entradasmp e WHERE e.idMateriaPrima = p.idProducto) AS existencia,
                       p.precio_venta,
                       (SELECT SUM(e.existencia) FROM entradasmp e WHERE e.idMateriaPrima = p.idProducto) * p.precio_venta AS Total
                       FROM productos p WHERE p.active = 1";
            return $this->conn->query($query)->fetchAll();
        }

        function COUNT(){
            $query = "SELECT COUNT(*) as 'total' FROM productos WHERE 1 ";

            $lista = [];

            if ($this->idProducto){
                array_push($lista,'idProducto');
            }
            if ($this->idCategoria){
                array_push($lista, 'idCategoria');
            }
            if ($this->active){
                array_push($lista, 'active');
            }
            if ($lista) {
                foreach ($lista as $e){
                    $query .= ' AND '.$e.'=:'.$e;
                }
            }
            $query = $this->conn->prepare($query);
            if ($this->idProducto){
                $query->bindParam(':idProducto', $this->idProducto, PDO::PARAM_INT);
            }
            if ($this->idCategoria){
                $query->bindParam(':idCategoria', $this->idCategoria, PDO::PARAM_INT);
            }
            if ($this->active){
                $query->bindParam(':active', $this->active, PDO::PARAM_INT);
            }
            $query->execute();
            return $query->fetch()['total'];
        }
    }
?>