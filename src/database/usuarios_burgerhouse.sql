-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2025 a las 19:59:17
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
-- Base de datos: `usuarios_burgerhouse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `tabla` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `accion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `id_usuario`, `tabla`, `accion`, `fecha`, `descripcion`) VALUES
(26, 11, 'Adicionales', 'Agregar', '2025-05-28 08:17:19', 'Se agrego un nuevo adicional'),
(27, 11, 'Adicionales', 'Eliminacion', '2025-05-28 08:18:35', 'Se ha eliminado un adicional'),
(28, 11, 'Clientes', 'Eliminacion', '2025-05-28 08:49:48', 'Se elimino un cliente'),
(29, 11, 'Clientes', 'Actualizacion', '2025-05-28 08:51:01', 'Se actualizo un cliente'),
(30, 11, 'Clientes', 'Agregar', '2025-05-28 08:51:47', 'Se agrego un nuevo cliente'),
(31, 11, 'Clientes', 'Actualizacion', '2025-05-28 08:54:06', 'Se actualizo un cliente'),
(32, 11, 'Papelera', 'Restaurar', '2025-05-28 10:05:24', 'Se ha restaurado un elemento de la papelera'),
(33, 11, 'Producto procesado', 'Agregar', '2025-05-28 10:35:32', 'Se agrego un producto procesado'),
(34, 11, 'Papelera', 'Restaurar', '2025-05-28 10:47:39', 'Se ha restaurado un elemento de la papelera'),
(35, 11, 'Orden de domicilio', 'Creacion', '2025-05-28 11:38:22', 'Se creo una orden de domicilio'),
(36, 11, 'Producto procesado', 'Actualizacion', '2025-05-28 11:48:27', 'Se agrego un producto procesado'),
(37, 11, 'Clientes', 'Agregar', '2025-05-28 11:48:54', 'Se agrego un nuevo cliente'),
(38, 11, 'Caja', 'Agregar', '2025-05-28 12:51:06', 'Se abrio una caja'),
(39, 11, 'Orden de domicilio', 'Creacion', '2025-05-28 13:41:29', 'Se creo una orden de domicilio'),
(40, 11, 'Orden de cocina', 'Preparado', '2025-05-28 14:36:13', 'Se preparo una orden de cocina'),
(41, 11, 'Orden de cocina', 'Preparado', '2025-05-28 14:40:43', 'Se preparo una orden de cocina'),
(42, 11, 'Orden de delivery', 'Orden aceptada', '2025-05-28 15:13:47', 'Se acepto una orden de delivery'),
(43, 11, 'Usuarios', 'Login', '2025-05-29 10:11:20', 'inicio de sesion'),
(44, 11, 'orden', 'Actualizacion', '2025-05-29 13:22:41', 'Se verifico la orden 10466000'),
(45, 11, 'Orden de cocina', 'Preparado', '2025-05-29 13:31:15', 'Se preparo una orden de cocina'),
(46, 11, 'orden', 'Actualizacion', '2025-05-29 13:33:38', 'Se anulo la orden 83599400'),
(47, 11, 'orden', 'Actualizacion', '2025-05-29 13:33:44', 'Se verifico la orden 10466000'),
(48, 11, 'Orden de cocina', 'Preparado', '2025-05-29 13:33:50', 'Se preparo una orden de cocina'),
(49, 11, 'Orden de cocina', 'Preparado', '2025-05-29 17:24:23', 'Se preparo una orden de cocina'),
(50, 11, 'orden', 'Actualizacion', '2025-05-29 17:27:48', 'Se anulo la orden 83599400'),
(51, 11, 'Usuarios', 'Login', '2025-05-29 19:53:06', 'inicio de sesion'),
(52, 11, 'Usuarios', 'Agregar', '2025-05-29 21:47:47', 'Se agrego un usuario'),
(53, 11, 'Clientes', 'Eliminacion', '2025-05-29 21:50:38', 'Se elimino un cliente'),
(54, 11, 'Clientes', 'Eliminacion', '2025-05-29 21:50:42', 'Se elimino un cliente'),
(55, 11, 'orden', 'Actualizacion', '2025-05-29 22:00:50', 'Se verifico la orden 83599400'),
(56, 11, 'Orden de cocina', 'Preparado', '2025-05-29 22:00:59', 'Se preparo una orden de cocina'),
(57, 11, 'Orden de delivery', 'Orden aceptada', '2025-05-29 22:01:35', 'Se acepto una orden de delivery'),
(58, 11, 'Orden de delivery', 'Orden aceptada', '2025-05-29 22:08:21', 'Se acepto una orden de delivery'),
(59, 11, 'Orden de delivery', 'Orden aceptada', '2025-05-29 22:19:25', 'Se acepto una orden de delivery'),
(60, 11, 'Orden de delivery', 'Orden aceptada', '2025-05-29 22:20:24', 'Se acepto una orden de delivery'),
(61, 11, 'Orden de delivery', 'Orden aceptada', '2025-05-29 22:21:35', 'Se acepto una orden de delivery'),
(62, 14, 'Usuarios', 'Login', '2025-06-02 13:52:53', 'inicio de sesion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_roles`
--

CREATE TABLE `detalles_roles` (
  `id` int NOT NULL,
  `id_rol` int NOT NULL,
  `modulo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `permisos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL
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
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `active`) VALUES
(10, 'SuperAdmin', 'Rol con acceso a todas las funciones del e-commerce', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `id_rol` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `session_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1',
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `token` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'token',
  `token_expiracion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `id_rol`, `nombre`, `hash`, `apellido`, `active`, `session_id`, `email`, `token`, `token_expiracion`) VALUES
(11, 10, 'Alejandro', 'Alejandro202*', 'Vargas', 1, '1', 'garnicaluis391@gmail.com', '3139', '2025-05-29 17:36:34'),
(13, 10, 'Pedro', 'Pedro25**', 'Perez', 1, '1', 'pedro202@gmail.com', 'token', NULL),
(14, 10, 'Rolando', 'Martinez25/', 'Martinez', 1, '1', 'martinezj@gmail.com', 'token', NULL);

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
-- Indices de la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`id_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `detalles_roles`
--
ALTER TABLE `detalles_roles`
  ADD CONSTRAINT `detalles_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
