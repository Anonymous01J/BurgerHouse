<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class CategoryModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarCategoriaProducto()
    {
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto(null, 'Hamburguesas', 1);
        $id = $categoria->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
    }

    public function testActualizarCategoriaProducto()
    {
        $c4 = new \Shtch\Burgerhouse\models\Categoria_producto();
        $id_ultima_categoria = $c4->search(order_type: 'DESC')[0]['id'];
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto($id_ultima_categoria, 'Bebidas', 1);
        $result = $categoria->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarCategoriaProducto()
    {
        $c4 = new \Shtch\Burgerhouse\models\Categoria_producto();
        $id_ultima_categoria = $c4->search(order_type: 'DESC')[0]['id'];
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto($id_ultima_categoria);
        $result = $categoria->borrar();
        $this->assertIsBool($result);
    }
}
