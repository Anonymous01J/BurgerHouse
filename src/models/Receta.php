<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Receta extends Db_base {
    private $id;
    private $id_producto;
    private $active;

    public function __construct($id = null, $id_producto = null, $active = null) {
        parent::__construct("recetas");
        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
            "a.active" => $this->active
        ]);

        $this->select_query = "
            a.id,
            a.id_producto,
            a.active
        ";
    }
}
