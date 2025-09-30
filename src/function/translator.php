<?php

namespace Shtch\Burgerhouse\function;

class Translator
{
    public static function TranslatorController($view)
    {
        switch ($view) {
            case 'ordenes':
                return 'orders';
                break;
            case 'delivery':
                return 'delivery';
                break;
            case 'mesas':
                return 'table';
                break;
            case 'estadisticas':
                return 'statistics';
                break;
            case 'cocina':
                return 'kitchen';
                break;
            case 'bitacora':
                return 'binnacle';
                break;
            case 'capital':
                return 'capital';
                break;
            case 'Papelera':
                return 'trash';
                break;
            case 'Producto preparado':
                return 'productPrepared';
                break;
            case 'Materia prima':
                return 'raw-material';
                break;
            case 'Recetas':
                return 'recipe';
                break;
            case 'Adicionales':
                return 'additional';
                break;
            case 'Producto procesado':
                return 'productProcess';
                break;
            case 'proveedores':
                return 'supplier';
                break;
            case 'clientes':
                return 'clients';
                break;
            case 'caja':
                return 'cash';
                break;
            case 'unidades':
                return 'units';
                break;
            case 'categorias':
                return 'category';
                break;
            case 'metodo pago':
                return 'paymentMethod';
                break;
            case 'usuarios':
                return 'users';
                break;
            case 'roles y permisos':
                return 'permissions';
                break;
            case 'Mantenimiento':
                return 'maintenance';
                break;
            case 'paquetes':
                return 'package_reservation';
                break;
            case 'reservaciones':
                return 'calendar';
                break;
            case 'facturas':
                return 'invoice';
                break;
            default:
                return "home";
                break;
        }
    }
}
