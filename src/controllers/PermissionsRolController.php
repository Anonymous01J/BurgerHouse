<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Permiso_rol;

class PermissionsRolController extends Controller_base {

    public function __construct() {
        parent::__construct("permissions_rol");
        $this->db = new Permiso_rol();
    }
    
}