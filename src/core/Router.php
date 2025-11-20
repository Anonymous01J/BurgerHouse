<?php

namespace Shtch\Burgerhouse\core;

class Router
{
    public function run()
    {
        session_start();
        require_once __DIR__ . '/../config/config.php';
        require_once __DIR__ . '/../controllers/Controller_base.php';
        $url = $this->parseUrl();
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
        
        $controllerName = !empty($url[0]) ? $url[0] : 'Home';
        $methodName = $url[1] ?? 'view';
        if (!isset($_SESSION['id']) && !in_array(strtolower($controllerName), ['login', 'changepass', 'recover_password'])) {
            $controllerName = 'Login';
            $methodName = 'view';
        }
        $controllerFile = __DIR__ . '/../controllers/' . ucfirst($controllerName) . 'Controller.php';

        if (!file_exists($controllerFile)) {
            $controllerFile = __DIR__ . '/../controllers/Error404Controller.php';
            $controllerName = 'Error404';
            $methodName = 'view';
        }
        require_once $controllerFile;
        $namespace = 'Shtch\\Burgerhouse\\controllers\\' . ucfirst($controllerName);
        $functionName = $namespace . '\\' . $methodName;
        if (function_exists($functionName)) {
            $functionName(...array_slice($url, 2), ...$_GET);
        } else {
            $error404File = __DIR__ . '/../controllers/Error404Controller.php';
            require_once $error404File;
            $error404Function = 'Shtch\\Burgerhouse\\controllers\\Error404\\view';
            $error404Function();
        }
    }

    private function parseUrl()
    {
        $uri = $_SERVER['REQUEST_URI'];
        $uri = parse_url($uri, PHP_URL_PATH);
        $uri = str_replace('/BurgerHouse', '', $uri);
        $uri = str_replace('/burgerhouse', '', $uri);
        return explode('/', filter_var(trim($uri, '/'), FILTER_SANITIZE_URL));
    }
}
