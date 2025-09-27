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
        $id = $cliente->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
    }

    public function testActualizarCliente()
    {
        $cliente = new \Shtch\Burgerhouse\models\Cliente(1, 'Juan Actualizado', 'juan2@example.com', '87654321', 1);
        $result = $cliente->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarCliente()
    {
        $cliente = new \Shtch\Burgerhouse\models\Cliente(1, '', '', '', 1);
        $result = $cliente->borrar();
        printf("%s\n", var_export($result, true));
        $this->assertTrue($result);
    }
}
