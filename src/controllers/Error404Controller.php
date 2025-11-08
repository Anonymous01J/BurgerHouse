<?php
namespace Shtch\Burgerhouse\controllers\Error404;
use function Shtch\Burgerhouse\controllers\{controller_init, base_view};
controller_init('error-404');
function view()
{
    base_view('error-404');
}
