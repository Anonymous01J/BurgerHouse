<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Producto;

class ComboController extends Controller_base {

    public function __construct() {
        parent::__construct(module_name: "combos");
        $this->db = new Producto();
    }
}