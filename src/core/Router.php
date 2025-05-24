<?php

namespace Shtch\Burgerhouse\core;

class Router
{
    public function run()
    {
        session_start();
        require_once __DIR__ . '/../config/config.php';
        $url = $this->parseUrl();

        //validar si la url es un archivo de media
        if (strpos($url[0], 'media') === 0) {
            $filePath = '../src/' . implode('/', $url);
            if (file_exists($filePath)) {
                header('Content-Type: ' . mime_content_type($filePath));
                readfile($filePath);
                exit;
            } else {
                http_response_code(404);
                echo "Archivo no encontrado.";
                exit;
            }
        }

        $controllerName = !empty($url[0]) ? ucfirst($url[0]) . 'Controller' : 'HomeController';
        $methodName = isset($url[1]) ? $url[1] : 'view';

        $controller_class = 'Shtch\\Burgerhouse\\controllers\\' . $controllerName;

        if (!(class_exists($controller_class) && method_exists($controller_class, $methodName))) {
            $controller_class = 'Shtch\\Burgerhouse\\controllers\\Error404Controller';
            $methodName = 'view';
        }

        if (!isset($_SESSION['id']) && $controllerName != "ChangepassController") {
            $controller_class = 'Shtch\\Burgerhouse\\controllers\\LoginController';
        }
        $controller = new $controller_class();
        $controller->$methodName(...array_slice($url, 2), ...$_GET);
    }

    private function parseUrl()
    {
        $uri = $_SERVER['REQUEST_URI'];
        $uri = parse_url($uri, PHP_URL_PATH);
        $uri = str_replace('/BurgerHouse', '', $uri);
        return explode('/', filter_var(trim($uri, '/'), FILTER_SANITIZE_URL));
    }
}
