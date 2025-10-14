<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PagoVentaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarPagoVenta()
    {
        // Obtener un pago válido
        $pago = new \Shtch\Burgerhouse\models\Pago();
        $pagos = $pago->search(limite: 1);
        
        // Obtener una venta válida
        $venta = new \Shtch\Burgerhouse\models\Venta();
        $ventas = $venta->search(limite: 1);
        
        if (empty($pagos) || empty($ventas)) {
            $this->markTestSkipped('No hay pagos o ventas disponibles para realizar el test');
        }
        
        $id_pago = $pagos[0]['id'];
        $id_venta = $ventas[0]['id'];
        
        $pago_venta = new \Shtch\Burgerhouse\models\Pago_venta(
            null,
            $id_pago,
            $id_venta
        );
        
        $pago_venta->conn->beginTransaction();
        $id = $pago_venta->agregar();
        $this->assertIsInt($id);
        $pago_venta->conn->rollBack();
    }

    public function testActualizarPagoVenta()
    {
        $pv = new \Shtch\Burgerhouse\models\Pago_venta();
        $pagos_venta = $pv->search(order_type: 'DESC', limite: 1);
        
        if (empty($pagos_venta)) {
            $this->markTestSkipped('No hay pagos de venta disponibles para actualizar');
        }
        
        $id_ultimo_pago_venta = $pagos_venta[0]['id'];
        $id_pago = $pagos_venta[0]['id_pago'];
        $id_venta = $pagos_venta[0]['id_venta'];
        
        $pago_venta = new \Shtch\Burgerhouse\models\Pago_venta(
            $id_ultimo_pago_venta,
            $id_pago,
            $id_venta
        );
        
        $pago_venta->conn->beginTransaction();
        $result = $pago_venta->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $pago_venta->conn->rollBack();
    }

    public function testBorrarPagoVenta()
    {
        $pv = new \Shtch\Burgerhouse\models\Pago_venta();
        $pagos_venta = $pv->search(order_type: 'DESC', limite: 1);
        
        if (empty($pagos_venta)) {
            $this->markTestSkipped('No hay pagos de venta disponibles para borrar');
        }
        
        $id_ultimo_pago_venta = $pagos_venta[0]['id'];
        $pago_venta = new \Shtch\Burgerhouse\models\Pago_venta($id_ultimo_pago_venta);
        
        $pago_venta->conn->beginTransaction();
        $result = $pago_venta->borrar();
        $this->assertIsBool($result);
        $pago_venta->conn->rollBack();
    }

    public function testBuscarPagoVenta()
    {
        $pago_venta = new \Shtch\Burgerhouse\models\Pago_venta();
        $resultados = $pago_venta->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_pago', $resultados[0]);
            $this->assertArrayHasKey('id_venta', $resultados[0]);
            $this->assertArrayHasKey('metodo_pago', $resultados[0]);
            $this->assertArrayHasKey('monto', $resultados[0]);
        }
    }

    public function testBuscarPagoVentaPorVenta()
    {
        $venta = new \Shtch\Burgerhouse\models\Venta();
        $ventas = $venta->search(limite: 1);
        
        if (empty($ventas)) {
            $this->markTestSkipped('No hay ventas disponibles para realizar el test');
        }
        
        $id_venta = $ventas[0]['id'];
        
        $pago_venta = new \Shtch\Burgerhouse\models\Pago_venta(null, null, $id_venta);
        $resultados = $pago_venta->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($id_venta, $registro['id_venta']);
        }
    }
}
