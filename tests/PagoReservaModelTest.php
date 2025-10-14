<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PagoReservaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarPagoReserva()
    {
        // Obtener un pago válido
        $pago = new \Shtch\Burgerhouse\models\Pago();
        $pagos = $pago->search(limite: 1);
        
        // Obtener una reservación válida
        $reserva = new \Shtch\Burgerhouse\models\Reservacion();
        $reservas = $reserva->search(limite: 1);
        
        if (empty($pagos) || empty($reservas)) {
            $this->markTestSkipped('No hay pagos o reservaciones disponibles para realizar el test');
        }
        
        $id_pago = $pagos[0]['id'];
        $id_reserva = $reservas[0]['id'];
        
        $pago_reserva = new \Shtch\Burgerhouse\models\Pago_reserva(
            null,
            $id_reserva,
            $id_pago
        );
        
        $pago_reserva->conn->beginTransaction();
        $id = $pago_reserva->agregar();
        $this->assertIsInt($id);
        $pago_reserva->conn->rollBack();
    }

    public function testActualizarPagoReserva()
    {
        $pr = new \Shtch\Burgerhouse\models\Pago_reserva();
        $pagos_reserva = $pr->search(order_type: 'DESC', limite: 1);
        
        if (empty($pagos_reserva)) {
            $this->markTestSkipped('No hay pagos de reserva disponibles para actualizar');
        }
        
        $id_ultimo_pago_reserva = $pagos_reserva[0]['id'];
        $id_reserva = $pagos_reserva[0]['id_reserva'];
        $id_pago = $pagos_reserva[0]['id_pago'];
        
        $pago_reserva = new \Shtch\Burgerhouse\models\Pago_reserva(
            $id_ultimo_pago_reserva,
            $id_reserva,
            $id_pago
        );
        
        $pago_reserva->conn->beginTransaction();
        $result = $pago_reserva->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $pago_reserva->conn->rollBack();
    }

    public function testBorrarPagoReserva()
    {
        $pr = new \Shtch\Burgerhouse\models\Pago_reserva();
        $pagos_reserva = $pr->search(order_type: 'DESC', limite: 1);
        
        if (empty($pagos_reserva)) {
            $this->markTestSkipped('No hay pagos de reserva disponibles para borrar');
        }
        
        $id_ultimo_pago_reserva = $pagos_reserva[0]['id'];
        $pago_reserva = new \Shtch\Burgerhouse\models\Pago_reserva($id_ultimo_pago_reserva);
        
        $pago_reserva->conn->beginTransaction();
        $result = $pago_reserva->borrar();
        $this->assertIsBool($result);
        $pago_reserva->conn->rollBack();
    }

    public function testBuscarPagoReserva()
    {
        $pago_reserva = new \Shtch\Burgerhouse\models\Pago_reserva();
        $resultados = $pago_reserva->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_reserva', $resultados[0]);
            $this->assertArrayHasKey('id_pago', $resultados[0]);
            $this->assertArrayHasKey('metodo_pago', $resultados[0]);
            $this->assertArrayHasKey('monto', $resultados[0]);
        }
    }

    public function testBuscarPagoReservaPorReserva()
    {
        $reserva = new \Shtch\Burgerhouse\models\Reservacion();
        $reservas = $reserva->search(limite: 1);
        
        if (empty($reservas)) {
            $this->markTestSkipped('No hay reservaciones disponibles para realizar el test');
        }
        
        $id_reserva = $reservas[0]['id'];
        
        $pago_reserva = new \Shtch\Burgerhouse\models\Pago_reserva(null, $id_reserva);
        $resultados = $pago_reserva->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($id_reserva, $registro['id_reserva']);
        }
    }
}
