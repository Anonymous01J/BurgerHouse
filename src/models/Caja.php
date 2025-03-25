<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Caja extends Db_base {
    private $id;
    private $usuario;
    private $monto_inicial;
    private $monto_final;
    private $fecha;
    private $monto_credito;
    private $total_ventas;

    public function __construct(
        $id = null,
        $usuario = null,
        $monto_inicial = null,
        $monto_final = null,
        $fecha = null,
        $monto_credito = null,
        $total_ventas = null
    ) {
        parent::__construct("caja");
        
        $this->id = $id;
        $this->usuario = $usuario;
        $this->monto_inicial = $monto_inicial;
        $this->monto_final = $monto_final;
        $this->fecha = $fecha;
        $this->monto_credito = $monto_credito;
        $this->total_ventas = $total_ventas;

        $this->add_variables([
            "a.id" => $this->id,
            "a.usuario" => $this->usuario,
            "a.monto_inicial" => $this->monto_inicial,
            "a.monto_final" => $this->monto_final,
            "a.fecha" => $this->fecha,
            "a.monto_credito" => $this->monto_credito,
            "a.total_ventas" => $this->total_ventas
        ]);

        $this->add_variables_like([
            "a.id" => $this->id,
            "a.usuario" => $this->usuario
        ]);

        $this->select_query = "
            a.id,
            a.usuario,
            b.nombre AS nombre_usuario,
            a.monto_inicial,
            a.monto_final,
            a.fecha,
            a.monto_credito,
            a.total_ventas
        ";

        $this->joins = "
            INNER JOIN usuario b ON b.usuario = a.usuario
        ";
    }
}