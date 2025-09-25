<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Bitacora;


class BinnacleController extends Controller_base {
    public function __construct() {
        parent::__construct("binnacle");
        $this->db = new Bitacora();
    }
}