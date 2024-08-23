<?php
class Caja extends DB{

    private $id;
    private $usuario;
    private $monto_inicial;
    private $estado;

    function __construct($id = null, $usuario = null, $monto_inicial = null, $estado = null){
        DB::__construct();
        $this->id = $id;
        $this->usuario = $usuario;
        $this->monto_inicial = $monto_inicial;
        $this->estado = $estado;
    }

    function abrir(){
        $query = $this->conn->prepare("INSERT INTO caja(usuario,monto_inicial,monto_final,estado) VALUES(:usuario, :monto_inicial, 0, 0)");
        $query->bindParam(':usuario', $this->usuario, PDO::PARAM_INT);
        $query->bindParam(':monto_inicial', $this->monto_inicial, PDO::PARAM_INT);
        $query->execute();
        $this->add_bitacora($this->usuario, "Caja", "Abriendo", "Caja abierta");
    }

    function search($n = 0, $limite = 100, $order = ' id DESC '){
        $query = "SELECT 
                        a.id, 
                        b.nombre, 
                        a.monto_final, 
                        a.monto_inicial, 
                        a.estado, 
                        a.fecha,
                        a.fecha_cierre,
                        a.total_ventas as total_ventas,
                        (SELECT SUM(rv.monto_final) FROM registro_ventas rv WHERE rv.id_caja=a.id) as total_cierre,
                        a.monto_credito as monto_credito
                        FROM caja as a 
                        INNER JOIN usuarios as b ON b.id = a.usuario
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

        if ($this->id != null) {
            $consulta->bindParam(':id', $this->id, PDO::PARAM_INT);
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

    function cerrar(){

        $caja = new Caja(id: $this->id, estado: 0);
        $caja = $this->search()[0];
        if (count($caja) == 0) {
            return [];
        }
        $stmt = $this->conn->prepare('CALL AsignarTotalVentasDia(:id)');
        $stmt->bindParam(':id', $this->id, PDO::PARAM_INT);
        $stmt->execute();
        // $query = $this->conn->prepare('UPDATE caja SET monto_final=:mf, estado=0 WHERE id = :id');
        // $query->bindParam(':id',$caja->id);
        // $query->bindParam(':mf',$this->monto_final);
        // $query->execute();
        // $this->add_bitacora($this->usuario,"Caja","Cerrar","Caja cerrada");
    }

    function buscar_ultima(){
        $consulta = $this->conn->prepare('SELECT * FROM caja WHERE estado=0 AND usuario=:usuario');
        $consulta->bindParam(':usuario', $this->usuario, PDO::PARAM_INT);
        $consulta->execute();
        $result = $consulta->fetchAll();

        if (count($result) < 1) {
            return [];
        }
        // $caja = new Caja(null, $this->usuario, null, 0);
        // $result = $caja->search();
        return $result[0];
    }


    function totalMetodosPago(){
        $consulta = $this->conn->prepare('SELECT 
                                        mp.nombre AS nombre,
                                        COALESCE(SUM(sub.monto), 0) AS monto
                                        FROM metodo_pago mp
                                        LEFT JOIN (SELECT p.id_metodo_pago,p.monto
                                        FROM pagos p
                                        JOIN registro_ventas rv ON p.id_venta = rv.id
                                        WHERE rv.id_caja = :id) sub ON mp.id = sub.id_metodo_pago
                                        GROUP BY mp.nombre');
        $consulta->bindParam(':id', $this->id, PDO::PARAM_INT);
        $consulta->execute();
        return $consulta->fetchAll();
    }

    function COUNT(){
        return $this->conn->query("SELECT COUNT(*) 'total' FROM caja")->fetch()['total'];
    }

}
