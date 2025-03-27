<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;

class C_Productos extends Controller_base {
    public function __construct() {
        parent::__construct('error-404', 'producto');
    }
}