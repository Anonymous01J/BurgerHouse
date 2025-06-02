<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Delivery extends Db_base {
    private $id;
    private $id_usuario_delivery;
    private $id_venta;
    private $active;
    public function __construct(
        $id = null,
        $id_usuario_delivery = null,
        $id_venta = null,
        $active = null
    ) {
        parent::__construct("delivery");
        
        $this->id = $id;
        $this->id_usuario_delivery = $id_usuario_delivery;
        $this->id_venta = $id_venta;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_usuario_delivery" => $this->id_usuario_delivery,
            "a.id_venta" => $this->id_venta,
            "a.active" => $this->active
        ]);

        $this->select_query = "
            a.id,
            a.id_usuario_delivery,
            a.id_venta,
            a.active,
            b.nombre AS nombre_delivery,
            b.apellido AS apellido_delivery
        ";

        $this->joins = "
            INNER JOIN usuario b ON b.id = a.id_usuario_delivery
        ";
    }
}