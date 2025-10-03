<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class EntradaMateriaPrimaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testAgregarEntradaMateriaPrima()
    {
        $c1 = new \Shtch\Burgerhouse\models\Materia_prima();
        $id_materia = $c1->search()[0]['id'];

        $c2 = new \Shtch\Burgerhouse\models\Proveedor();
        $id_proveedor = $c2->search()[0]['id'];

        $c3 = new \Shtch\Burgerhouse\models\Unidad();
        $id_unidad = $c3->search()[0]['id'];

        $entrada = new \Shtch\Burgerhouse\models\Entrada_materia_prima(null, $id_materia, $id_proveedor, '000001', '2025-10-02', '2025-10-02', 1, id_unidad:$id_unidad, cantidad:10, existencia:10, imagen_name:'000000');
        $id = $entrada->agregar();
        $this->assertIsInt($id);
        $this->assertGreaterThan(0, $id);
    }

    public function testActualizarEntradaMateriaPrima()
    {
        $entrada = new \Shtch\Burgerhouse\models\Entrada_materia_prima(1, 1, 10, '000001', '2025-10-02', '2025-10-02', 1,cantidad:10, existencia:10, imagen_name:'000000');
        $result = $entrada->actualizar();
        $this->assertIsArray($result);
        $this->assertTrue($result['success']);
    }

    public function testBorrarEntradaMateriaPrima()
    {
        $entrada = new \Shtch\Burgerhouse\models\Entrada_materia_prima(1, 1, 0, '', 1);
        $result = $entrada->borrar();
        $this->assertIsBool($result);
    }
}
