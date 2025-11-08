<?php
namespace Shtch\Burgerhouse\controllers\Additional;
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

controller_init('additional', ProductoPreparado::class);
function view()
{
    base_view('additional');
}
function get_all(...$args)
{
    base_get_all('additional', ...$args);
}
function add()
{
    base_add('additional');
}
function delete()
{
    base_delete('additional');
}
function update()
{
    base_update('additional');
}
function add_many()
{
    base_add_many('additional');
}
function delete_many()
{
    base_delete_many('additional');
}
function updateMany()
{
    base_update_many('additional');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('additional', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('additional');
}