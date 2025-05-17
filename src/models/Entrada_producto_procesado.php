<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_producto_procesado extends Db_base {
    private $id;
    private $id_producto;
    private $id_provedor;
    private $fecha_compra;
    private $precio_compra;
    private $referencia;
    private $cantiad;
    private $existencia;
    

    public function __construct(
        $id = null,
        $id_producto = null,
        $id_provedor = null,
        $fecha_compra = null,
        $precio_compra = null,
        $referencia = null,
        $cantiad = null,
        $existencia = null,
    ) {
        parent::__construct("entradad_producto_procesado");
        
        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->id_provedor = $id_provedor;
        $this->fecha_compra = $fecha_compra;
        $this->precio_compra = $precio_compra;
        $this->referencia = $referencia;
        $this->cantiad = $cantiad;
        $this->existencia = $existencia;
    

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
            "a.id_provedor" => $this->id_provedor,
            "a.fecha_compra" => $this->fecha_compra,
            "a.precio_compra" => $this->precio_compra,
            "a.referencia" => $this->referencia,
            "a.cantiad" => $this->cantiad,
            "a.existencia" => $this->existencia,
        ]);
    }
}