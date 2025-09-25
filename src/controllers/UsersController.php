<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Usuario;


class UsersController extends Controller_base {

    public function __construct() {
        parent::__construct("users");
        $this->db = new Usuario();
    }
    
}