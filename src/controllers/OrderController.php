<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Orden;

class OrderController extends Controller_base {

    public function __construct() {
        parent::__construct("orders");
        $this->db = new Orden();
    }
}
