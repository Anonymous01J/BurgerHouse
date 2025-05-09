<?php

namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Adicionales extends Db_base
{
    private $id;
    private $nombre;
    private $imagen;
    private $precio;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $imagen = null,
        $precio = null,
        $active = null,
        $nombre_like = null,
        $imagen_name = null
    ) {
        parent::__construct("adicionales");

        $this->id = $id;
        $this->nombre = $nombre;
        $this->imagen = $imagen_name;
        $this->precio = $precio;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.imagen" => $this->imagen,
            "a.precio" => $this->precio,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.imagen,
            a.precio,
            a.active
        ";
    }
}
