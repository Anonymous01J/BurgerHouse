<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class ProductoProcesadoModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarProductoProcesado()
    {
        // Obtener una categoría válida
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto();
        $categorias = $categoria->search(limite: 1);
        
        if (empty($categorias)) {
            $this->markTestSkipped('No hay categorías disponibles para realizar el test');
        }
        
        $id_categoria = $categorias[0]['id'];
        
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado(
            null,
            $id_categoria,
            'Producto Procesado Test',
            null,
            50.00,
            'Detalles del producto',
            1,
            100,
            10,
            50,
            null,
            'default.jpg'
        );
        
        $producto->conn->beginTransaction();
        $id = $producto->agregar();
        $this->assertIsInt($id);
        $producto->conn->rollBack();
    }

    public function testActualizarProductoProcesado()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $productos = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos procesados disponibles para actualizar');
        }
        
        $id_ultimo_producto = $productos[0]['id'];
        $id_categoria = $productos[0]['id_categoria'];
        
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado(
            $id_ultimo_producto,
            $id_categoria,
            'Producto Procesado Actualizado',
            null,
            75.00,
            'Detalles actualizados',
            1,
            150,
            15,
            75,
            null,
            'default.jpg'
        );
        
        $producto->conn->beginTransaction();
        $result = $producto->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $producto->conn->rollBack();
    }

    public function testBorrarProductoProcesado()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $productos = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos procesados disponibles para borrar');
        }
        
        $id_ultimo_producto = $productos[0]['id'];
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado($id_ultimo_producto);
        
        $producto->conn->beginTransaction();
        $result = $producto->borrar();
        $this->assertIsBool($result);
        $producto->conn->rollBack();
    }

    public function testBuscarProductoProcesado()
    {
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_categoria', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('precio', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarProductoProcesadoPorNombreLike()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $productos = $p->search(limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos procesados disponibles para buscar');
        }
        
        $nombre_completo = $productos[0]['nombre'];
        $nombre_parcial = substr($nombre_completo, 0, 3);
        
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado(
            null, null, null, null, null, null, null, null, null, null, $nombre_parcial
        );
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }

    public function testBuscarProductoProcesadoActivos()
    {
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado(
            null, null, null, null, null, null, 1
        );
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
