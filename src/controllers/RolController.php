<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Rol;

class RolController extends Controller_base {

    public function __construct() {
        parent::__construct("roles");
        $this->db = new Rol();
    }
    
}