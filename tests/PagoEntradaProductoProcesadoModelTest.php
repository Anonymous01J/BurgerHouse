<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PagoEntradaProductoProcesadoModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testBuscarPagoEntradaProductoProcesado()
    {
        $pago = new \Shtch\Burgerhouse\models\Pago_entrada_producto_procesado();
        $resultados = $pago->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
