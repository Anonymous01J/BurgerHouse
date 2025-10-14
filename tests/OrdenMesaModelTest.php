<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class OrdenMesaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testBuscarOrdenMesa()
    {
        $orden_mesa = new \Shtch\Burgerhouse\models\Orden_mesa();
        $resultados = $orden_mesa->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
