<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class ClienteModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testAgregarCliente()
    {
        $cliente = new \Shtch\Burgerhouse\models\Cliente(null, 'Juan Perez', 'juan@example.com', '12345678', 1);
        $cliente->conn->beginTransaction();
        $id = $cliente->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
        $cliente->conn->rollBack();
    }

    public function testActualizarCliente()
    {
        $c4 = new \Shtch\Burgerhouse\models\Cliente();
        $id_ultimo_cliente = $c4->search(order_type: 'DESC')[0]['id'];
        $cliente = new \Shtch\Burgerhouse\models\Cliente($id_ultimo_cliente, 'Juan Actualizado', 'juan2@example.com', '87654321', 1);
        $cliente->conn->beginTransaction();
        $result = $cliente->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $cliente->conn->rollBack();
    }
    public function testBorrarCliente()
    {
        $c4 = new \Shtch\Burgerhouse\models\Cliente();
        $id_ultimo_cliente = $c4->search(order_type: 'DESC')[0]['id'];
        $cliente = new \Shtch\Burgerhouse\models\Cliente($id_ultimo_cliente);
        $cliente->conn->beginTransaction();
        $result = $cliente->borrar();
        $this->assertIsBool($result);
        $cliente->conn->rollBack();
    }
}
