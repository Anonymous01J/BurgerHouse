<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Entrada_materia_prima;

class Entrada_materia_primaController extends Controller_base {
    public function __construct() {
        parent::__construct("entrada_materia_prima");
        $this->db = new Entrada_materia_prima();
    }

    public function brokenear_materia() {
        $this->db->clear();
        $this->db->__construct(id:$_POST['id']);
        $r = $this->db->search()[0];
        $existencia = $r['existencia'] - $_POST['cantidad'];
        $broken = $r['broken'] + $_POST['cantidad'];
        $this->db->clear();
        $this->db->__construct(id:$_POST['id'], existencia:$existencia, broken:$broken);
        $result = $this->db->actualizar();
        if ($result['success'] == false) {
            echo json_encode(['success' => false, 'message' => $result['message']]);
            return;
        }
        else {
            echo json_encode(['success' => true]);
        }
    }
    
}