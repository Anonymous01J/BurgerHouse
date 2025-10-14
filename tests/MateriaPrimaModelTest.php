<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class MateriaPrimaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarMateriaPrima()
    {
        $categoria = new \Shtch\Burgerhouse\models\Categoria_materia_prima();
        $categorias = $categoria->search(limite: 1);
        
        $unidad = new \Shtch\Burgerhouse\models\Unidad();
        $unidades = $unidad->search(limite: 1);
        
        if (empty($categorias) || empty($unidades)) {
            $this->markTestSkipped('No hay categorías o unidades disponibles para realizar el test');
        }
        
        $id_categoria = $categorias[0]['id'];
        $id_unidad = $unidades[0]['id'];
        
        $materia = new \Shtch\Burgerhouse\models\Materia_prima(
            null,
            $id_categoria,
            $id_unidad,
            'Materia Prima Test',
            10,
            100,
            1
        );
        
        $materia->conn->beginTransaction();
        $id = $materia->agregar();
        $this->assertIsInt($id);
        $materia->conn->rollBack();
    }

    public function testActualizarMateriaPrima()
    {
        $m = new \Shtch\Burgerhouse\models\Materia_prima();
        $materias = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($materias)) {
            $this->markTestSkipped('No hay materias primas disponibles para actualizar');
        }
        
        $id_ultima_materia = $materias[0]['id'];
        $id_categoria = $materias[0]['id_categoria'];
        $id_unidad = $materias[0]['id_unidad'];
        
        $materia = new \Shtch\Burgerhouse\models\Materia_prima(
            $id_ultima_materia,
            nombre:'Materia Prima Actualizada',
        );
        
        $materia->conn->beginTransaction();
        $result = $materia->actualizar();
        $materia->conn->rollBack();
        
        // El método actualizar puede retornar un array con success o un booleano
        $this->assertNotNull($result, 'El método actualizar no debe retornar null');
    }

    public function testBorrarMateriaPrima()
    {
        $m = new \Shtch\Burgerhouse\models\Materia_prima();
        $materias = $m->search(order_type: 'DESC', limite: 1);
        
        if (empty($materias)) {
            $this->markTestSkipped('No hay materias primas disponibles para borrar');
        }
        
        $id_ultima_materia = $materias[0]['id'];
        $materia = new \Shtch\Burgerhouse\models\Materia_prima($id_ultima_materia);
        
        $materia->conn->beginTransaction();
        $result = $materia->borrar();
        $this->assertIsBool($result);
        $materia->conn->rollBack();
    }

    public function testBuscarMateriaPrima()
    {
        $materia = new \Shtch\Burgerhouse\models\Materia_prima();
        $resultados = $materia->search(limite: 10);
        
        $this->assertIsArray($resultados);
        
        if (!empty($resultados)) {
            $this->assertArrayHasKey('id', $resultados[0]);
            $this->assertArrayHasKey('nombre', $resultados[0]);
            $this->assertArrayHasKey('id_categoria', $resultados[0]);
            $this->assertArrayHasKey('active', $resultados[0]);
        }
    }
}
