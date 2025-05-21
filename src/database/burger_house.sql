-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2025 a las 19:32:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `burger_house`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PromedioGastoClienteAnual` (IN `p_anio` INT)   BEGIN
    -- CTE para generar los 12 meses del año con su nombre en español
    WITH meses AS (
        SELECT  1 AS Mes, 'Enero'     AS Nombre UNION ALL
        SELECT  2,       'Febrero'   UNION ALL
        SELECT  3,       'Marzo'     UNION ALL
        SELECT  4,       'Abril'     UNION ALL
        SELECT  5,       'Mayo'      UNION ALL
        SELECT  6,       'Junio'     UNION ALL
        SELECT  7,       'Julio'     UNION ALL
        SELECT  8,       'Agosto'    UNION ALL
        SELECT  9,       'Septiembre'UNION ALL
        SELECT 10,       'Octubre'   UNION ALL
        SELECT 11,       'Noviembre' UNION ALL
        SELECT 12,       'Diciembre'
    )
    SELECT
        m.Nombre                    AS Mes,
        COALESCE(
          ROUND(
            SUM(v.monto_final)
            / NULLIF(
                (
                  SELECT COUNT(DISTINCT o.Id_cliente)
                  FROM orden o
                  WHERE YEAR(o.fecha)  = p_anio
                    AND MONTH(o.fecha) = m.Mes
                )
              , 0
            )
          , 2)
        , 0)                        AS PromedioGastoCliente
    FROM meses m
    LEFT JOIN ventas v
      ON YEAR(v.fecha)  = p_anio
     AND MONTH(v.fecha) = m.Mes
    GROUP BY m.Mes, m.Nombre
    ORDER BY m.Mes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PromedioGastoClienteMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    -- Calcular promedio de gasto por semana (semanas 1 a 5 del mes)
    SELECT
        CASE
            WHEN DAY(v.fecha) BETWEEN 1 AND 7 THEN 1
            WHEN DAY(v.fecha) BETWEEN 8 AND 14 THEN 2
            WHEN DAY(v.fecha) BETWEEN 15 AND 21 THEN 3
            WHEN DAY(v.fecha) BETWEEN 22 AND 28 THEN 4
            WHEN DAY(v.fecha) >= 29 THEN 5
            ELSE NULL
        END AS semana_del_mes,
        ROUND(SUM(v.monto_final) / NULLIF(COUNT(DISTINCT o.Id_cliente), 0), 2) AS promedio_gasto
    FROM ventas v
    JOIN orden o ON o.id = v.id_orden
    WHERE MONTH(v.fecha) = p_mes AND YEAR(v.fecha) = p_anio
    GROUP BY semana_del_mes
    HAVING semana_del_mes IS NOT NULL
    ORDER BY semana_del_mes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PromedioGastoClientePorSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    -- CTE que genera los 7 días de la semana ISO indicada
    WITH dias AS (
        SELECT
            -- Calcula el lunes de la semana ISO (modo %X%V%w con %w=1 para lunes)
            ADDDATE(
                STR_TO_DATE(
                    CONCAT(p_anio, LPAD(p_semana,2,'0'), '1'),
                    '%X%V%w'
                ),
                INTERVAL seq.n DAY
            ) AS fecha,
            -- Nombres de los días en español
            ELT(seq.n+1,
                'Lunes','Martes','Miércoles','Jueves',
                'Viernes','Sábado','Domingo'
            ) AS DiaNombre
        FROM (
            SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2
            UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
            UNION ALL SELECT 6
        ) AS seq
    )
    SELECT
        d.DiaNombre     AS Dia,
        -- Promedio de gasto por cliente en ese día
        COALESCE(
          ROUND(
            SUM(v.monto_final)
            / NULLIF(
                (
                  SELECT COUNT(DISTINCT o.Id_cliente)
                  FROM orden o
                  WHERE o.fecha = d.fecha
                ),
                0
            )
          , 2)
        , 0)            AS PromedioGastoCliente
    FROM dias d
    LEFT JOIN ventas v
      ON v.fecha = d.fecha
    GROUP BY d.fecha, d.DiaNombre
    ORDER BY d.fecha;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoAnual` (IN `p_anio` INT)   BEGIN
    -- Retornar número de reservas por método de pedido en un año dado
    SELECT
        metodo_pedido,
        COALESCE(COUNT(*),0) AS cantidad_reservas
    FROM reservaciones
    WHERE YEAR(fecha_inicio) = p_anio
    GROUP BY metodo_pedido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    -- Retornar número de reservas por método de pedido en un año dado
    SELECT
        metodo_pedido,
        COUNT(*) AS cantidad_reservas
    FROM reservaciones
    WHERE YEAR(fecha_inicio) = p_anio AND MONTH(fecha_inicio) =p_mes
    GROUP BY metodo_pedido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Top5AdicionalesMenosVendidosPorMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    WITH ventas_mes AS (
        SELECT
            p.id             AS ProductoID,
            p.nombre         AS ProductoNombre,
            SUM(od.cantidad) AS TotalCantidad
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o ON o.id = od.id_orden
        WHERE p.tipo = "adicional"
          AND YEAR(o.fecha)  = p_anio
          AND MONTH(o.fecha) = p_mes
        GROUP BY p.id, p.nombre
    ),
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (ORDER BY vm.TotalCantidad ASC) AS rn
        FROM ventas_mes vm
    )
    SELECT
        ProductoID AS id,
        ProductoNombre AS nombre,
        TotalCantidad AS cantidad
    FROM ranking
    WHERE rn <= 5
    ORDER BY TotalCantidad ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Top5ProductosMasVendidosPorMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    -- 1) Agrupo ventas de productos preparados para el mes y año indicados
    WITH ventas_mes AS (
        SELECT
            p.id                      AS ProductoID,
            p.nombre                  AS ProductoNombre,
            SUM(od.cantidad)          AS TotalCantidad
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p 
          ON p.id = od.id_producto
        JOIN `orden` o 
          ON o.id = od.id_orden
        WHERE YEAR(o.fecha)  = p_anio
          AND MONTH(o.fecha) = p_mes
        GROUP BY p.id, p.nombre
    ),
    -- 2) Le aplico un ranking para quedarme con los 5 mejores
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (
              ORDER BY vm.TotalCantidad DESC
            ) AS rn
        FROM ventas_mes vm
    )
    -- 3) Selecciono sólo los 5 primeros
    SELECT
        ProductoID   AS id,
        ProductoNombre AS nombre,
        TotalCantidad AS cantidad
    FROM ranking
    WHERE rn <= 5
    ORDER BY TotalCantidad DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Top5ProductosMenosVendidosPorMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    WITH ventas_mes AS (
        SELECT
            p.id             AS ProductoID,
            p.nombre         AS ProductoNombre,
            SUM(od.cantidad) AS TotalCantidad
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p 
          ON p.id = od.id_producto
        JOIN `orden` o 
          ON o.id = od.id_orden
        WHERE YEAR(o.fecha)  = p_anio
          AND MONTH(o.fecha) = p_mes
        GROUP BY p.id, p.nombre
    ),
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (
              ORDER BY vm.TotalCantidad ASC
            ) AS rn
        FROM ventas_mes vm
    )
    SELECT
        ProductoID     AS id,
        ProductoNombre AS nombre,
        TotalCantidad  AS cantidad
    FROM ranking
    WHERE rn <= 5
    ORDER BY TotalCantidad ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasPorAnio` (IN `p_anio` INT)   BEGIN
    SELECT 
        COALESCE(SUM(CASE WHEN tipo = 'local' THEN 1 ELSE 0 END), 0)     AS local,
        COALESCE(SUM(CASE WHEN tipo = 'delivery' THEN 1 ELSE 0 END), 0)  AS delivery,
        COALESCE(SUM(CASE WHEN tipo = 'llevar' THEN 1 ELSE 0 END), 0)    AS paraLlevar
    FROM `orden`
    WHERE YEAR(fecha) = p_anio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasPorMes` (IN `p_anio` INT, IN `p_mes` INT)   BEGIN
    SELECT 
        COALESCE(SUM(CASE WHEN tipo = 'local' THEN 1 ELSE 0 END), 0)     AS local,
        COALESCE(SUM(CASE WHEN tipo = 'delivery' THEN 1 ELSE 0 END), 0)  AS delivery,
        COALESCE(SUM(CASE WHEN tipo = 'llevar' THEN 1 ELSE 0 END), 0)    AS paraLlevar
    FROM `orden`
    WHERE YEAR(fecha) = p_anio
      AND month(fecha) = p_mes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasPorSemana` (IN `p_anio` INT, IN `p_semana` INT)   BEGIN
    SELECT 
        COALESCE(SUM(CASE WHEN tipo = 'local' THEN 1 ELSE 0 END), 0)     AS local,
        COALESCE(SUM(CASE WHEN tipo = 'delivery' THEN 1 ELSE 0 END), 0)  AS delivery,
        COALESCE(SUM(CASE WHEN tipo = 'llevar' THEN 1 ELSE 0 END), 0)    AS paraLlevar
    FROM `orden`
    WHERE YEAR(fecha) = p_anio
      AND WEEK(fecha, 1) = p_semana;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tabla` varchar(20) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `monto_inicial_$` float NOT NULL,
  `monto_inicial_bs` float NOT NULL,
  `monto_final_bs` float DEFAULT NULL,
  `monto_final_$` float DEFAULT NULL,
  `fecha_apertura` datetime NOT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `total_ventas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capital`
