<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PagoEntradaMateriaPrimaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testBuscarPagoEntradaMateriaPrima()
    {
        $pago = new \Shtch\Burgerhouse\models\Pago_entrada_materia_prima();
        $resultados = $pago->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
