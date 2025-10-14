<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class VentaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarVenta()
    {
        // Obtener una caja válida
        $caja = new \Shtch\Burgerhouse\models\Caja();
        $cajas = $caja->search(limite: 1);
        
        // Obtener una orden válida
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        if (empty($cajas) || empty($ordenes)) {
            $this->markTestSkipped('No hay cajas u órdenes disponibles para realizar el test');
        }
        
        $id_caja = $cajas[0]['id'];
        $id_orden = $ordenes[0]['id'];
        
        $venta = new \Shtch\Burgerhouse\models\Venta(
            null,
            $id_caja,
            $id_orden,
            16.00,
            100.00,
            date('Y-m-d H:i:s'),
            'Dirección de prueba',
            1
        );
        
        $venta->conn->beginTransaction();
        $id = $venta->agregar();
        $this->assertIsInt($id);
        $venta->conn->rollBack();
    }

    public function testActualizarVenta()
    {
        $v = new \Shtch\Burgerhouse\models\Venta();
        $ventas = $v->search(order_type: 'DESC', limite: 1);
        
        if (empty($ventas)) {
            $this->markTestSkipped('No hay ventas disponibles para actualizar');
        }
        
        $id_ultima_venta = $ventas[0]['id'];
        $id_caja = $ventas[0]['id_caja'];
        
        $id_orden = $ventas[0]['id_orden'] ?? null;
        
        $venta = new \Shtch\Burgerhouse\models\Venta(
            $id_ultima_venta,
            $id_caja,
            $id_orden,
            16.00,
            150.00,
            date('Y-m-d H:i:s'),
            'Dirección actualizada',
            1
        );
        
        $venta->conn->beginTransaction();
        $result = $venta->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $venta->conn->rollBack();
    }

    public function testBorrarVenta()
    {
        $v = new \Shtch\Burgerhouse\models\Venta();
        $ventas = $v->search(order_type: 'DESC', limite: 1);
        
        if (empty($ventas)) {
            $this->markTestSkipped('No hay ventas disponibles para borrar');
        }
        
        $id_ultima_venta = $ventas[0]['id'];
        $venta = new \Shtch\Burgerhouse\models\Venta($id_ultima_venta);
        
        $venta->conn->beginTransaction();
        $result = $venta->borrar();
        $this->assertIsBool($result);
        $venta->conn->rollBack();
    }

    public function testBuscarVenta()
    {
        $venta = new \Shtch\Burgerhouse\models\Venta();
        $resultados = $venta->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_caja', $resultados[0]);
            $this->assertArrayHasKey('IVA', $resultados[0]);
            $this->assertArrayHasKey('monto_final', $resultados[0]);
            $this->assertArrayHasKey('fecha', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarVentaActivas()
    {
        $venta = new \Shtch\Burgerhouse\models\Venta(null, null, null, null, null, null, null, 1);
        $resultados = $venta->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
