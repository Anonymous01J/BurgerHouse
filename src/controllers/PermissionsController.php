<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Permiso;

class PermissionsController extends Controller_base {

    public function __construct() {
        parent::__construct("permissions");
        $this->db = new Permiso();
    }
    
}