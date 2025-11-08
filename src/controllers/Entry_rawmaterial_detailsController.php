<?php
namespace Shtch\Burgerhouse\controllers\Entry_rawmaterial_details;
use Shtch\Burgerhouse\models\Detalle_entrada_materia_prima;
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

controller_init('Detalles_entradas_materia_prima', Detalle_entrada_materia_prima::class);
function view()
{
    base_view('Detalles_entradas_materia_prima');
}
function get_all(...$args)
{
    base_get_all('Detalles_entradas_materia_prima', ...$args);
}
function add()
{
    base_add('Detalles_entradas_materia_prima');
}
function delete()
{
    base_delete('Detalles_entradas_materia_prima');
}
function update()
{
    base_update('Detalles_entradas_materia_prima');
}
function add_many()
{
    base_add_many('Detalles_entradas_materia_prima');
}
function delete_many()
{
    base_delete_many('Detalles_entradas_materia_prima');
}
function updateMany()
{
    base_update_many('Detalles_entradas_materia_prima');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('Detalles_entradas_materia_prima', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('Detalles_entradas_materia_prima');
}