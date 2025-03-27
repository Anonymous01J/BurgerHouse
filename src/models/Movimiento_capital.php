<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Movimiento_capital extends Db_base {
    private $id;
    private $monto;
    private $descripcion;
    private $fecha;
    
    public function __construct(
        $id = null,
        $monto = null,
        $descripcion = null,
        $fecha = null
    ) {
        parent::__construct("movimientos_capital");
        
        $this->id = $id;
        $this->monto = $monto;
        $this->descripcion = $descripcion;
        $this->fecha = $fecha;

        $this->add_variables([
            "a.id" => $this->id,
            "a.monto" => $this->monto,
            "a.descripcion" => $this->descripcion,
            "a.fecha" => $this->fecha
        ]);
    }
}