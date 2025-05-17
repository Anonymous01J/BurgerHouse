<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Entrada_producto_procesado;

class Entrada_productos_procesados extends Controller_base {
    public function __construct() {
        parent::__construct("entrada_producto_procesado");
        $this->db = new Entrada_producto_procesado();
    }
    
}