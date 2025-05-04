<?php
    namespace Shtch\Burgerhouse\Controller;
    use Shtch\Burgerhouse\Model\Productos;
    use Shtch\Burgerhouse\Model\CategoriasProductos;
    class CMain {
        
        private $productos;
        private $categorias;

        public function mostrarMain() {
            $this->productos = new Productos();
            $productos = $this->productos->search();
            $this->categorias = new CategoriasProductos();
            $categorias = $this->categorias->search();
            header(header: 'Content-Type: application/json');
            echo json_encode(value: [
                'productos' => $productos,
                'categorias' => $categorias
            ]);
            include_once __DIR__ . '/../Views/index.php';
        }
        
        // public function mostrarCategorias() {
        //     $this->categorias = new CategoriaProductos(); // Cambié 'categoriaProductos' a 'CategoriaProductos' para mantener la consistencia en el uso de mayúsculas.
        //     $categorias = $this->categorias->search();
        //     require_once 'View/categorias.php';
        // }
        
        // public function mostrarProductos() {
        //     $this->productos = new Productos();
        //     $productos = $this->productos->search();
        //     require_once 'View/productos.php';
        // }
    }
?>