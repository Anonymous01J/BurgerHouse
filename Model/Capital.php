<?php
class Capital extends DB {

    private $idMovimientoCapital;
    private $monto;
    private $descripcion;
    private $fecha;

    function __construct($idMovimientoCapital = null, $monto = null, $descripcion = null, $fecha = null) {
        DB::__construct();
        $this->idMovimientoCapital = $idMovimientoCapital;
        $this->monto = $monto;
        $this->descripcion = $descripcion;
        $this->fecha = $fecha;
    }

    function agregar($usuario) {
        $query = $this->conn->prepare("INSERT INTO movimientoscapital (monto, descripcion, fecha) VALUES (:monto, :descripcion, :fecha)");
        $query->bindParam(':monto', $this->monto, PDO::PARAM_INT);
        $query->bindParam(':descripcion', $this->descripcion, PDO::PARAM_STR);
        $query->bindParam(':fecha', $this->fecha, PDO::PARAM_STR);
        $query->execute();
        $this->add_bitacora($usuario, "movimientosCapital", "Nodificación", "Capital Cambiado");
    }

    function search($n = 0, $limite = 100) {
        $query = "SELECT 
                        a.idMC, 
                        a.monto, 
                        a.descripcion, 
                        a.fecha
                        FROM movimientoscapital as a 
                        WHERE 1";

        $lista = [];

        if ($this->idMovimientoCapital != null) {
            array_push($lista, 'idMC');
        }

        if ($lista) {
            foreach ($lista as $e) {
                $query .= ' AND a.' . $e . ' = :' . $e;
            }
        }

        $n = $n * $limite;
        $query .= " ORDER BY a.fecha DESC LIMIT :l OFFSET :n";

        $consulta = $this->conn->prepare($query);
        $consulta->bindParam(':l', $limite, PDO::PARAM_INT);
        $consulta->bindParam(':n', $n, PDO::PARAM_INT);

        if ($this->idMovimientoCapital != null) {
            $consulta->bindParam(':idMC', $this->idMovimientoCapital, PDO::PARAM_INT);
        }

        $consulta->execute();
        return $consulta->fetchAll();
    }

    function detallesCapital() {
        $query = $this->conn->prepare('SELECT SUM(monto) AS total_ingresos, SUM(CASE WHEN monto < 0 THEN monto ELSE 0 END) AS total_egresos FROM movimientos_capital;');
        $query->execute();
        return $query->fetchAll();
    }

    function COUNT() {
        return $this->conn->query("SELECT COUNT(*) 'total' FROM movimientos_capital")->fetch()['total'];
    }
}
?>