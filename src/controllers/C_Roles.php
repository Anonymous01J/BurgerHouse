<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;

class C_Roles extends Controller_base {

    public function __construct() {
        parent::__construct('error-404', 'rol');
    }
}