-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2025 a las 19:58:34
-- Versión del servidor: 8.0.41
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `burgerhouse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `monto_inicial_dolar` float NOT NULL,
  `monto_inicial_bs` float NOT NULL,
  `monto_final_bs` float DEFAULT NULL,
  `monto_final_dolar` float DEFAULT NULL,
  `fecha_apertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `total_ventas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id`, `id_usuario`, `monto_inicial_dolar`, `monto_inicial_bs`, `monto_final_bs`, `monto_final_dolar`, `fecha_apertura`, `fecha_cierre`, `estado`, `total_ventas`) VALUES
(8, 11, 5, 2, NULL, NULL, '2025-05-24 18:47:30', NULL, 0, NULL),
(10, 11, 10, 1000, NULL, NULL, '2025-05-28 12:55:33', NULL, 0, NULL),
(11, 11, 10, 1500, NULL, NULL, '2025-05-28 11:34:29', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capital`
--

CREATE TABLE `capital` (
  `id` int NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_productos`
--

CREATE TABLE `categorias_productos` (
  `id` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
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
  `id` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
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
  `id` int NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `documento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `telefono`, `active`, `documento`) VALUES
(1, 'Jose', 'Escalona', '+584126742231', 1, 'V-30087582'),
(2, 'Pedro', 'Escalona', '+584161214717', 0, ''),
(3, 'Pedro ', 'Perex', '+584162589318', 1, ''),
(4, 'AMELIA', 'GARNICAR', NULL, 1, 'V-5435543'),
(5, 'FELIX', 'DOMINGUEZ', NULL, 1, 'V-30554404'),
(6, 'PETER', 'HOFER', NULL, 1, 'V-1000000'),
(7, 'KENDERSON', 'TORREALBA', NULL, 0, 'V-19572137'),
(17, 'JOSE', 'PEREZ', NULL, 1, 'V-30218990'),
(18, 'Rodrigo', 'Hernandezz', '+584122578963', 1, 'E-14586325'),
(19, 'Nombre', 'Nombre', '+584159949468', 0, 'E-4984894894'),
(20, 'Nombrequiza', 'Alomen', '+584267959595', 0, 'V-468468468'),
(21, 'Otromas', 'Sadada', '+584126468464', 0, 'V-68464648');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `id` int NOT NULL,
  `llave` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `valor` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `id` int NOT NULL,
  `id_usuario_delivery` int NOT NULL,
  `id_venta` int NOT NULL,
  `active` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `delivery`
--

INSERT INTO `delivery` (`id`, `id_usuario_delivery`, `id_venta`, `active`) VALUES
(1, 11, 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_receta`
--

CREATE TABLE `detalles_receta` (
  `id` int NOT NULL,
  `id_receta` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_receta`
--

INSERT INTO `detalles_receta` (`id`, `id_receta`, `id_materia_prima`, `cantidad`) VALUES
(60, 13, 8, 0.56),
(65, 15, 9, 1),
(66, 15, 8, 0.56),
(67, 15, 5, 1.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_materia_prima`
--

CREATE TABLE `entradas_materia_prima` (
  `id` int NOT NULL,
  `codigo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `broken` int NOT NULL DEFAULT '0'
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
  `id` int NOT NULL,
  `codigo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_producto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_unidad` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `broken` float NOT NULL DEFAULT '0'
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
  `id` int NOT NULL,
  `id_categoria` int NOT NULL,
  `id_unidad` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `stock_min` int NOT NULL,
  `stock_max` int NOT NULL,
  `existencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id`, `id_categoria`, `id_unidad`, `nombre`, `stock_min`, `stock_max`, `existencia`, `active`) VALUES
(1, 1, 3, 'Pollo', 10, 20, '0', 1),
(2, 1, 3, 'Carne de res', 10, 20, '0', 1),
(3, 3, 3, 'Cebolla', 10, 20, '0', 1),
(4, 3, 3, 'Maíz', 10, 20, '0', 1),
(5, 7, 4, 'Queso cheddar', 10, 20, '3.999999761581421', 1),
(6, 4, 3, 'Salsa especial', 10, 20, '0', 1),
(7, 1, 3, 'Tocineta', 10, 20, '0', 1),
(8, 3, 3, 'Papas', 10, 20, '4.399999976158142', 1),
(9, 2, 4, 'Pan de la casa', 10, 20, '5', 1),
(10, 3, 3, 'Prueba', 1, 5, '0', 1),
(11, 7, 5, 'CONSOLA', 2, 10, '0', 0),
(12, 6, 4, 'CONN', 2, 3, '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sillas` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LIBRE',
  `vip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `nombre`, `sillas`, `estado`, `vip`, `imagen`, `active`) VALUES
(1, 'Mesa 2', '5', 'LIBRE', '0', '29604004.jpg', '1'),
(2, 'Mesa 45', '10', 'OCUPADA', '1', 'concepto-rpa-pantalla-tactil-mano-borrosa.jpg', '1'),
(3, 'Mesa 9', '4', 'LIBRE', '0', '5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg', '1'),
(4, 'Mesa 10', '7', 'LIBRE', '1', 'championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg', '0'),
(5, 'Mesa inf', '58', 'LIBRE', '0', 'depositphotos_66292255-stock-photo-dark-background-with-spotlights.jpg', '1'),
(6, 'Mesa 99', '10', 'LIBRE', '1', '5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_reservacion`
--

CREATE TABLE `mesa_reservacion` (
  `id` int NOT NULL,
  `id_mesa` int NOT NULL,
  `id_reservacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id`, `nombre`, `active`, `imagen`, `descripcion`) VALUES
(1, 'Zelle', 0, NULL, NULL),
(2, 'Binance', 0, NULL, NULL),
(3, 'Pago Movil', 1, NULL, NULL),
(4, 'Efectivo', 1, NULL, NULL),
(9, 'Prueba infinity', 0, NULL, NULL),
(10, 'Prueba 2', 0, NULL, NULL),
(11, 'Transferencia', 1, NULL, NULL),
(12, 'Divisa', 1, NULL, NULL),
(13, 'Zinli', 0, NULL, NULL),
(14, 'Cashea', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_capital`
--

CREATE TABLE `movimientos_capital` (
  `id` int NOT NULL,
  `monto` float NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int NOT NULL,
  `nro_orden` float NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '0',
  `tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `nro_orden`, `id_cliente`, `fecha`, `status`, `tipo`) VALUES
(33, 83599400, 1, '2025-05-30 02:00:59', 2, 'delivery'),
(34, 10466000, 1, '2025-05-30 02:21:50', 0, 'delivery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int NOT NULL,
  `id_venta` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tasa` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_venta`, `id_metodo_pago`, `monto`, `fecha`, `tasa`, `comprobante`, `referencia`) VALUES
(4, 15, 11, 85.65, '2025-05-28 11:38:22', 95.81, 'cap.jpg', '52662'),
(5, 16, 11, 6595.95, '2025-05-28 13:41:29', 95.81, 'cap.jpg', '5684684');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_reserva`
--

CREATE TABLE `pago_reserva` (
  `id` int NOT NULL,
  `id_reserva` int DEFAULT NULL,
  `id_metodo_pago` int DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `comprobante` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tasa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_preparados`
--

CREATE TABLE `productos_preparados` (
  `id` int NOT NULL,
  `id_categoria` int NOT NULL DEFAULT '10',
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
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
(45, 7, 'Producto Prueba', 'ImgThumb.jpg', 0.56, 'mucha descripcion', 1, 'producto'),
(46, 10, 'Carne', '2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg', 0.56, NULL, 1, 'adicional'),
(47, 10, 'Papitas', 'DIABLITOS-UNDERWOOD.jpg', 0.25, NULL, 1, 'adicional'),
(48, 10, 'Nuggets', 'arroz.jpeg', 2, NULL, 1, 'adicional'),
(49, 10, 'Ensalada', '7594005430045.jpg', 1.5, NULL, 1, 'adicional'),
(50, 10, 'Salsa Inglesa', 'harina-pan.jpg', 0.55, NULL, 1, 'adicional'),
(51, 10, 'Jamon', '7502223708136_1.jpg', 2.5, NULL, 1, 'adicional'),
(52, 5, 'Prokdaod', '5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg', 6.16, 'dawdawdawdawdadawd', 1, 'producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_procesados`
--

CREATE TABLE `productos_procesados` (
  `id` int NOT NULL,
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_procesados`
--

INSERT INTO `productos_procesados` (`id`, `nombre`, `imagen`, `precio`, `detalles`, `active`, `id_categoria`) VALUES
(41, 'Nigga', '19085819.jpg', 5, 'dawdwdwadascacacac', 1, 1),
(42, 'Coca colaa', 'OIP.jpeg', 1.5, 'Coca cola de 1.5L', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_preparado_detalle_orden`
--

CREATE TABLE `producto_preparado_detalle_orden` (
  `id` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adicionales` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_preparado_detalle_orden`
--

INSERT INTO `producto_preparado_detalle_orden` (`id`, `id_producto`, `id_orden`, `cantidad`, `descripcion`, `adicionales`, `active`) VALUES
(51, 41, 33, '1', NULL, 'Salsa Inglesa,Nuggets', 1),
(52, 48, 33, '1', NULL, NULL, 1),
(53, 50, 33, '1', NULL, NULL, 1),
(54, 45, 34, '1', NULL, 'Salsa Inglesa', 1),
(55, 41, 34, '1', NULL, 'Carne', 1),
(56, 46, 34, '1', NULL, NULL, 1),
(57, 50, 34, '1', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_procesado_detalle_orden`
--

CREATE TABLE `producto_procesado_detalle_orden` (
  `id` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `razon_social` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `documento` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `n_telefono1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `n_telefono2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
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
  `id` int NOT NULL,
  `id_producto` int NOT NULL,
  `active` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `id_producto`, `active`) VALUES
(13, 41, 1),
(15, 45, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id` int NOT NULL,
  `id_cliente` int NOT NULL,
  `cantidad_personas` float NOT NULL,
  `descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int NOT NULL,
  `nombre` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `alias` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1'
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
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int NOT NULL,
  `id_caja` int NOT NULL,
  `id_orden` int NOT NULL,
  `IVA` float DEFAULT NULL,
  `monto_final` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_caja`, `id_orden`, `IVA`, `monto_final`, `fecha`, `direccion`, `active`) VALUES
(15, 11, 33, NULL, 25.75, '2025-05-28 11:38:22', 'mi casa', 1),
(16, 11, 34, NULL, 24.96, '2025-05-28 13:41:29', 'en mi casa', 1);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asdfg_idx` (`id_usuario_delivery`),
  ADD KEY `asdfgh_idx` (`id_venta`);

--
-- Indices de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_receta` (`id_receta`,`id_materia_prima`),
  ADD KEY `Id_materia_prima_ibfk_1` (`id_materia_prima`);

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
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_cliente` (`id_cliente`),
  ADD KEY `idx_cliente` (`id_cliente`),
  ADD KEY `idx_fecha` (`fecha`);

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
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categoria_materia_prima`
--
ALTER TABLE `categoria_materia_prima`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `entradas_producto_procesado`
--
ALTER TABLE `entradas_producto_procesado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mesa_reservacion`
--
ALTER TABLE `mesa_reservacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `movimientos_capital`
--
ALTER TABLE `movimientos_capital`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos_preparados`
--
ALTER TABLE `productos_preparados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `productos_procesados`
--
ALTER TABLE `productos_procesados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `producto_preparado_detalle_orden`
--
ALTER TABLE `producto_preparado_detalle_orden`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `producto_procesado_detalle_orden`
--
ALTER TABLE `producto_procesado_detalle_orden`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `asdfgh` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD CONSTRAINT `Id_materia_prima_ibfk_1` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Id_receta_prima_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

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
  ADD CONSTRAINT `id59` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `id8` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `NON0ON` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`);

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `id4` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `srxtrxrxr` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
