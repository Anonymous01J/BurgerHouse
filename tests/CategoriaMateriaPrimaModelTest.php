<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class CategoriaMateriaPrimaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarCategoriaMateriaPrima()
    {
        $categoria = new \Shtch\Burgerhouse\models\Categoria_materia_prima(
            null,
            'Categoría Test',
            1
        );
        
        $categoria->conn->beginTransaction();
        $id = $categoria->agregar();
        $this->assertIsInt($id);
        $categoria->conn->rollBack();
    }

    public function testActualizarCategoriaMateriaPrima()
    {
        $c = new \Shtch\Burgerhouse\models\Categoria_materia_prima();
        $categorias = $c->search(order_type: 'DESC', limite: 1);
        
        if (empty($categorias)) {
            $this->markTestSkipped('No hay categorías de materia prima disponibles para actualizar');
        }
        
        $id_ultima_categoria = $categorias[0]['id'];
        
        $categoria = new \Shtch\Burgerhouse\models\Categoria_materia_prima(
            $id_ultima_categoria,
            'Categoría Actualizada',
            1
        );
        
        $categoria->conn->beginTransaction();
        $result = $categoria->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
        $categoria->conn->rollBack();
    }

    public function testBorrarCategoriaMateriaPrima()
    {
        $c = new \Shtch\Burgerhouse\models\Categoria_materia_prima();
        $categorias = $c->search(order_type: 'DESC', limite: 1);
        
        if (empty($categorias)) {
            $this->markTestSkipped('No hay categorías de materia prima disponibles para borrar');
        }
        
        $id_ultima_categoria = $categorias[0]['id'];
        $categoria = new \Shtch\Burgerhouse\models\Categoria_materia_prima($id_ultima_categoria);
        
        $categoria->conn->beginTransaction();
        $result = $categoria->borrar();
        $this->assertIsBool($result);
        $categoria->conn->rollBack();
    }

    public function testBuscarCategoriaMateriaPrima()
    {
        $categoria = new \Shtch\Burgerhouse\models\Categoria_materia_prima();
        $resultados = $categoria->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }

    public function testBuscarCategoriaMateriaPrimaActivas()
    {
        $categoria = new \Shtch\Burgerhouse\models\Categoria_materia_prima(null, null, 1);
        $resultados = $categoria->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        foreach ($resultados as $registro) {
            $this->assertEquals(1, $registro['active']);
        }
    }
}
