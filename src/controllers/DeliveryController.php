<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Delivery;
use Shtch\Burgerhouse\models\Orden;


class DeliveryController extends Controller_base {

    public function __construct() {
        parent::__construct("delivery");
        $this->db = new Delivery();
    }

}