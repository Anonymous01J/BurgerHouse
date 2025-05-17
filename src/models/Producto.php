<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Producto extends Db_base
{
    private $id;
    private $id_categoria;
    private $nombre;
    private $imagen;
    private $precio;
    private $detalles;
    private $tipo;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $id_categoria = null,
        $nombre = null,
        $imagen = null,
        $precio = null,
        $detalles = null,
        $active = null,
        $tipo = null,
        $nombre_like = null,
        $imagen_name = null
    ) {
        parent::__construct("productos_preparados");

        $this->id = $id;
        $this->id_categoria = $id_categoria;
        $this->nombre = $nombre;
        $this->imagen = $imagen_name;
        $this->precio = $precio;
        $this->detalles = $detalles;
        $this->active = $active;
        $this->tipo = $tipo;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_categoria" => $this->id_categoria,
            "a.nombre" => $this->nombre,
            "a.imagen" => $this->imagen,
            "a.precio" => $this->precio,
            "a.detalles" => $this->detalles,
            "a.active" => $this->active,
            "a.tipo" => $this->tipo
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.id_categoria,
            categorias_productos.nombre as nombre_categoria,
            a.nombre,
            a.imagen,
            a.precio,
            a.detalles,
            a.active,
            a.tipo
        ";
        $this->joins = "
            INNER JOIN categorias_productos ON categorias_productos.id = a.id_categoria
        ";
    }
}
