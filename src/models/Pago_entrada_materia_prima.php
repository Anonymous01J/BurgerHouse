<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Pago_entrada_materia_prima extends Db_base
{
    private $id;
    private $id_metodo_pago;
    private $id_entrada;
    private $tasa;
    private $precio_compra;
    private $fecha;
    private $comprobante;
    private $referencia;

    public function __construct(
        $id = null,
        $id_metodo_pago = null,
        $id_entrada = null,
        $tasa = null,
        $precio_compra = null,
        $fecha = null,
        $comprobante = null,
        $referencia = null,
        $imagen_name = null
    ) {
        parent::__construct("pagos_entrada_materia_prima");

        $this->id = $id;
        $this->id_metodo_pago = $id_metodo_pago;
        $this->id_entrada = $id_entrada;
        $this->tasa = $tasa;
        $this->precio_compra = $precio_compra;
        $this->fecha = $fecha;
        $this->comprobante = $imagen_name;
        $this->referencia = $referencia;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_metodo_pago" => $this->id_metodo_pago,
            "a.id_entrada" => $this->id_entrada,
            "a.tasa" => $this->tasa,
            "a.precio_compra" => $this->precio_compra,
            "a.fecha" => $this->fecha,
            "a.comprobante" => $this->comprobante,
            "a.referencia" => $this->referencia
        ]);
        $this->select_query = "
        a.id,
        a.id_metodo_pago,
        a.id_entrada,
        a.tasa,
        a.precio_compra,
        a.fecha,
        a.comprobante,
        a.referencia,
        mp.nombre as metodo_pago
        ";

        $this->joins = "
        INNER JOIN metodo_pago mp ON a.id_metodo_pago = mp.id
        ";
    }
}
