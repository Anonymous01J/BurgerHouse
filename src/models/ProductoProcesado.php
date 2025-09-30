<?php
    namespace Shtch\Burgerhouse\models;

    use Shtch\Burgerhouse\models\Db_base;

    class ProductoProcesado extends Db_base {
        private $id;
        private $id_categoria;
        private $nombre;
        private $imagen;
        private $precio;
        private $detalles;
        private $stock_min;
        private $stock_max;
        private $existencia;
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
            $stock_max = null,
            $stock_min = null,
            $existencia = null,
            $nombre_like = null,
            $imagen_name = null
        ) {
            parent::__construct("productos_procesados");

            $this->id = $id;
            $this->id_categoria = $id_categoria;
            $this->nombre = $nombre;
            $this->imagen = $imagen_name;
            $this->precio = $precio;
            $this->detalles = $detalles;
            $this->active = $active;
            $this->stock_max = $stock_max;
            $this->stock_min = $stock_min;
            $this->existencia = $existencia;
            $this->nombre_like = $nombre_like;

            $this->add_variables([
                "a.id" => $this->id,
                "a.id_categoria" => $this->id_categoria,
                "a.nombre" => $this->nombre,
                "a.imagen" => $this->imagen,
                "a.precio" => $this->precio,
                "a.detalles" => $this->detalles,
                "a.active" => $this->active,
                "a.stock_max" => $this->stock_max,
                "a.stock_min" => $this->stock_min,
                "a.existencia" => $this->existencia
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
                a.stock_max,
                a.stock_min,
                a.existencia
            ";
            $this->joins = "
                INNER JOIN categorias_productos ON categorias_productos.id = a.id_categoria
            ";
        }
    }