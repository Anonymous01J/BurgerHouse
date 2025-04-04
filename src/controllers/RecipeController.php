<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Receta;

class RecipeController extends Controller_base {
    public function __construct() {
        parent::__construct('recetas');
        $this->db = new Receta();
    }
}