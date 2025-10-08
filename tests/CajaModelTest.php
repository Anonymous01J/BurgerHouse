<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class CajaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testAgregarCaja()
    {
        $c1 = new \Shtch\Burgerhouse\models\Usuario();
        $id_usuario = $c1->search()[0]['id'];

        $caja = new \Shtch\Burgerhouse\models\Caja(null, $id_usuario, 1000, 1000, 0, 0);
        $id = $caja->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
    }

    public function testActualizarCaja()
    {
        $c4 = new \Shtch\Burgerhouse\models\Caja();
        $id_ultima_caja = $c4->search(order_type: 'DESC')[0]['id'];
        
        $c5 = new \Shtch\Burgerhouse\models\Usuario();
        $id_usuario = $c5->search()[0]['id'];
        
        $caja = new \Shtch\Burgerhouse\models\Caja($id_ultima_caja, monto_final_dolar:2000, monto_final_bs:2000);
        $caja->conn->beginTransaction();
        $result = $caja->actualizar();
        $caja->conn->rollBack();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarCaja()
    {
        $c4 = new \Shtch\Burgerhouse\models\Caja();
        $id_ultima_caja = $c4->search(order_type: 'DESC')[0]['id'];

        $caja = new \Shtch\Burgerhouse\models\Caja($id_ultima_caja);
        $caja->conn->beginTransaction();
        $result = $caja->borrar();
        $caja->conn->rollBack();
        $this->assertIsBool($result);
    }
}
