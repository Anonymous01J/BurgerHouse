<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Reservacion extends Db_base
{
    private $id;
    private $id_paquete;
    private $id_orden;
    private $id_caja;
    private $descripcion;
    private $fecha_inicio;
    private $fecha_final;
    private $fecha_bloqueo;
    private $metodo_pedido;
    private $status;
    private $nombre_like;

    public function __construct(
        $id = null,
        $id_paquete = null,
        $id_orden = null,
        $id_caja = null,
        $descripcion = null,
        $fecha_inicio = null,
        $fecha_final = null,
        $fecha_bloqueo = null,
        $metodo_pedido = null,
        $status = null,
        $nombre_like = null
    ) {
        parent::__construct("reservaciones");

        $this->id = $id;
        $this->id_paquete = $id_paquete;
        $this->id_orden = $id_orden;
        $this->id_caja = $id_caja;
        $this->descripcion = $descripcion;
        $this->fecha_inicio = $fecha_inicio;
        $this->fecha_final = $fecha_final;
        $this->fecha_bloqueo = $fecha_bloqueo;
        $this->metodo_pedido = $metodo_pedido;
        $this->status = $status;
        $this->nombre_like = $nombre_like;


        $this->add_variables([
            "a.id" => $this->id,
            "a.id_paquete" => $this->id_paquete,
            "a.id_orden" => $this->id_orden,
            "a.id_caja" => $this->id_caja,
            "a.descripcion" => $this->descripcion,
            "a.fecha_inicio" => $this->fecha_inicio,
            "a.fecha_final" => $this->fecha_final,
            "a.fecha_bloqueo" => $this->fecha_bloqueo,
            "a.metodo_pedido" => $this->metodo_pedido,
            "a.status" => $this->status
        ]);

        $this->add_variables_like([
            "c.nombre" => $this->nombre_like
        ]);


        $this->select_query = "
        a.id,
        a.id_paquete,
        a.id_orden,
        a.id_caja,
        a.descripcion,
        a.fecha_inicio,
        a.fecha_final,
        a.fecha_bloqueo,
        a.metodo_pedido,
        a.status,
        p.nombre as paquete,
        p.precio as precio_paquete,
        c.documento,
        c.id as id_cliente, 
        c.nombre as nombre_cliente,
        c.apellido as apellido_cliente,
        c.telefono,
        o.status as status_orden
        ";

        $this->joins = "
        INNER JOIN paquetes_reservacion p ON a.id_paquete = p.id
        INNER JOIN orden o ON a.id_orden = o.id
        INNER JOIN clientes c ON o.id_cliente = c.id
        ";
    }
}
