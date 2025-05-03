<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Bitacora extends Db_base {
    private $id;
    private $id_usuario;
    private $tabla_str;
    private $accion;
    private $fecha;
    private $detalles;

    public function __construct(
        $id = null,
        $id_usuario = null,
        $tabla = null,
        $accion = null,
        $fecha = null,
        $detalles = null
    ) {
        parent::__construct("bitacora");
        
        $this->id = $id;
        $this->id_usuario = $id_usuario;
        $this->tabla_str = $tabla;
        $this->accion = $accion;
        $this->fecha = $fecha;
        $this->detalles = $detalles;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_usuario" => $this->id_usuario,
            "a.tabla" => $this->tabla_str,
            "a.accion" => $this->accion,
            "a.fecha" => $this->fecha,
            "a.detalles" => $this->detalles
        ]);

        $this->select_query = "
            a.id,
            a.id_usuario,
            b.nombre AS nombre_usuario,
            a.tabla,
            a.accion,
            a.fecha,
            a.detalles
        ";

        $this->joins = "
            INNER JOIN usuario b ON b.usuario = a.usuario
        ";
    }
}