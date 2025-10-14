<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class MovimientoCapitalModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarMovimientoCapital()
    {
        $movimiento = new \Shtch\Burgerhouse\models\Movimiento_capital(
            null,
            500.00,
            'Movimiento de prueba',
            date('Y-m-d H:i:s')
        );
        
        $movimiento->conn->beginTransaction();
        $id = $movimiento->agregar();
        $this->assertIsInt($id);
        $movimiento->conn->rollBack();
    }

    public function testActualizarMovimientoCapital()
    {
        $m = new \Shtch\Burgerhouse\models\Movimiento_capital();
        $movimientos = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($movimientos)) {
            $this->markTestSkipped('No hay movimientos de capital disponibles para actualizar');
        }
        
        $id_ultimo_movimiento = $movimientos[0]['id'];
        
        $movimiento = new \Shtch\Burgerhouse\models\Movimiento_capital(
            $id_ultimo_movimiento,
            750.00,
            'Movimiento actualizado',
            date('Y-m-d H:i:s')
        );
        
        $movimiento->conn->beginTransaction();
        $result = $movimiento->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $movimiento->conn->rollBack();
    }

    public function testBorrarMovimientoCapital()
    {
        $m = new \Shtch\Burgerhouse\models\Movimiento_capital();
        $movimientos = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($movimientos)) {
            $this->markTestSkipped('No hay movimientos de capital disponibles para borrar');
        }
        
        $id_ultimo_movimiento = $movimientos[0]['id'];
        $movimiento = new \Shtch\Burgerhouse\models\Movimiento_capital($id_ultimo_movimiento);
        
        $movimiento->conn->beginTransaction();
        $result = $movimiento->borrar();
        $this->assertIsBool($result);
        $movimiento->conn->rollBack();
    }

    public function testBuscarMovimientoCapital()
    {
        $movimiento = new \Shtch\Burgerhouse\models\Movimiento_capital();
        $resultados = $movimiento->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('monto', $resultados[0]);
            $this->assertArrayHasKey('descripcion', $resultados[0]);
            $this->assertArrayHasKey('fecha', $resultados[0]);
        }
    }
}
