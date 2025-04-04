<?php

namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;

use Shtch\Burgerhouse\models\Usuario;

class LoginController extends Controller_base{
    public function __construct(){
        parent::__construct('login');
        // $this->db = new Usuario(nombre:$_POST['email'], hash:$_POST['password']);
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
            echo json_encode(['success' => false, 'message' => 'Captcha verification failed']);
            return;
            die;
        }
        $cont = $_POST['password'];
        // $encriptada = password_hash($cont, PASSWORD_DEFAULT);
        // $this->db = new Usuario(nombre:$_POST['nombre'],hash:$encriptada);
        $this->db = new Usuario(nombre:$_POST['nombre'],hash:$cont);
        $result = $this->db->search();
        if (empty($result)) {
            echo json_encode(['success' => false,'message'=>'Usuario no encontrado']);
            return;
            die;
        }
        echo json_encode(['success' => true, 'message' => 'Usuario encontrado']);
        return;
        die;

    }

}
