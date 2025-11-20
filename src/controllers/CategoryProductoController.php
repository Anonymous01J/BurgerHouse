<?php
namespace Shtch\Burgerhouse\controllers\CategoryProducto;
use Shtch\Burgerhouse\models\Categoria_producto;
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
controller_init('categorias_productos', Categoria_producto::class);
function view()
{
    base_view('categorias_productos');
}
function get_all(...$args)
{
    base_get_all('categorias_productos', ...$args);
}
function add()
{
    base_add('categorias_productos');
}
function delete()
{
    base_delete('categorias_productos');
}
function update()
{
    base_update('categorias_productos');
}
function add_many()
{
    base_add_many('categorias_productos');
}
function delete_many()
{
    base_delete_many('categorias_productos');
}
function updateMany()
{
    base_update_many('categorias_productos');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('categorias_productos', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('categorias_productos');
}