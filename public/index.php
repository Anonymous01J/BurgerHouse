<?php

require_once __DIR__ . '/../vendor/autoload.php';

use Shtch\Burgerhouse\core\Router;

$router = new Router();
$router->run();