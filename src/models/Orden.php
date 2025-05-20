<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Orden extends Db_base {
    private $id;
    private $numero;
    private $id_cliente;
    private $fecha;
    private $tipo;

    public function __construct(
        $id = null,
        $numero = null,
        $id_cliente = null,
        $fecha = null,
        $tipo = null
        
    ) {
        parent::__construct("pagos");
        
        $this->id = $id;
        $this->numero = $numero;
        $this->id_cliente = $id_cliente;
        $this->fecha = $fecha;
        $this->tipo = $tipo;

        if ($this->numero == null){
            $this->numero = random_int(10000000,99999999);
        }

        $this->add_variables([
            "a.id" => $this->id,
            "a.numero" => $this->numero,
            "a.id_cliente" => $this->id_cliente,
            "a.fecha" => $this->fecha,
            "a.tipo" => $this->tipo
        ]);
    }
}