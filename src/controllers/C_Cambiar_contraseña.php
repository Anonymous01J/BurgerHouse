<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;

class C_Cambiar_contraseña extends Controller_base {

    public function __construct() {
        parent::__construct('recover_password');
    }
}