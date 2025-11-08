<?php

namespace Shtch\Burgerhouse\controllers\Statistics;

use Shtch\Burgerhouse\models\Estadisticas;
use function Shtch\Burgerhouse\controllers\{controller_init, base_view};
use Exception;

controller_init('statistics');
function view()
{
    base_view('statistics');
}

function gastoClienteSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->GastoClienteSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function gastoClienteMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->gastoClienteMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function gastoClienteAnual()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->gastoClienteAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function productosMasVendidoSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->productosMasVendidoSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function productosVendidosMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->productosMasVendidosMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function productosVendidosAnual()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->productosMasVendidosAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}


function productosMenosVendidosSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->productosMenosVendidoSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function productosMenosVendidosMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->productosMenosVendidosMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function productosMenosVendidosAnual()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->productosMenosVendidosAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}


function totalVentaSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->totalVentaSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function totalVentaMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->totalVentaMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function totalVentaAnio()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->totalVentaAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function utilidadNetaSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->utilidadNetaSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function utilidadNetaMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->utilidadNetaMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function utilidadNetaAnio()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->utilidadNetaAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}


function ReservaHorarioSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->porcentajeReservasSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function ReservaHorarioMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->porcentajeReservasMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function ReservaHorarioAnio()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->porcentajeReservasAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function ReservasPorMetodoSemana()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $semana = $_POST['semana'];
        echo json_encode($statistics->porcentajeReservasMetodoSemana($anio, $semana));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function ReservasPorMetodoMes()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        $mes = $_POST['mes'];
        echo json_encode($statistics->porcentajeReservasMetodoMes($anio, $mes));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
function ReservasPorMetodoAnio()
{
    try {
        $statistics = new Estadisticas();
        $anio = $_POST['anio'];
        echo json_encode($statistics->porcentajeReservasMetodoAnio($anio));
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}
