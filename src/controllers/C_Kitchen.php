<?php
namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;

class C_Kitchen extends Controller_base {

    public function __construct() {
        parent::__construct(module_name:'kitchen');
    }
}