<?php
namespace Shtch\Burgerhouse\controllers\PaymentSale;
use Shtch\Burgerhouse\models\Pago_venta;
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

controller_init('pay_sale', Pago_venta::class);
function view()
{
    base_view('pay_sale');
}
function get_all(...$args)
{
    base_get_all('pay_sale', ...$args);
}
function add()
{
    base_add('pay_sale');
}
function delete()
{
    base_delete('pay_sale');
}
function update()
{
    base_update('pay_sale');
}
function add_many()
{
    base_add_many('pay_sale');
}
function delete_many()
{
    base_delete_many('pay_sale');
}
function updateMany()
{
    base_update_many('pay_sale');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('pay_sale', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('pay_sale');
}