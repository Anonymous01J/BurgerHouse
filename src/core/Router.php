<?php

namespace Shtch\Burgerhouse\core;

class Router{

    public function run(){
        require_once __DIR__ . '/../config/config.php';
        $url = $this->parseUrl();

        $controllerName = !empty($url[0]) ? "C_".ucfirst($url[0]) : 'C_Home';
        $methodName = isset($url[1]) ? $url[1] : 'view';

        $controller_class = 'Shtch\\Burgerhouse\\controllers\\' . $controllerName;

        if (!(class_exists($controller_class) && method_exists($controller_class, $methodName))) {
            $controller_class = 'Shtch\\Burgerhouse\\controllers\\C_Error404';
            $methodName = 'view';
        }

        $controller = new $controller_class();
        $controller->$methodName(...array_slice($url, 2), ...$_GET);
    }

    private function parseUrl(){
        $uri = $_SERVER['REQUEST_URI'];
        $uri = parse_url($uri, PHP_URL_PATH);
        $uri = str_replace('/BurgerHouse', '', $uri);
        return explode('/', filter_var(trim($uri, '/'), FILTER_SANITIZE_URL));
    }
}
