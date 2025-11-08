<?php
namespace Shtch\Burgerhouse\controllers\Detalle_orden_producto_procesado;
use Shtch\Burgerhouse\models\DetalleOrdenProductoProcesado;
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

controller_init('detalle_orden_producto_procesado', DetalleOrdenProductoProcesado::class);
function view()
{
    base_view('detalle_orden_producto_procesado');
}
function get_all(...$args)
{
    base_get_all('detalle_orden_producto_procesado', ...$args);
}
function add()
{
    base_add('detalle_orden_producto_procesado');
}
function delete()
{
    base_delete('detalle_orden_producto_procesado');
}
function update()
{
    base_update('detalle_orden_producto_procesado');
}
function add_many()
{
    base_add_many('detalle_orden_producto_procesado');
}
function delete_many()
{
    base_delete_many('detalle_orden_producto_procesado');
}
function updateMany()
{
    base_update_many('detalle_orden_producto_procesado');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('detalle_orden_producto_procesado', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('detalle_orden_producto_procesado');
}