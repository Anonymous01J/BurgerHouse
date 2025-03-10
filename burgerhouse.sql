-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2025 a las 07:11:10
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `AsignarTotalVentasDia` (IN `id_caja` INT(250))   BEGIN
    DECLARE asignar_total_ventas FLOAT;
	SELECT SUM(rv.monto_final) INTO asignar_total_ventas FROM registro_ventas rv WHERE rv.id_caja = id_caja;
	UPDATE caja c SET c.monto_final=(asignar_total_ventas+c.monto_inicial), c.fecha_cierre = CURRENT_TIMESTAMP, c.estado = 1, c.total_ventas = (SELECT COUNT(rv2.id) FROM registro_ventas rv2 WHERE rv2.id_caja = c.id) WHERE c.id = id_caja AND c.estado = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DescontarIngredientes` (IN `p_idProducto` INT, IN `p_cantidad` INT)   BEGIN
    DECLARE v_idMateriaPrima INT;
    DECLARE v_cantidad_necesaria DECIMAL(10,3);
    DECLARE done INT DEFAULT FALSE;
    
    -- Cursor para recorrer los ingredientes del producto
    DECLARE cur_ingredientes CURSOR FOR 
        SELECT idMateriaPrima, cantidad_necesaria 
        FROM producto_ingredientes 
        WHERE idProducto = p_idProducto;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_ingredientes;
    
    loop_ingredientes:LOOP
        FETCH cur_ingredientes INTO v_idMateriaPrima, v_cantidad_necesaria;
        IF done THEN
            LEAVE loop_ingredientes;
        END IF;
        
        -- Descontar el stock
        UPDATE materiaprima 
        SET stock = stock - (v_cantidad_necesaria * p_cantidad)
        WHERE idMateriaPrima = v_idMateriaPrima;
        
    END LOOP;
    
    CLOSE cur_ingredientes;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--
-- Creación: 10-03-2025 a las 04:05:37
--

CREATE TABLE `bitacora` (
  `idBitacora` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `tabla` varchar(20) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `detalles` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--
-- Creación: 10-03-2025 a las 04:04:50
--

CREATE TABLE `caja` (
  `idCaja` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `montoInicial` float NOT NULL,
  `montoFinal` float NOT NULL,
  `fecha` datetime NOT NULL,
  `montoCredito` float NOT NULL,
  `totalVentas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capital`
--
-- Creación: 10-03-2025 a las 04:04:56
--

CREATE TABLE `capital` (
  `idCapital` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--
-- Creación: 10-03-2025 a las 04:04:58
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--
-- Creación: 10-03-2025 a las 04:05:00
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `clientesfrecuentes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `clientesfrecuentes` (
`idCliente` int(11)
,`Cliente` mediumtext
,`Compras` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--
-- Creación: 10-03-2025 a las 04:05:01
--

CREATE TABLE `configuraciones` (
  `idConfiguraciones` int(11) NOT NULL,
  `montoDolarBCV` float NOT NULL,
  `montoDolarParalelo` float NOT NULL,
  `montoTasa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `costo_entradas_mensuales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `costo_entradas_mensuales` (
`Enero` double(19,2)
,`Febrero` double(19,2)
,`Marzo` double(19,2)
,`Abril` double(19,2)
,`Mayo` double(19,2)
,`Junio` double(19,2)
,`Julio` double(19,2)
,`Agosto` double(19,2)
,`Septiembre` double(19,2)
,`Octubre` double(19,2)
,`Noviembre` double(19,2)
,`Diciembre` double(19,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--
-- Creación: 10-03-2025 a las 04:05:41
--

CREATE TABLE `credito` (
  `idCredito` int(11) NOT NULL,
  `idRegistroVentas` int(11) NOT NULL,
  `fechaLimite` datetime NOT NULL,
  `montoCredito` float NOT NULL,
  `montoFinal` float NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalles_capital`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalles_capital` (
`Gastos` double(19,2)
,`Ingresos` double(19,2)
,`Ventas` double(19,2)
,`capital` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradasmp`
--
-- Creación: 10-03-2025 a las 05:28:07
--

CREATE TABLE `entradasmp` (
  `idEntradasMP` int(11) NOT NULL,
  `idMateriaPrima` int(11) NOT NULL,
  `idProvedor` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `fechaCompra` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaVencimiento` datetime NOT NULL,
  `precioCompra` float NOT NULL,
  `precioCompraDivisa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Disparadores `entradasmp`
--
DELIMITER $$
CREATE TRIGGER `actualizar_stock_entrada` AFTER INSERT ON `entradasmp` FOR EACH ROW BEGIN
    UPDATE materiaprima 
    SET stock = stock + NEW.cantidad 
    WHERE idMateriaPrima = NEW.idMateriaPrima;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--
-- Creación: 10-03-2025 a las 04:15:38
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `idRegistroVentas` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripción` text NOT NULL,
  `costeTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Disparadores `facturas`
--
DELIMITER $$
CREATE TRIGGER `after_insert_factura` AFTER INSERT ON `facturas` FOR EACH ROW BEGIN
    CALL DescontarIngredientes(NEW.idProducto, NEW.cantidad);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ganacias_mensuales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ganacias_mensuales` (
`Enero` double(19,2)
,`Febrero` double(19,2)
,`Marzo` double(19,2)
,`Abril` double(19,2)
,`Mayo` double(19,2)
,`Junio` double(19,2)
,`Julio` double(19,2)
,`Agosto` double(19,2)
,`Septiembre` double(19,2)
,`Octubre` double(19,2)
,`Noviembre` double(19,2)
,`Diciembre` double(19,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiaprima`
--
-- Creación: 10-03-2025 a las 05:55:14
-- Última actualización: 10-03-2025 a las 05:55:14
--

CREATE TABLE `materiaprima` (
  `idMateriaPrima` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idUnidad` int(11) NOT NULL,
  `stock` decimal(10,3) NOT NULL DEFAULT 0.000,
  `nombre` text NOT NULL,
  `stockMIn` int(6) NOT NULL,
  `stockMax` int(6) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Disparadores `materiaprima`
--
DELIMITER $$
CREATE TRIGGER `before_update_materiaprima` BEFORE UPDATE ON `materiaprima` FOR EACH ROW BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock no puede ser negativo';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `maxventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `maxventas` (
`id` int(11)
,`nombre` varchar(25)
,`cantidad` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--
-- Creación: 10-03-2025 a las 04:05:07
--

CREATE TABLE `metodopago` (
  `idMetodoPago` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `minventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `minventas` (
`id` int(11)
,`nombre` varchar(25)
,`cantidad` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoscapital`
--
-- Creación: 10-03-2025 a las 04:05:08
--

CREATE TABLE `movimientoscapital` (
  `idMC` int(11) NOT NULL,
  `monto` float NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--
-- Creación: 10-03-2025 a las 04:05:59
--

CREATE TABLE `notificaciones` (
  `idNotificaciones` int(11) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--
-- Creación: 10-03-2025 a las 04:06:01
--

CREATE TABLE `pagos` (
  `idPagos` int(11) NOT NULL,
  `idRegistroVentas` int(11) NOT NULL,
  `idMetodoPago` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Disparadores `pagos`
--
DELIMITER $$
CREATE TRIGGER `movimientos_pagos` AFTER INSERT ON `pagos` FOR EACH ROW BEGIN
    INSERT INTO movimientos_capital (monto, descripcion)
    VALUES (NEW.monto, "Ingreso por facturacion");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Creación: 10-03-2025 a las 04:06:08
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `detalles` text NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_ingredientes`
--
-- Creación: 10-03-2025 a las 05:18:20
--

CREATE TABLE `producto_ingredientes` (
  `idProducto` int(11) NOT NULL,
  `idMateriaPrima` int(11) NOT NULL,
  `cantidad_necesaria` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--
-- Creación: 10-03-2025 a las 04:05:22
--

CREATE TABLE `proveedores` (
  `idProvedor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `razonSocial` varchar(50) NOT NULL,
  `rif` varchar(15) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` text NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroventas`
--
-- Creación: 10-03-2025 a las 04:06:12
--

CREATE TABLE `registroventas` (
  `idRegistroVentas` int(11) NOT NULL,
  `idCaja` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `IVA` float NOT NULL,
  `IGTF` float NOT NULL,
  `montoFinal` float NOT NULL,
  `montoDivisa` float NOT NULL,
  `tasa` float NOT NULL,
  `fecha` datetime NOT NULL,
  `referenciaPago` varchar(6) NOT NULL,
  `comprobantePago` text NOT NULL,
  `direccion` text NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--
-- Creación: 10-03-2025 a las 04:05:28
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--
-- Creación: 10-03-2025 a las 04:05:33
--

CREATE TABLE `unidades` (
  `idUnidad` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
-- Creación: 10-03-2025 a las 04:24:17
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `idRol` int(11) NOT NULL,
  `hash` text NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `preguntaS` text NOT NULL,
  `respuestaS` text NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura para la vista `clientesfrecuentes`
--
DROP TABLE IF EXISTS `clientesfrecuentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clientesfrecuentes`  AS SELECT (select `registroventas`.`idCliente`) AS `idCliente`, (select `clientes`.`nombre` from `clientes` where `clientes`.`idCliente` = `registroventas`.`idCliente`) AS `Cliente`, (select count(0) from `registroventas` where `registroventas`.`idCliente` = `registroventas`.`idCliente`) AS `Compras` FROM `registroventas` GROUP BY `registroventas`.`idCliente` ORDER BY (select count(0) from `registroventas` where `registroventas`.`idCliente` = `registroventas`.`idCliente`) DESC LIMIT 0, 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `costo_entradas_mensuales`
--
DROP TABLE IF EXISTS `costo_entradas_mensuales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `costo_entradas_mensuales`  AS SELECT coalesce(round(sum(case when month(`e`.`fechaCompra`) = 1 then `e`.`precioCompra` else 0 end),2),0) AS `Enero`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 2 then `e`.`precioCompra` else 0 end),2),0) AS `Febrero`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 3 then `e`.`precioCompra` else 0 end),2),0) AS `Marzo`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 4 then `e`.`precioCompra` else 0 end),2),0) AS `Abril`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 5 then `e`.`precioCompra` else 0 end),2),0) AS `Mayo`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 6 then `e`.`precioCompra` else 0 end),2),0) AS `Junio`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 7 then `e`.`precioCompra` else 0 end),2),0) AS `Julio`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 8 then `e`.`precioCompra` else 0 end),2),0) AS `Agosto`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 9 then `e`.`precioCompra` else 0 end),2),0) AS `Septiembre`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 10 then `e`.`precioCompra` else 0 end),2),0) AS `Octubre`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 11 then `e`.`precioCompra` else 0 end),2),0) AS `Noviembre`, coalesce(round(sum(case when month(`e`.`fechaCompra`) = 12 then `e`.`precioCompra` else 0 end),2),0) AS `Diciembre` FROM `entradasmp` AS `e` WHERE year(`e`.`fechaCompra`) = year(current_timestamp()) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalles_capital`
--
DROP TABLE IF EXISTS `detalles_capital`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalles_capital`  AS SELECT (select coalesce(round(sum(case when `m`.`monto` like '-%' then `m`.`monto` else 0 end),2),0) from `movimientoscapital` `m`) AS `Gastos`, (select coalesce(round(sum(case when `m`.`monto` not like '-%' then `m`.`monto` else 0 end),2),0) from `movimientoscapital` `m`) AS `Ingresos`, (select coalesce(round(sum(`p`.`monto`),2),0) from `pagos` `p`) AS `Ventas`, (select coalesce(`capital`.`monto`,0) from `capital` limit 1) AS `capital` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ganacias_mensuales`
--
DROP TABLE IF EXISTS `ganacias_mensuales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ganacias_mensuales`  AS SELECT (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 1),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 1) AS `Enero`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 2),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 2) AS `Febrero`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 3),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 3) AS `Marzo`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 4),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 4) AS `Abril`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 5),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 5) AS `Mayo`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 6),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 6) AS `Junio`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 7),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 7) AS `Julio`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 8),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 8) AS `Agosto`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 9),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 9) AS `Septiembre`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 10),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 10) AS `Octubre`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 11),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 11) AS `Noviembre`, (select coalesce(round(sum(`m`.`monto`) + (select sum(`m`.`monto`) from `movimientoscapital` `m` where `m`.`monto` like '-%' and month(`m`.`fecha`) = 12),2),0) from `movimientoscapital` `m` where `m`.`monto` not like '-%' and month(`m`.`fecha`) = 12) AS `Diciembre` FROM `movimientoscapital` AS `m` WHERE year(`m`.`fecha`) = year(current_timestamp()) LIMIT 0, 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `maxventas`
--
DROP TABLE IF EXISTS `maxventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maxventas`  AS SELECT `p`.`idProducto` AS `id`, `p`.`nombre` AS `nombre`, (select sum(`f`.`cantidad`) from `facturas` `f` where `f`.`idProducto` = `p`.`idProducto`) AS `cantidad` FROM `productos` AS `p` ORDER BY (select sum(`f`.`cantidad`) from `facturas` `f` where `f`.`idProducto` = `p`.`idProducto`) DESC LIMIT 0, 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `minventas`
--
DROP TABLE IF EXISTS `minventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `minventas`  AS SELECT `p`.`idProducto` AS `id`, `p`.`nombre` AS `nombre`, (select sum(`f`.`cantidad`) from `facturas` `f` where `f`.`idProducto` = `p`.`idProducto`) AS `cantidad` FROM `productos` AS `p` ORDER BY (select sum(`f`.`cantidad`) from `facturas` `f` where `f`.`idProducto` = `p`.`idProducto`) ASC LIMIT 0, 5 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`idBitacora`),
  ADD KEY `Usuario` (`Usuario`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`idCaja`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`idCapital`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`idConfiguraciones`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`idCredito`),
  ADD KEY `idRegistroVentas` (`idRegistroVentas`);

--
-- Indices de la tabla `entradasmp`
--
ALTER TABLE `entradasmp`
  ADD PRIMARY KEY (`idEntradasMP`),
  ADD KEY `idMateriaPrima` (`idMateriaPrima`),
  ADD KEY `idProvedor` (`idProvedor`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idRegistroVentas` (`idRegistroVentas`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `materiaprima`
--
ALTER TABLE `materiaprima`
  ADD PRIMARY KEY (`idMateriaPrima`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idUnidad` (`idUnidad`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`idMetodoPago`);

--
-- Indices de la tabla `movimientoscapital`
--
ALTER TABLE `movimientoscapital`
  ADD PRIMARY KEY (`idMC`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`idNotificaciones`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPagos`),
  ADD KEY `idRegistroVentas` (`idRegistroVentas`),
  ADD KEY `idMetodoPago` (`idMetodoPago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `producto_ingredientes`
--
ALTER TABLE `producto_ingredientes`
  ADD PRIMARY KEY (`idProducto`,`idMateriaPrima`),
  ADD KEY `idMateriaPrima` (`idMateriaPrima`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProvedor`);

--
-- Indices de la tabla `registroventas`
--
ALTER TABLE `registroventas`
  ADD PRIMARY KEY (`idRegistroVentas`),
  ADD KEY `idCaja` (`idCaja`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`idUnidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `idCaja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capital`
--
ALTER TABLE `capital`
  MODIFY `idCapital` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `idConfiguraciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `idCredito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradasmp`
--
ALTER TABLE `entradasmp`
  MODIFY `idEntradasMP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiaprima`
--
ALTER TABLE `materiaprima`
  MODIFY `idMateriaPrima` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `idMetodoPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientoscapital`
--
ALTER TABLE `movimientoscapital`
  MODIFY `idMC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `idNotificaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProvedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registroventas`
--
ALTER TABLE `registroventas`
  MODIFY `idRegistroVentas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `idUnidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `credito_ibfk_1` FOREIGN KEY (`idRegistroVentas`) REFERENCES `registroventas` (`idRegistroVentas`);

--
-- Filtros para la tabla `entradasmp`
--
ALTER TABLE `entradasmp`
  ADD CONSTRAINT `entradasmp_ibfk_1` FOREIGN KEY (`idProvedor`) REFERENCES `proveedores` (`idProvedor`),
  ADD CONSTRAINT `entradasmp_ibfk_2` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materiaprima` (`idMateriaPrima`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`idRegistroVentas`) REFERENCES `registroventas` (`idRegistroVentas`);

--
-- Filtros para la tabla `materiaprima`
--
ALTER TABLE `materiaprima`
  ADD CONSTRAINT `materiaprima_ibfk_1` FOREIGN KEY (`idUnidad`) REFERENCES `unidades` (`idUnidad`),
  ADD CONSTRAINT `materiaprima_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idMetodoPago`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`idRegistroVentas`) REFERENCES `registroventas` (`idRegistroVentas`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`);

--
-- Filtros para la tabla `producto_ingredientes`
--
ALTER TABLE `producto_ingredientes`
  ADD CONSTRAINT `producto_ingredientes_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `producto_ingredientes_ibfk_2` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materiaprima` (`idMateriaPrima`);

--
-- Filtros para la tabla `registroventas`
--
ALTER TABLE `registroventas`
  ADD CONSTRAINT `registroventas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `registroventas_ibfk_2` FOREIGN KEY (`idCaja`) REFERENCES `caja` (`idCaja`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
