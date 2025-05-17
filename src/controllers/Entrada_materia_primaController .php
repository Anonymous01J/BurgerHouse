<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Entrada_materia_prima;

class Entrada_materia_primaController extends Controller_base {
    public function __construct() {
        parent::__construct("entrada_materia_prima");
        $this->db = new Entrada_materia_prima();
    }
    
}