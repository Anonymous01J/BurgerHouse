<?php
namespace Shtch\Burgerhouse\controllers\Maintenance;
use Shtch\Burgerhouse\models\Backup;
use Shtch\Burgerhouse\models\Usuario;
use Exception;
use function Shtch\Burgerhouse\controllers\{controller_init, base_view};

controller_init('maintenance', Backup::class);
function view()
{
    base_view('maintenance');
}
function export()
{
    try {
        $db = $_POST['db'];
        $route = $_POST['route'];
        $backup = new Backup();
        $backup->respaldo($db, $route);
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => $e->getMessage()]);
    }
}
function import()
{
    try {
        $user = new Usuario();
        $backup = new Backup();
        $user->clear();
        $user->__construct(id: $_POST['id']);
        $result = $user->search();
        if ($result[0]["hash"] == $_POST['password']) {
            $db = $_POST['db'];
            $route = $_POST['route'];
            $archive = $_POST['archive'];
            $backup->restaurar($db, $route, $archive);
        } else {
            echo json_encode(["success" => false, "message" => "Contraseña incorrecta"]);
        }
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => $e->getMessage()]);
    }
}
function search()
{
    try {
        $backup = new Backup();
        $route = $_POST['route'];
        $result = $backup->search($route);
        echo json_encode($result);
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => $e->getMessage()]);
    }
}
function delete()
{
    try {
        $user = new Usuario();
        $backup = new Backup();
        $user->clear();
        $user->__construct(id: $_POST['id']);
        $result = $user->search();
        if ($result[0]["hash"] == $_POST['password']) {
            $route = $_POST['route'];
            $archive = $_POST['archive'];
            $backup->delete($route, $archive);
        } else {
            echo json_encode(["success" => false, "message" => "Contraseña incorrecta"]);
        }
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => $e->getMessage()]);
    }
}
