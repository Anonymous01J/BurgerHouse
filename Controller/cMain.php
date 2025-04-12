<?php
require_once('Model/categoriasProductos.php');
require_once('Model/productos.php');

class CMain {
    
    private $productos;
    private $categorias;

    public function mostrarMain() {
        $this->productos = new Productos();
        $productos = $this->productos->search();
        $this->categorias = new CategoriasProductos();
        $categorias = $this->categorias->search();
        require_once 'View/index.php';
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