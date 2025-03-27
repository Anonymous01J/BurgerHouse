<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Notificacion extends Db_base {
    private $id;
    private $id_usuario;
    private $status;
    private $mensaje;
    private $fecha;

    public function __construct(
        $id = null,
        $id_usuario = null,
        $status = null,
        $mensaje = null,
        $fecha = null
    ) {
        parent::__construct("notificaciones");
        
        $this->id = $id;
        $this->id_usuario = $id_usuario;
        $this->status = $status;
        $this->mensaje = $mensaje;
        $this->fecha = $fecha;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_usuario" => $this->id_usuario,
            "a.status" => $this->status,
            "a.mensaje" => $this->mensaje,
            "a.fecha" => $this->fecha
        ]);
    }
}