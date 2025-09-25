<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Mesa extends Db_base {
    private $id;
    private $nombre;
    private $sillas;
    private $active;
    private $estado;
    private $imagen;
    private $vip;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $sillas = null,
        $active = null,
        $estado = null,
        $imagen_name = null,
        $imagen = null,
        $vip = null,
        $nombre_like = null
    ) {
        parent::__construct("mesas");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->sillas = $sillas;
        $this->active = $active;
        $this->estado = $estado;
        $this->imagen = $imagen_name;
        $this->vip = $vip;
        $this->nombre_like = $nombre_like;

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.sillas" => $this->sillas,
            "a.active" => $this->active,
            "a.estado" => $this->estado,
            "a.imagen" => $this->imagen,
            "a.vip" => $this->vip
        ]);
    }
}