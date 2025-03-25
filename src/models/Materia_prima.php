<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Materia_prima extends Db_base {
    private $id;
    private $id_categoria;
    private $id_unidad;
    private $stock;

    public function __construct(
        $id = null,
        $id_categoria = null,
        $id_unidad = null,
        $stock = null
    ) {
        parent::__construct("materia_prima");
        
        $this->id = $id;
        $this->id_categoria = $id_categoria;
        $this->id_unidad = $id_unidad;
        $this->stock = $stock;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_categoria" => $this->id_categoria,
            "a.id_unidad" => $this->id_unidad,
            "a.stock" => $this->stock
        ]);

        $this->add_variables_like([
            "a.id" => $this->id,
            "a.id_categoria" => $this->id_categoria
        ]);

        $this->select_query = "
            a.id,
            a.id_categoria,
            b.nombre AS nombre_categoria,
            a.id_unidad,
            c.nombre AS nombre_unidad,
            a.stock
        ";

        $this->joins = "
            INNER JOIN categorias b ON b.id = a.id_categoria
            INNER JOIN unidades c ON c.id = a.id_unidad
        ";
    }
}