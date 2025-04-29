<?php
namespace Shtch\Burgerhouse\controllers;
use Shtch\Burgerhouse\controllers\Controller_base;
use Shtch\Burgerhouse\models\Permiso;
use Shtch\Burgerhouse\models\Rol;
use Shtch\Burgerhouse\models\Permiso_rol;

class RolController extends Controller_base {

    public function __construct() {
        parent::__construct("roles");
        $this->db = new Rol();
    }

    public function agregar_rol(){
        $data = json_decode($_POST['nose'], true);
        $nombre = $data['detalles']['nombre'];
        $descripcion = $data['detalles']['descripcion'];
        $db = new Rol(nombre: $nombre, descripcion: $descripcion);
        $last_id = $db->agregar();

        $lista_permisos = $_POST['nose']['permisos'];
        
        for ($i = 0; $i < count($lista_permisos); $i++) {
            $db= new  Permiso_rol(id_rol: $last_id, modulo: $lista_permisos[$i]['modulo'], permisos: $lista_permisos[$i]['permisos']);
            $db->agregar();
        }
    }
    
}