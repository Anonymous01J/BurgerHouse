<?php
namespace Shtch\Burgerhouse\controllers\Payment;
use Shtch\Burgerhouse\models\Pago;
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

controller_init('pay', Pago::class);
function view()
{
    base_view('pay');
}
function get_all(...$args)
{
    base_get_all('pay', ...$args);
}
function add()
{
    base_add('pay');
}
function delete()
{
    base_delete('pay');
}
function update()
{
    base_update('pay');
}
function delete_many()
{
    base_delete_many('pay');
}
function updateMany()
{
    base_update_many('pay');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('pay', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('pay');
}
function add_many()
{
    $pay = new Pago();
    $pagos = [];
    try {
        for ($i = 0; $i < count($_POST['lista']); $i++) {
            $pay->__construct(...$_POST['lista'][$i]);
            if (isset($_FILES['lista'])) {
                guardar_imagen_mult($i);
            }
            $id = $pay ->agregar();
            array_push($pagos, $id);
        }
        echo json_encode(['success' => true, 'lista' => $pagos]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
