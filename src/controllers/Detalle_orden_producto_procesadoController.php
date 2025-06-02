<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\DetalleOrdenProductoProcesado;

class Detalle_orden_producto_procesadoController extends Controller_base {

    public function __construct() {
        parent::__construct("detalle_orden_producto_procesado");
        $this->db = new DetalleOrdenProductoProcesado();
    }
    
}