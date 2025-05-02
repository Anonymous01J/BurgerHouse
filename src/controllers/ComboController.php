<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Exception;
use Shtch\Burgerhouse\models\Producto;

class ComboController extends Controller_base {

    public function __construct() {
        parent::__construct(module_name: "combos");
        $this->db = new Producto();
    }

    public function add() {
        header('Content-Type: application/json');
        try {
            $this->db->clear();
            $this->db->__construct(...$_POST);
            $this->guardar_imagen();
            echo json_encode(['success' => true, 'last_id' => $this->db->agregar()]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function guardar_imagen() {
        $imagen = $_FILES['imagen1'];
        move_uploaded_file($imagen['tmp_name'],'../src/media/combos/'.$imagen['name']);
    }
}