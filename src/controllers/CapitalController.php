<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Movimiento_capital;
use Exception;

class CapitalController extends Controller_base {
    public function __construct() {
        parent::__construct("capital");
        $this->db = new Movimiento_capital();
    }
    public function GetCapital() {
        try {
            echo json_encode($this->db->consultar_vista("vista_resumen_financiero"));
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
}