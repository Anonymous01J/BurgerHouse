<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\models\Permiso;
use Shtch\Burgerhouse\function\Auth;
use Shtch\Burgerhouse\models\Usuario;
use Exception;

$GLOBALS['controller_instances'] = [];

function controller_init($module_name,$model_class = null) {
    $publicModules = ["login", "recover_password", "index", "changepass"];
    if (!in_array($module_name, $publicModules)) {
        if (empty($_SESSION['id']) || empty($_SESSION['session_id'])) {
            header("Location: login");
            exit;
        }
        $usuario = new Usuario(id: $_SESSION['id']);
        $result = $usuario->search();

        if (empty($result) || $result[0]['session_id'] !== $_SESSION['session_id']) {
            session_destroy();
            header("Location: login");
            exit;
        }
    }
    
    $GLOBALS['controller_instances'][$module_name] = [
        'module_name' => $module_name,
        'db' => $model_class ? new $model_class() : null
    ];
    return $module_name;
}

function get_db($module_name)
{
    return $GLOBALS['controller_instances'][$module_name]['db'] ?? null;
}

function get_module_name($module_name)
{
    return $GLOBALS['controller_instances'][$module_name]['module_name'] ?? $module_name;
}

function base_view($module_name)
{
    if (isset($_SESSION['id_rol'])) {
        $permiso = new Permiso(id_rol: $_SESSION['id_rol']);
        $_SESSION['permisos'] = $permiso->search(n: 0, limite: 2000);
    }

    if (in_array($module_name, ["login", "recover_password", "index", "profile", "notifications"])) {
        include_once __DIR__ . '/../views/' . $module_name . '.php';
    } else {
        if ($_SESSION['id_rol'] == 1 || Auth::AuthController($module_name)) {
            header("HTTP/1.1 200 OK");
            try {
                include_once __DIR__ . '/../views/' . $module_name . '.php';
            } catch (Exception $e) {
                header("HTTP/1.0 500 Internal Server Error");
                echo "Error 500: Error al cargar la vista " . $module_name;
            }
        } else {
            header("HTTP/1.0 404 Not Found");
            include_once __DIR__ . '/../views/error-404.php';
        }
    }
}

function base_get_all($module_name, ...$args)
{
    header('Content-Type: application/json');
    try {
        $db = get_db($module_name);
        $db->clear();
        $db->__construct(...$_POST);
        echo json_encode($db->search(...$args));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_add($module_name, $imagen_callback = null)
{
    header('Content-Type: application/json');
    try {
        $db = get_db($module_name);
        $db->clear();
        $db->__construct(...$_POST);

        if (isset($_FILES['imagen'])) {
            if ($imagen_callback) {
                $imagen_callback($module_name);
            } else {
                base_guardar_imagen_single($module_name);
            }
        }

        $id = $db->agregar();
        echo json_encode(['success' => true, 'last_id' => $id]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_add_many($module_name, $imagen_callback = null)
{
    try {
        $db = get_db($module_name);
        for ($i = 0; $i < count($_POST['lista']); $i++) {
            $db->__construct(...$_POST['lista'][$i]);

            if (isset($_FILES['lista'])) {
                if ($imagen_callback) {
                    $imagen_callback($module_name, $i);
                } else {
                    base_guardar_imagen_mult($module_name, $i);
                }
            }

            $db->agregar();
        }
        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_delete($module_name)
{
    header('Content-Type: application/json');
    try {
        $db = get_db($module_name);
        $db->clear();
        $db->add_variables(["a.id" => $_POST['id']]);
        $result = $db->borrar();

        if ($result === 0 or $result === false) {
            echo json_encode(['success' => false, 'message' => 'No se pudo eliminar el registro']);
        } else {
            echo json_encode(['success' => true]);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_delete_many($module_name)
{
    try {
        $db = get_db($module_name);
        for ($i = 0; $i < count($_POST['lista']); $i++) {
            $db->__construct(...$_POST['lista'][$i]);
            $result = $db->borrar();
        }

        if ($result === 0 or $result === false) {
            echo json_encode(['success' => false, 'message' => 'No se pudo eliminar el registro']);
        } else {
            echo json_encode(['success' => true]);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_update($module_name, $imagen_callback = null)
{
    header('Content-Type: application/json');
    try {
        $db = get_db($module_name);
        $db->clear();
        $db->__construct(...$_POST);
        $result = $db->actualizar();

        if (isset($_FILES['imagen'])) {
            if ($imagen_callback) {
                $imagen_callback($module_name);
            } else {
                base_guardar_imagen_single($module_name);
            }
        }

        if ($result == false or $result == 0) {
            echo json_encode(['success' => false, 'message' => 'No se pudo actualizar el registro']);
        } else {
            echo json_encode(['success' => true]);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_update_many($module_name, $imagen_callback = null)
{
    try {
        $db = get_db($module_name);
        for ($i = 0; $i < count($_POST['lista']); $i++) {
            $db->__construct(...$_POST['lista'][$i]);

            if (isset($_FILES['lista'])) {
                if ($imagen_callback) {
                    $imagen_callback($module_name, $i);
                } else {
                    base_guardar_imagen_mult($module_name, $i);
                }
            }

            $result = $db->actualizar();
        }

        if ($result == false or $result == 0) {
            echo json_encode(['success' => false, 'message' => 'No se pudo actualizar el registro']);
        } else {
            echo json_encode(['success' => true]);
        }
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function base_guardar_imagen_mult($module_name, int $index)
{
    is_dir("../src/media/" . $module_name) or mkdir("../src/media/" . $module_name);
    $imagen = $_FILES['lista'];
    move_uploaded_file(
        $imagen['tmp_name'][$index]['imagen'],
        '../src/media/' . $module_name . '/' . $imagen['name'][$index]['imagen']
    );
}

function base_guardar_imagen_single($module_name)
{
    is_dir("../src/media/" . $module_name) or mkdir("../src/media/" . $module_name);
    $imagen = $_FILES['imagen'];
    move_uploaded_file($imagen['tmp_name'], '../src/media/' . $module_name . '/' . $imagen['name']);
}

function base_check(...$args)
{
    echo "<pre>";
    echo "POST:";
    print_r($_POST);
    echo "GET:";
    print_r($_GET);
    echo "</pre>";
    print_r($args);
    echo "</pre>";
    echo "Session";
    print_r($_SESSION);
    echo "</pre>";
    print_r($_FILES);
}