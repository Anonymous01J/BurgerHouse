<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\DetalleOrdenProductoPreparado;

class Detalle_orden_producto_preparadoController extends Controller_base {

    public function __construct() {
        parent::__construct("detalle_orden_producto_preparado");
        $this->db = new DetalleOrdenProductoPreparado();
    }
    
}