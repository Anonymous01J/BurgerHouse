<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Metodo_pago extends Db_base {
    private $id;
    private $nombre;
    private $descripcion;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $descripcion = null,
        $nombre_like = null
    ) {
        parent::__construct("metodo_pago");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.descripcion" => $this->descripcion
        ]);

        $this->add_variables_like([
            "a.nombre LIKE" => $this->nombre_like
        ]);
        
    }
}