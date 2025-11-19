<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class UnitsModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testAgregarUnidad()
    {
        $unidad = new \Shtch\Burgerhouse\models\Unidad(
            null, // id
            'Litro', // nombre
            'L', // abreviatura
            1 // activo
        );
        
        $unidad->conn->beginTransaction();
        $id = $unidad->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
        $unidad->conn->rollBack();
    }

    public function testActualizarUnidad()
    {
        // Buscar una unidad existente para actualizar
        $unidad = new \Shtch\Burgerhouse\models\Unidad();
        $unidades = $unidad->search(limite: 1);
        
        if (empty($unidades)) {
            $this->markTestSkipped('No hay unidades disponibles para actualizar');
        }
        
        $unidad_actualizar = new \Shtch\Burgerhouse\models\Unidad(
            $unidades[0]['id'],
            'Mililitro', // nuevo nombre
            'ml', // nueva abreviatura
            1 // activo
        );
        
        $unidad_actualizar->conn->beginTransaction();
        $resultado = $unidad_actualizar->actualizar();
        $this->assertIsArray($resultado);
        $this->assertTrue($resultado['success']);
        $unidad_actualizar->conn->rollBack();
    }

    public function testBuscarUnidad()
    {
        $unidad = new \Shtch\Burgerhouse\models\Unidad();
        $resultados = $unidad->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
