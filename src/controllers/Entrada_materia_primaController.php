<?php

namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Entrada_materia_prima;
use Shtch\Burgerhouse\models\Detalle_entrada_materia_prima;
use Shtch\Burgerhouse\models\Pago_entrada_materia_prima;
use Exception;

class Entrada_materia_primaController extends Controller_base
{
    public function __construct()
    {
        parent::__construct("entrada_materia_prima");
        $this->db = new Entrada_materia_prima();
    }

    public function brokenear_materia()
    {
        $this->db->clear();
        $this->db->__construct(id: $_POST['id']);
        $r = $this->db->search()[0];
        $existencia = $r['existencia'] - $_POST['cantidad'];
        $broken = $r['broken'] + $_POST['cantidad'];
        $this->db->clear();
        $this->db->__construct(id: $_POST['id'], existencia: $existencia, broken: $broken);
        $result = $this->db->actualizar();
        if ($result['success'] == false) {
            echo json_encode(['success' => false, 'message' => $result['message']]);
            return;
        } else {
            echo json_encode(['success' => true]);
        }
    }

    public function add_many()
    {
        try {
            $pago_materia_prima = new Pago_entrada_materia_prima();
            $detalle_entrada = new Detalle_entrada_materia_prima();
            $lista_entrada = $_POST['lista']["info_entrada"];

            foreach ($lista_entrada as $key => $value) {
                $this->db->clear();
                $this->db->__construct(id_proveedor: $value["id_proveedor"]);
                $last_id = $this->db->agregar();
                $pago_materia_prima->clear();
                foreach ($value["payment"] as $key2 => $value2) {
                    $pago_materia_prima->__construct(...["id_entrada" => $last_id, ...$value["payment"][$key2]]);
                    $pago_materia_prima->agregar();
                }
                $imagen = $_FILES["lista"];
                foreach ($imagen['tmp_name']['info_entrada'][$key]["payment"] as $key3 => $value3) {
                    move_uploaded_file($value3["imagen"], "../src/media/pay_entrys_rawmaterial" . '/' . $imagen['name']['info_entrada'][$key]["payment"][$key3]["imagen"]);
                }

                foreach ($value["detalles_entrada"] as $key2 => $value2) {
                    $detalle_entrada->clear();
                    $detalle_entrada->__construct(
                        id_materia_prima: $value2["id_materia_prima"],
                        id_entrada: $last_id,
                        cantidad: $value2["cantidad"],
                        codigo: $value2["codigo"],
                        fecha_vencimiento: $value2["fecha_vencimiento"],
                        existencia: $value2["existencia"],
                    );
                    $detalle_entrada->agregar();
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
            echo json_encode($this->db->consultar_vista("vista_inventario_materia_prima"));
        } catch (Exception $th) {
            echo json_encode(['success' => false, 'message' => $th->getMessage()]);
        }
    }
}
