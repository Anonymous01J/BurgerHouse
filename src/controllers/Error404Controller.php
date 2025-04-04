<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;

class Error404Controller extends Controller_base {

    public function __construct(){
        parent::__construct('error-404');
    }
}