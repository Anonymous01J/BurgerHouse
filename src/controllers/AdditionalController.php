<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Adicional;
use Exception;


class AdditionalController extends Controller_base {

    public function __construct() {
        parent::__construct("additional");
        $this->db = new Adicional();
    }
}