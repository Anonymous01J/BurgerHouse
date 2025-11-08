<?php
namespace Shtch\Burgerhouse\controllers\Calendar;
use Shtch\Burgerhouse\models\Reservacion;
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

controller_init('calendar', Reservacion::class);
function view()
{
    base_view('calendar');
}
function get_all(...$args)
{
    base_get_all('calendar', ...$args);
}
function add()
{
    base_add('calendar');
}
function delete()
{
    base_delete('calendar');
}
function update()
{
    base_update('calendar');
}
function add_many()
{
    base_add_many('calendar');
}
function delete_many()
{
    base_delete_many('calendar');
}
function updateMany()
{
    base_update_many('calendar');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('calendar', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('calendar');
}