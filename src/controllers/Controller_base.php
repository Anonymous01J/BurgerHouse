<?php
namespace Shtch\Burgerhouse\controllers;

class Controller_base {
    public $module_name;

    public function __construct($module_name) {
        $this->module_name = $module_name;
    }

    public function view() {
        include_once __DIR__ . '/../views/' . $this->module_name . '.php';
    }
}