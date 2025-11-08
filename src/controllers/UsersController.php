<?php
namespace Shtch\Burgerhouse\controllers\Users;
use Shtch\Burgerhouse\models\Usuario;
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

controller_init('users', Usuario::class);
function view()
{
    base_view('users');
}
function get_all(...$args)
{
    base_get_all('users', ...$args);
}
function add()
{
    base_add('users');
}
function delete()
{
    base_delete('users');
}
function update()
{
    base_update('users');
}
function add_many()
{
    base_add_many('users');
}
function delete_many()
{
    base_delete_many('users');
}
function updateMany()
{
    base_update_many('users');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('users', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('users');
}