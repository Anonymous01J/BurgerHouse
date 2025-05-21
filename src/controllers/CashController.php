<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Caja;


class CashController extends Controller_base {

    public function __construct() {
        parent::__construct("cash");
        $this->db = new Caja();
    }
    
}