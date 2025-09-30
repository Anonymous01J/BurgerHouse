<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Paquetes_mesa extends Db_base
{
    private $id;
    private $id_paquete;
    private $id_mesa;


    public function __construct(
        $id = null,
        $id_paquete = null,
        $id_mesa = null

    ) {
        parent::__construct("paquetes_mesas");

        $this->id = $id;
        $this->id_mesa = $id_mesa;
        $this->id_paquete = $id_paquete;


        $this->add_variables([
            "a.id" => $this->id,
            "a.id_paquete" => $this->id_paquete,
            "a.id_mesa" => $this->id_mesa,
        ]);


        $this->select_query = "
                a.id,
                a.id_paquete,
                a.id_mesa,
                mesas.sillas
            ";
        $this->joins = "
                INNER JOIN mesas ON mesas.id = a.id_mesa
            ";
    }
}
