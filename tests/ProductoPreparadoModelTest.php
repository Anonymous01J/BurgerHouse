<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class ProductoPreparadoModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarProductoPreparado()
    {
        // Obtener una categoría válida
        $categoria = new \Shtch\Burgerhouse\models\Categoria_producto();
        $categorias = $categoria->search(limite: 1);
        
        if (empty($categorias)) {
            $this->markTestSkipped('No hay categorías disponibles para realizar el test');
        }
        
        $id_categoria = $categorias[0]['id'];
        
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado(
            null,
            $id_categoria,
            'Producto Preparado Test',
            null,
            45.00,
            'Detalles del producto preparado',
            1,
            'plato',
            null,
            'default.jpg'
        );
        
        $producto->conn->beginTransaction();
        $id = $producto->agregar();
        $this->assertIsInt($id);
        $producto->conn->rollBack();
    }

    public function testActualizarProductoPreparado()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos preparados disponibles para actualizar');
        }
        
        $id_ultimo_producto = $productos[0]['id'];
        $id_categoria = $productos[0]['id_categoria'];
        
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado(
            $id_ultimo_producto,
            $id_categoria,
            'Producto Preparado Actualizado',
            null,
            65.00,
            'Detalles actualizados del producto',
            1,
            'bebida',
            null,
            'default.jpg'
        );
        
        $producto->conn->beginTransaction();
        $result = $producto->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $producto->conn->rollBack();
    }

    public function testBorrarProductoPreparado()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos = $p->search(order_type: 'DESC', limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos preparados disponibles para borrar');
        }
        
        $id_ultimo_producto = $productos[0]['id'];
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado($id_ultimo_producto);
        
        $producto->conn->beginTransaction();
        $result = $producto->borrar();
        $this->assertIsBool($result);
        $producto->conn->rollBack();
    }

    public function testBuscarProductoPreparado()
    {
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_categoria', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('precio', $resultados[0]);
            $this->assertArrayHasKey('tipo', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarProductoPreparadoPorNombreLike()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos = $p->search(limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos preparados disponibles para buscar');
        }
        
        $nombre_completo = $productos[0]['nombre'];
        $nombre_parcial = substr($nombre_completo, 0, 3);
        
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado(
            null, null, null, null, null, null, null, null, $nombre_parcial
        );
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }

    public function testBuscarProductoPreparadoActivos()
    {
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado(
            null, null, null, null, null, null, 1
        );
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }

    public function testBuscarProductoPreparadoPorTipo()
    {
        $p = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos = $p->search(limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos preparados disponibles para buscar');
        }
        
        $tipo = $productos[0]['tipo'];
        
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado(
            null, null, null, null, null, null, null, $tipo
        );
        $resultados = $producto->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals($tipo, $registro['tipo']);
        }
    }
}
