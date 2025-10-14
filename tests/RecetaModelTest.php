<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class RecetaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarReceta()
    {
        // Obtener un producto preparado válido
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos = $producto->search(limite: 1);
        
        if (empty($productos)) {
            $this->markTestSkipped('No hay productos preparados disponibles para realizar el test');
        }
        
        $id_producto = $productos[0]['id'];
        
        $receta = new \Shtch\Burgerhouse\models\Receta(
            null,
            $id_producto,
            1
        );
        
        $receta->conn->beginTransaction();
        $id = $receta->agregar();
        $this->assertIsInt($id);
        $receta->conn->rollBack();
    }

    public function testActualizarReceta()
    {
        $r = new \Shtch\Burgerhouse\models\Receta();
        $recetas = $r->search(order_type: 'DESC', limite: 1);
        
        if (empty($recetas)) {
            $this->markTestSkipped('No hay recetas disponibles para actualizar');
        }
        
        $id_ultima_receta = $recetas[0]['id'];
        $id_producto = $recetas[0]['id_producto'];
        
        $receta = new \Shtch\Burgerhouse\models\Receta(
            $id_ultima_receta,
            $id_producto,
            1
        );
        
        $receta->conn->beginTransaction();
        $result = $receta->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $receta->conn->rollBack();
    }

    public function testBorrarReceta()
    {
        $r = new \Shtch\Burgerhouse\models\Receta();
        $recetas = $r->search(order_type: 'DESC', limite: 1);
        
        if (empty($recetas)) {
            $this->markTestSkipped('No hay recetas disponibles para borrar');
        }
        
        $id_ultima_receta = $recetas[0]['id'];
        $receta = new \Shtch\Burgerhouse\models\Receta($id_ultima_receta);
        
        $receta->conn->beginTransaction();
        $result = $receta->borrar();
        $this->assertIsBool($result);
        $receta->conn->rollBack();
    }

    public function testBuscarReceta()
    {
        $receta = new \Shtch\Burgerhouse\models\Receta();
        $resultados = $receta->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('id_producto', $resultados[0]);
            $this->assertArrayHasKey('nombre_producto', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarRecetaActivas()
    {
        $receta = new \Shtch\Burgerhouse\models\Receta(null, null, 1);
        $resultados = $receta->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }

    public function testBuscarRecetaPorNombreLike()
    {
        $r = new \Shtch\Burgerhouse\models\Receta();
        $recetas = $r->search(limite: 1);
        
        if (empty($recetas)) {
            $this->markTestSkipped('No hay recetas disponibles para buscar');
        }
        
        $nombre_completo = $recetas[0]['nombre_producto'];
        $nombre_parcial = substr($nombre_completo, 0, 3);
        
        $receta = new \Shtch\Burgerhouse\models\Receta(null, null, null, $nombre_parcial);
        $resultados = $receta->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
