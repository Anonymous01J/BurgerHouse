<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class RolModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarRol()
    {
        $rol = new \Shtch\Burgerhouse\models\Rol(
            null,
            'Rol de Prueba',
            'Este es un rol de prueba para testing',
            null,
            1
        );
        
        $rol->conn->beginTransaction();
        $id = $rol->agregar();
        $this->assertIsInt($id);
        $rol->conn->rollBack();
    }

    public function testActualizarRol()
    {
        $r = new \Shtch\Burgerhouse\models\Rol();
        $roles = $r->search(order_type: 'DESC', limite: 1);
        
        if (empty($roles)) {
            $this->markTestSkipped('No hay roles disponibles para actualizar');
        }
        
        $id_ultimo_rol = $roles[0]['id'];
        
        $rol = new \Shtch\Burgerhouse\models\Rol(
            $id_ultimo_rol,
            'Rol Actualizado',
            'Descripción actualizada del rol',
            null,
            1
        );
        
        $rol->conn->beginTransaction();
        $result = $rol->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $rol->conn->rollBack();
    }

    public function testBorrarRol()
    {
        $r = new \Shtch\Burgerhouse\models\Rol();
        $roles = $r->search(order_type: 'DESC', limite: 1);
        
        if (empty($roles)) {
            $this->markTestSkipped('No hay roles disponibles para borrar');
        }
        
        $id_ultimo_rol = $roles[0]['id'];
        $rol = new \Shtch\Burgerhouse\models\Rol($id_ultimo_rol);
        
        $rol->conn->beginTransaction();
        $result = $rol->borrar();
        $this->assertIsBool($result);
        $rol->conn->rollBack();
    }

    public function testBuscarRol()
    {
        $rol = new \Shtch\Burgerhouse\models\Rol();
        $resultados = $rol->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('descripcion', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarRolPorNombre()
    {
        $r = new \Shtch\Burgerhouse\models\Rol();
        $roles = $r->search(limite: 1);
        
        if (empty($roles)) {
            $this->markTestSkipped('No hay roles disponibles para buscar');
        }
        
        $nombre_buscar = $roles[0]['nombre'];
        
        $rol = new \Shtch\Burgerhouse\models\Rol(null, $nombre_buscar);
        $resultados = $rol->search(limite: 10);
        
        $this->assertIsArray($resultados);
        $this->assertNotEmpty($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($nombre_buscar, $registro['nombre']);
        }
    }

    public function testBuscarRolPorNombreLike()
    {
        $r = new \Shtch\Burgerhouse\models\Rol();
        $roles = $r->search(limite: 1);
        
        if (empty($roles)) {
            $this->markTestSkipped('No hay roles disponibles para buscar');
        }
        
        // Tomar las primeras letras del nombre para buscar con LIKE
        $nombre_completo = $roles[0]['nombre'];
        $nombre_parcial = substr($nombre_completo, 0, 3);
        
        $rol = new \Shtch\Burgerhouse\models\Rol(null, null, null, $nombre_parcial);
        $resultados = $rol->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertStringContainsString($nombre_parcial, $registro['nombre']);
        }
    }

    public function testBuscarRolActivos()
    {
        $rol = new \Shtch\Burgerhouse\models\Rol(null, null, null, null, 1);
        $resultados = $rol->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }

    public function testBuscarRolInactivos()
    {
        $rol = new \Shtch\Burgerhouse\models\Rol(null, null, null, null, 0);
        $resultados = $rol->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(0, $registro['active']);
        }
    }
}
