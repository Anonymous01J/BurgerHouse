<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class OrdenModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testAgregarOrden()
    {
        $c1 = new \Shtch\Burgerhouse\models\Cliente();
        $id_cliente = $c1->search()[0]['id'];

        $c2 = new \Shtch\Burgerhouse\models\Mesa();
        $id_mesa = $c2->search()[0]['id'];

        $orden = new \Shtch\Burgerhouse\models\Orden(null, "5867145", $id_cliente, '2025-10-06', "negocio");
        $orden->conn->beginTransaction();
        $id = $orden->agregar();
        $orden->conn->rollBack();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
    }

    public function testActualizarOrden()
    {
        $c4 = new \Shtch\Burgerhouse\models\Orden();
        $id_ultima_orden = $c4->search(order_type: 'DESC')[0]['id'];
        $orden = new \Shtch\Burgerhouse\models\Orden($id_ultima_orden, null, null, '2025-10-07');
        $orden->conn->beginTransaction();
        $result = $orden->actualizar();
        $orden->conn->rollBack();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarOrden()
    {
        $c4 = new \Shtch\Burgerhouse\models\Orden();
        $id_ultima_orden = $c4->search(order_type: 'DESC')[0]['id'];
        $orden = new \Shtch\Burgerhouse\models\Orden($id_ultima_orden);
        $orden->conn->beginTransaction();
        $result = $orden->borrar();
        $orden->conn->rollBack();
        $this->assertIsBool($result);
    }
}
