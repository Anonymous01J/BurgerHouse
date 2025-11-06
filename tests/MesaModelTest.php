<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class MesaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarMesa()
    {
        $mesa = new \Shtch\Burgerhouse\models\Mesa(
            null,
            'Mesa Test',
            '4',
            '1',
            'disponible',
            'default.jpg',
            vip:'0'
        );
        
        $mesa->conn->beginTransaction();
        $id = $mesa->agregar();
        $this->assertIsInt($id);
        $mesa->conn->rollBack();
    }

    public function testActualizarMesa()
    {
        $m = new \Shtch\Burgerhouse\models\Mesa();
        $mesas = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($mesas)) {
            $this->markTestSkipped('No hay mesas disponibles para actualizar');
        }
        
        $id_ultima_mesa = $mesas[0]['id'];
        
        $mesa = new \Shtch\Burgerhouse\models\Mesa(
            $id_ultima_mesa,
            'Mesa Actualizada',
            6,
            1,
            'ocupada',
            'default.jpg',
            null,
            1
        );
        
        $mesa->conn->beginTransaction();
        $result = $mesa->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $mesa->conn->rollBack();
    }

    public function testBorrarMesa()
    {
        $m = new \Shtch\Burgerhouse\models\Mesa();
        $mesas = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($mesas)) {
            $this->markTestSkipped('No hay mesas disponibles para borrar');
        }
        
        $id_ultima_mesa = $mesas[0]['id'];
        $mesa = new \Shtch\Burgerhouse\models\Mesa($id_ultima_mesa);
        
        $mesa->conn->beginTransaction();
        $result = $mesa->borrar();
        $this->assertIsBool($result);
        $mesa->conn->rollBack();
    }

    public function testBuscarMesa()
    {
        $mesa = new \Shtch\Burgerhouse\models\Mesa();
        $resultados = $mesa->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('sillas', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
            $this->assertArrayHasKey('estado', $resultados[0]);
        }
    }

    public function testBuscarMesaActivas()
    {
        $mesa = new \Shtch\Burgerhouse\models\Mesa(null, null, null, 1);
        $resultados = $mesa->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
