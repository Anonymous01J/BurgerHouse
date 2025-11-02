<?php
    $GLOBALS['expresiones_regulares'] = [
        'id' => '/^[0-9]*$/',
        'nombre' => '/^[a-zA-Z ]+$/',
        'apellido' => '/^[a-zA-Z ]+$/',
        'telefono' => '/^[0-9]{10}$/',
        'email' => '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
        'password' => '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/',
        'id_rol' => '/^[0-9]+$/',
        'active' => '/^[0-1]+$/',
        'session_id' => '/^[a-zA-Z0-9]+$/',
        'token' => '/^[a-zA-Z0-9]+$/',
        'token_expiracion' => '/^[0-9]+$/',
        'imagen' => '/^[a-zA-Z0-9\.]+$/',
        'hash' => '//', // aqui iria la expresion regular que tiene el js
        'nombre_like' => '/^[a-zA-Z ]+$/',
        'modulo' => '/^[a-zA-Z ]+$/',
        'accion' => '/^[a-zA-Z ]+$/',
        'permiso' => '/^[a-zA-Z ]+$/',
        'id_permiso' => '/^[0-9]+$/',
    ];
    $GLOBALS['db1'] = [
        'host' => 'localhost',
        'name' => 'burgerhouse',
        'user' => 'root',
        'pass' => '1234'
    ];
    $GLOBALS['db2'] = [
        'host' => 'localhost',
        'name' => 'usuarios_burgerhouse',
        'user' => 'root',
        'pass' => '1234'
    ];
?>