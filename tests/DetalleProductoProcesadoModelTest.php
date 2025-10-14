<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class DetalleProductoProcesadoModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testBuscarDetalleProductoProcesado()
    {
        $detalle = new \Shtch\Burgerhouse\models\DetalleOrdenProductoProcesado();
        $resultados = $detalle->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
