<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Proveedor extends Db_base {
    private $id;
    private $nombre;
    private $razon_social;
    private $rif;

    public function __construct(
        $id = null,
        $nombre = null,
        $razon_social = null,
        $rif = null
    ) {
        parent::__construct("proveedores");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->razon_social = $razon_social;
        $this->rif = $rif;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.razon_social" => $this->razon_social,
            "a.rif" => $this->rif
        ]);


        $this->select_query = "
            a.id,
            a.nombre,
            a.razon_social,
            a.rif
        ";
    }
}