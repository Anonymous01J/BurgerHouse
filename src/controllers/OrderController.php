<?php

namespace Shtch\Burgerhouse\controllers;

use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\DetalleOrdenProductoPreparado;
use Shtch\Burgerhouse\models\DetalleOrdenProductoProcesado;
use Shtch\Burgerhouse\models\Orden;
use Kunnu\Dropbox\Dropbox;
use Kunnu\Dropbox\DropboxApp;
use Exception;

class OrderController extends Controller_base
{
    public function __construct()
    {
        parent::__construct("orders");
        $this->db = new Orden();
    }
    public function add()
    {
        try {
            $this->db->clear();
            $l = $_POST;
            unset($l['lista_detalle_preparado']);
            unset($l['lista_detalle_procesado']);
            $this->db->__construct(tipo: $_POST['tipo'], id_cliente: $_POST['id_cliente'] ?? null, status: $_POST['status'], nro_orden: $_POST['nro_orden']);
            $last_id = $this->db->agregar();
            $clase_detalle_producto_preparado = new DetalleOrdenProductoPreparado();
            $clase_detalle_producto_procesado = new DetalleOrdenProductoProcesado();
            if (isset($_POST['lista_detalle_preparado'])) {
                for ($i = 0; $i < count($_POST['lista_detalle_preparado']); $i++) {
                    $clase_detalle_producto_preparado->__construct(...['id_orden' => $last_id, ...$_POST['lista_detalle_preparado'][$i]]);
                    $clase_detalle_producto_preparado->agregar();
                }
            }
            if (isset($_POST['lista_detalle_procesado'])) {
                for ($i = 0; $i < count($_POST['lista_detalle_procesado']); $i++) {
                    $clase_detalle_producto_procesado->__construct(...['id_orden' => $last_id, ...$_POST['lista_detalle_procesado'][$i]]);
                    $clase_detalle_producto_procesado->agregar();
                }
            }

            echo json_encode(['success' => true, 'last_id' => $last_id]);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
    public static function getDropboxAccessToken($clientId, $clientSecret, $refreshToken)
    {
        $ch = curl_init('https://api.dropboxapi.com/oauth2/token');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERPWD, "$clientId:$clientSecret");
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query([
            'grant_type' => 'refresh_token',
            'refresh_token' => $refreshToken
        ]));
        $response = curl_exec($ch);
        curl_close($ch);

        $data = json_decode($response, true);
        if (isset($data['access_token'])) {
            return $data['access_token'];
        } else {
            throw new Exception("No se pudo renovar el token: " . $response);
        }
    }
    public function sendInvoice()
    {
        $tmpPath = $_FILES['pdf']['tmp_name'];
        $filename = $_FILES['pdf']['name'];
        $dropboxPath = "/facturas/" . date('Y-m-d') . "/" . uniqid() . "-" . $filename;

        try {
            $clientId = 'bjv6fj53algyuvy';
            $clientSecret = 'xctzdywh51b3oxy';
            $refreshToken = 'c3RXYAqJBP4AAAAAAAAAAU5M0GoRBtJnQYrvl6gPHYlmDSir37GjiGXiQC7KQZxm';

            $accessToken = OrderController::getDropboxAccessToken($clientId, $clientSecret, $refreshToken);

            $app = new DropboxApp($clientId, $clientSecret, $accessToken);
            $dropbox = new Dropbox($app);

            $uploadedFile = $dropbox->upload($tmpPath, $dropboxPath, ['autorename' => true]);
            $listResponse = $dropbox->postToAPI('/sharing/list_shared_links', [
                'path' => $uploadedFile->getPathDisplay(),
                'direct_only' => true
            ]);
            $listData = $listResponse->getDecodedBody();

            if (!empty($listData['links'])) {
                $url = str_replace('?dl=0', '?raw=1', $listData['links'][0]['url']);
            } else {
                $createResponse = $dropbox->postToAPI('/sharing/create_shared_link_with_settings', [
                    'path' => $uploadedFile->getPathDisplay(),
                    'settings' => ['requested_visibility' => 'public']
                ]);
                $linkData = $createResponse->getDecodedBody();
                $url = str_replace('?dl=0', '?raw=1', $linkData['url']);
            }
            echo json_encode(['url' => $url]);
        } catch (Exception $e) {
            echo json_encode(['error' => 'Error en Dropbox', 'detalle' => $e->getMessage()]);
        }
    }
}
