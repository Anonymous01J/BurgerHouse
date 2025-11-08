<?php
namespace Shtch\Burgerhouse\controllers\PaymentReservation;
use Shtch\Burgerhouse\models\Pago_reserva;
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

controller_init('pay_reservation', Pago_reserva::class);
function view()
{
    base_view('pay_reservation');
}
function get_all(...$args)
{
    base_get_all('pay_reservation', ...$args);
}
function add()
{
    base_add('pay_reservation');
}
function delete()
{
    base_delete('pay_reservation');
}
function update()
{
    base_update('pay_reservation');
}
function add_many()
{
    base_add_many('pay_reservation');
}
function delete_many()
{
    base_delete_many('pay_reservation');
}
function updateMany()
{
    base_update_many('pay_reservation');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('pay_reservation', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('pay_reservation');
}