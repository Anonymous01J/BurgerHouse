<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_materia_prima extends Db_base {
    private $id;
    private $id_provedor;
    private $fecha_compra;
    private $precio_compra;
    private $referencia;

    public function __construct(
        $id = null,
        $id_provedor = null,
        $fecha_compra = null,
        $precio_compra = null,
        $referencia = null
    ) {
        parent::__construct("entradas_materia_prima");
        
        $this->id = $id;
        $this->id_provedor = $id_provedor;
        $this->fecha_compra = $fecha_compra;
        $this->precio_compra = $precio_compra;
        $this->referencia = $referencia;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_provedor" => $this->id_provedor,
            "a.fecha_compra" => $this->fecha_compra,
            "a.precio_compra" => $this->precio_compra,
            "a.referencia" => $this->referencia
        ]);
    }
}