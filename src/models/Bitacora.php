<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Bitacora extends Db_base {
    private $id;
    private $id_usuario;
    private $tabla_str;
    private $accion;
    private $fecha;
    private $descripcion;

    public function __construct(
        $id = null,
        $id_usuario = null,
        $tabla = null,
        $accion = null,
        $fecha = null,
        $descripcion = null
    ) {
        parent::__construct("bitacora");
        
        $this->id = $id;
        $this->id_usuario = $id_usuario;
        $this->tabla_str = $tabla;
        $this->accion = $accion;
        $this->fecha = $fecha;
        $this->descripcion = $descripcion;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_usuario" => $this->id_usuario,
            "a.tabla" => $this->tabla_str,
            "a.accion" => $this->accion,
            "a.fecha" => $this->fecha,
            "a.descripcion" => $this->descripcion
        ]);

        $this->select_query = "
            a.id,
            a.id_usuario,
            b.nombre AS nombre_usuario,
            a.tabla,
            a.accion,
            a.fecha,
            a.descripcion
        ";

        $this->joins = "
            INNER JOIN usuario b ON b.id = a.id_usuario
        ";
    }

    public function agregar($id_usuario, $tabla, $accion,$descripcion=null) {
        $query = "INSERT INTO bitacora (id_usuario, tabla, accion, descripcion) VALUES (:id_usuario, :tabla, :accion, :descripcion)";
        $this->db->prepare($query);
        $this->db->bind(':id_usuario', $id_usuario);
        $this->db->bind(':tabla', $tabla);
        $this->db->bind(':accion', $accion);
        $this->db->bind(':descripcion', $descripcion);
        return $this->db->execute();
    }
}