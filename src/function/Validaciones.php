<?php
namespace Shtch\Burgerhouse\function;

class Validaciones{
    public static function validar_id($variable){
        if (preg_match($GLOBALS['expresiones_regulares']['id'], $variable)) {
            return true;
        }
        return false;
    }
    public static function validar_imagen($imagen){
        $permitidos = array("image/jpeg", "image/jpg", "image/png");
        if (in_array($imagen["type"], $permitidos)) {
            return true;
        }
        return false;
    }

    public static function validar_nombre($nombre){
        if (preg_match($GLOBALS['expresiones_regulares']['nombre'], $nombre)) {
            return true;
        }
        return false;
    }

    public static function validar_apellido($apellido){
        if (preg_match($GLOBALS['expresiones_regulares']['apellido'], $apellido)) {
            return true;
        }
        return false;
    }
    public static function validar_telefono($telefono){
        if (preg_match($GLOBALS['expresiones_regulares']['telefono'], $telefono)) {
            return true;
        }
        return false;
    }
    public static function validar_email($email){
        if (preg_match($GLOBALS['expresiones_regulares']['email'], $email)) {
            return true;
        }
        return false;
    }
    public static function validar_password($password){
        if (preg_match($GLOBALS['expresiones_regulares']['password'], $password)) {
            return true;
        }
        return false;
    }
    public static function validar_id_rol($id_rol){
        if (preg_match($GLOBALS['expresiones_regulares']['id_rol'], $id_rol)) {
            return true;
        }
        return false;
    }
    public static function validar_active($active){
        if (preg_match($GLOBALS['expresiones_regulares']['active'], $active)) {
            return true;
        }
        return false;
    }
    public static function validar_modulo($variable){
        if (preg_match($GLOBALS['expresiones_regulares']['modulo'], $variable)) {
            return true;
        }
        return false;
    }
    public static function validar_hash($hash){
        if (preg_match($GLOBALS['expresiones_regulares']['hash'], $hash)) {
            return true;
        }
        return false;
    }
    public static function validar_session_id($session_id){
        if (preg_match($GLOBALS['expresiones_regulares']['session_id'], $session_id)) {
            return true;
        }
        return false;
    }
}