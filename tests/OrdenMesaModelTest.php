<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class OrdenMesaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarOrdenMesa()
    {
        // Obtener una mesa y una orden existentes
        $mesa = new \Shtch\Burgerhouse\models\Mesa();
        $mesas = $mesa->search(limite: 1);
        
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        if (empty($mesas) || empty($ordenes)) {
            $this->markTestSkipped('No hay mesas u órdenes disponibles para realizar el test');
        }
        
        $orden_mesa = new \Shtch\Burgerhouse\models\Orden_mesa(
            null,
            $mesas[0]['id'],
            $ordenes[0]['id']
        );
        
        $orden_mesa->conn->beginTransaction();
        $id = $orden_mesa->agregar();
        $this->assertIsInt($id);
        $orden_mesa->conn->rollBack();
    }

    public function testActualizarOrdenMesa()
    {
        $orden_mesa = new \Shtch\Burgerhouse\models\Orden_mesa();
        $ordenes_mesa = $orden_mesa->search(limite: 1);
        
        if (empty($ordenes_mesa)) {
            $this->markTestSkipped('No hay órdenes de mesa disponibles para actualizar');
        }
        
        $orden = new \Shtch\Burgerhouse\models\Orden();
        $ordenes = $orden->search(limite: 1);
        
        if (empty($ordenes)) {
            $this->markTestSkipped('No hay órdenes disponibles para la actualización');
        }
        
        $orden_mesa_actualizar = new \Shtch\Burgerhouse\models\Orden_mesa(
            $ordenes_mesa[0]['id'],
            $ordenes_mesa[0]['id_mesa'],
            $ordenes[0]['id']
        );
        
        $orden_mesa_actualizar->conn->beginTransaction();
        $resultado = $orden_mesa_actualizar->actualizar();
        $this->assertTrue($resultado['success']);
        $orden_mesa_actualizar->conn->rollBack();
    }

    public function testBorrarOrdenMesa()
    {
        $orden_mesa = new \Shtch\Burgerhouse\models\Orden_mesa();
        $ordenes_mesa = $orden_mesa->search(limite: 1);
        
        if (empty($ordenes_mesa)) {
            $this->markTestSkipped('No hay órdenes de mesa disponibles para eliminar');
        }
        
        $orden_mesa_borrar = new \Shtch\Burgerhouse\models\Orden_mesa($ordenes_mesa[0]['id']);
        
        $orden_mesa_borrar->conn->beginTransaction();
        $resultado = $orden_mesa_borrar->borrar();
        $this->assertTrue($resultado);
        $orden_mesa_borrar->conn->rollBack();
    }

    public function testBuscarOrdenMesa()
    {
        $orden_mesa = new \Shtch\Burgerhouse\models\Orden_mesa();
        $resultados = $orden_mesa->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_mesa', $resultados[0]);
            $this->assertArrayHasKey('id_orden', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
        }
    }
}
