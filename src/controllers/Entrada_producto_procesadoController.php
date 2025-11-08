<?php
namespace Shtch\Burgerhouse\controllers\Entrada_producto_procesado;
use Shtch\Burgerhouse\models\Entrada_producto_procesado;
use Shtch\Burgerhouse\models\Pago_entrada_producto_procesado;
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

controller_init('entradas_producto_procesado', Entrada_producto_procesado::class);
function view()
{
    base_view('entradas_producto_procesado');
}
function get_all(...$args)
{
    base_get_all('entradas_producto_procesado', ...$args);
}
function add()
{
    base_add('entradas_producto_procesado');
}
function delete()
{
    base_delete('entradas_producto_procesado');
}
function update()
{
    base_update('entradas_producto_procesado');
}
function delete_many()
{
    base_delete_many('entradas_producto_procesado');
}
function updateMany()
{
    base_update_many('entradas_producto_procesado');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('entradas_producto_procesado', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('entradas_producto_procesado');
}
function add_many()
{
    try {
        $pago_producto_procesado = new Pago_entrada_producto_procesado();
        $lista_entrada = $_POST['lista']["detalles_entrada"];
        $entrada_producto_procesado = new Entrada_producto_procesado();
        for ($i = 0; $i < count($lista_entrada); $i++) {
            $entrada_producto_procesado->clear();
            $entrada_producto_procesado->__construct(
                id_proveedor: $lista_entrada[$i]["id_proveedor"],
                id_producto: $lista_entrada[$i]["id_producto"],
                id_unidad: $lista_entrada[$i]["id_unidad"],
                cantidad: $lista_entrada[$i]["cantidad"],
                existencia: $lista_entrada[$i]["existencia"],
                codigo: $lista_entrada[$i]["codigo"],
                fecha_vencimiento: $lista_entrada[$i]["fecha_vencimiento"]
            );
            $last_id = $entrada_producto_procesado->agregar();
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
function inventario()
{
    try {
        $entrada_producto_procesado = new Entrada_producto_procesado();
        $entrada_producto_procesado->clear();
        $entrada_producto_procesado->__construct();
        echo json_encode($entrada_producto_procesado->consultar_vista("vista_inventario_productos_procesados"));
    } catch (Exception $th) {
        echo json_encode(['success' => false, 'message' => $th->getMessage()]);
    }
}
