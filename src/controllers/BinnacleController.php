<?php
namespace Shtch\Burgerhouse\controllers\Binnacle;
use Shtch\Burgerhouse\models\Bitacora;
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

controller_init('binnacle', Bitacora::class);
function view()
{
    base_view('binnacle');
}
function get_all(...$args)
{
    base_get_all('binnacle', ...$args);
}
function add()
{
    base_add('binnacle');
}
function delete()
{
    base_delete('binnacle');
}
function update()
{
    base_update('binnacle');
}
function add_many()
{
    base_add_many('binnacle');
}
function delete_many()
{
    base_delete_many('binnacle');
}
function updateMany()
{
    base_update_many('binnacle');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('binnacle', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('binnacle');
}