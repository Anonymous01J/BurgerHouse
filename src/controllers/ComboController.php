<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;


class ComboController extends Controller_base {

    public function __construct() {
        parent::__construct("combos");
        // $this->db = new Producto;
    }
}