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
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto(1, 'Bebidas', 1);
        $result = $categoria->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarCategoriaProducto()
    {
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto(1, '', 1);
        $result = $categoria->borrar();
        $this->assertIsBool($result);
    }
}
