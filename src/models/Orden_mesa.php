<?php

namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Orden_mesa extends Db_base
{
    private $id;
    private $id_mesa;
    private $id_orden;

    public function __construct(
        $id = null,
        $id_mesa = null,
        $id_orden = null,
    ) {
        parent::__construct("orden_mesa");

        $this->id = $id;
        $this->id_mesa = $id_mesa;
        $this->id_orden = $id_orden;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_mesa" => $this->id_mesa,
            "a.id_orden" => $this->id_orden,
        ]);
        $this->select_query = "
        a.id,
        a.id_mesa,
        a.id_orden,
        m.nombre
        ";
        $this->joins = "
        INNER JOIN mesas m ON a.id_mesa = m.id
        ";
    }
}
