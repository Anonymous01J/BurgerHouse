<?php
namespace Shtch\Burgerhouse\controllers\Login;
use Shtch\Burgerhouse\models\Permiso;
use Shtch\Burgerhouse\models\Usuario;
use function Shtch\Burgerhouse\controllers\{
    controller_init,
    base_view,
    base_get_all,
    base_add,
    base_delete,
    base_update,
    base_add_many,
    base_delete_many,
    base_update_many,
    base_guardar_imagen_mult,
    base_guardar_imagen_single
};

controller_init('login', Usuario::class);
function view()
{
    base_view('login');
}
function get_all(...$args)
{
    base_get_all('login', ...$args);
}
function add()
{
    base_add('login');
}
function delete()
{
    base_delete('login');
}
function update()
{
    base_update('login');
}
function add_many()
{
    base_add_many('login');
}
function delete_many()
{
    base_delete_many('login');
}
function updateMany()
{
    base_update_many('login');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('login', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('login');
}
function login()
{
    $user = new Usuario(email: $_POST['email'], hash: $_POST['password']);
    $result = $user->search();
    if (empty($result)) {
        echo json_encode(['success' => false, 'message' => 'Usuario o contraseña incorrectos']);
    } else {
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
            echo json_encode(['success' => false, 'message' => 'Error de verificación de captcha']);
        } else {
            $session_id = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'), 0, 10);
            $user->__construct(id: $result[0]['id'], session_id: $session_id);
            $user->actualizar();
            echo json_encode(['success' => true, 'message' => 'Usuario encontrado']);
            $permission = new Permiso(id_rol: $result[0]['rol_id']);
            $permisos = $permission->search(n: 0, limite: 2000);
            $_SESSION['permisos'] = $permisos;
            $_SESSION['id'] = $result[0]['id'];
            $_SESSION['id_rol'] = $result[0]['rol_id'];
            $_SESSION['rol'] = $result[0]['rol'];
            $_SESSION['nombre'] = $result[0]['nombre'];
            $_SESSION['apellido'] = $result[0]['apellido'];
            $_SESSION['correo'] = $result[0]['email'];
            $_SESSION['session_id'] = $session_id;
            $_SESSION['imagen'] = $result[0]['imagen'];
        }
    }
}
function logout()
{
    session_destroy();
    exit;
}
function cedula()
{
    define('APPID_CEDULA', '1033');
    define('TOKEN_CEDULA', '2e40fcab6d2f933e63fa9be82cdbd1be');
    function getCurlData($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        $curlData = curl_exec($curl);
        curl_close($curl);
        return $curlData;
    }
    function getCI($cedula, $return_raw = false)
    {
        $cedula = $_POST['cedula'];
        $res = getCurlData("https://api.cedula.com.ve/api/v1?app_id=" . APPID_CEDULA . "&token=" . TOKEN_CEDULA . "&cedula=" . (int)$cedula);
        if ($return_raw)
            return strlen($res) > 3 ? $res : false;
        $res = json_decode($res, true);
        return isset($res['data']) && $res['data'] ? $res['data'] : $res['error_str'];
    }
    $consulta = getCI(00000);
    if (is_array($consulta)) {
        echo json_encode(['success' => true, 'message' => $consulta]);
    } else {
        echo json_encode(['success' => false, 'message' => $consulta]);
    }
}
function SessionInfo()
{
    if (!isset($_SESSION)) {
        echo json_encode(['success' => false, 'message' => 'Sesion no iniciada']);
    } else {
        echo json_encode(['success' => true, 'message' => $_SESSION]);
    }
}
function UpdateSession()
{
    if (isset($_POST['imagen_name'])) {
        $imagen = $_POST['imagen_name'];
        $_SESSION['imagen'] = $imagen;
    } else if (isset($_POST['nombre']) && isset($_POST['apellido']) && isset($_POST['email'])) {
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $correo = $_POST['email'];
        $_SESSION['nombre'] = $nombre;
        $_SESSION['apellido'] = $apellido;
        $_SESSION['correo'] = $correo;
    } else {
        $permisos = $_POST['permisos'];
        $_SESSION['permisos'] = $permisos;
    }
}
