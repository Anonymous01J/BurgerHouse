<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Mesa extends Db_base {
    private $id;
    private $nombre;
    private $numero;
    private $sillas;
    private $active;
    private $estado;
    private $imagen;

    public function __construct(
        $id = null,
        $numero = null,
        $sillas = null,
        $active = null,
        $estado = null,
        $imagen = null
    ) {
        parent::__construct("mesas");
        
        $this->id = $id;
        $this->numero = $numero;
        $this->sillas = $sillas;
        $this->active = $active;
        $this->estado = $estado;
        $this->imagen = $imagen;

        $this->add_variables([
            "a.id" => $this->id,
            "a.numero" => $this->numero,
            "a.sillas" => $this->sillas,
            "a.active" => $this->active,
            "a.estado" => $this->estado,
            "a.imagen" => $this->imagen
        ]);
    }
}