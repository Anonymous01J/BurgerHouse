<?php
namespace Shtch\Burgerhouse\controllers;

class HomeController {

    public function index() {
        // Verifica si la petición es AJAX
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
            // Leer los datos enviados con FormData
            $nombre = $_POST['nombre'] ?? null;
            $mensaje = $_POST['mensaje'] ?? null;

            // Respuesta en JSON
            header('Content-Type: application/json');
            echo json_encode([
                'status' => 'success',
                'nombre' => $nombre,
                'mensaje' => $mensaje
            ]);
        } else {
            // Para peticiones normales se carga la vista
            include_once __DIR__ . '/../Views/index.php';
        }
    }
}