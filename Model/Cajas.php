<?php
class Caja extends DB {

    private $idCaja;
    private $usuario;
    private $montoInicial;
    private $montoFinal;
    private $fecha;
    private $montoCredito;
    private $totalVentas;

    function __construct($idCaja = null, $usuario = null, $montoInicial = null, $montoFinal = null, $fecha = null, $montoCredito = null, $totalVentas = null) {
        DB::__construct();
        $this->idCaja = $idCaja;
        $this->usuario = $usuario;
        $this->montoInicial = $montoInicial;
        $this->montoFinal = $montoFinal;
        $this->fecha = $fecha;
        $this->montoCredito = $montoCredito;
        $this->totalVentas = $totalVentas;
    }

    function abrir() {
        $query = $this->conn->prepare("INSERT INTO caja (usuario, montoInicial, montoFinal, fecha, montoCredito, totalVentas) VALUES (:usuario, :montoInicial, :montoFinal, :fecha, :montoCredito, :totalVentas)");
        $query->bindParam(':usuario', $this->usuario, PDO::PARAM_INT);
        $query->bindParam(':montoInicial', $this->montoInicial, PDO::PARAM_INT);
        $query->bindParam(':montoFinal', $this->montoFinal, PDO::PARAM_INT);
        $query->bindParam(':fecha', $this->fecha, PDO::PARAM_STR);
        $query->bindParam(':montoCredito', $this->montoCredito, PDO::PARAM_INT);
        $query->bindParam(':totalVentas', $this->totalVentas, PDO::PARAM_INT);
        $query->execute();
        $this->add_bitacora($this->usuario, "Caja", "Abriendo", "Caja abierta");
    }

    function search($n = 0, $limite = 100, $order = ' idCaja DESC ') {
        $query = "SELECT 
                        a.idCaja, 
                        b.nombre, 
                        a.montoFinal, 
                        a.montoInicial, 
                        a.fecha,
                        a.fecha_cierre,
                        a.totalVentas as totalVentas,
                        (SELECT SUM(rv.montoFinal) FROM registro_ventas rv WHERE rv.id_caja=a.idCaja) as total_cierre,
                        a.montoCredito as montoCredito
                        FROM caja as a 
                        INNER JOIN usuarios as b ON b.usuario = a.usuario
                        WHERE 1";

        $lista = [];

        if ($this->usuario != null) {
            array_push($lista, 'usuario');
        }
        if ($this->estado != null) {
            array_push($lista, 'estado');
        }

        if ($lista) {
            foreach ($lista as $e) {
                $query .= ' AND a.' . $e . ' = :' . $e;
            }
        }

        $n = $n * $limite;
        $query .= " ORDER BY $order LIMIT :l OFFSET :n";

        $consulta = $this->conn->prepare($query);
        $consulta->bindParam(':l', $limite, PDO::PARAM_INT);
        $consulta->bindParam(':n', $n, PDO::PARAM_INT);

        if ($this->idCaja != null) {
            $consulta->bindParam(':idCaja', $this->idCaja, PDO::PARAM_INT);
        }
        if ($this->usuario != null) {
            $consulta->bindParam(':usuario', $this->usuario, PDO::PARAM_INT);
        }
        if ($this->estado != null) {
            $consulta->bindParam(':estado', $this->estado, PDO::PARAM_BOOL);
        }

        $consulta->execute();
        return $consulta->fetchAll();
    }

    function cerrar() {
        $caja = new Caja(idCaja: $this->idCaja, estado: 0);
        $caja = $this->search()[0];
        if (count($caja) == 0) {
            return [];
        }
        $stmt = $this->conn->prepare('CALL AsignarTotalVentasDia(:idCaja)');
        $stmt->bindParam(':idCaja', $this->idCaja, PDO::PARAM_INT);
        $stmt->execute();
        $query = $this->conn->prepare('UPDATE caja SET montoFinal=:mf, fecha_cierre = CURRENT_TIMESTAMP, estado = 1, totalVentas = (SELECT COUNT(rv2.idRegistroVentas) FROM registro_ventas rv2 WHERE rv2.id_caja = :idCaja) WHERE idCaja = :idCaja AND estado = 0');
        $query->bindParam(':idCaja', $this->idCaja, PDO::PARAM_INT);
        $query->bindParam(':mf', $this->montoFinal, PDO::PARAM_INT);
        $query->execute();
        $this->add_bitacora($this->usuario, "Caja", "Cerrar", "Caja cerrada");
    }

    function buscar_ultima() {
        $consulta = $this->conn->prepare('SELECT * FROM caja WHERE estado=0 AND usuario=:usuario');
        $consulta->bindParam(':usuario', $this->usuario, PDO::PARAM_INT);
        $consulta->execute();
        $result = $consulta->fetchAll();

        if (count($result) < 1) {
            return [];
        }
        return $result[0];
    }

    function totalMetodosPago() {
        $consulta = $this->conn->prepare('SELECT 
                                        mp.nombre AS nombre,
                                        COALESCE(SUM(sub.monto), 0) AS monto
                                        FROM metodo_pago mp
                                        LEFT JOIN (SELECT p.id_metodo_pago,p.monto
                                        FROM pagos p
                                        JOIN registro_ventas rv ON p.id_venta = rv.idRegistroVentas
                                        WHERE rv.id_caja = :idCaja) sub ON mp.idMetodoPago = sub.id_metodo_pago
                                        GROUP BY mp.nombre');
        $consulta->bindParam(':idCaja', $this->idCaja, PDO::PARAM_INT);
        $consulta->execute();
        return $consulta->fetchAll();
    }

    function COUNT() {
        return $this->conn->query("SELECT COUNT(*) 'total' FROM caja")->fetch()['total'];
    }
}
?>