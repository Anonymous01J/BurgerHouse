<?php
namespace Shtechnologyx\Pt3\Model;

use Shtechnologyx\Pt3\Model\Db_base;

class Categorias extends Db_base {
    private $id;
    private $nombre;
    private $tipo;
    private $active;

    public function __construct(
        $id = null,
        $nombre = null,
        $tipo = null,
        $active = null
    ) {
        parent::__construct($id, "categorias");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->tipo = $tipo;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.tipo" => $this->tipo,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.tipo" => $this->tipo
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.tipo,
            a.active
        ";
    }
}