<?php
namespace Shtch\Burgerhouse\controllers\Notification;
use Shtch\Burgerhouse\models\Notificacion;
use Pusher\Pusher;
use Exception;
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

controller_init('notifications', Notificacion::class);
function view()
{
    base_view('notifications');
}
function get_all(...$args)
{
    base_get_all('notifications', ...$args);
}
function add()
{
    base_add('notifications');
}
function delete()
{
    base_delete('notifications');
}
function update()
{
    base_update('notifications');
}
function add_many()
{
    base_add_many('notifications');
}
function delete_many()
{
    base_delete_many('notifications');
}
function updateMany()
{
    base_update_many('notifications');
}
function guardar_imagen_mult($index)
{
    base_guardar_imagen_mult('notifications', $index);
}
function guardar_imagen_single()
{
    base_guardar_imagen_single('notifications');
}
function sendNotifications()
{
    try {
        date_default_timezone_set('America/Caracas');
        $channel = $_POST['channel'];
        $event = $_POST['event'];
        $message = $_POST['message'];
        $pusher = new Pusher(
            '2a7ca356d030e2945ae9',
            '3c3f676721576bb7c676',
            '2016820',
            [
                'cluster' => 'us2',
                'useTLS' => true
            ]
        );
        $data = ['message' => $message,  'time' => date('Y-m-d H:i:s'), 'event' => $event];
        $pusher->trigger($channel, $event, $data);
        echo json_encode(['success' => true]);
    } catch (Exception $th) {
        echo json_encode(['success' => false, 'message' => $th->getMessage()]);
    }
}
