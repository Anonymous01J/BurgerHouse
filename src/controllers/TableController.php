<?php

namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Mesa;

class TableController extends Controller_base
{
    public function __construct()
    {
        parent::__construct("table");
        $this->db = new Mesa();
    }
   
}
