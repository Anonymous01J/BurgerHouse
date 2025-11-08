<?php
namespace Shtch\Burgerhouse\controllers\PaymentMethod;
use Shtch\Burgerhouse\models\Metodo_pago;
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

controller_init('paymentMethod', Metodo_pago::class);
function view()
{
    base_view('paymentMethod');
}
function get_all(...$args)
{
    base_get_all('paymentMethod', ...$args);
}
function add()
{
    base_add('paymentMethod');
}
function delete()
{
    base_delete('paymentMethod');
}
function update()
{
    base_update('paymentMethod');
}
function add_many()
{
    base_add_many('paymentMethod');
}
function delete_many()
{
    base_delete_many('paymentMethod');
}
function updateMany()
{
    base_update_many('paymentMethod');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('paymentMethod', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('paymentMethod');
}