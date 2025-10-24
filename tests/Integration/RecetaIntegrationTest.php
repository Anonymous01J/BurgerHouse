<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class RecetaIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearRecetaConDetalles()
    {
        // Obtener un producto preparado válido
        $producto = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos = $producto->search(limite: 1);
        
        // Obtener materias primas válidas
        $materia = new \Shtch\Burgerhouse\models\Materia_prima();
        $materias = $materia->search(limite: 3);
        
        if (empty($productos) || count($materias) < 2) {
            $this->markTestSkipped('No hay suficientes productos o materias primas para realizar el test');
        }
        
        $id_producto = $productos[0]['id'];
        
        // Iniciar transacción
        $receta_base = new \Shtch\Burgerhouse\models\Receta();
        $conn = $receta_base->conn;
        $conn->beginTransaction();
        
        try {
            // 1. Crear la receta
            $receta = new \Shtch\Burgerhouse\models\Receta(
                null,
                $id_producto,
                1
            );
            
            $id_receta = $receta->agregar();
            $this->assertIsInt($id_receta, 'La receta debe crearse correctamente');
            
            // 2. Agregar detalles de la receta
            $detalles_agregados = [];
            
            foreach ($materias as $index => $materia_prima) {
                $detalle = new \Shtch\Burgerhouse\models\Detalle_receta(
                    null,
                    $id_receta,
                    $materia_prima['id'],
                    ($index + 1) * 10 // Cantidad variable
                );
                
                $id_detalle = $detalle->agregar();
                $this->assertIsInt($id_detalle, "El detalle #{$index} debe crearse correctamente");
                $detalles_agregados[] = $id_detalle;
            }
            
            // 3. Verificar que la receta y sus detalles se crearon correctamente
            $receta_verificar = new \Shtch\Burgerhouse\models\Receta($id_receta);
            $receta_data = $receta_verificar->search(limite: 1);
            
            $this->assertNotEmpty($receta_data, 'La receta debe existir en la base de datos');
            $this->assertEquals($id_producto, $receta_data[0]['id_producto']);
            
            // 4. Verificar que los detalles se crearon correctamente
            $detalle_verificar = new \Shtch\Burgerhouse\models\Detalle_receta(null, $id_receta);
            $detalles_data = $detalle_verificar->search();
            
            $this->assertCount(count($materias), $detalles_data, 
                'Deben existir todos los detalles de la receta');
            
            // 5. Verificar que cada detalle tiene los datos correctos
            foreach ($detalles_data as $index => $detalle_data) {
                $this->assertEquals($id_receta, $detalle_data['id_receta']);
                $this->assertNotNull($detalle_data['cantidad']);
                $this->assertNotNull($detalle_data['ingrediente']);
            }
            
            // Si todo salió bien, hacer rollback para no afectar la BD
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Receta con Detalles funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
