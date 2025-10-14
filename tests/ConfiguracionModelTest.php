<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class ConfiguracionModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarConfiguracion()
    {
        $config = new \Shtch\Burgerhouse\models\Configuracion(
            null,
            'test_key',
            'test_value'
        );
        
        $config->conn->beginTransaction();
        $id = $config->agregar();
        $this->assertIsInt($id);
        $config->conn->rollBack();
    }

    public function testActualizarConfiguracion()
    {
        $c = new \Shtch\Burgerhouse\models\Configuracion();
        $configs = $c->search(order_type: 'DESC', limite: 1);
        
        if (empty($configs)) {
            $this->markTestSkipped('No hay configuraciones disponibles para actualizar');
        }
        
        $id_ultima_config = $configs[0]['id'];
        
        $config = new \Shtch\Burgerhouse\models\Configuracion(
            $id_ultima_config,
            'updated_key',
            'updated_value'
        );
        
        $config->conn->beginTransaction();
        $result = $config->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $config->conn->rollBack();
    }

    public function testBorrarConfiguracion()
    {
        $c = new \Shtch\Burgerhouse\models\Configuracion();
        $configs = $c->search(order_type: 'DESC', limite: 1);
        
        if (empty($configs)) {
            $this->markTestSkipped('No hay configuraciones disponibles para borrar');
        }
        
        $id_ultima_config = $configs[0]['id'];
        $config = new \Shtch\Burgerhouse\models\Configuracion($id_ultima_config);
        
        $config->conn->beginTransaction();
        $result = $config->borrar();
        $this->assertIsBool($result);
        $config->conn->rollBack();
    }

    public function testBuscarConfiguracion()
    {
        $config = new \Shtch\Burgerhouse\models\Configuracion();
        $resultados = $config->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
        }
    }
}
