<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class UnitsModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarUnidad()
    {
        $unidad = new \Shtch\Burgerhouse\models\Unidad(null, 'Litro', 'L', 1);
        $id = $unidad->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
    }

    public function testActualizarUnidad()
    {
        $unidad = new \Shtch\Burgerhouse\models\Unidad(1, 'Mililitro', 'ml', 1);
        $result = $unidad->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarUnidad()
    {
        $unidad = new \Shtch\Burgerhouse\models\Unidad(1, '', '', 1);
        $result = $unidad->borrar();
        $this->assertIsBool($result);
    }
}
