<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class DeliveryModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarDelivery()
    {
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $usuarios = $usuario->search(limite: 1);
        
        $venta = new \Shtch\Burgerhouse\models\Venta();
        $ventas = $venta->search(limite: 1);
        
        if (empty($usuarios) || empty($ventas)) {
            $this->markTestSkipped('No hay usuarios o ventas disponibles para realizar el test');
        }
        
        $id_usuario = $usuarios[0]['id'];
        $id_venta = $ventas[0]['id'];
        
        $delivery = new \Shtch\Burgerhouse\models\Delivery(
            null,
            $id_usuario,
            $id_venta,
            1
        );
        
        $delivery->conn->beginTransaction();
        $id = $delivery->agregar();
        $this->assertIsInt($id);
        $delivery->conn->rollBack();
    }

    public function testActualizarDelivery()
    {
        $d = new \Shtch\Burgerhouse\models\Delivery();
        $deliveries = $d->search(order_type: 'DESC', limite: 1);
        
        if (empty($deliveries)) {
            $this->markTestSkipped('No hay deliveries disponibles para actualizar');
        }
        
        $id_ultimo_delivery = $deliveries[0]['id'];
        $id_usuario = $deliveries[0]['id_usuario_delivery'];
        $id_venta = $deliveries[0]['id_venta'];
        
        $delivery = new \Shtch\Burgerhouse\models\Delivery(
            $id_ultimo_delivery,
            $id_usuario,
            $id_venta,
            1
        );
        
        $delivery->conn->beginTransaction();
        $result = $delivery->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $delivery->conn->rollBack();
    }

    public function testBorrarDelivery()
    {
        $d = new \Shtch\Burgerhouse\models\Delivery();
        $deliveries = $d->search(order_type: 'DESC', limite: 1);
        
        if (empty($deliveries)) {
            $this->markTestSkipped('No hay deliveries disponibles para borrar');
        }
        
        $id_ultimo_delivery = $deliveries[0]['id'];
        $delivery = new \Shtch\Burgerhouse\models\Delivery($id_ultimo_delivery);
        
        $delivery->conn->beginTransaction();
        $result = $delivery->borrar();
        $this->assertIsBool($result);
        $delivery->conn->rollBack();
    }

    public function testBuscarDelivery()
    {
        $delivery = new \Shtch\Burgerhouse\models\Delivery();
        $resultados = $delivery->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_usuario_delivery', $resultados[0]);
            $this->assertArrayHasKey('id_venta', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }
}
