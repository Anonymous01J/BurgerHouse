<?php
namespace Shtch\Burgerhouse\controllers\CategoryMateriaPrima;
use Shtch\Burgerhouse\models\Categoria_materia_prima;
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
controller_init('category_materia_prima', Categoria_materia_prima::class);
function view()
{
    base_view('category_materia_prima');
}
function get_all(...$args)
{
    base_get_all('category_materia_prima', ...$args);
}
function add()
{
    base_add('category_materia_prima');
}
function delete()
{
    base_delete('category_materia_prima');
}
function update()
{
    base_update('category_materia_prima');
}
function add_many()
{
    base_add_many('category_materia_prima');
}
function delete_many()
{
    base_delete_many('category_materia_prima');
}
function updateMany()
{
    base_update_many('category_materia_prima');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('category_materia_prima', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('category_materia_prima');
}