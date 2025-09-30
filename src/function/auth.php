<?php

namespace Shtch\Burgerhouse\function;

use Shtch\Burgerhouse\function\Translator;

class Auth
{
    public static function AuthController($view)
    {
        foreach ($_SESSION['permisos'] as $modulo) {
            if (strcasecmp(Translator::TranslatorController($modulo['modulo']), $view) === 0) {
                return !empty(trim($modulo['permisos']));
            }
        }
        return false;
    }
}
