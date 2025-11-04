<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;
use Exception;
use PDO;

class Orden extends Db_base
{
    private $id;
    private $nro_orden;
    private $id_cliente;
    private $fecha;
    private $tipo;
    private $status;
    private $nombre_like;
    private $cedula_cliente;
    private $between_fecha;


    public function __construct(
        $id = null,
        $nro_orden = null,
        $id_cliente = null,
        $fecha = null,
        $tipo = null,
        $status = null,
        $nombre_like = null,
        $between_fecha = null,
        $cedula_cliente = null
    ) {
        parent::__construct("orden");
        $this->id = $id;
        $this->nro_orden = $nro_orden;
        $this->id_cliente = $id_cliente;
        $this->fecha = $fecha;
        $this->tipo = $tipo;
        $this->status = $status;
        $this->nombre_like = $nombre_like;
        $this->cedula_cliente = $cedula_cliente;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nro_orden" => $this->nro_orden,
            "a.id_cliente" => $this->id_cliente,
            "a.fecha" => $this->fecha,
            "a.tipo" => $this->tipo,
            "a.status" => $this->status
        ]);

        $this->add_variables_like([
            "clientes.nombre" => $this->nombre_like,
            "clientes.documento" => $this->cedula_cliente
        ]);
        $this->add_variables_interval([
            "a.fecha" => $between_fecha
        ]);

        $this->select_query = "
            a.id,
            a.nro_orden,
            a.id_cliente,
            ventas.id as id_venta,
            clientes.nombre AS cliente_nombre,
            clientes.apellido AS cliente_apellido,
            clientes.telefono AS cliente_telefono,
            clientes.documento AS cliente_documento,
            ventas.direccion as direccion,
            a.fecha,
            a.status,
            a.tipo,
            ventas.monto_final
        ";
        $this->joins = "
            LEFT JOIN clientes ON clientes.id = a.id_cliente
            LEFT JOIN ventas ON ventas.id_orden = a.id
        ";
    }

    public function getMateriaPrima($id)
    {
        try {
            $query = "
            SELECT 
            entradas_materia_prima.existencia,
            materia_prima.nombre,
            entradas_materia_prima.fecha_compra
            FROM recetas
            INNER JOIN detalles_receta ON detalles_receta.id_receta = recetas.id
            INNER JOIN materia_prima ON materia_prima.id = detalles_receta.id_materia_prima
            INNER JOIN entradas_materia_prima ON entradas_materia_prima.id_materia_prima = materia_prima.id
            WHERE recetas.id_producto = $id AND entradas_materia_prima.fecha_vencimiento > NOW()
            ORDER BY entradas_materia_prima.fecha_compra ASC
            ";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            return ['error' => true, 'message' => $e->getMessage()];
        }
    }
}
