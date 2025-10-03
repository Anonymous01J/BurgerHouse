<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class EntradaProductoProcesadoModelTest extends TestCase
{
    private $id;
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testAgregarEntradaProductoProcesado()
    {
        $c1 = new \Shtch\Burgerhouse\models\ProductoProcesado();
        $id_producto = $c1->search()[0]['id'];

        $c2 = new \Shtch\Burgerhouse\models\Proveedor();
        $id_proveedor = $c2->search()[0]['id'];

        // unidad
        $c3 = new \Shtch\Burgerhouse\models\Unidad();
        $id_unidad = $c3->search()[0]['id'];

        $entrada = new \Shtch\Burgerhouse\models\Entrada_producto_procesado(null, $id_producto, $id_proveedor, '2025-10-02', 1, id_unidad:$id_unidad, cantidad:5, existencia:5, imagen_name:'000000');
        $this->id = $entrada->agregar();
        $this->assertIsInt($this->id);
        $this->assertGreaterThan(0, $this->id);
    }

    public function testActualizarEntradaProductoProcesado()
    {

        // unidad
        $c3 = new \Shtch\Burgerhouse\models\Unidad();
        $id_unidad = $c3->search()[0]['id'];
        $entrada = new \Shtch\Burgerhouse\models\Entrada_producto_procesado($this->id, cantidad:10, existencia:10);
        $result = $entrada->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarEntradaProductoProcesado()
    {
        $entrada = new \Shtch\Burgerhouse\models\Entrada_producto_procesado($this->id);
        $result = $entrada->borrar();
        $this->assertIsBool($result);
    }
}
