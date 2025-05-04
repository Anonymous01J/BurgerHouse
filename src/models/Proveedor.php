<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Proveedor extends Db_base {
    private $id;
    private $nombre;
    private $razon_social;
    private $documento;
    private $n_telefono1;
    private $n_telefono2;
    private $direccion;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $razon_social = null,
        $documento = null,
        $nombre_like = null,
        $n_telefono1 = null,
        $n_telefono2 = null,
        $direccion = null,
        $active = null
    ) {
        parent::__construct("proveedores");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->razon_social = $razon_social;
        $this->documento = $documento;;
        $this->nombre_like = $nombre_like;
        $this->n_telefono1 = $n_telefono1;
        $this->n_telefono2 = $n_telefono2;
        $this->direccion = $direccion;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.razon_social" => $this->razon_social,
            "a.documento" => $this->documento,
            "a.n_telefono1" => $this->n_telefono1,
            "a.n_telefono2" => $this->n_telefono2,
            "a.direccion" => $this->direccion,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.razon_social" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.razon_social,
            a.documento,
            a.n_telefono1,
            a.n_telefono2,
            a.direccion,
            a.active
        ";
    }
}