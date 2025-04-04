<?php

namespace Shtch\Burgerhouse\core;

class Router
{

    public function run()
    {
        require_once __DIR__ . '/../config/config.php';
        $url = $this->parseUrl();

        $controllerName = !empty($url[0]) ? ucfirst($url[0]) . 'Controller' : 'HomeController';
        $methodName = isset($url[1]) ? $url[1] : 'view';

        // $controllerClass = 'Shtch\\Burgerhouse\\controllers\\' . $controllerName;
        $controller_class = 'Shtch\\Burgerhouse\\controllers\\' . $controllerName;

        // if (class_exists($controllerClass)) {
        //     $controller = new $controllerClass();
        //     if (method_exists($controller, $methodName)) {

        //         $params = array_slice($url, 2);
        //         call_user_func_array([$controller, $methodName], $params);
        //     } else {
        //         header("HTTP/1.0 404 Not Found");
        //         echo "Método <strong>{$methodName}</strong> no encontrado en <strong>{$controllerName}</strong>";
        //     }
        // } else {
        //     // header("HTTP/1.0 404 Not Found");
        //     // header("Location: Error404");
        //     echo "Controlador <strong>{$controllerName}</strong> no encontrado";
        // // }

        if (!(class_exists($controller_class) && method_exists($controller_class, $methodName))) {
            $controller_class = 'Shtch\\Burgerhouse\\controllers\\Error404Controller';
            $methodName = 'view';
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
