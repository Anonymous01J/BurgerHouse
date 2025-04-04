<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;


class RecipeController extends Controller_base {

    public function __construct() {
        parent::__construct("recipe");
        // $this->db = new Recipe();
    }
}