<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class EntradaMateriaPrimaIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearEntradaMateriaPrimaConDetalles()
    {
        // Obtener un proveedor válido
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor();
        $proveedores = $proveedor->search(limite: 1);
        
        // Obtener materias primas válidas
        $materia = new \Shtch\Burgerhouse\models\Materia_prima();
        $materias = $materia->search(limite: 3);
        
        if (empty($proveedores) || count($materias) < 2) {
            $this->markTestSkipped('No hay suficientes proveedores o materias primas para realizar el test');
        }
        
        $entrada_base = new \Shtch\Burgerhouse\models\Entrada_materia_prima();
        $conn = $entrada_base->conn;
        $conn->beginTransaction();
        
        try {
            // 1. Crear la entrada de materia prima
            $entrada = new \Shtch\Burgerhouse\models\Entrada_materia_prima(
                null,
                $proveedores[0]['id'],
                date('Y-m-d')
            );
            
            $id_entrada = $entrada->agregar();
            $this->assertIsInt($id_entrada, 'La entrada debe crearse correctamente');
            
            // 2. Agregar detalles de la entrada
            $detalles_agregados = [];
            
            foreach ($materias as $index => $materia_prima) {
                $detalle = new \Shtch\Burgerhouse\models\Detalle_entrada_materia_prima(
                    null, // id
                    $materia_prima['id'], // id_materia_prima
                    'COD' . str_pad($index + 1, 5, '0', STR_PAD_LEFT), // codigo
                    date('Y-m-d', strtotime('+1 year')), // fecha_vencimiento
                    $id_entrada, // id_entrada
                    ($index + 1) * 5, // cantidad
                    ($index + 1) * 5, // existencia
                    0, // broken
                    1 // active
                );
                
                $id_detalle = $detalle->agregar();
                $this->assertIsInt($id_detalle, "El detalle #{$index} debe crearse correctamente");
                $detalles_agregados[] = $id_detalle;
            }
            
            
            // 3. Verificar que la entrada se creó correctamente
            $entrada_verificar = new \Shtch\Burgerhouse\models\Entrada_materia_prima($id_entrada);
            $entrada_data = $entrada_verificar->search(limite: 1);
            
            $this->assertNotEmpty($entrada_data, 'La entrada debe existir en la base de datos');
            $this->assertEquals($proveedores[0]['id'], $entrada_data[0]['id_proveedor']);
            
            // 4. Verificar que los detalles se crearon correctamente
            $this->assertGreaterThan(0, count($detalles_agregados), 
                'Deben existir detalles de la entrada');
            $this->assertEquals(count($materias), count($detalles_agregados), 
                'Se deben haber creado todos los detalles solicitados');
            
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Entrada de Materia Prima con Detalles funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
