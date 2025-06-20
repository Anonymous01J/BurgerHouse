<?php

namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Entrada_producto_procesado;
use Exception;

class Entrada_producto_procesadoController extends Controller_base
{
    public function __construct()
    {
        parent::__construct("entradas_producto_procesado");
        $this->db = new Entrada_producto_procesado();
    }

    public function inventario()
    {
        try {
            $this->db->clear();
            $this->db->__construct();
            echo json_encode($this->db->consultar_vista("vista_inventario_productos_procesados"));
        } catch (Exception $th) {
            echo json_encode(['success' => false, 'message' => $th->getMessage()]);
        }
    }
}
