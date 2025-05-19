<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Materia_prima extends Db_base {
    private $id;
    private $id_categoria;
    private $id_unidad;
    private $nombre;
    private $stock_min;
    private $stock_max;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $id_categoria = null,
        $id_unidad = null,
        $nombre = null,
        $stock_min = null,
        $stock_max = null,
        $active = null,
        $nombre_like = null
    ) {
        parent::__construct("materia_prima");
        
        $this->id = $id;
        $this->id_categoria = $id_categoria;
        $this->id_unidad = $id_unidad;
        $this->nombre = $nombre;
        $this->stock_min = $stock_min;
        $this->stock_max = $stock_max;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_categoria" => $this->id_categoria,
            "a.id_unidad" => $this->id_unidad,
            "a.nombre" => $this->nombre,
            "a.stock_min" => $this->stock_min,
            "a.stock_max" => $this->stock_max,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.id_categoria,
            b.nombre AS nombre_categoria,
            a.id_unidad,
            c.nombre AS nombre_unidad,
            c.alias AS alias_unidad,
            a.stock_min,
            a.stock_max,
            a.existencia,
            a.active
        ";

        $this->joins = "
            INNER JOIN categoria_materia_prima b ON b.id = a.id_categoria
            INNER JOIN unidades c ON c.id = a.id_unidad
        ";
    }
}