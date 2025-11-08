<?php
namespace Shtch\Burgerhouse\controllers\ProductPrepared;
use Shtch\Burgerhouse\models\ProductoPreparado;
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

controller_init('productPrepared', ProductoPreparado::class);
function view()
{
    base_view('productPrepared');
}
function get_all(...$args)
{
    base_get_all('productPrepared', ...$args);
}
function add()
{
    base_add('productPrepared');
}
function delete()
{
    base_delete('productPrepared');
}
function update()
{
    base_update('productPrepared');
}
function add_many()
{
    base_add_many('productPrepared');
}
function delete_many()
{
    base_delete_many('productPrepared');
}
function updateMany()
{
    base_update_many('productPrepared');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('productPrepared', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('productPrepared');
}