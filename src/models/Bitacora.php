<?php
namespace Shtechnologyx\Pt3\Model;

use Shtechnologyx\Pt3\Model\Db_base;

class Bitacora extends Db_base {
    private $id;
    private $usuario;
    private $tabla_str;
    private $accion;
    private $fecha;
    private $detalles;

    public function __construct(
        $id = null,
        $usuario = null,
        $tabla = null,
        $accion = null,
        $fecha = null,
        $detalles = null
    ) {
        parent::__construct($id, "bitacora");
        
        $this->id = $id;
        $this->usuario = $usuario;
        $this->tabla_str = $tabla;
        $this->accion = $accion;
        $this->fecha = $fecha;
        $this->detalles = $detalles;

        $this->add_variables([
            "a.id" => $this->id,
            "a.usuario" => $this->usuario,
            "a.tabla" => $this->tabla_str,
            "a.accion" => $this->accion,
            "a.fecha" => $this->fecha,
            "a.detalles" => $this->detalles
        ]);

        $this->add_variables_like([
            "a.id" => $this->id,
            "a.usuario" => $this->usuario,
            "a.tabla" => $this->tabla_str,
            "a.accion" => $this->accion
        ]);

        $this->select_query = "
            a.id,
            a.usuario,
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