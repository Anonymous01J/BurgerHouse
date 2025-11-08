<?php
namespace Shtch\Burgerhouse\controllers\Order_table;
use Shtch\Burgerhouse\models\Orden_mesa;
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

controller_init('order_table', Orden_mesa::class);
function view()
{
    base_view('order_table');
}
function get_all(...$args)
{
    base_get_all('order_table', ...$args);
}
function add()
{
    base_add('order_table');
}
function delete()
{
    base_delete('order_table');
}
function update()
{
    base_update('order_table');
}
function add_many()
{
    base_add_many('order_table');
}
function delete_many()
{
    base_delete_many('order_table');
}
function updateMany()
{
    base_update_many('order_table');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('order_table', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('order_table');
}