<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Entrada_producto_procesado;

class Entrada_producto_procesadoController extends Controller_base {
    public function __construct() {
        parent::__construct("entradas_producto_procesado");
        $this->db = new Entrada_producto_procesado();
    }
    
}