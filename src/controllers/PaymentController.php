<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Pago;

class PaymentController extends Controller_base{

    public function __construct(){
        parent::__construct(module_name: 'pay');
        $this->db = new Pago();
    }
}