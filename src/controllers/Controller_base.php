<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\models\Db_base;

class Controller_base {
    public $module_name;
    public $table_name;
    public Db_base $db;

    public function __construct($module_name, $table_name = null) {
        $this->module_name = $module_name;
        if ($table_name) {
            $this->table_name = "Shtch\\Burgerhouse\\models\\".$table_name;
            $this->db = new $this->table_name(...$_POST);
        }
    }

    public function view() {
        include_once __DIR__ . '/../views/' . $this->module_name . '.php';
    }

    public function get_all(...$args) {
        header('Content-Type: application/json');
        echo json_encode($this->db->search(...$args));
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
    }
}