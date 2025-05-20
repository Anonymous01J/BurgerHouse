<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Orden extends Db_base {
    private $id;
    private $nro_orden;
    private $id_cliente;
    private $fecha;
    private $tipo;

    public function __construct(
        $id = null,
        $nro_orden = null,
        $id_cliente = null,
        $fecha = null,
        $tipo = null
        
    ) {
        parent::__construct("pagos");
        
        $this->id = $id;
        $this->nro_orden = $nro_orden;
        $this->id_cliente = $id_cliente;
        $this->fecha = $fecha;
        $this->tipo = $tipo;

        if ($this->nro_orden == null){
            $this->nro_orden = random_int(10000000,99999999);
        }

        $this->add_variables([
            "a.id" => $this->id,
            "a.nro_orden" => $this->nro_orden,
            "a.id_cliente" => $this->id_cliente,
            "a.fecha" => $this->fecha,
            "a.tipo" => $this->tipo
        ]);
    }
}