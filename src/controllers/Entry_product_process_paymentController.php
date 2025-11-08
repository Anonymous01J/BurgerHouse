<?php

namespace Shtch\Burgerhouse\controllers\Entry_product_process_payment;
use Shtch\Burgerhouse\models\Pago_entrada_producto_procesado;
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

controller_init('pagos_entrada_producto_procesado', Pago_entrada_producto_procesado::class);
function view()
{
    base_view('pagos_entrada_producto_procesado');
}
function get_all(...$args)
{
    base_get_all('pagos_entrada_producto_procesado', ...$args);
}
function add()
{
    base_add('pagos_entrada_producto_procesado');
}
function delete()
{
    base_delete('pagos_entrada_producto_procesado');
}
function update()
{
    base_update('pagos_entrada_producto_procesado');
}
function add_many()
{
    base_add_many('pagos_entrada_producto_procesado');
}
function delete_many()
{
    base_delete_many('pagos_entrada_producto_procesado');
}
function updateMany()
{
    base_update_many('pagos_entrada_producto_procesado');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('pagos_entrada_producto_procesado', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('pagos_entrada_producto_procesado');
}