<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Pago extends Db_base {
    private $id;
    private $id_venta;
    private $id_metodo_pago;
    private $monto;
    private $fecha;
    private $tasa;
    private $referencia;
    private $comprobante;

    public function __construct(
        $id = null,
        $id_venta = null,
        $id_metodo_pago = null,
        $monto = null,
        $fecha = null,
        $tasa = null,
        $referencia = null,
        $comprobante = null,
        $imagen_name = null

    ) {
        parent::__construct("pagos");
        
        $this->id = $id;
        $this->id_venta = $id_venta;
        $this->id_metodo_pago = $id_metodo_pago;
        $this->monto = $monto;
        $this->fecha = $fecha;
        $this->tasa = $tasa;
        $this->referencia = $referencia;
        $this->comprobante = $imagen_name;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_venta" => $this->id_venta,
            "a.id_metodo_pago" => $this->id_metodo_pago,
            "a.monto" => $this->monto,
            "a.fecha" => $this->fecha,
            "a.tasa" => $this->tasa,
            "a.referencia" => $this->referencia,
            "a.comprobante" => $this->comprobante
        ]);
    }
}