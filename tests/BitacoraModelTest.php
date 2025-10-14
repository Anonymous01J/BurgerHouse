<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class BitacoraModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarBitacora()
    {
        // Primero necesitamos un usuario válido para la bitácora
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $usuarios = $usuario->search(limite: 1);
        
        if (empty($usuarios)) {
            $this->markTestSkipped('No hay usuarios disponibles para realizar el test');
        }
        
        $id_usuario = $usuarios[0]['id'];
        
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora(
            null,
            $id_usuario,
            'productos',
            'INSERT',
            date('Y-m-d H:i:s'),
            'Test de inserción de bitácora'
        );
        
        $bitacora->conn->beginTransaction();
        $id = $bitacora->agregar();
        $this->assertIsInt($id);
        $bitacora->conn->rollBack();
    }

    public function testActualizarBitacora()
    {
        $b = new \Shtch\Burgerhouse\models\Bitacora();
        $registros = $b->search(order_type: 'DESC', limite: 1);
        
        if (empty($registros)) {
            $this->markTestSkipped('No hay registros de bitácora para actualizar');
        }
        
        $id_ultima_bitacora = $registros[0]['id'];
        $id_usuario = $registros[0]['id_usuario'];
        
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora(
            $id_ultima_bitacora,
            $id_usuario,
            'productos',
            'UPDATE',
            date('Y-m-d H:i:s'),
            'Test de actualización de bitácora'
        );
        
        $bitacora->conn->beginTransaction();
        $result = $bitacora->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $bitacora->conn->rollBack();
    }

    public function testBorrarBitacora()
    {
        $b = new \Shtch\Burgerhouse\models\Bitacora();
        $registros = $b->search(order_type: 'DESC', limite: 1);
        
        if (empty($registros)) {
            $this->markTestSkipped('No hay registros de bitácora para borrar');
        }
        
        $id_ultima_bitacora = $registros[0]['id'];
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora($id_ultima_bitacora);
        
        $bitacora->conn->beginTransaction();
        $result = $bitacora->borrar();
        $this->assertIsBool($result);
        $bitacora->conn->rollBack();
    }

    public function testBuscarBitacora()
    {
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora();
        $resultados = $bitacora->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_usuario', $resultados[0]);
            $this->assertArrayHasKey('nombre_usuario', $resultados[0]);
            $this->assertArrayHasKey('apellido_usuario', $resultados[0]);
            $this->assertArrayHasKey('tabla', $resultados[0]);
            $this->assertArrayHasKey('accion', $resultados[0]);
            $this->assertArrayHasKey('fecha', $resultados[0]);
            $this->assertArrayHasKey('descripcion', $resultados[0]);
        }
    }

    public function testBuscarBitacoraPorUsuario()
    {
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $usuarios = $usuario->search(limite: 1);
        
        if (empty($usuarios)) {
            $this->markTestSkipped('No hay usuarios disponibles para realizar el test');
        }
        
        $id_usuario = $usuarios[0]['id'];
        
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora(null, $id_usuario);
        $resultados = $bitacora->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($id_usuario, $registro['id_usuario']);
        }
    }

    public function testBuscarBitacoraPorTabla()
    {
        $tabla_buscar = 'productos';
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora(null, null, $tabla_buscar);
        $resultados = $bitacora->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($tabla_buscar, $registro['tabla']);
        }
    }

    public function testBuscarBitacoraPorAccion()
    {
        $accion_buscar = 'INSERT';
        $bitacora = new \Shtch\Burgerhouse\models\Bitacora(null, null, null, $accion_buscar);
        $resultados = $bitacora->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($accion_buscar, $registro['accion']);
        }
    }
}