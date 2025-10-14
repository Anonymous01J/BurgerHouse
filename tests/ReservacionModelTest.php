<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class ReservacionModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarReservacion()
    {
        // Obtener un paquete válido
        $paquete = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $paquete->search(limite: 1);
        
        // Obtener una orden válida
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        // Obtener una caja válida
        $caja = new \Shtch\Burgerhouse\models\Caja();
        $cajas = $caja->search(limite: 1);
        
        if (empty($paquetes) || empty($ordenes) || empty($cajas)) {
            $this->markTestSkipped('No hay paquetes, órdenes o cajas disponibles para realizar el test');
        }
        
        $id_paquete = $paquetes[0]['id'];
        $id_orden = $ordenes[0]['id'];
        $id_caja = $cajas[0]['id'];
        
        $reservacion = new \Shtch\Burgerhouse\models\Reservacion(
            null,
            $id_paquete,
            $id_orden,
            $id_caja,
            'Reservación de prueba',
            date('Y-m-d H:i:s', strtotime('+1 day')),
            date('Y-m-d H:i:s', strtotime('+2 days')),
            null,
            'online',
            'pendiente'
        );
        
        $reservacion->conn->beginTransaction();
        $id = $reservacion->agregar();
        $this->assertIsInt($id);
        $reservacion->conn->rollBack();
    }

    public function testActualizarReservacion()
    {
        $r = new \Shtch\Burgerhouse\models\Reservacion();
        $reservaciones = $r->search(order_type: 'DESC', limite: 1);
        
        if (empty($reservaciones)) {
            $this->markTestSkipped('No hay reservaciones disponibles para actualizar');
        }
        
        $id_ultima_reservacion = $reservaciones[0]['id'];
        $id_paquete = $reservaciones[0]['id_paquete'];
        $id_orden = $reservaciones[0]['id_orden'] ?? null;
        $id_caja = $reservaciones[0]['id_caja'] ?? null;
        
        $reservacion = new \Shtch\Burgerhouse\models\Reservacion(
            $id_ultima_reservacion,
            $id_paquete,
            $id_orden,
            $id_caja,
            'Reservación actualizada',
            date('Y-m-d H:i:s', strtotime('+1 day')),
            date('Y-m-d H:i:s', strtotime('+2 days')),
            null,
            'online',
            'confirmada'
        );
        
        $reservacion->conn->beginTransaction();
        $result = $reservacion->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $reservacion->conn->rollBack();
    }

    public function testBorrarReservacion()
    {
        $r = new \Shtch\Burgerhouse\models\Reservacion();
        $reservaciones = $r->search(order_type: 'DESC', limite: 1);
        
        if (empty($reservaciones)) {
            $this->markTestSkipped('No hay reservaciones disponibles para borrar');
        }
        
        $id_ultima_reservacion = $reservaciones[0]['id'];
        $reservacion = new \Shtch\Burgerhouse\models\Reservacion($id_ultima_reservacion);
        
        $reservacion->conn->beginTransaction();
        $result = $reservacion->borrar();
        $this->assertIsBool($result);
        $reservacion->conn->rollBack();
    }

    public function testBuscarReservacion()
    {
        $reservacion = new \Shtch\Burgerhouse\models\Reservacion();
        $resultados = $reservacion->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_paquete', $resultados[0]);
            $this->assertArrayHasKey('descripcion', $resultados[0]);
            $this->assertArrayHasKey('status', $resultados[0]);
        }
    }

    public function testBuscarReservacionPorStatus()
    {
        $reservacion = new \Shtch\Burgerhouse\models\Reservacion(
            null, null, null, null, null, null, null, null, null, 'pendiente'
        );
        $resultados = $reservacion->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals('pendiente', $registro['status']);
        }
    }
}
