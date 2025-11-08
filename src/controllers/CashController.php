<?php
namespace Shtch\Burgerhouse\controllers\Cash;
use Shtch\Burgerhouse\models\Caja;
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

controller_init('cash', Caja::class);
function view()
{
    base_view('cash');
}
function get_all(...$args)
{
    base_get_all('cash', ...$args);
}
function add()
{
    base_add('cash');
}
function delete()
{
    base_delete('cash');
}
function update()
{
    base_update('cash');
}
function add_many()
{
    base_add_many('cash');
}
function delete_many()
{
    base_delete_many('cash');
}
function updateMany()
{
    base_update_many('cash');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('cash', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('cash');
}
function detailCash()
{
    $cash = new Caja();
    try {
        $id = $_POST['id'];
        $cashDetails = $cash->cajaDetails($id);
        echo json_encode($cashDetails);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function closeCash()
{
    $cash = new Caja();
    try {
        $id = $_POST['id'];
        $cash->closeCash($id);
        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}