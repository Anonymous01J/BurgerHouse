<?php
namespace Shtch\Burgerhouse\controllers\Delivery;
use Shtch\Burgerhouse\models\Delivery;
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

controller_init('delivery', Delivery::class);
function view()
{
    base_view('delivery');
}
function get_all(...$args)
{
    base_get_all('delivery', ...$args);
}
function add()
{
    base_add('delivery');
}
function delete()
{
    base_delete('delivery');
}
function update()
{
    base_update('delivery');
}
function add_many()
{
    base_add_many('delivery');
}
function delete_many()
{
    base_delete_many('delivery');
}
function updateMany()
{
    base_update_many('delivery');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('delivery', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('delivery');
}