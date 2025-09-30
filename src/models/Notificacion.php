<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Notificacion extends Db_base
{
    private $id;
    private $id_usuario;
    private $status;
    private $titulo;
    private $mensaje;
    private $fecha;

    public function __construct(
        $id = null,
        $id_usuario = null,
        $status = null,
        $titulo = null,
        $mensaje = null,
        $fecha = null
    ) {
        parent::__construct("notificaciones", 2);

        $this->id = $id;
        $this->id_usuario = $id_usuario;
        $this->status = $status;
        $this->titulo = $titulo;
        $this->mensaje = $mensaje;
        $this->fecha = $fecha;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_usuario" => $this->id_usuario,
            "a.titulo" => $this->titulo,
            "a.status" => $this->status,
            "a.mensaje" => $this->mensaje,
            "a.fecha" => $this->fecha
        ]);

        $this->select_query = "
                a.id,
                a.id_usuario,
                a.titulo,
                a.status,
                a.mensaje,
                a.fecha,
                u.nombre,
                u.apellido
            ";
        $this->joins = "
                INNER JOIN usuario u ON a.id_usuario = u.id
            ";
    }
}
