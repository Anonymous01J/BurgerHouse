<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Cliente extends Db_base {
    private $id;
    private $nombre;
    private $apellido;
    private $documento;
    private $telefono;
    // private $direccion;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $apellido = null,
        $documento = null,
        $telefono = null,
        // $direccion = null,
        $active = null,
        $nombre_like = null
    ) {
        parent::__construct("clientes");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->documento = $documento;
        $this->telefono = $telefono;
        // $this->direccion = $direccion;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.apellido" => $this->apellido,
            "a.documento" => $this->documento,
            "a.telefono" => $this->telefono,
            // "a.direccion" => $this->direccion,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);
        
        $this->select_query = "
            a.id,
            a.nombre,
            a.apellido,
            a.telefono,
            a.documento,
            a.active
        ";
    }
}