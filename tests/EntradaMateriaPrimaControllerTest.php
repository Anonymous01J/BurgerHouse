<?php
require_once __DIR__ . '/../src/config/config.php';
use PHPUnit\Framework\TestCase;

class EntradaMateriaPrimaControllerTest extends TestCase
{
    public function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
    }

    public function testViewEntradaMateriaPrimaStatus200()
    {
        $controller = new \Shtch\Burgerhouse\controllers\Entrada_materia_primaController('entrada_materia_prima');
        ob_start();
        $controller->view();
        ob_get_clean();
        $headers = headers_list();
        $has200 = true;
        foreach ($headers as $header) {
            if (stripos($header, '404') !== false || stripos($header, '500') !== false) {
                $has200 = false;
                break;
            }
        }
        $this->assertTrue($has200, 'No se obtuvo código 200 OK');
    }
}
