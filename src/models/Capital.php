<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Capital extends Db_base {
    private $id;
    private $monto;
    private $fecha;

    public function __construct(
        $id = null,
        $monto = null,
        $fecha = null
    ) {
        parent::__construct("capital");
        
        $this->id = $id;
        $this->monto = $monto;
        $this->fecha = $fecha;

        $this->add_variables([
            "a.id" => $this->id,
            "a.monto" => $this->monto,
            "a.fecha" => $this->fecha
        ]);

        $this->add_variables_like([
            "a.id" => $this->id
        ]);

        $this->select_query = "
            a.id,
            a.monto,
            a.fecha
        ";
    }
}