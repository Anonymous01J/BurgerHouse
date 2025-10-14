<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PagoModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarPago()
    {
        // Obtener un método de pago válido
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $metodo->search(limite: 1);
        
        if (empty($metodos)) {
            $this->markTestSkipped('No hay métodos de pago disponibles para realizar el test');
        }
        
        $id_metodo_pago = $metodos[0]['id'];
        
        $pago = new \Shtch\Burgerhouse\models\Pago(
            null,
            $id_metodo_pago,
            100.00,
            date('Y-m-d H:i:s'),
            1.00,
            'REF123456',
            null
        );
        
        $pago->conn->beginTransaction();
        $id = $pago->agregar();
        $this->assertIsInt($id);
        $pago->conn->rollBack();
    }

    public function testActualizarPago()
    {
        $p = new \Shtch\Burgerhouse\models\Pago();
        $pagos = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($pagos)) {
            $this->markTestSkipped('No hay pagos disponibles para actualizar');
        }
        
        $id_ultimo_pago = $pagos[0]['id'];
        
        // Obtener un método de pago válido
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $metodo->search(limite: 1);
        
        if (empty($metodos)) {
            $this->markTestSkipped('No hay métodos de pago disponibles');
        }
        
        $id_metodo_pago = $metodos[0]['id'];
        
        $pago = new \Shtch\Burgerhouse\models\Pago(
            $id_ultimo_pago,
            $id_metodo_pago,
            150.00,
            date('Y-m-d H:i:s'),
            1.00,
            'REF789012',
            null
        );
        
        $pago->conn->beginTransaction();
        $result = $pago->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $pago->conn->rollBack();
    }

    public function testBorrarPago()
    {
        $p = new \Shtch\Burgerhouse\models\Pago();
        $pagos = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($pagos)) {
            $this->markTestSkipped('No hay pagos disponibles para borrar');
        }
        
        $id_ultimo_pago = $pagos[0]['id'];
        $pago = new \Shtch\Burgerhouse\models\Pago($id_ultimo_pago);
        
        $pago->conn->beginTransaction();
        $result = $pago->borrar();
        $this->assertIsBool($result);
        $pago->conn->rollBack();
    }

    public function testBuscarPago()
    {
        $pago = new \Shtch\Burgerhouse\models\Pago();
        $resultados = $pago->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_metodo_pago', $resultados[0]);
            $this->assertArrayHasKey('monto', $resultados[0]);
            $this->assertArrayHasKey('fecha', $resultados[0]);
        }
    }
}
