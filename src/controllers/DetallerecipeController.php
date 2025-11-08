<?php
namespace Shtch\Burgerhouse\controllers\Detallerecipe;
use Shtch\Burgerhouse\models\Detalle_receta;
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

controller_init('recipe', Detalle_receta::class);
function view()
{
    base_view('recipe');
}
function get_all(...$args)
{
    base_get_all('recipe', ...$args);
}
function add()
{
    base_add('recipe');
}
function delete()
{
    base_delete('recipe');
}
function update()
{
    base_update('recipe');
}
function add_many()
{
    base_add_many('recipe');
}
function delete_many()
{
    base_delete_many('recipe');
}
function updateMany()
{
    base_update_many('recipe');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('recipe', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('recipe');
}
