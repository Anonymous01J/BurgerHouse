<?php
namespace Shtch\Burgerhouse\controllers;

class PermissionsController {

    public function index() {
        if(isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
            header('Content-Type: application/json');
            echo json_encode(['mensaje' => 'Bienvenido al Home (AJAX)']);
        } else {
            include_once __DIR__ . '/../views/permissions.php';
        }
    }
}