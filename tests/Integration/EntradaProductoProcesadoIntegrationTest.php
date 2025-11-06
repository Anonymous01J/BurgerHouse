<?php
require_once __DIR__ . '/../../src/config/config.php';

use PHPUnit\Framework\TestCase;

class EntradaProductoProcesadoIntegrationTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testCrearEntradaProductoProcesadoConPago()
    {
        // Obtener datos necesarios
        $producto = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $productos = $producto->search(limite: 1);
        
        $proveedor = new \Shtch\Burgerhouse\models\Proveedor();
        $proveedores = $proveedor->search(limite: 1);
        
        $unidad = new \Shtch\Burgerhouse\models\Unidad();
        $unidades = $unidad->search(limite: 1);
        
        $metodo_pago = new \Shtch\Burgerhouse\models\Metodo_pago();
        $metodos = $metodo_pago->search(limite: 1);
        
        if (empty($productos) || empty($proveedores) || empty($unidades) || empty($metodos)) {
            $this->markTestSkipped('No hay datos suficientes para realizar el test');
        }
        
        $entrada_base = new \Shtch\Burgerhouse\models\Entrada_producto_procesado();
        $conn = $entrada_base->conn;
        $conn->beginTransaction();
        
        try {
            // 1. Crear la entrada de producto procesado
            $entrada = new \Shtch\Burgerhouse\models\Entrada_producto_procesado(
                null,
                $productos[0]['id'],
                $proveedores[0]['id'],
                date('Y-m-d'),
                50, // cantidad
                50, // existencia
                0, // broken
                $unidades[0]['id'],
                date('Y-m-d', strtotime('+6 months')), // fecha_vencimiento
                'asdkaskdaksj',
                1 // active
            );
            
            $id_entrada = $entrada->agregar();
            $this->assertIsInt($id_entrada, 'La entrada debe crearse correctamente');
            
            // 2. Crear el pago asociado a la entrada
            $pago = new \Shtch\Burgerhouse\models\Pago_entrada_producto_procesado(
                null, // id
                $metodos[0]['id'], // id_metodo_pago
                $id_entrada, // id_entrada
                1.00, // tasa
                250.00, // precio_compra
                date('Y-m-d H:i:s'), // fecha
                null, // comprobante (no se usa)
                'REF-PROC-' . time(), // referencia
                'ejemplo.jpg' // imagen_name (este es el que se usa como comprobante)
            );
            
            $id_pago = $pago->agregar();
            $this->assertIsInt($id_pago, 'El pago debe crearse correctamente');
            
            // 3. Verificar que todo se creó correctamente
            $entrada_verificar = new \Shtch\Burgerhouse\models\Entrada_producto_procesado($id_entrada);
            $entrada_data = $entrada_verificar->search(limite: 1);
            $this->assertNotEmpty($entrada_data, 'La entrada debe existir');
            
            $pago_verificar = new \Shtch\Burgerhouse\models\Pago_entrada_producto_procesado(null, null, $id_entrada);
            $pago_data = $pago_verificar->search();
            $this->assertNotEmpty($pago_data, 'El pago de la entrada debe existir');
            $this->assertEquals($id_entrada, $pago_data[0]['id_entrada']);
            
            $conn->rollBack();
            
            $this->assertTrue(true, 'La integración de Entrada Producto Procesado con Pago funciona correctamente');
            
        } catch (\Exception $e) {
            $conn->rollBack();
            $this->fail('Error en la integración: ' . $e->getMessage());
        }
    }
}
