<?php
namespace Shtch\Burgerhouse\controllers\Home;
use Shtch\Burgerhouse\models\Estadisticas;
use Exception;
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

controller_init('index', Estadisticas::class);
function view()
{
    base_view('index');
}
function get_all(...$args)
{
    base_get_all('index', ...$args);
}
function add()
{
    base_add('index');
}
function delete()
{
    base_delete('index');
}
function update()
{
    base_update('index');
}
function add_many()
{
    base_add_many('index');
}
function delete_many()
{
    base_delete_many('index');
}
function updateMany()
{
    base_update_many('index');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('index', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('index');
}
function ClientesFrecuentes()
{
    $statistics = new Estadisticas();
    try {
        echo json_encode($statistics->consultar_vista('vista_resumen_clientes'));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
