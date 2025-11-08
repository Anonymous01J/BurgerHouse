<?php

namespace Shtch\Burgerhouse\controllers\capital;

use Shtch\Burgerhouse\models\Movimiento_capital;
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

controller_init('capital', Movimiento_capital::class);
function view()
{
    base_view('capital');
}
function get_all(...$args)
{
    base_get_all('capital', ...$args);
}
function add()
{
    base_add('capital');
}
function delete()
{
    base_delete('capital');
}
function update()
{
    base_update('capital');
}
function add_many()
{
    base_add_many('capital');
}
function delete_many()
{
    base_delete_many('capital');
}
function updateMany()
{
    base_update_many('capital');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('capital', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('capital');
}
function GetCapital()
{
    $movimiento_capital = new Movimiento_capital();
    try {
        echo json_encode($movimiento_capital->consultar_vista("vista_resumen_financiero"));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
