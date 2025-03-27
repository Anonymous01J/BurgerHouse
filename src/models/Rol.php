<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Proveedor extends Db_base {
    private $id;
    private $nombre;
    private $razonSocial;
    private $rif;
    private $telefono;
    private $correo;

    public function __construct($id = null, $nombre = null, $razonSocial = null, $rif = null, $telefono = null, $correo = null) {
        parent::__construct("proveedores");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->razonSocial = $razonSocial;
        $this->rif = $rif;
        $this->telefono = $telefono;
        $this->correo = $correo;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.razonSocial" => $this->razonSocial,
            "a.rif" => $this->rif,
            "a.telefono" => $this->telefono,
            "a.correo" => $this->correo
        ]);
        
        $this->select_query = "
            a.id,
            a.nombre,
            a.razonSocial,
            a.rif,
            a.telefono,
            a.correo
        ";
    }
}
