<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Detalle_receta extends Db_base {
    private $id;
    private $id_receta;
    private $id_materia_prima;
    private $cantidad;
    private $nombre_like;

    public function __construct($id = null, $id_receta = null, $id_materia_prima = null, $cantidad = null, $nombre_like = null) {
        parent::__construct("detalles_receta");
        $this->id = $id;
        $this->id_receta = $id_receta;
        $this->id_materia_prima = $id_materia_prima;
        $this->cantidad = $cantidad;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_receta" => $this->id_receta,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.cantidad" => $this->cantidad
        ]);

        $this->add_variables_like([
            "productos_preparados.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.id_receta,
            a.id_materia_prima,
            a.cantidad,
            recetas.active as active,
            productos_preparados.nombre,
            recetas.id_producto,
            materia_prima.nombre as ingrediente,
            unidades.alias as unidad
        ";

        $this->joins = "
            INNER JOIN recetas ON a.id_receta = recetas.id
            INNER JOIN productos_preparados ON productos_preparados.id = recetas.id_producto
            INNER JOIN materia_prima ON a.id_materia_prima = materia_prima.id
            INNER JOIN unidades ON materia_prima.id_unidad = unidades.id
        ";
    }
}
