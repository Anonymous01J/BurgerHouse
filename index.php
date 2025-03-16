<?php 
    require "vendor/autoload.php";
    // require_once("variables.php");

    session_start();
	$page = isset($_GET['page']) ? ucfirst($_GET['page']) : "Inicio";
	$func = isset($_GET['type']) ? strtolower($_GET['type']) : "view";


	if (file_exists("src/Controller/C_".$page.".php")) {
		require_once("src/Controller/C_".$page.".php");
		$instancia = new $page();
		if (method_exists($instancia, $func)) {
			$instancia->$func();
		} else {
			echo "NO EXISTE EL METODO";
		}
		exit(0);
	}
	else {
		echo "NO EXISTE EL CONTROLADOR";
	}
?>