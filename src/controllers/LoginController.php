<?php

namespace Shtch\Burgerhouse\controllers;


class LoginController
{

    public function index()
    {
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
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
            echo json_encode(['success' => $resultado['success']]);
        } else {
            include_once __DIR__ . '/../views/login.php';
        }
    }
}
