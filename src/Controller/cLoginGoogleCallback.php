<?php
namespace BurgerHouse\Controller;

require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../../vendor/autoload.php';

use Google_Service_Oauth2;
use BurgerHouse\Model\Usuarios;

class CLoginGoogleCallback {
    private $client;

    public function __construct() {
        // Reutilizar la instancia de Google_Client configurada en config.php
        global $client;
        $this->client = $client;
    }

    public function loginGoogleCallback() {
        // Iniciar sesión si no está iniciada
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (isset($_GET['code'])) {
            $token = $this->client->fetchAccessTokenWithAuthCode($_GET['code']);

            if (!isset($token['error'])) {
                $this->client->setAccessToken($token['access_token']);
        
                $google_oauth = new Google_Service_Oauth2($this->client);
                $google_account_info = $google_oauth->userinfo->get();

                // Validar que los datos del usuario sean válidos
                if (!empty($google_account_info->email) && !empty($google_account_info->name)) {
                    // Datos del usuario
                    $email = $google_account_info->email;
                    $name = $google_account_info->name;

                    // Guardar en sesión
                    $_SESSION['user_email'] = $email;
                    $_SESSION['user_name'] = $name;

                    // Verificar si el usuario existe en la base de datos
                    $userModel = new Usuarios();
                    $user = $userModel->getUserByEmail($email);

                    if (!$user) {
                        // Crear el usuario si no existe
                        $userModel->createUser([
                            'email' => $email,
                            'name' => $name,
                        ]);
                    }

                    // Redirigir al dashboard o página de inicio
                    header('Location: dashboard.php');
                    exit;
                } else {
                    // Manejar el caso en que los datos del usuario no sean válidos
                    header('Location: error.php?error=invalid_user_data');
                    exit;
                }
            } else {
                // Manejar el error de autenticación
                header('Location: error.php?error=auth_failed');
                exit;
            }
        } else {
            // Manejar el caso en que no se reciba el código de autenticación
            header('Location: error.php?error=missing_code');
            exit;
        }
    }
}