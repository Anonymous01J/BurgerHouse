<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Categoria_producto extends Db_base {
    private $id;
    private $nombre;
    private $active;
    private $nombre_like;

    public function __construct(
        $id = null,
        $nombre = null,
        $active = null,
        $nombre_like = null
    ) {
        parent::__construct("categorias_productos");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);
        
        $this->select_query = "
            a.id,
            a.nombre,
            a.active
        ";
    }
}