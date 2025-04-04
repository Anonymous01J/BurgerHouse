<?php

namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Usuario;

class LoginController extends Controller_base{
    public $db;
    public function __construct(){
        parent::__construct('login');
        $this->db = new Usuario();
    }

    public function login()    {
        header('Content-Type: application/json');
        $token = $_POST['token'];
        $secretKey = '0x4AAAAAABDYzHAap8ofRwK1xEfj_e_rKz8';

        $response = file_get_contents("https://challenges.cloudflare.com/turnstile/v0/siteverify", false, stream_context_create([
            'http' => [
                'method' => 'POST',
                'header' => "Content-Type: application/x-www-form-urlencoded\r\n",
                'content' => http_build_query(['secret' => $secretKey, 'response' => $token])
            ]
        ]));
        $resultado = json_decode($response, true);
        if (!$resultado['success']) {
            echo json_encode(['success' => false]);
            return;
            die;
        }
        $result = $this->db->search();
        if (empty($result)) {
            echo json_encode(['success' => false]);
            return;
            die;
        }
        echo json_encode(['success' => true]);
        return;
        die;

    }

}
