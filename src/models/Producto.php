<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Producto extends Db_base {
    private $id;
    private $id_categoria;
    private $id_receta;
    private $nombre;
    private $imagen;
    private $precio;
    private $detalles;
    private $active;

    public function __construct(
        $id = null,
        $id_categoria = null,
        $id_receta = null,
        $nombre = null,
        $imagen = null,
        $precio = null,
        $detalles = null,
        $active = null
    ) {
        parent::__construct("productos");
        
        $this->id = $id;
        $this->id_categoria = $id_categoria;
        $this->id_receta = $id_receta;
        $this->nombre = $nombre;
        $this->imagen = $imagen;
        $this->precio = $precio;
        $this->detalles = $detalles;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_categoria" => $this->id_categoria,
            "a.id_receta" => $this->id_receta,
            "a.nombre" => $this->nombre,
            "a.imagen" => $this->imagen,
            "a.precio" => $this->precio,
            "a.detalles" => $this->detalles,
            "a.active" => $this->active
        ]);


        $this->select_query = "
            a.id,
            a.id_categoria,
            a.id_receta,
            a.nombre,
            a.imagen,
            a.precio,
            a.detalles,
            a.active
        ";
    }
}