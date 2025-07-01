<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Pago;

class PaymentController extends Controller_base{

    public function __construct(){
        parent::__construct(module_name: 'pay');
        $this->db = new Pago();
    }

    public function add_many(){
        // header('Content-Type: application/json');
        $pagos = [];
        try {
            for ($i = 0; $i < count($_POST['lista']); $i++) {
                $this->db->__construct(...$_POST['lista'][$i]);
                if (isset($_FILES['lista'])) {
                    $this->guardar_imagen_mult($i);
                }
                $id = $this->db->agregar();
                $pagos->
                array_push($pagos, $id);
                $bitacora_clase = new Bitacora();
                $bitacora_clase->nuevo(id_usuario:$_SESSION['id'], tabla:$this->module_name, accion:"Añadido", descripcion:"id:".$id);
            }
            echo json_encode(['success' => true, 'lista' => $pagos]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
}