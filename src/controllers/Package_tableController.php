<?php
namespace Shtch\Burgerhouse\controllers\Additional;
use Shtch\Burgerhouse\models\Paquetes_mesa;
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

controller_init('package_reservation', Paquetes_mesa::class);
function view()
{
    base_view('package_reservation');
}
function get_all(...$args)
{
    base_get_all('package_reservation', ...$args);
}
function add()
{
    base_add('package_reservation');
}
function delete()
{
    base_delete('package_reservation');
}
function update()
{
    base_update('package_reservation');
}
function add_many()
{
    base_add_many('package_reservation');
}
function delete_many()
{
    base_delete_many('package_reservation');
}
function updateMany()
{
    base_update_many('package_reservation');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('package_reservation', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('package_reservation');
}