<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;


class OrderController extends Controller_base {

    public function index() {
        // Verifica si la petición es AJAX
        if(isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
            // Respuesta en JSON para AJAX
            header('Content-Type: application/json');
            echo json_encode(['mensaje' => 'Bienvenido al Home (AJAX)']);
        } else {
            // Para peticiones normales se carga la vista
            include_once __DIR__ . '/../views/orders.php';
        }
    }
}
