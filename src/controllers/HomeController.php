<?php

namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Estadisticas;
use Exception;

class HomeController extends Controller_base
{
    public function __construct()
    {
        parent::__construct(module_name: 'index');
        $this->db = new Estadisticas();
    }
    public function ClientesFrecuentes()
    {
        try {
            echo json_encode($this->db->consultar_vista('vista_resumen_clientes'));
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
}
