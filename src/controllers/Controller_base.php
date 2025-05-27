<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\models\Db_base;
use Shtch\Burgerhouse\models\Bitacora;
use Exception;

class Controller_base {
    public $module_name;
    public string $table_name;
    public Db_base $db;

    public function __construct(string $module_name) {
        $this->module_name = $module_name;
    }

    public function view() {
        include_once __DIR__ . '/../views/' . $this->module_name . '.php';
    }

    public function get_all(...$args) {
        // print_r($this->db);
        header('Content-Type: application/json');
        try {
            $this->db->clear();
            $this->db->__construct(...$_POST);
            echo json_encode($this->db->search(...$args));
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function add() {
        header('Content-Type: application/json');
        try {
            $this->db->clear();
            $this->db->__construct(...$_POST);
            if (isset($_FILES['imagen'])){
                $this->guardar_imagen_single();
            }
            $id = $this->db->agregar();
            $this->bitacora_clase = new Bitacora();
            $this->bitacora_clase->nuevo(usuario_id:$_SESSION['id_usuario'], tabla:$this->table_name, accion:"Añadido", descripcion:"id:".$id);
            echo json_encode(['success' => true, 'last_id' => $id]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function add_many() {
        // header('Content-Type: application/json');
        try {
            for ($i = 0; $i < count($_POST['lista']); $i++) {
                $this->db->__construct(...$_POST['lista'][$i]);
                if (isset($_FILES['lista'])) {
                    $this->guardar_imagen_mult($i);
                }
                $id = $this->db->agregar();
                $this->bitacora_clase = new Bitacora();
                $this->bitacora_clase->nuevo(usuario_id:$_SESSION['id_usuario'], tabla:$this->table_name, accion:"Añadido", descripcion:"id:".$id);
            }
            echo json_encode(['success' => true]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function delete() {
        header('Content-Type: application/json');
        try {
            $this->db->clear();
            $this->db->add_variables(["a.id" => $_POST['id']]);
            $result = $this->db->borrar();
            if ($result === 0 or $result === false) {
                echo json_encode(['success' => false, 'message' => 'No se pudo eliminar el registro']);
            } else {
                echo json_encode(['success' => true]);
            }
            $this->bitacora_clase = new Bitacora();
            $this->bitacora_clase->nuevo(usuario_id:$_SESSION['id_usuario'], tabla:$this->table_name, accion:"Eliminado", descripcion:"id:".$_POST['id']);

        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function update() {
        header('Content-Type: application/json');
        try {
            $this->db->clear();
            $this->db->__construct(...$_POST);
            $result = $this->db->actualizar();
            if (isset($_FILES['imagen'])) {
                $this->guardar_imagen_single();
            }
            $this->bitacora_clase = new Bitacora();
            $this->bitacora_clase->nuevo(usuario_id:$_SESSION['id_usuario'], tabla:$this->table_name, accion:"Actualizado", descripcion:"id:".$_POST['id']);
            if ($result == false or $result == 0) {
                echo json_encode(['success' => false, 'message' => 'No se pudo actualizar el registro']);
            } else {
                echo json_encode(['success' => true]);
            }
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function guardar_imagen_mult($index) {
        is_dir("../src/media/".$this->module_name) or mkdir("../src/media/".$this->module_name);
        $imagen = $_FILES['lista'];
        $result = move_uploaded_file($imagen['tmp_name'][$index]['imagen'],'../src/media/'.$this->module_name.'/'.$imagen['name'][$index]['imagen']);

    }
    public function guardar_imagen_single() {
        is_dir("../src/media/".$this->module_name) or mkdir("../src/media/".$this->module_name);
        $imagen = $_FILES['imagen'];
        $result = move_uploaded_file($imagen['tmp_name'],'../src/media/'.$this->module_name.'/'.$imagen['name']);
    }

    public function check(...$args) {
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
        $data = $_POST;
        unset($data['variable']);
        print_r($_POST);
    }
}