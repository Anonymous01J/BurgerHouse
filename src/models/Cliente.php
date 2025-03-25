<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Clientes extends Db_base {
    private $id;
    private $nombre;
    private $cedula;
    private $telefono;
    private $active;

    public function __construct(
        $id = null,
        $nombre = null,
        $cedula = null,
        $telefono = null,
        $active = null
    ) {
        parent::__construct("clientes");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->cedula = $cedula;
        $this->telefono = $telefono;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.cedula" => $this->cedula,
            "a.telefono" => $this->telefono,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.cedula" => $this->cedula
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.cedula,
            a.telefono,
            a.active
        ";
    }
}