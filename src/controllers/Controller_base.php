<?php
namespace Shtch\Burgerhouse\controllers;

use Exception;

class Controller_base {
    public $module_name;
    public $table_name;
    public $db;

    public function __construct($module_name) {
        $this->module_name = $module_name;
    }

    public function view() {
        include_once __DIR__ . '/../views/' . $this->module_name . '.php';
    }

    public function get_all(...$args) {
        header('Content-Type: application/json');
        try {
            echo json_encode($this->db->search(...$args));
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function add() {
        header('Content-Type: application/json');
        try {
            echo json_encode($this->db->agregar(...$_POST));
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function add_many() {
        header('Content-Type: application/json');
        try {
            for ($i = 0; $i < count($_POST); $i++) {
                echo json_encode($this->db->agregar(...$_POST[$i]));
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
    }
}