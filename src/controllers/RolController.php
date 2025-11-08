<?php
namespace Shtch\Burgerhouse\controllers\Rol;
use Shtch\Burgerhouse\models\Rol;
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

controller_init('roles', Rol::class);
function view()
{
    base_view('roles');
}
function get_all(...$args)
{
    base_get_all('roles', ...$args);
}
function add()
{
    base_add('roles');
}
function delete()
{
    base_delete('roles');
}
function update()
{
    base_update('roles');
}
function add_many()
{
    base_add_many('roles');
}
function delete_many()
{
    base_delete_many('roles');
}
function updateMany()
{
    base_update_many('roles');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('roles', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('roles');
}