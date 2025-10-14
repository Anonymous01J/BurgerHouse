<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class MetodoPagoModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarMetodoPago()
    {
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago(
            null,
            'Método Test',
            1
        );
        
        $metodo->conn->beginTransaction();
        $id = $metodo->agregar();
        $this->assertIsInt($id);
        $metodo->conn->rollBack();
    }

    public function testActualizarMetodoPago()
    {
        $m = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($metodos)) {
            $this->markTestSkipped('No hay métodos de pago disponibles para actualizar');
        }
        
        $id_ultimo_metodo = $metodos[0]['id'];
        
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago(
            $id_ultimo_metodo,
            'Método Actualizado',
            1
        );
        
        $metodo->conn->beginTransaction();
        $result = $metodo->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $metodo->conn->rollBack();
    }

    public function testBorrarMetodoPago()
    {
        $m = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($metodos)) {
            $this->markTestSkipped('No hay métodos de pago disponibles para borrar');
        }
        
        $id_ultimo_metodo = $metodos[0]['id'];
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago($id_ultimo_metodo);
        
        $metodo->conn->beginTransaction();
        $result = $metodo->borrar();
        $this->assertIsBool($result);
        $metodo->conn->rollBack();
    }

    public function testBuscarMetodoPago()
    {
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago();
        $resultados = $metodo->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarMetodoPagoActivos()
    {
        $metodo = new \Shtch\Burgerhouse\models\Metodo_pago(null, null, 1);
        $resultados = $metodo->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
