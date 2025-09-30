<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Credito extends Db_base {
    private $id;
    private $id_venta;
    private $fecha;
    private $monto_credito;
    private $monto_final;
    private $estado;

    public function __construct(
        $id = null,
        $id_venta = null,
        $fecha = null,
        $monto_credito = null,
        $monto_final = null,
        $estado = null
    ) {
        parent::__construct("credito");
        
        $this->id = $id;
        $this->id_venta = $id_venta;
        $this->fecha = $fecha;
        $this->monto_credito = $monto_credito;
        $this->monto_final = $monto_final;
        $this->estado = $estado;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_venta" => $this->id_venta,
            "a.fecha" => $this->fecha,
            "a.monto_credito" => $this->monto_credito,
            "a.monto_final" => $this->monto_final,
            "a.estado" => $this->estado
        ]);
        
        $this->select_query = "
            a.id,
            a.id_venta,
            a.fecha,
            a.monto_credito,
            a.monto_final,
            a.estado
        ";
    }
}