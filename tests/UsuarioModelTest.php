<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class UsuarioModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testCrearUsuario()
    {
        $rol = new \Shtch\Burgerhouse\models\Rol();
        $id_rol = $rol->search(order_type: 'DESC')[0]['id'];
        $usuario = new \Shtch\Burgerhouse\models\Usuario(
            null, 
            'Test', 
            password_hash('password123', PASSWORD_DEFAULT), 
            id_rol:$id_rol, 
            active:1, 
            session_id:null, 
            email:'test@example.com',
            apellido:'User', 
        );
        
        $usuario->conn->beginTransaction();
        $id = $usuario->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
        $usuario->conn->rollBack();
    }

    public function testActualizarUsuario()
    {
        // Obtener el último usuario creado
        $usuarioModel = new \Shtch\Burgerhouse\models\Usuario();
        $ultimoUsuario = $usuarioModel->search(order_type: 'DESC')[0];
        
        $usuario = new \Shtch\Burgerhouse\models\Usuario(
            $ultimoUsuario['id'],
            nombre:'Usuario Actualizado',
        );
        
        $usuario->conn->beginTransaction();
        $result = $usuario->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $usuario->conn->rollBack();
    }

    public function testBuscarUsuario()
    {
        $usuario = new \Shtch\Burgerhouse\models\Usuario();
        $resultados = $usuario->search();
        $this->assertIsArray($resultados);
        $this->assertNotEmpty($resultados);
    }

    public function testEliminarUsuario()
    {
        // Obtener el último usuario creado
        $usuarioModel = new \Shtch\Burgerhouse\models\Usuario();
        $ultimoUsuario = $usuarioModel->search(order_type: 'DESC')[0];
        
        $usuario = new \Shtch\Burgerhouse\models\Usuario($ultimoUsuario['id']);
        $usuario->conn->beginTransaction();
        $result = $usuario->borrar();
        $this->assertIsBool($result);
        $this->assertFalse($result);
        $usuario->conn->rollBack();
    }
}
