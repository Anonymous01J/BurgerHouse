<?php
namespace Shtch\Burgerhouse\controllers\ProductProcess;
use Shtch\Burgerhouse\models\ProductoProcesado;
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

controller_init('productProcess', ProductoProcesado::class);
function view()
{
    base_view('productProcess');
}
function get_all(...$args)
{
    base_get_all('productProcess', ...$args);
}
function add()
{
    base_add('productProcess');
}
function delete()
{
    base_delete('productProcess');
}
function update()
{
    base_update('productProcess');
}
function add_many()
{
    base_add_many('productProcess');
}
function delete_many()
{
    base_delete_many('productProcess');
}
function updateMany()
{
    base_update_many('productProcess');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('productProcess', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('productProcess');
}