<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PaquetesModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarPaquete()
    {
        $paquete = new \Shtch\Burgerhouse\models\Paquetes(
            null,
            'Paquete Test',
            250.00,
            1
        );
        
        $paquete->conn->beginTransaction();
        $id = $paquete->agregar();
        $this->assertIsInt($id);
        $paquete->conn->rollBack();
    }

    public function testActualizarPaquete()
    {
        $p = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($paquetes)) {
            $this->markTestSkipped('No hay paquetes disponibles para actualizar');
        }
        
        $id_ultimo_paquete = $paquetes[0]['id'];
        
        $paquete = new \Shtch\Burgerhouse\models\Paquetes(
            $id_ultimo_paquete,
            'Paquete Actualizado',
            300.00,
            1
        );
        
        $paquete->conn->beginTransaction();
        $result = $paquete->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $paquete->conn->rollBack();
    }

    public function testBorrarPaquete()
    {
        $p = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($paquetes)) {
            $this->markTestSkipped('No hay paquetes disponibles para borrar');
        }
        
        $id_ultimo_paquete = $paquetes[0]['id'];
        $paquete = new \Shtch\Burgerhouse\models\Paquetes($id_ultimo_paquete);
        
        $paquete->conn->beginTransaction();
        $result = $paquete->borrar();
        $this->assertIsBool($result);
        $paquete->conn->rollBack();
    }

    public function testBuscarPaquete()
    {
        $paquete = new \Shtch\Burgerhouse\models\Paquetes();
        $resultados = $paquete->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('precio', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarPaquetePorNombreLike()
    {
        $p = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $p->search(limite: 1);
        
        if (empty($paquetes)) {
            $this->markTestSkipped('No hay paquetes disponibles para buscar');
        }
        
        $nombre_completo = $paquetes[0]['nombre'];
        $nombre_parcial = substr($nombre_completo, 0, 3);
        
        $paquete = new \Shtch\Burgerhouse\models\Paquetes(null, null, null, null, $nombre_parcial);
        $resultados = $paquete->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }

    public function testBuscarPaqueteActivos()
    {
        $paquete = new \Shtch\Burgerhouse\models\Paquetes(null, null, null, 1);
        $resultados = $paquete->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
