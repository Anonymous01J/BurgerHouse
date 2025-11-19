<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PaquetesMesaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarPaqueteMesa()
    {
        // Obtener un paquete existente
        $paquete = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $paquete->search(limite: 1);
        
        // Obtener una mesa existente
        $mesa = new \Shtch\Burgerhouse\models\Mesa();
        $mesas = $mesa->search(limite: 1);
        
        if (empty($paquetes) || empty($mesas)) {
            $this->markTestSkipped('No hay paquetes o mesas disponibles para realizar el test');
        }
        
        $paquete_mesa = new \Shtch\Burgerhouse\models\Paquetes_mesa(
            null,
            $paquetes[0]['id'],
            $mesas[0]['id']
        );
        
        $paquete_mesa->conn->beginTransaction();
        $id = $paquete_mesa->agregar();
        $this->assertIsInt($id);
        $paquete_mesa->conn->rollBack();
    }

    public function testActualizarPaqueteMesa()
    {
        $pm = new \Shtch\Burgerhouse\models\Paquetes_mesa();
        $paquetes_mesa = $pm->search(limite: 1);
        
        if (empty($paquetes_mesa)) {
            $this->markTestSkipped('No hay paquetes de mesa disponibles para actualizar');
        }
        
        // Obtener otro paquete para la actualización
        $paquete = new \Shtch\Burgerhouse\models\Paquetes();
        $paquetes = $paquete->search(limite: 1);
        
        if (empty($paquetes)) {
            $this->markTestSkipped('No hay paquetes disponibles para la actualización');
        }
        
        $paquete_mesa_actualizar = new \Shtch\Burgerhouse\models\Paquetes_mesa(
            $paquetes_mesa[0]['id'],
            $paquetes[0]['id'],
            $paquetes_mesa[0]['id_mesa']
        );
        
        $paquete_mesa_actualizar->conn->beginTransaction();
        $resultado = $paquete_mesa_actualizar->actualizar();
        $this->assertTrue($resultado['success']);
        $paquete_mesa_actualizar->conn->rollBack();
    }

    public function testBorrarPaqueteMesa()
    {
        $pm = new \Shtch\Burgerhouse\models\Paquetes_mesa();
        $paquetes_mesa = $pm->search(limite: 1);
        
        if (empty($paquetes_mesa)) {
            $this->markTestSkipped('No hay paquetes de mesa disponibles para eliminar');
        }
        
        $paquete_mesa_borrar = new \Shtch\Burgerhouse\models\Paquetes_mesa($paquetes_mesa[0]['id']);
        
        $paquete_mesa_borrar->conn->beginTransaction();
        $resultado = $paquete_mesa_borrar->borrar();
        $this->assertTrue($resultado);
        $paquete_mesa_borrar->conn->rollBack();
    }

    public function testBuscarPaquetesMesa()
    {
        $paquete_mesa = new \Shtch\Burgerhouse\models\Paquetes_mesa();
        $resultados = $paquete_mesa->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
