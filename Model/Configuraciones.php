<?php
    class Configuracion extends DB {
        private $idConfiguraciones;
        private $montoDolarBCV;
        private $montoDolarParalelo;
        private $montoTasa;

        function __construct($idConfiguraciones=null, $montoDolarBCV=null, $montoDolarParalelo=null, $montoTasa=null) {
            DB::__construct();

            $this->idConfiguraciones = $idConfiguraciones;
            $this->montoDolarBCV = $montoDolarBCV;
            $this->montoDolarParalelo = $montoDolarParalelo;
            $this->montoTasa = $montoTasa;
        }

        function actualizar($usuario) {
            $query = "UPDATE configuraciones SET montoDolarBCV=:montoDolarBCV, montoDolarParalelo=:montoDolarParalelo WHERE idConfiguraciones=:idConfiguraciones";
            $query = $this->conn->prepare($query);
            $query->bindParam(':montoDolarBCV',$this->montoDolarBCV, PDO::PARAM_STR);
            $query->bindParam(':montoDolarParalelo',$this->montoDolarParalelo, PDO::PARAM_STR);
            $query->bindParam(':idConfiguraciones',$this->idConfiguraciones, PDO::PARAM_INT);
            $query->execute();
            $this->add_bitacora($usuario,"Configuraciones","Actualizar","Tasas actualizadas");
        }

            function actualizarMontoTasa($usuario) {
            $query = "UPDATE configuraciones SET montoTasa=:montoTasa WHERE idConfiguraciones=:idConfiguraciones";
            $query = $this->conn->prepare($query);
            $query->bindParam(':montoTasa',$this->montoTasa, PDO::PARAM_STR);
            $query->bindParam(':idConfiguraciones',$this->idConfiguraciones, PDO::PARAM_INT);
            $query->execute();
            $this->add_bitacora($usuario,"Configuraciones","Actualizar","Tasa UF actualizada");
        }

        function search($n=0, $limite=9) {
            $query = "SELECT * FROM configuraciones ";
            if ($this->idConfiguraciones != null) {
                $query = $query." WHERE idConfiguraciones=:idConfiguraciones";
            }
            
            $query .= " LIMIT :l OFFSET :n";
            $query = $this->conn->prepare($query);

            $n = $n*$limite;
            $query->bindParam(':l', $limite, PDO::PARAM_INT);
            $query->bindParam(':n', $n, PDO::PARAM_INT);
            if ($this->idConfiguraciones != null) {
                $query->bindParam(':idConfiguraciones',$this->idConfiguraciones, PDO::PARAM_INT);
            }
            $query->execute();
            $result = $query->fetchAll();
            return $result;
        }

        function COUNT() {
            $query = $this->conn->prepare("SELECT COUNT(*) as 'total' FROM configuraciones ");
            $query->execute();
            return $query->fetch()['total'];
        }
    }          
?>