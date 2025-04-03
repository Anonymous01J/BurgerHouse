<?php

namespace Shtch\Burgerhouse\core;

class Router
{

    public function run()
    {
        $url = $this->parseUrl();

        $controllerName = !empty($url[0]) ? ucfirst($url[0]) . 'Controller' : 'HomeController';
        $methodName = isset($url[1]) ? $url[1] : 'index';

        $controllerClass = 'Shtch\\Burgerhouse\\controllers\\' . $controllerName;

        if (class_exists($controllerClass)) {
            $controller = new $controllerClass();
            if (method_exists($controller, $methodName)) {

                $params = array_slice($url, 2);
                call_user_func_array([$controller, $methodName], $params);
            } else {
                header("HTTP/1.0 404 Not Found");
                echo "Método <strong>{$methodName}</strong> no encontrado en <strong>{$controllerName}</strong>";
            }
        } else {
            // header("HTTP/1.0 404 Not Found");
            // header("Location: Error404");
            echo "Controlador <strong>{$controllerName}</strong> no encontrado";
        }
    }

    private function parseUrl()
    {
        $uri = $_SERVER['REQUEST_URI'];
        $uri = parse_url($uri, PHP_URL_PATH);
        $uri = str_replace('/BurgerHouse', '', $uri);
        return explode('/', filter_var(trim($uri, '/'), FILTER_SANITIZE_URL));
    }
}
