<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class ProveedorModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarProveedor()
    {
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor(
            null,
            'Proveedor Test',
            'Razón Social Test',
            'J-12345678-9',
            null,
            '04121234567',
            '04129876543',
            'Dirección de prueba',
            1
        );
        
        $proveedor->conn->beginTransaction();
        $id = $proveedor->agregar();
        $this->assertIsInt($id);
        $proveedor->conn->rollBack();
    }

    public function testActualizarProveedor()
    {
        $p = new \Shtch\Burgerhouse\models\Proveedor();
        $proveedores = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($proveedores)) {
            $this->markTestSkipped('No hay proveedores disponibles para actualizar');
        }
        
        $id_ultimo_proveedor = $proveedores[0]['id'];
        
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor(
            $id_ultimo_proveedor,
            'Proveedor Actualizado',
            'Razón Social Actualizada',
            'J-98765432-1',
            null,
            '04141234567',
            '04149876543',
            'Dirección actualizada',
            1
        );
        
        $proveedor->conn->beginTransaction();
        $result = $proveedor->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $proveedor->conn->rollBack();
    }

    public function testBorrarProveedor()
    {
        $p = new \Shtch\Burgerhouse\models\Proveedor();
        $proveedores = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($proveedores)) {
            $this->markTestSkipped('No hay proveedores disponibles para borrar');
        }
        
        $id_ultimo_proveedor = $proveedores[0]['id'];
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor($id_ultimo_proveedor);
        
        $proveedor->conn->beginTransaction();
        $result = $proveedor->borrar();
        $this->assertIsBool($result);
        $proveedor->conn->rollBack();
    }

    public function testBuscarProveedor()
    {
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor();
        $resultados = $proveedor->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('razon_social', $resultados[0]);
            $this->assertArrayHasKey('documento', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarProveedorPorNombreLike()
    {
        $p = new \Shtch\Burgerhouse\models\Proveedor();
        $proveedores = $p->search(limite: 1);
        
        if (empty($proveedores)) {
            $this->markTestSkipped('No hay proveedores disponibles para buscar');
        }
        
        $nombre_completo = $proveedores[0]['nombre'];
        $nombre_parcial = substr($nombre_completo, 0, 3);
        
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor(null, null, null, null, $nombre_parcial);
        $resultados = $proveedor->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }

    public function testBuscarProveedorActivos()
    {
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor(
            null, null, null, null, null, null, null, null, 1
        );
        $resultados = $proveedor->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
