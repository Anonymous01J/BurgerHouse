<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Receta extends Db_base {
    private $id;
    private $id_producto;

    public function __construct($id = null, $id_producto = null) {
        parent::__construct("recetas");
        $this->id = $id;
        $this->id_producto = $id_producto;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
        ]);


        $this->select_query = "
            a.id,
            a.id_producto
        ";
    }
}
