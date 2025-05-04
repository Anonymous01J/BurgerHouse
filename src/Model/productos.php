<?php
    namespace Shtch\burgerhouse\Model;
    use Shtch\burgerhouse\Model\Conexion;
    require_once 'conexion.php';

    class Productos extends Conexion {
        private $id;
        private $id_categoria;
        private $nombre;
        private $imagen;
        private $precio;
        private $detalles;
        private $active;
        private $id_receta;

        function __construct($id = null, $id_categoria = null, $nombre = null, $imagen = null, $precio = null, $detalles = null, $active = 1, $id_receta = null) {
            $this->id = $id;
            $this->id_categoria = $id_categoria;
            $this->nombre = $nombre;
            $this->imagen = $imagen;
            $this->precio = $precio;
            $this->detalles = $detalles;
            $this->active = $active;
            $this->id_receta = $id_receta;
            parent::__construct();
        }

        public function search() {
            $search_sql = "SELECT * FROM productos WHERE active = 1";
            $stmt = $this->conn->prepare($search_sql);
            $stmt->execute();
            return $stmt->fetchAll();
        }
    }
?>