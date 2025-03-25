<?php
    namespace Shtch\Burgerhouse\models;
    use Shtch\Burgerhouse\models\Db_base;
    use PDO;

	class Configuracion extends Db_base {
        private $id;
        private $value;
        private $key;
		function __construct($id=null, $key=null,$value=null) {
			parent::__construct("configuraciones");

            $this->id = $id;
            $this->add_variables([
                "a.id" => $this->id,
                "a.valor" => $this->value,
                "a.llave" => $this->key
            ]);
            $this->add_variables_like([
                "a.valor" => $this->value
            ]);
		}
	}
?>