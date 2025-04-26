-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2025 a las 22:15:48
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
-- Base de datos: `burgerhouse`
--

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
  `monto_inicial` float NOT NULL,
  `monto_final` float NOT NULL,
  `fecha_apertura` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
(8, 'Kids', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_materia_prima`
--

CREATE TABLE `categoria_materia_prima` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categoria_materia_prima`
--

INSERT INTO `categoria_materia_prima` (`id`, `nombre`, `tipo`, `active`) VALUES
(1, 'Carnes', '', 1),
(2, 'Panadería', '', 1),
(3, 'Verduras y hortaliza', '', 1),
(4, 'Salsas y condimentos', '', 1),
(5, 'Aceites y grasas', '', 1),
(6, 'Postres y acompañamientos', '', 1),
(7, 'Lacteos', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto_credito` float NOT NULL,
  `monto_final` float NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_orden`
--

CREATE TABLE `detalles_orden` (
  `Id` int(11) NOT NULL,
  `Id_Orden` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  `detalles_producto` text NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_receta`
--

CREATE TABLE `detalles_receta` (
  `Id` int(11) NOT NULL,
  `Id_receta` int(11) NOT NULL,
  `Id_materia_prima` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_receta`
--

INSERT INTO `detalles_receta` (`Id`, `Id_receta`, `Id_materia_prima`, `cantidad`) VALUES
(41, 1, 2, 0.15),
(42, 1, 3, 0.05),
(43, 1, 4, 0.02),
(44, 1, 5, 2),
(45, 1, 8, 0.15),
(46, 1, 1, 0.1),
(47, 1, 6, 0.03),
(48, 1, 7, 0.02),
(49, 1, 8, 0.15),
(50, 1, 9, 1);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada`
--

CREATE TABLE `detalle_entrada` (
  `id` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `restante` int(11) NOT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `precio_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_materia_prima`
--

CREATE TABLE `entradas_materia_prima` (
  `id` int(11) NOT NULL,
  `id_provedor` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT current_timestamp(),
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `Id_factura` int(11) NOT NULL,
  `Id_orden` int(11) NOT NULL,
  `Id_caja` int(11) NOT NULL,
  `Monto_total` int(11) NOT NULL,
  `Monto_total_divisa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id`, `id_categoria`, `id_unidad`, `nombre`, `stock_min`, `stock_max`, `active`) VALUES
(1, 1, 3, 'Pollo', 10, 20, 1),
(2, 1, 3, 'Carne de res', 10, 20, 1),
(3, 3, 3, 'Cebolla', 10, 20, 1),
(4, 3, 3, 'Maíz', 10, 20, 1),
(5, 7, 4, 'Queso cheddar', 10, 20, 1),
(6, 4, 3, 'Salsa especial', 10, 20, 1),
(7, 1, 3, 'Tocineta', 10, 20, 1),
(8, 3, 3, 'Papas', 10, 20, 1),
(9, 2, 4, 'Pan de la casa', 10, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id`, `nombre`, `descripcion`, `imagen`, `active`) VALUES
(1, 'Zelle', '', '', 1),
(2, 'Binance', '', '', 1),
(3, 'PagoMovil', '', '', 1),
(4, 'Efectivo', '', '', 1);

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
  `Id` int(11) NOT NULL,
  `Nro_Orden` int(11) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Referencia` int(11) NOT NULL,
  `Comprobante` text NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `detalles` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `id_receta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `nombre`, `imagen`, `precio`, `detalles`, `active`, `id_receta`) VALUES
(1, 2, 'PEPITO TRADICIONAL', '', 7, '22CM de pan, salsas, tomate, lechuga, cebolla, solomo o pollo, tocineta, queso parmesano y ración de papas fritas.', 1, 0),
(2, 2, 'PEPITO MIXTO', '', 11, '22CM de pan, salsas, tomate, lechuga, cebolla, solomo, pollo, chorizo, tocineta, queso amarillo, queso parmesano, queso cheddar, maíz y ración de papas fritas.', 1, 0),
(3, 2, 'PEPITO GRATINADO', '', 9, '22CM de pan, salsas, solomo, pollo o chorizo, tocineta, queso mozzarella, queso cheddar y ración de papas fritas.', 1, 0),
(4, 2, 'PEPITO ESPECIAL', '', 10, '22CM de pan, mayonesa, pollo y camarones, queso mozzarella gratinado, queso parmesano y ración de papas fritas.', 1, 0),
(5, 4, 'PERRO TRADICIONAL', '', 2, 'Pan grande, salchicha, salsas, repollo, cebolla y ración de papas fritas.', 1, 0),
(6, 4, 'PERRO ESPECIAL', '', 3.5, 'Pan grande, salchicha, salsas, tocineta, queso amarillo, maíz y ración de papas fritas.', 1, 0),
(7, 4, 'PERRO CON CARNE', '', 4.5, 'Pan grande, salchicha, salsas, carne, queso amarillo y ración de papas fritas.', 1, 0),
(8, 6, 'CLUB HOUSE', '', 8, 'Pan de sándwich, salsas, vegetales, pollo, jamón, queso, tocineta, tortilla de huevo y ración de papas fritas.', 1, 0),
(9, 3, 'GRIEGO TRADICIONAL', '', 7.7, 'Pan, salsas, vegetales, salchicha, carne, pollo o mixto, queso parmesano, tocineta, jamón, queso amarillo y ración de papas fritas.', 1, 0),
(10, 3, 'GRIEGO ESPECIAL', '', 9, 'Pan, salsas, vegetales, carne, pollo y camarones, queso parmesano y ración de papas fritas.', 1, 0),
(11, 5, 'PAPAS CON CARNE', '', 7.5, '300gr de papas, 200gr de carne o mixta, queso amarillo, tocineta, salsas.', 1, 0),
(12, 5, 'SALCHIPAPAS', '', 3.5, '300gr de papa, salchicha, cubiertas con queso cheddar con topping de tocineta.', 1, 0),
(13, 5, 'PAPAS CHEDDAR', '', 2.8, '300gr de papas fritas, cubiertas de queso cheddar y tocineta.', 1, 0),
(14, 8, 'MINI BURGER', '', 3, 'Pan de la casa, salsas, carne, queso cheddar y ración de papas fritas.', 1, 0),
(15, 8, 'TENDERS DE POLLO', '', 4, 'Tenders de pollo, salsas y ración de papas fritas.', 1, 0),
(16, 7, 'CLÁSICA', '', 2.8, 'Pan de la casa, carne, tomate, lechuga, cebolla, salsas, ración de papas fritas.', 1, 0),
(17, 7, 'CHEESE BURGER', '', 4.1, 'Pan de la casa, carne o pollo, tomate, lechuga, cebolla, salsas, queso cheddar, tocineta y ración de papas fritas.', 1, 0),
(18, 7, 'CHICKEN BURGER', '', 5.6, 'Pan de la casa, pollo crispy, salsa especial, doble cheddar, doble tocineta, ración de papas fritas.', 1, 0),
(19, 7, 'CRISPY BURGER', '', 4, 'Pan de la casa, salsa especial, pollo crispy, queso cheddar, lechuga, tocineta, ración de papas fritas.', 1, 0),
(20, 7, 'TENTACIÓN BURGER', '', 7, 'Pan de la casa, carne, pollo, tomate, lechuga, cebolla, salsas, queso cheddar, tocineta, maíz y ración de papas fritas.', 1, 0),
(21, 7, 'BACON JAM BURGER', '', 5, 'Pan de papa, mayonesa, doble carne, doble cheddar, mermelada de tocineta, ración de papas fritas.', 1, 0),
(22, 7, 'ONION BURGER', '', 4, 'Pan de la casa, carne o pollo, salsa especial, cebolla caramelizada o cebolla crispy, queso cheddar, tocineta y ración de papas fritas.', 1, 0),
(23, 7, 'BURGER HOUSE', '', 6.5, 'Pan de la casa, salsa especial, carne, pollo crispy, cebolla crispy, cebolla caramelizada, tocineta, queso cheddar, maíz y ración de papas fritas.', 1, 0),
(24, 7, 'BIG BURGER', '', 6.5, 'Pan de la casa, doble carne, doble queso cheddar, salsa Big Mac, pepinillo, lechuga, tocineta y ración de papas fritas.', 1, 0),
(25, 7, 'TASTY BURGER', '', 8, 'Pan de papa, salsa tasty, triple carne, triple cheddar, tocineta, tomate, cebolla, lechuga, ración de papas fritas.', 1, NULL),
(26, 7, 'SMASH BURGER', '', 8.8, 'Pan de papa, salsa especial, triple carne, triple cheddar, tocineta, cebolla morada, pepinillo, ración de papas fritas.', 1, 0),
(27, 1, 'Luis', 'C:\\fakepath\\5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg', 6.56, 'awdk;oakd;kaw;odk;ad', 1, 2),
(28, 1, 'Azucar', 'C:\\fakepath\\5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg', 656.56, 'alwjdildjiladjiljdildwada', 1, 2),
(29, 2, 'Shawarma', 'C:\\fakepath\\LOGO SHTECHNOLOGYX CON OTRAS LETRAS.png', 50, 'mailmdilwmlidmlwiadl', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `razonSocial` varchar(50) NOT NULL,
  `rif` varchar(15) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `nombre`) VALUES
(1, 'Burger House');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Super-Administrador'),
(2, 'Cajero'),
(3, 'Mesero'),
(4, 'Delivery'),
(5, 'Cocinero'),
(6, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `alias` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `alias`) VALUES
(1, 'Litro', 'Lt'),
(2, 'Gramo', 'Gr'),
(3, 'Kilogramo', 'Kg'),
(4, 'Unidad', 'Ud'),
(5, 'Mililitro', 'Ml');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `hash` text NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `session_id` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `id_rol`, `hash`, `nombre`, `active`, `session_id`) VALUES
(1, 1, 'GodOfWar20**', 'josepeez@gmail.com', 1, 'fpsejfpisfp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `IVA` float NOT NULL,
  `monto_final` float NOT NULL,
  `fecha` datetime NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRegistroVentas` (`id_venta`);

--
-- Indices de la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Orden` (`Id_Orden`),
  ADD KEY `Id_producto` (`Id_producto`);

--
-- Indices de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_receta` (`Id_receta`,`Id_materia_prima`),
  ADD KEY `Id_materia_prima_ibfk_1` (`Id_materia_prima`);

--
-- Indices de la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_materia_prima` (`id_materia_prima`);

--
-- Indices de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_provedor` (`id_provedor`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`Id_factura`),
  ADD KEY `Id_orden` (`Id_orden`),
  ADD KEY `Id_caja` (`Id_caja`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad_idx` (`id_unidad`),
  ADD KEY `id_categoria` (`id_categoria`);

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
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_cliente` (`Id_cliente`),
  ADD KEY `idx_cliente` (`Id_cliente`),
  ADD KEY `idx_fecha` (`fecha`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRegistroVentas` (`id_venta`),
  ADD KEY `idMetodoPago` (`id_metodo_pago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`id_categoria`),
  ADD KEY `id_receta` (`id_receta`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCaja` (`id_caja`),
  ADD KEY `idCliente` (`id_cliente`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categoria_materia_prima`
--
ALTER TABLE `categoria_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `Id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `credito_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `detalles_orden`
--
ALTER TABLE `detalles_orden`
  ADD CONSTRAINT `Id_orden_ibfk_1` FOREIGN KEY (`Id_Orden`) REFERENCES `orden` (`Id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `detalles_receta`
--
ALTER TABLE `detalles_receta`
  ADD CONSTRAINT `Id_materia_prima_ibfk_1` FOREIGN KEY (`Id_materia_prima`) REFERENCES `materia_prima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Id_receta_prima_ibfk_2` FOREIGN KEY (`Id_receta`) REFERENCES `recetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  ADD CONSTRAINT `detalles_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD CONSTRAINT `id_materia_prima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`);

--
-- Filtros para la tabla `entradas_materia_prima`
--
ALTER TABLE `entradas_materia_prima`
  ADD CONSTRAINT `id_proveedor` FOREIGN KEY (`id_provedor`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `id_caja_ibfk_1` FOREIGN KEY (`Id_caja`) REFERENCES `caja` (`id`);

--
-- Filtros para la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_materia_prima` (`id`),
  ADD CONSTRAINT `id_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
