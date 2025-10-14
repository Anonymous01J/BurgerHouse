<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class PaquetesMesaModelTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    public function testBuscarPaquetesMesa()
    {
        $paquete_mesa = new \Shtch\Burgerhouse\models\Paquetes_mesa();
        $resultados = $paquete_mesa->search(limite: 10);
        
        $this->assertIsArray($resultados);
    }
}
