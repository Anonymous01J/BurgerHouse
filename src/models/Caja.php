<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;
use Exception;
use PDO;

class Caja extends Db_base
{
    private $id;
    private $id_usuario;
    private $monto_inicial_dolar;
    private $monto_inicial_bs;
    private $monto_final_dolar;
    private $monto_final_bs;
    private $fecha_apertura;
    private $fecha_cierre;
    private $estado;
    private $total_ventas;
    private $fecha_inicio;
    private $fecha_final;


    public function __construct(
        $id = null,
        $id_usuario = null,
        $monto_inicial_dolar = null,
        $monto_inicial_bs = null,
        $monto_final_dolar = null,
        $monto_final_bs = null,
        $fecha_apertura = null,
        $fecha_cierre = null,
        $estado = null,
        $total_ventas = null,
        $fecha_inicio = null,
        $fecha_final = null

    ) {
        parent::__construct("caja");

        $this->id = $id;
        $this->id_usuario = $id_usuario;
        $this->monto_inicial_bs = $monto_inicial_bs;
        $this->monto_inicial_dolar = $monto_inicial_dolar;
        $this->monto_final_bs = $monto_final_bs;
        $this->monto_final_dolar = $monto_final_dolar;
        $this->fecha_apertura = $fecha_apertura;
        $this->fecha_cierre = $fecha_cierre;
        $this->estado = $estado;
        $this->total_ventas = $total_ventas;
        $this->fecha_inicio = $fecha_inicio;
        $this->fecha_final = $fecha_final;


        $this->add_variables([
            "a.id" => $this->id,
            "a.id_usuario" => $this->id_usuario,
            "a.monto_inicial_bs" => $this->monto_inicial_bs,
            "a.monto_inicial_dolar" => $this->monto_inicial_dolar,
            "a.monto_final_bs" => $this->monto_final_bs,
            "a.monto_final_dolar" => $this->monto_final_dolar,
            "a.fecha_apertura" => $this->fecha_apertura,
            "a.fecha_cierre" => $this->fecha_cierre,
            "a.estado" => $this->estado,
            "a.total_ventas" => $this->total_ventas
        ]);

        $this->select_query = "
            a.id,
            a.id_usuario,
            a.monto_inicial_bs,
            a.monto_inicial_dolar,
            a.monto_final_bs,
            a.monto_final_dolar,
            a.fecha_apertura,
            a.fecha_cierre,
            a.estado,
            a.total_ventas
        ";
        $this->add_variables_interval([
            "a.fecha_apertura" => [
                "inicio" => $this->fecha_inicio,
                "fin" => $this->fecha_final
            ],
        ]);
    }
    public function cajaDetails(int $id)
    {
        try {
            $query = $this->conn->prepare("CALL Caja2(:id)");
            $query->bindValue(':id', $id, PDO::PARAM_INT);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
    public function closeCash(int $id)
    {
        try {
            $query = $this->conn->prepare("CALL CerrarCaja(:id)");
            $query->bindValue(':id', $id, PDO::PARAM_INT);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
}
