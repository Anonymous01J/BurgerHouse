<?php
    namespace Shtch\burgerhouse\Model;
    use Shtch\burgerhouse\Model\Conexion;

    class CategoriasProductos extends Conexion {
        private $id;
        private $nombre;
        private $active;

        function __construct($id = null, $nombre = null, $active = 1) {
            $this->id = $id;
            $this->nombre = $nombre;
            $this->active = $active;
            parent::__construct();
        }

        public function search() {
            $search_sql = "SELECT id,nombre FROM categorias_productos WHERE active = 1 and id != 1";
            $stmt = $this->conn->prepare($search_sql);
            $stmt->execute();
            return $stmt->fetchAll();
        }

    }
?>