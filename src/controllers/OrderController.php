<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Orden;
use Shtch\Burgerhouse\models\DetalleOrdenProductoPreparado;
use Shtch\Burgerhouse\models\DetalleOrdenProductoProcesado;

class OrderController extends Controller_base {

    public function __construct() {
        parent::__construct("orders");
        $this->db = new Orden();
    }
    public function add() {
        try {
            $this->db->clear();
            $this->db->__construct(...$_POST);
            $last_id = $this->db->agregar();
            
            $clase_detalle_producto_preparado = new DetalleOrdenProductoPreparado();
            $clase_detalle_producto_procesado = new DetalleOrdenProductoProcesado();
            for ($i = 0; $i < count($_POST['lista_detalle_preparado']); $i++) {
                $clase_detalle_producto_preparado->__construct(...['id_orden' => $last_id,...$_POST['lista_detalle_preparado'][$i]]);
                $clase_detalle_producto_preparado->agregar();
            }
            for ($i = 0; $i < count($_POST['lista_detalle_procesado']); $i++) {
                $clase_detalle_producto_procesado->__construct(...['id_orden' => $last_id,...$_POST['lista_detalle_procesado'][$i]]);
                $clase_detalle_producto_procesado->agregar();
            }
            echo json_encode(['success' => true, 'last_id' => $last_id]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
}
