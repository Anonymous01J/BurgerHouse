<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class ReservacionIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearReservacionConPago()
    {
        // Obtener datos necesarios
        $paquete = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $paquete->search(limite: 1);
        
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        $caja = new \Shtch\Burgerhouse\models\Caja();
        $cajas = $caja->search(limite: 1);
        
        $metodo_pago = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $metodo_pago->search(limite: 1);
        
        if (empty($paquetes) || empty($ordenes) || empty($cajas) || empty($metodos)) {
            $this->markTestSkipped('No hay datos suficientes para realizar el test');
        }
        
        $reservacion_base = new \Shtch\Burgerhouse\models\Reservacion();
        $conn = $reservacion_base->conn;
        $conn->beginTransaction();
        
        try {
            // 1. Crear la reservación
            $reservacion = new \Shtch\Burgerhouse\models\Reservacion(
                null,
                $paquetes[0]['id'],
                $ordenes[0]['id'],
                $cajas[0]['id'],
                'Reservación de prueba integración',
                date('Y-m-d', strtotime('+1 day')),
                date('Y-m-d', strtotime('+2 days')),
                null,
                'online',
                'confirmada'
            );
            
            $id_reservacion = $reservacion->agregar();
            $this->assertIsInt($id_reservacion, 'La reservación debe crearse correctamente');
            
            // 2. Crear el pago asociado
            $pago = new \Shtch\Burgerhouse\models\Pago(
                null,
                $metodos[0]['id'],
                200.00,
                date('Y-m-d H:i:s'),
                1.00, // tasa
                'REF-RESERVA-001', // referencia
                'Comprobante-RESERVA-001' // comprobante
            );
            
            $id_pago = $pago->agregar();
            $this->assertIsInt($id_pago, 'El pago debe crearse correctamente');
            
            // 3. Asociar el pago con la reservación
            $pago_reserva = new \Shtch\Burgerhouse\models\Pago_reserva(
                null,
                $id_reservacion,
                $id_pago
            );
            
            $id_pago_reserva = $pago_reserva->agregar();
            $this->assertIsInt($id_pago_reserva, 'La asociación pago-reserva debe crearse correctamente');
            
            // 4. Verificar que la reservación se creó
            $this->assertIsInt($id_reservacion, 'La reservación debe tener un ID válido');
            
            $pago_reserva_verificar = new \Shtch\Burgerhouse\models\Pago_reserva(null, $id_reservacion);
            $pago_reserva_data = $pago_reserva_verificar->search();
            $this->assertNotEmpty($pago_reserva_data, 'El pago de la reservación debe existir');
            $this->assertEquals($id_pago, $pago_reserva_data[0]['id_pago']);
            
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Reservación con Pago funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
