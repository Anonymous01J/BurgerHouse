<?php

namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Entrada_producto_procesado;
use Shtch\Burgerhouse\models\Pago_entrada_producto_procesado;
use Exception;

class Entrada_producto_procesadoController extends Controller_base
{
    public function __construct()
    {
        parent::__construct("entradas_producto_procesado");
        $this->db = new Entrada_producto_procesado();
    }

    public function add_many()
    {
        try {
            $pago_producto_procesado = new Pago_entrada_producto_procesado();
            $lista_entrada = $_POST['lista']["detalles_entrada"];

            for ($i = 0; $i < count($lista_entrada); $i++) {
                $this->db->clear();
                $this->db->__construct(
                    id_proveedor: $lista_entrada[$i]["id_proveedor"],
                    id_producto: $lista_entrada[$i]["id_producto"],
                    id_unidad: $lista_entrada[$i]["id_unidad"],
                    cantidad: $lista_entrada[$i]["cantidad"],
                    existencia: $lista_entrada[$i]["existencia"],
                    codigo: $lista_entrada[$i]["codigo"],
                    fecha_vencimiento: $lista_entrada[$i]["fecha_vencimiento"]
                );
                $last_id = $this->db->agregar();
                for ($j = 0; $j < count($lista_entrada[$i]["payment"]); $j++) {
                    $pago_producto_procesado->clear();
                    $pago_producto_procesado->__construct(...["id_entrada" => $last_id, ...$lista_entrada[$i]["payment"][$j]]);
                    is_dir("../src/media/pay_entrys_product_process") or mkdir("../src/media/pay_entrys_product_process");
                    $imagen = $_FILES["lista"];
                    move_uploaded_file($imagen['tmp_name']["detalles_entrada"][$i]["payment"][$j]["imagen"], "../src/media/pay_entrys_product_process" . '/' . $imagen['name']["detalles_entrada"][$i]["payment"][$j]["imagen"]);
                    $result = $pago_producto_procesado->agregar();
                }
            }
            echo json_encode(['success' => true]);
        } catch (Exception $th) {
            echo json_encode(['success' => false, 'message' => $th->getMessage()]);
        }
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
