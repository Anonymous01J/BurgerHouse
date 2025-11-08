<?php
namespace Shtch\Burgerhouse\controllers\Units;
use Shtch\Burgerhouse\models\Unidad;
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

controller_init('units', Unidad::class);
function view()
{
    base_view('units');
}
function get_all(...$args)
{
    base_get_all('units', ...$args);
}
function add()
{
    base_add('units');
}
function delete()
{
    base_delete('units');
}
function update()
{
    base_update('units');
}
function add_many()
{
    base_add_many('units');
}
function delete_many()
{
    base_delete_many('units');
}
function updateMany()
{
    base_update_many('units');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('units', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('units');
}