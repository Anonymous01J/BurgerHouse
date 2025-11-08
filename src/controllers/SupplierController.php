<?php
namespace Shtch\Burgerhouse\controllers\Supplier;
use Shtch\Burgerhouse\models\Proveedor;
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

controller_init('supplier', Proveedor::class);
function view()
{
    base_view('supplier');
}
function get_all(...$args)
{
    base_get_all('supplier', ...$args);
}
function add()
{
    base_add('supplier');
}
function delete()
{
    base_delete('supplier');
}
function update()
{
    base_update('supplier');
}
function add_many()
{
    base_add_many('supplier');
}
function delete_many()
{
    base_delete_many('supplier');
}
function updateMany()
{
    base_update_many('supplier');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('supplier', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('supplier');
}