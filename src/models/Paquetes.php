<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Paquetes extends Db_base
{
    private $id;
    private $nombre;
    private $precio;
    private $active;
    private $nombre_like;


    public function __construct(
        $id = null,
        $nombre = null,
        $precio = null,
        $active = null,
        $nombre_like = null

    ) {
        parent::__construct("paquetes_reservacion");

        $this->id = $id;
        $this->nombre = $nombre;
        $this->precio = $precio;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.precio" => $this->precio,
            "a.active" => $this->active
        ]);
    }
}
