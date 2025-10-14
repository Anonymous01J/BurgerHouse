<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class NotificacionModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarNotificacion()
    {
        // Obtener un usuario válido
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $usuarios = $usuario->search(limite: 1);
        
        if (empty($usuarios)) {
            $this->markTestSkipped('No hay usuarios disponibles para realizar el test');
        }
        
        $id_usuario = $usuarios[0]['id'];
        
        $notificacion = new \Shtch\Burgerhouse\models\Notificacion(
            null,
            $id_usuario,
            0,
            'Titulo de prueba',
            'Este es un mensaje de prueba',
            date('Y-m-d H:i:s')
        );
        
        $notificacion->conn->beginTransaction();
        $id = $notificacion->agregar();
        $this->assertIsInt($id);
        $notificacion->conn->rollBack();
    }

    public function testActualizarNotificacion()
    {
        $n = new \Shtch\Burgerhouse\models\Notificacion();
        $notificaciones = $n->search(order_type: 'DESC', limite: 1);
        
        if (empty($notificaciones)) {
            $this->markTestSkipped('No hay notificaciones disponibles para actualizar');
        }
        
        $id_ultima_notificacion = $notificaciones[0]['id'];
        $id_usuario = $notificaciones[0]['id_usuario'];
        
        $notificacion = new \Shtch\Burgerhouse\models\Notificacion(
            $id_ultima_notificacion,
            $id_usuario,
            1,
            'Titulo actualizado',
            'Mensaje actualizado',
            date('Y-m-d H:i:s')
        );
        
        $notificacion->conn->beginTransaction();
        $result = $notificacion->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $notificacion->conn->rollBack();
    }

    public function testBorrarNotificacion()
    {
        $n = new \Shtch\Burgerhouse\models\Notificacion();
        $notificaciones = $n->search(order_type: 'DESC', limite: 1);
        
        if (empty($notificaciones)) {
            $this->markTestSkipped('No hay notificaciones disponibles para borrar');
        }
        
        $id_ultima_notificacion = $notificaciones[0]['id'];
        $notificacion = new \Shtch\Burgerhouse\models\Notificacion($id_ultima_notificacion);
        
        $notificacion->conn->beginTransaction();
        $result = $notificacion->borrar();
        $this->assertIsBool($result);
        $notificacion->conn->rollBack();
    }

    public function testBuscarNotificacion()
    {
        $notificacion = new \Shtch\Burgerhouse\models\Notificacion();
        $resultados = $notificacion->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_usuario', $resultados[0]);
            $this->assertArrayHasKey('status', $resultados[0]);
            $this->assertArrayHasKey('titulo', $resultados[0]);
            $this->assertArrayHasKey('mensaje', $resultados[0]);
            $this->assertArrayHasKey('fecha', $resultados[0]);
        }
    }

    public function testBuscarNotificacionPorUsuario()
    {
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $usuarios = $usuario->search(limite: 1);
        
        if (empty($usuarios)) {
            $this->markTestSkipped('No hay usuarios disponibles para realizar el test');
        }
        
        $id_usuario = $usuarios[0]['id'];
        
        $notificacion = new \Shtch\Burgerhouse\models\Notificacion(null, $id_usuario);
        $resultados = $notificacion->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($id_usuario, $registro['id_usuario']);
        }
    }

    public function testBuscarNotificacionPorStatus()
    {
        $notificacion = new \Shtch\Burgerhouse\models\Notificacion(null, null, 0);
        $resultados = $notificacion->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(0, $registro['status']);
        }
    }
}
