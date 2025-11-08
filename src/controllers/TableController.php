<?php
namespace Shtch\Burgerhouse\controllers\Table;
use Shtch\Burgerhouse\models\Mesa;
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

controller_init('table', Mesa::class);
function view()
{
    base_view('table');
}
function get_all(...$args)
{
    base_get_all('table', ...$args);
}
function add()
{
    base_add('table');
}
function delete()
{
    base_delete('table');
}
function update()
{
    base_update('table');
}
function add_many()
{
    base_add_many('table');
}
function delete_many()
{
    base_delete_many('table');
}
function updateMany()
{
    base_update_many('table');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('table', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('table');
}