<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\models\Db_base;
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
            echo json_encode(['success' => true, 'last_id' => $this->db->agregar()]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function add_many() {
        // header('Content-Type: application/json');
        try {
            for ($i = 0; $i < count($_POST['lista']); $i++) {
                $this->db->__construct(...$_POST['lista'][$i]);
                $this->db->agregar();
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
            if ($result == false or $result == 0) {
                echo json_encode(['success' => false, 'message' => 'No se pudo actualizar el registro']);
            } else {
                echo json_encode(['success' => true]);
            }
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
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
        print_r($_POST['nombre']);
    }
}