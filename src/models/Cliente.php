<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Cliente extends Db_base {
    private $id;
    private $nombre;
    private $cedula;
    private $telefono;
    private $direccion;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $cedula = null,
        $telefono = null,
        $direccion = null,
        $active = null,
        $nombre_like = null
    ) {
        parent::__construct("clientes");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->cedula = $cedula;
        $this->telefono = $telefono;
        $this->direccion = $direccion;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.cedula" => $this->cedula,
            "a.telefono" => $this->telefono,
            "a.direccion" => $this->direccion,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);
        
        $this->select_query = "
            a.id,
            a.nombre,
            a.cedula,
            a.telefono,
            a.direccion,
            a.active
        ";
    }
}