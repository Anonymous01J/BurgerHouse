<?php
namespace Shtch\Burgerhouse\controllers\Sale;
use Shtch\Burgerhouse\models\Venta;
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

controller_init('sale', Venta::class);
function view()
{
    base_view('sale');
}
function get_all(...$args)
{
    base_get_all('sale', ...$args);
}
function add()
{
    base_add('sale');
}
function delete()
{
    base_delete('sale');
}
function update()
{
    base_update('sale');
}
function add_many()
{
    base_add_many('sale');
}
function delete_many()
{
    base_delete_many('sale');
}
function updateMany()
{
    base_update_many('sale');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('sale', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('sale');
}