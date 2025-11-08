<?php
namespace Shtch\Burgerhouse\controllers\Recipe;
use Shtch\Burgerhouse\models\Receta;
use Shtch\Burgerhouse\models\Detalle_receta;
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

controller_init('recipe', Receta::class);
function view()
{
    base_view('recipe');
}
function get_all(...$args)
{
    base_get_all('recipe', ...$args);
}
function delete()
{
    base_delete('recipe');
}
function update()
{
    base_update('recipe');
}
function add_many()
{
    base_add_many('recipe');
}
function delete_many()
{
    base_delete_many('recipe');
}
function updateMany()
{
    base_update_many('recipe');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('recipe', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('recipe');
}
function add()
{
    header('Content-Type: application/json');
    try {
        $recipe = new Receta();
        $recipe ->clear();
        $recipe ->__construct(id_producto: $_POST['id_producto']);
        $last_id = $recipe ->agregar();
        for ($i = 0; $i < count($_POST['lista']); $i++) {
            $otra_clase = new Detalle_receta(...['id_receta' => $last_id, ...$_POST['lista'][$i]]);
            $otra_clase->agregar();
        }
        echo json_encode(['success' => true, 'last_id' => $last_id]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
