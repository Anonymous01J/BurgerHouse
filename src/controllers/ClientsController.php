<?php
namespace Shtch\Burgerhouse\controllers\Clients;
use Shtch\Burgerhouse\models\Cliente;
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

controller_init('clients', Cliente::class);
function view()
{
    base_view('clients');
}
function get_all(...$args)
{
    base_get_all('clients', ...$args);
}
function add()
{
    base_add('clients');
}
function delete()
{
    base_delete('clients');
}
function update()
{
    base_update('clients');
}
function add_many()
{
    base_add_many('clients');
}
function delete_many()
{
    base_delete_many('clients');
}
function updateMany()
{
    base_update_many('clients');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('clients', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('clients');
}