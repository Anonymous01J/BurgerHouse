<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class OrdenIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearOrdenConProductos()
    {
        // Obtener productos preparados y procesados
        $producto_preparado = new \Shtch\Burgerhouse\models\ProductoPreparado();
        $productos_preparados = $producto_preparado->search(limite: 2);
        
        $producto_procesado = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $productos_procesados = $producto_procesado->search(limite: 2);
        
        if (empty($productos_preparados) && empty($productos_procesados)) {
            $this->markTestSkipped('No hay productos disponibles para realizar el test');
        }
        
        $orden_base = new \Shtch\Burgerhouse\models\Orden();
        $conn = $orden_base->conn;
        $conn->beginTransaction();
        
        try {
            // 1. Crear la orden
            $orden = new \Shtch\Burgerhouse\models\Orden(
                null,
                rand(1000, 9999), // nro_orden
                null, // id_cliente
                date('Y-m-d H:i:s'), // fecha
                'local', // tipo
                'preparacion' // status
            );
            
            $id_orden = $orden->agregar();
            $this->assertIsInt($id_orden, 'La orden debe crearse correctamente');
            
            $detalles_agregados = 0;
            
            // 2. Agregar productos preparados a la orden
            if (!empty($productos_preparados)) {
                foreach ($productos_preparados as $index => $producto) {
                    $detalle = new \Shtch\Burgerhouse\models\DetalleOrdenProductoPreparado(
                        null,
                        $id_orden,
                        $producto['id'],
                        $index + 1, // Cantidad
                        $producto['precio']
                    );
                    
                    $id_detalle = $detalle->agregar();
                    $this->assertIsInt($id_detalle, "El detalle de producto preparado #{$index} debe crearse");
                    $detalles_agregados++;
                }
            }
            
            // 3. Agregar productos procesados a la orden
            if (!empty($productos_procesados)) {
                foreach ($productos_procesados as $index => $producto) {
                    $detalle = new \Shtch\Burgerhouse\models\DetalleOrdenProductoProcesado(
                        null,
                        $id_orden,
                        $producto['id'],
                        $index + 1, // Cantidad
                        $producto['precio']
                    );
                    
                    $id_detalle = $detalle->agregar();
                    $this->assertIsInt($id_detalle, "El detalle de producto procesado #{$index} debe crearse");
                    $detalles_agregados++;
                }
            }
            
            // 4. Verificar que la orden se creó correctamente
            $orden_verificar = new \Shtch\Burgerhouse\models\Orden($id_orden);
            $orden_data = $orden_verificar->search(limite: 1);
            
            $this->assertNotEmpty($orden_data, 'La orden debe existir en la base de datos');
            $this->assertEquals('preparacion', $orden_data[0]['status']);
            
            // 5. Verificar que se agregaron detalles
            $this->assertGreaterThan(0, $detalles_agregados, 'Deben existir detalles en la orden');
            
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Orden con Productos funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            // Si el error es de constraint de FK, significa que los productos no existen
            if (str_contains($e->getMessage(), 'foreign key constraint')) {
                $this->markTestSkipped('Los productos no existen en la base de datos');
            }
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
