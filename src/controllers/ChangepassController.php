<?php

namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Usuario;
use DateTime;
use DateInterval;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class ChangepassController extends Controller_base
{
    public function __construct()
    {
        parent::__construct("recover_password");
        $this->db = new Usuario();
    }
    public function sendEmail()
    {
        date_default_timezone_set('America/Caracas');
        $day = new DateTime();
        $day->format('Y-m-d H:i:s');
        $token = random_int(1000, 9999);
        $expiresAt = $day->add(new DateInterval('PT150S'))->format('Y-m-d H:i:s');
        $this->db->__construct(id: $_POST['id'], token: $token, token_expiracion: $expiresAt);
        $this->db->actualizar();
        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = 'smtp.gmail.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'garnicaluis391@gmail.com';
            $mail->Password   = 'iwqqzociqlbxlrvs';
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port       = 587;

            $mail->CharSet  = 'UTF-8';
            $mail->setFrom('garnicaluis391@gmail.com', 'Burger House Soporte');
            $mail->addAddress($_POST['email']);
            $mail->isHTML(true);
            $mail->Subject = 'Restablece tu contraseña';
            $mail->addEmbeddedImage(
                './assets/img/banner.png',
                'logo_cid',
                'logo.png'
            );
            $mail->Body = '
                <html>
                    <body>
                        <img src="cid:logo_cid" alt="Logo">
                        <h1 style="color:##FF4B00; font-family: Arial, sans-serif; text-align: center;">¡Hola, ' . $_POST['name'] . '!</h1>
                        <p style="font-size: 14px; line-height: 1.5;">Has solicitado restablecer tu contraseña en Burger House.</p>
                        <h3 style="font-family: Arial, sans-serif;">Tu código de verificación es: ' . $token . '</h3>
                        <p>Introduce este código en el formulario de restablecimiento dentro de los próximos 150 segundos para completar el proceso.</p>
                        <p>Si no solicitaste este cambio, ignora este correo y tu contraseña seguirá siendo la misma.</p>
                        <h3>¡Gracias!</h3>
                    </body>
                </html>
            ';
            $mail->send();
            echo json_encode(["success" => true, "mensaje" => "Correo enviado."]);
        } catch (Exception $e) {
            echo json_encode(["success" => false, "mensaje" => "Error al enviar el correo: " . $e->getMessage()]);
        }
    }

    public function validateToken()
    {
        $token = $_POST['token'] ?? '';
        date_default_timezone_set('America/Caracas');
        $now  = new DateTime();
        $now->format('Y-m-d H:i:s');
        $this->db->__construct(token: $token);
        $result = $this->db->search();

        if (!empty($result)) {
            $date_DB = new DateTime($result[0]['token_expiracion']);
            if ($now > $date_DB) {
                echo json_encode(["success" => false, "mensaje" => "Codigo expirado."]);
            } else {
                echo json_encode(["success" => true, "mensaje" => $result]);
            }
        } else {
            echo json_encode(["success" => false, "mensaje" => "Codigo no valido."]);
        }
    }
}
