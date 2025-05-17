<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Exception;
use Shtch\Burgerhouse\models\Producto;

class ProductController extends Controller_base {

    public function __construct() {
        parent::__construct(module_name: "product");
        $this->db = new Producto();
    }

    // public function add() {
    //     header('Content-Type: application/json');
    //     try {
    //         $this->db->clear();
    //         $this->db->__construct(...$_POST);
    //         $this->guardar_imagen_mult(0);
    //         echo json_encode(['success' => true, 'last_id' => $this->db->agregar()]);
    //     } catch (Exception $e) {
    //         echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    //     }
    // }
    // public function add_many() {
    //     // header('Content-Type: application/json');
    //     try {
    //         for ($i = 0; $i < count($_POST['lista']); $i++) {
    //             $this->guardar_imagen_mult($i);
    //             $this->db->__construct(...$_POST['lista'][$i]);
    //             $this->db->agregar();
    //         }
    //         echo json_encode(['success' => true ]);
    //     } catch (Exception $e) {
    //         echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    //     }
    // }
    // public function update() {
    //     header('Content-Type: application/json');
    //     try {
    //         $this->db->clear();
    //         $this->db->__construct(...$_POST);
    //         $result = $this->db->actualizar();
    //         if (isset($_FILES['imagen'])) {
    //             $this->guardar_imagen_single();
    //         }
    //         if ($result == false or $result == 0) {
    //             echo json_encode(['success' => false, 'message' => 'No se pudo actualizar el registro']);
    //         } else {
    //             echo json_encode(['success' => true]);
    //         }
    //     } catch (Exception $e) {
    //         echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    //     }
    // }
}