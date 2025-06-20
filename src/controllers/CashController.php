<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Caja;
use Exception;


class CashController extends Controller_base {

    private $cashModel;
    public function __construct() {
        parent::__construct("cash");
        $this->db = new Caja();
        $this->cashModel = new Caja();
    }

    public function detailCash() {
        try {
            $id = $_POST['id'];
            $cashDetails = $this->cashModel->cajaDetails($id);
            echo json_encode($cashDetails);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
    public function closeCash() {
        try {
            $id = $_POST['id'];
            $this->cashModel->closeCash($id);
            echo json_encode(['success' => true]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
}