--

CREATE TABLE `capital` (
  `id` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_productos`
--

CREATE TABLE `categorias_productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias_productos`
--

INSERT INTO `categorias_productos` (`id`, `nombre`, `active`) VALUES
(1, 'Bebidas', 1),
(2, 'Pepitos', 1),
(3, 'Griegos', 1),
(4, 'Perros Calientes', 1),
(5, 'Papas', 1),
(6, 'Club House', 1),
(7, 'Burgers', 1),
(8, 'Kids', 1),
(9, 'Jira', 0),
(10, 'Adicionales', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_materia_prima`
--

CREATE TABLE `categoria_materia_prima` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categoria_materia_prima`
--

INSERT INTO `categoria_materia_prima` (`id`, `nombre`, `active`) VALUES
(1, 'Carnes', 1),
(2, 'Panadería', 1),
(3, 'Verduras y hortaliza', 1),
(4, 'Salsas y condimentos', 1),
(5, 'Aceites y grasas', 1),
(6, 'Postres y acompañamientos', 1),
(7, 'Lacteos', 1),
(8, 'Prueba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `telefono`, `active`) VALUES
(1, 'Jose', 'Escalona', '+584126742231', 1),
(2, 'Pedro', 'Escalona', '+584161214717', 0),
(3, 'Pedro ', 'Perex', '+584162589318', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `id` int(11) NOT NULL,
  `llave` varchar(500) NOT NULL,
  `valor` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliverys`
--

CREATE TABLE `deliverys` (
  `id` int(11) NOT NULL,
  `id_usuario_delivery` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deliverys`
--

INSERT INTO `deliverys` (`id`, `id_usuario_delivery`, `id_venta`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_receta`
--

CREATE TABLE `detalles_receta` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_receta`
--

INSERT INTO `detalles_receta` (`id`, `id_receta`, `id_materia_prima`, `cantidad`) VALUES
(60, 13, 8, 0.56),
(61, 13, 9, 1),
(62, 14, 10, 4.55),
(63, 14, 9, 2),
(64, 14, 6, 0.45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_roles`
--

CREATE TABLE `detalles_roles` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `modulo` varchar(45) NOT NULL,
  `permisos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_roles`
--

INSERT INTO `detalles_roles` (`id`, `id_rol`, `modulo`, `permisos`) VALUES
(20, 10, 'combo', 'consultar,agregar,editar,eliminar'),
(21, 10, 'supplier', 'consultar,agregar,editar,eliminar'),
(22, 10, 'order', 'consultar,agregar,editar,eliminar'),
(23, 10, 'delivery', 'consultar,agregar'),
(24, 10, 'kitchen', 'consultar,agregar'),
(25, 10, 'statistics', 'consultar'),
(26, 10, 'calendar', 'consultar'),
(27, 10, 'binnacle', 'consultar'),
(28, 10, 'capital', 'consultar,agregar'),
(29, 10, 'trash', 'consultar,editar'),
(30, 10, 'clients', 'consultar,agregar,editar,eliminar'),
(31, 10, 'cash', 'consultar,agregar,editar'),
(32, 10, 'invoice', 'consultar'),
(33, 10, 'credit', 'consultar,editar'),
(34, 10, 'units', 'consultar,agregar,editar,eliminar'),
(35, 10, 'category', 'consultar,agregar,editar,eliminar'),
(36, 10, 'paymentMethod', 'consultar,agregar,editar,eliminar'),
(37, 10, 'permissionsRol', 'consultar,agregar,editar,eliminar'),
(38, 10, 'users', 'consultar,agregar,editar,eliminar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_materia_prima`
--

CREATE TABLE `entradas_materia_prima` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT current_timestamp(),
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `comprobante` varchar(500) NOT NULL,
  `broken` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `entradas_materia_prima`
--

INSERT INTO `entradas_materia_prima` (`id`, `codigo`, `id_proveedor`, `id_materia_prima`, `fecha_compra`, `precio_compra`, `referencia`, `fecha_vencimiento`, `existencia`, `cantidad`, `comprobante`, `broken`) VALUES
(6, '586325', 1, 7, '2025-05-19 12:33:41', 96.36, '5959494', '2025-07-31 00:00:00', 10.5, 10.5, 'tutorials-9832-0-35951100-1501582894.png', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_producto_procesado`
--

CREATE TABLE `entradas_producto_procesado` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `id_producto` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_vencimiento` datetime DEFAULT NULL,
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `comprobante` varchar(500) DEFAULT NULL,
  `broken` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entradas_producto_procesado`
--

INSERT INTO `entradas_producto_procesado` (`id`, `codigo`, `id_producto`, `id_proveedor`, `id_unidad`, `fecha_compra`, `fecha_vencimiento`, `precio_compra`, `referencia`, `existencia`, `cantidad`, `comprobante`, `broken`) VALUES
(16, '4646486', 41, 1, 4, '2025-05-19 13:05:53', '2025-05-29 00:00:00', 25, '4648648', 50.25, 50.25, '5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg', 0),
(17, '56836', 41, 1, 1, '2025-05-19 13:14:42', '2025-07-31 00:00:00', 150.75, '792684', 45.8, 45.8, '29604004.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `existencia` varchar(45) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id`, `id_categoria`, `id_unidad`, `nombre`, `stock_min`, `stock_max`, `existencia`, `active`) VALUES
(1, 1, 3, 'Pollo', 10, 20, '0', 1),
(2, 1, 3, 'Carne de res', 10, 20, '0', 1),
(3, 3, 3, 'Cebolla', 10, 20, '0', 1),
(4, 3, 3, 'Maíz', 10, 20, '0', 1),
(5, 7, 4, 'Queso cheddar', 10, 20, '0', 1),
(6, 4, 3, 'Salsa especial', 10, 20, '0', 1),
(7, 1, 3, 'Tocineta', 10, 20, '0', 1),
(8, 3, 3, 'Papas', 10, 20, '0', 1),
(9, 2, 4, 'Pan de la casa', 10, 20, '0', 1),
(10, 3, 3, 'Prueba', 1, 5, '0', 1),
(11, 7, 5, 'CONSOLA', 2, 10, '0', 0),
(12, 6, 4, 'CONN', 2, 3, '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `sillas` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'LIBRE',
  `vip` varchar(45) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `nombre`, `sillas`, `estado`, `vip`, `imagen`, `active`) VALUES
(1, 'Mesa 2', '5', 'LIBRE', '0', '29604004.jpg', '1'),
(2, 'Mesa 45', '10', 'OCUPADA', '1', 'concepto-rpa-pantalla-tactil-mano-borrosa.jpg', '1'),
(3, 'Mesa 9', '4', 'LIBRE', '0', '5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg', '0'),
(4, 'Mesa 10', '7', 'LIBRE', '1', 'championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg', '0'),
(5, 'Mesa inf', '58', 'LIBRE', '0', 'depositphotos_66292255-stock-photo-dark-background-with-spotlights.jpg', '1'),
(6, 'Mesa 99', '10', 'LIBRE', '1', '5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_reservacion`
--

CREATE TABLE `mesa_reservacion` (
  `id` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_reservacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id`, `nombre`, `active`, `imagen`, `descripcion`) VALUES
(1, 'Zelle', 1, NULL, NULL),
(2, 'Binance', 1, NULL, NULL),
(3, 'Pago Movil', 1, NULL, NULL),
(4, 'Efectivo', 1, NULL, NULL),
(9, 'Prueba infinity', 1, NULL, NULL),
(10, 'Prueba 2', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_capital`
--

CREATE TABLE `movimientos_capital` (
  `id` int(11) NOT NULL,
  `monto` float NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `nro_orden` float NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_mesa`
--

CREATE TABLE `orden_mesa` (
  `id` int(11) NOT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_reserva`
--

CREATE TABLE `orden_reserva` (
  `id` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `id_reserva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL,
  `tasa` float NOT NULL,
  `comprobante` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_reserva`
--

CREATE TABLE `pago_reserva` (
  `id` int(11) NOT NULL,
  `id_reserva` int(11) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `comprobante` varchar(45) DEFAULT NULL,
  `tasa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_preparados`
--

CREATE TABLE `productos_preparados` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `detalles` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos_preparados`
--

INSERT INTO `productos_preparados` (`id`, `id_categoria`, `nombre`, `imagen`, `precio`, `detalles`, `active`, `tipo`) VALUES
(41, 1, 'hamburguesa', '', 20, 'mucho detalle', 1, 'producto'),
(42, 7, 'Pruba', '7893000979932.jpg', 0.56, 'dadkawpdkpoakdokada', 0, 'producto'),
(43, 7, 'Ninncwda', '7702535011805-20-281-29.webp', 74.87, 'dawdalwdmawldmwadaw', 0, 'producto'),
(44, 7, 'SWSADA', 'harina-pan.jpg', 0.56, 'DAWDADAWDADADADA', 0, 'producto'),
(45, 7, 'Producto Pruebaa', 'ImgThumb.jpg', 0.56, 'mucha descripcion', 1, 'producto'),
(46, NULL, 'Carneee', '2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg', 0.56, NULL, 1, 'adicional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_procesados`
--

CREATE TABLE `productos_procesados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `detalles` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_procesados`
--

INSERT INTO `productos_procesados` (`id`, `nombre`, `imagen`, `precio`, `detalles`, `active`, `id_categoria`) VALUES
(41, 'Nimbre', '19085819.jpg', 5, 'dawdwdwadascacacac', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_preparado_detalle_orden`
--

CREATE TABLE `producto_preparado_detalle_orden` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `adicionales` varchar(45) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_procesado_detalle_orden`
--

CREATE TABLE `producto_procesado_detalle_orden` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `promediogastoclientedelmes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `promediogastoclientedelmes` (
`semana_del_mes` int(1)
,`promedio_gasto` double(19,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `n_telefono1` varchar(20) NOT NULL,
  `n_telefono2` varchar(45) DEFAULT NULL,
  `direccion` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `razon_social`, `documento`, `n_telefono1`, `n_telefono2`, `direccion`, `active`) VALUES
(1, 'Luis Perez', 'Montecarmelo', 'V-5435543', '+584126742231', '', 'una direccion para especificar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `id_producto`, `active`) VALUES
(13, 41, 1),
(14, 45, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `cantidad_personas` float NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `metodo_pedido` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `reservaspormetododelmes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `reservaspormetododelmes` (
`metodo_pedido` int(10)
,`cantidad_reservas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `active`) VALUES
(10, 'SuperAdmin', 'Rol con acceso a todas las funciones del e-commerce', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `alias` varchar(4) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `alias`, `active`) VALUES
(1, 'Litro', 'Lt', '1'),
(2, 'Gramo', 'Gr', '1'),
(3, 'Kilogramo', 'Kg', '1'),
(4, 'Unidad', 'Ud', '1'),
(5, 'Mililitro', 'Ml', '1'),
(7, 'Prueba', 'P', '0'),
(8, 'Prueba1', '1', '0'),
(9, 'Prueba2', '2', '0'),
(10, 'Prueba3', '2', '0'),
(11, 'PRUEBS', 'pr', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `hash` text NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `session_id` varchar(500) NOT NULL DEFAULT '1',
  `email` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `id_rol`, `nombre`, `hash`, `apellido`, `active`, `session_id`, `email`) VALUES
(11, 10, 'Alejandro', 'Luisgv202*', 'Vargas', 1, '1', 'garnicaluis391@gmail.com'),
(13, 10, 'Pedro', 'Pedro25**', 'Perez', 1, '1', 'pedro202@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari_cliente`
--

CREATE TABLE `usuari_cliente` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `IVA` float NOT NULL,
  `monto_final` float NOT NULL,
  `fecha` datetime NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ventasdelmes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ventasdelmes` (
`local` decimal(22,0)
,`delivery` decimal(22,0)
,`paraLlevar` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `promediogastoclientedelmes`
--
DROP TABLE IF EXISTS `promediogastoclientedelmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promediogastoclientedelmes`  AS SELECT CASE WHEN dayofmonth(`v`.`fecha`) between 1 and 7 THEN 1 WHEN dayofmonth(`v`.`fecha`) between 8 and 14 THEN 2 WHEN dayofmonth(`v`.`fecha`) between 15 and 21 THEN 3 WHEN dayofmonth(`v`.`fecha`) between 22 and 28 THEN 4 WHEN dayofmonth(`v`.`fecha`) >= 29 THEN 5 ELSE NULL END AS `semana_del_mes`, round(sum(`v`.`monto_final`) / nullif(count(distinct `o`.`id_cliente`),0),2) AS `promedio_gasto` FROM (`ventas` `v` join `orden` `o` on(`o`.`id` = `v`.`id_orden`)) WHERE month(`v`.`fecha`) = month(curdate()) AND year(`v`.`fecha`) = year(curdate()) GROUP BY CASE WHEN dayofmonth(`v`.`fecha`) between 1 and 7 THEN 1 WHEN dayofmonth(`v`.`fecha`) between 8 and 14 THEN 2 WHEN dayofmonth(`v`.`fecha`) between 15 and 21 THEN 3 WHEN dayofmonth(`v`.`fecha`) between 22 and 28 THEN 4 WHEN dayofmonth(`v`.`fecha`) >= 29 THEN 5 ELSE NULL END HAVING `semana_del_mes` is not null ORDER BY CASE WHEN dayofmonth(`v`.`fecha`) between 1 and 7 THEN 1 WHEN dayofmonth(`v`.`fecha`) between 8 and 14 THEN 2 WHEN dayofmonth(`v`.`fecha`) between 15 and 21 THEN 3 WHEN dayofmonth(`v`.`fecha`) between 22 and 28 THEN 4 WHEN dayofmonth(`v`.`fecha`) >= 29 THEN 5 ELSE NULL END ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `reservaspormetododelmes`
--
DROP TABLE IF EXISTS `reservaspormetododelmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservaspormetododelmes`  AS SELECT `reservaciones`.`metodo_pedido` AS `metodo_pedido`, count(0) AS `cantidad_reservas` FROM `reservaciones` WHERE year(`reservaciones`.`fecha_inicio`) = year(curdate()) AND month(`reservaciones`.`fecha_inicio`) = month(curdate()) GROUP BY `reservaciones`.`metodo_pedido` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ventasdelmes`
--
DROP TABLE IF EXISTS `ventasdelmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ventasdelmes`  AS SELECT coalesce(sum(case when `orden`.`tipo` = 'local' then 1 else 0 end),0) AS `local`, coalesce(sum(case when `orden`.`tipo` = 'delivery' then 1 else 0 end),0) AS `delivery`, coalesce(sum(case when `orden`.`tipo` = 'llevar' then 1 else 0 end),0) AS `paraLlevar` FROM `orden` WHERE year(`orden`.`fecha`) = year(curdate()) AND month(`orden`.`fecha`) = month(curdate()) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Usuario` (`id_usuario`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`id_usuario`);

--
-- Indices de la tabla `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_materia_prima`
--
ALTER TABLE `categoria_materia_prima`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deliverys`
--
ALTER TABLE `deliverys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta_delivery_idx` (`id_venta`),
  ADD KEY `id_usuario_delivery_idx` (`id_usuario_delivery`),
  ADD KEY `del_comb_1` (`id_venta`,`id_usuario_delivery`);

--
-- Indices de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_receta` (`id_receta`,`id_materia_prima`),
  ADD KEY `Id_materia_prima_ibfk_1` (`id_materia_prima`);

--
-- Indices de la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provedor` (`id_proveedor`),
  ADD KEY `id_materia_prima_idx` (`id_materia_prima`);

--
-- Indices de la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rov_idx` (`id_proveedor`),
  ADD KEY `pro_idx` (`id_producto`),
  ADD KEY `nose_fg_idx` (`id_unidad`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad_idx` (`id_unidad`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesa_reservacion`
--
ALTER TABLE `mesa_reservacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reservacion_idx` (`id_reservacion`),
  ADD KEY `id_mesa_idx` (`id_mesa`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos_capital`
--
ALTER TABLE `movimientos_capital`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`id_usuario`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_cliente` (`id_cliente`),
  ADD KEY `idx_cliente` (`id_cliente`),
  ADD KEY `idx_fecha` (`fecha`);

--
-- Indices de la tabla `orden_mesa`
--
ALTER TABLE `orden_mesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id5_idx` (`id_mesa`),
  ADD KEY `id6_idx` (`id_orden`);

--
-- Indices de la tabla `orden_reserva`
--
ALTER TABLE `orden_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id6_idx` (`id_orden`),
  ADD KEY `id7_idx` (`id_reserva`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRegistroVentas` (`id_venta`),
  ADD KEY `idMetodoPago` (`id_metodo_pago`);

--
-- Indices de la tabla `pago_reserva`
--
ALTER TABLE `pago_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id8_idx` (`id_reserva`),
  ADD KEY `id59_idx` (`id_metodo_pago`);

--
-- Indices de la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`id_categoria`);

--
-- Indices de la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id20_idx` (`id_categoria`);

--
-- Indices de la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id11_idx` (`id_producto`),
  ADD KEY `id12_idx` (`id_orden`);

--
-- Indices de la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id12_idx` (`id_orden`),
  ADD KEY `id110_idx` (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_p_idx` (`id_producto`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id4_idx` (`id_cliente`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol` (`id_rol`);

--
-- Indices de la tabla `usuari_cliente`
--
ALTER TABLE `usuari_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id1_idx` (`id_cliente`),
  ADD KEY `id2_idx` (`id_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCaja` (`id_caja`),
  ADD KEY `id-orden_idx` (`id_orden`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categoria_materia_prima`
--
ALTER TABLE `categoria_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deliverys`
--
ALTER TABLE `deliverys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mesa_reservacion`
--
ALTER TABLE `mesa_reservacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movimientos_capital`
--
ALTER TABLE `movimientos_capital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `orden_mesa`
--
ALTER TABLE `orden_mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `id_usuario(caja)` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `deliverys`
--
ALTER TABLE `deliverys`
  ADD CONSTRAINT `id_usuario_delivery` FOREIGN KEY (`id_usuario_delivery`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `id_venta_delivery` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD CONSTRAINT `Id_materia_prima_ibfk_1` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Id_receta_prima_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  ADD CONSTRAINT `detalles_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  ADD CONSTRAINT `id_materia_prima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  ADD CONSTRAINT `nose_fg` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `pro` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`),
  ADD CONSTRAINT `rov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_materia_prima` (`id`),
  ADD CONSTRAINT `id_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `mesa_reservacion`
--
ALTER TABLE `mesa_reservacion`
  ADD CONSTRAINT `id_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  ADD CONSTRAINT `id_reservacion` FOREIGN KEY (`id_reservacion`) REFERENCES `reservaciones` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `orden_mesa`
--
ALTER TABLE `orden_mesa`
  ADD CONSTRAINT `id5` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`);

--
-- Filtros para la tabla `orden_reserva`
--
ALTER TABLE `orden_reserva`
  ADD CONSTRAINT `id7` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `pago_reserva`
--
ALTER TABLE `pago_reserva`
  ADD CONSTRAINT `id59` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id8` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`);

--
-- Filtros para la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  ADD CONSTRAINT `id20` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`);

--
-- Filtros para la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  ADD CONSTRAINT `id11` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`),
  ADD CONSTRAINT `id12` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`);

--
-- Filtros para la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  ADD CONSTRAINT `id110` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id568` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`);

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `id4` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `usuari_cliente`
--
ALTER TABLE `usuari_cliente`
  ADD CONSTRAINT `id1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
