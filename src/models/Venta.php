<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Venta extends Db_base {
    private $id;
    private $id_caja;
    private $id_orden;
    private $id_cliente;
    private $IVA;
    private $monto_final;
    private $fecha;
    private $direccion;
    private $active;

    public function __construct($id = null, $id_caja = null,$id_orden = null, $id_cliente = null, $IVA = null, $monto_final = null, $fecha = null, $direccion = null, $active = null) {
        parent::__construct("ventas");
        $this->id = $id;
        $this->id_caja = $id_caja;
        $this->id_orden = $id_orden;
        $this->id_cliente = $id_cliente;
        $this->IVA = $IVA;
        $this->monto_final = $monto_final;
        $this->fecha = $fecha;
        $this->direccion = $direccion;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_caja" => $this->id_caja,
            "a.id_orden" => $this->id_orden,
            "a.id_cliente" => $this->id_cliente,
            "a.IVA" => $this->IVA,
            "a.monto_final" => $this->monto_final,
            "a.fecha" => $this->fecha,
            "a.direccion" => $this->direccion,
            "a.active" => $this->active
        ]);

        $this->select_query = "
            a.id,
            a.id_caja,
            d.nombre AS nombre_usuario,
            a.id_cliente,
            c.nombre AS nombre_cliente,
            a.IVA,
            a.monto_final,
            a.fecha,
            a.direccion,
            a.active
        ";

        $this->joins = "
            INNER JOIN caja b ON b.id = a.id_caja
            INNER JOIN clientes c ON c.id = a.id_cliente
            INNER JOIN usuario d ON d.id = b.id_usuario
        ";
    }
}