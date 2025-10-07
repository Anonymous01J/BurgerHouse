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
        $unidad->conn->beginTransaction();
        $id = $unidad->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
        $unidad->conn->rollBack();
    }

    public function testActualizarUnidad()
    {
        $c4 = new \Shtch\Burgerhouse\models\Unidad();
        $id_ultima_unidad = $c4->search(order_type: 'DESC')[0]['id'];
        $unidad = new \Shtch\Burgerhouse\models\Unidad($id_ultima_unidad, 'Mililitro', 'ml', 1);
        $unidad->conn->beginTransaction();
        $result = $unidad->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $unidad->conn->rollBack();
    }

    public function testBorrarUnidad()
    {
        $c4 = new \Shtch\Burgerhouse\models\Unidad();
        $id_ultima_unidad = $c4->search(order_type: 'DESC')[0]['id'];
        $unidad = new \Shtch\Burgerhouse\models\Unidad($id_ultima_unidad);
        $unidad->conn->beginTransaction();
        $result = $unidad->borrar();
        $this->assertIsBool($result);
        $unidad->conn->rollBack();
    }
}
