<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class VentaIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearVentaConPago()
    {
        // Obtener datos necesarios
        $caja = new \Shtch\Burgerhouse\models\Caja();
        $cajas = $caja->search(limite: 1);
        
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        $metodo_pago = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $metodo_pago->search(limite: 1);
        
        if (empty($cajas) || empty($ordenes) || empty($metodos)) {
            $this->markTestSkipped('No hay datos suficientes para realizar el test');
        }
        
        $venta_base = new \Shtch\Burgerhouse\models\Venta();
        $conn = $venta_base->conn;
        $conn->beginTransaction();
        
        try {
            // 1. Crear la venta
            $venta = new \Shtch\Burgerhouse\models\Venta(
                null,
                $cajas[0]['id'],
                $ordenes[0]['id'],
                16.00, // IVA
                116.00, // Monto final
                date('Y-m-d H:i:s'),
                'Dirección de prueba',
                1
            );
            
            $id_venta = $venta->agregar();
            $this->assertIsInt($id_venta, 'La venta debe crearse correctamente');
            
            // 2. Crear el pago asociado
            $pago = new \Shtch\Burgerhouse\models\Pago(
                null,
                $metodos[0]['id'],
                116.00,
                date('Y-m-d H:i:s'),
                1.00, // tasa
                'REF-001', // referencia
                'Comprobante-TEST-001' // comprobante
            );
            
            $id_pago = $pago->agregar();
            $this->assertIsInt($id_pago, 'El pago debe crearse correctamente');
            
            // 3. Asociar el pago con la venta
            $pago_venta = new \Shtch\Burgerhouse\models\Pago_venta(
                null,
                $id_pago,
                $id_venta
            );
            
            $id_pago_venta = $pago_venta->agregar();
            $this->assertIsInt($id_pago_venta, 'La asociación pago-venta debe crearse correctamente');
            
            // 4. Verificar que todo se creó correctamente
            $venta_verificar = new \Shtch\Burgerhouse\models\Venta($id_venta);
            $venta_data = $venta_verificar->search(limite: 1);
            $this->assertNotEmpty($venta_data, 'La venta debe existir');
            
            $pago_venta_verificar = new \Shtch\Burgerhouse\models\Pago_venta(null, null, $id_venta);
            $pago_venta_data = $pago_venta_verificar->search();
            $this->assertNotEmpty($pago_venta_data, 'El pago de la venta debe existir');
            $this->assertEquals($id_pago, $pago_venta_data[0]['id_pago']);
            
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Venta con Pago funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
