<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class DeliveryIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearVentaConDelivery()
    {
        // Obtener datos necesarios
        $caja = new \Shtch\Burgerhouse\models\Caja();
        $cajas = $caja->search(limite: 1);
        
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $usuarios = $usuario->search(limite: 1);
        
        if (empty($cajas) || empty($ordenes) || empty($usuarios)) {
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
                16.00,
                116.00,
                date('Y-m-d'),
                'Calle Principal #123, Ciudad',
                1
            );
            
            $id_venta = $venta->agregar();
            $this->assertIsInt($id_venta, 'La venta debe crearse correctamente');
            
            // 2. Asignar delivery a la venta
            $delivery = new \Shtch\Burgerhouse\models\Delivery(
                null,
                $usuarios[0]['id'],
                $id_venta,
                1
            );
            
            $id_delivery = $delivery->agregar();
            $this->assertIsInt($id_delivery, 'El delivery debe crearse correctamente');
            
            // 3. Verificar que todo se creó correctamente
            $venta_verificar = new \Shtch\Burgerhouse\models\Venta($id_venta);
            $venta_data = $venta_verificar->search(limite: 1);
            $this->assertNotEmpty($venta_data, 'La venta debe existir');
            
            $delivery_verificar = new \Shtch\Burgerhouse\models\Delivery(null, null, $id_venta);
            $delivery_data = $delivery_verificar->search();
            $this->assertNotEmpty($delivery_data, 'El delivery debe existir');
            $this->assertEquals($id_venta, $delivery_data[0]['id_venta']);
            $this->assertEquals($usuarios[0]['id'], $delivery_data[0]['id_usuario_delivery']);
            
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Venta con Delivery funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
