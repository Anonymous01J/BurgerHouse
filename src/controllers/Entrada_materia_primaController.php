<?php
namespace Shtch\Burgerhouse\controllers\Entrada_materia_prima;
use Shtch\Burgerhouse\models\Entrada_materia_prima;
use Shtch\Burgerhouse\models\Detalle_entrada_materia_prima;
use Shtch\Burgerhouse\models\Pago_entrada_materia_prima;
use Exception;
use function Shtch\Burgerhouse\controllers\{
    controller_init,
    base_view,
    base_get_all,
    base_add,
    base_delete,
    base_update,
    base_add_many,
    base_delete_many,
    base_update_many,
    base_guardar_imagen_mult,
    base_guardar_imagen_single
};

controller_init('entrada_materia_prima', Entrada_materia_prima::class);
function view()
{
    base_view('entrada_materia_prima');
}
function get_all(...$args)
{
    base_get_all('entrada_materia_prima', ...$args);
}
function add()
{
    base_add('entrada_materia_prima');
}
function delete()
{
    base_delete('entrada_materia_prima');
}
function update()
{
    base_update('entrada_materia_prima');
}
function delete_many()
{
    base_delete_many('entrada_materia_prima');
}
function updateMany()
{
    base_update_many('entrada_materia_prima');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('entrada_materia_prima', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('entrada_materia_prima');
}
function add_many()
{
    try {
        $pago_materia_prima = new Pago_entrada_materia_prima();
        $detalle_entrada = new Detalle_entrada_materia_prima();
        $entrada_materia_prima = new Entrada_materia_prima();
        $lista_entrada = $_POST['lista']["info_entrada"];

        foreach ($lista_entrada as $key => $value) {
            $entrada_materia_prima->clear();
            $entrada_materia_prima->__construct(id_proveedor: $value["id_proveedor"]);
            $last_id = $entrada_materia_prima->agregar();
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
function brokenear_materia()
{
    $entrada_materia_prima = new Entrada_materia_prima();
    $entrada_materia_prima->clear();
    $entrada_materia_prima->__construct(id: $_POST['id']);
    $r = $entrada_materia_prima->search()[0];
    $existencia = $r['existencia'] - $_POST['cantidad'];
    $broken = $r['broken'] + $_POST['cantidad'];
    $entrada_materia_prima->clear();
    $entrada_materia_prima->__construct(id: $_POST['id'], existencia: $existencia, broken: $broken);
    $result = $entrada_materia_prima->actualizar();
    if ($result['success'] == false) {
        echo json_encode(['success' => false, 'message' => $result['message']]);
        return;
    } else {
        echo json_encode(['success' => true]);
    }
}
function inventario()
{
    try {
        $entrada_materia_prima = new Entrada_materia_prima();
        $entrada_materia_prima->clear();
        $entrada_materia_prima->__construct();
        echo json_encode($entrada_materia_prima->consultar_vista("vista_inventario_materia_prima"));
    } catch (Exception $th) {
        echo json_encode(['success' => false, 'message' => $th->getMessage()]);
    }
}
