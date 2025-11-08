<?php
namespace Shtch\Burgerhouse\controllers\Permissions;
use Shtch\Burgerhouse\models\Permiso;
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

controller_init('permissions', Permiso::class);
function view()
{
    base_view('permissions');
}
function get_all(...$args)
{
    base_get_all('permissions', ...$args);
}
function add()
{
    base_add('permissions');
}
function delete()
{
    base_delete('permissions');
}
function update()
{
    base_update('permissions');
}
function add_many()
{
    base_add_many('permissions');
}
function delete_many()
{
    base_delete_many('permissions');
}
function updateMany()
{
    base_update_many('permissions');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('permissions', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('permissions');
}