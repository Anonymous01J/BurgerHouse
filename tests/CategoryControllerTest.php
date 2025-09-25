<?php
require_once __DIR__ . '/../src/config/config.php';

use PHPUnit\Framework\TestCase;

class CategoryControllerTest extends TestCase
{
    protected function setUp(): void
    {
        if (!isset($_SESSION)) {
            $_SESSION = [];
        }
        $_SESSION['id_rol'] = 1;
        $_SESSION['permisos'] = [];
    }

    // public function testViewCategoriasProductoHtml()
    // {
    //     $controller = new \Shtch\Burgerhouse\controllers\CategoryController();
    //     ob_start();
    //     $controller->view();
    //     $output = ob_get_clean();
    //     $this->assertStringContainsString('<html', $output);
    // }

    public function testViewCategoriasProductoStatus200()
    {
        $controller = new \Shtch\Burgerhouse\controllers\CategoryController('category');
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
