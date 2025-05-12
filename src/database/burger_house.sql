-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: burger_house
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adicionales`
--

DROP TABLE IF EXISTS `adicionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicionales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicionales`
--

LOCK TABLES `adicionales` WRITE;
/*!40000 ALTER TABLE `adicionales` DISABLE KEYS */;
INSERT INTO `adicionales` VALUES (1,'Ensalada Picorina',2.55,'collage-fondo-programacion.jpg',1,'');
/*!40000 ALTER TABLE `adicionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `tabla` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `accion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  PRIMARY KEY (`id`),
  KEY `Usuario` (`id_usuario`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `monto_inicial` float NOT NULL,
  `monto_final` float NOT NULL,
  `fecha_apertura` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`id_usuario`),
  CONSTRAINT `id_usuario(caja)` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capital`
--

DROP TABLE IF EXISTS `capital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capital`
--

LOCK TABLES `capital` WRITE;
/*!40000 ALTER TABLE `capital` DISABLE KEYS */;
/*!40000 ALTER TABLE `capital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_materia_prima`
--

DROP TABLE IF EXISTS `categoria_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_materia_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_materia_prima`
--

LOCK TABLES `categoria_materia_prima` WRITE;
/*!40000 ALTER TABLE `categoria_materia_prima` DISABLE KEYS */;
INSERT INTO `categoria_materia_prima` VALUES (1,'Carnes',1),(2,'Panadería',1),(3,'Verduras y hortaliza',1),(4,'Salsas y condimentos',1),(5,'Aceites y grasas',1),(6,'Postres y acompañamientos',1),(7,'Lacteos',1),(8,'Prueba',1);
/*!40000 ALTER TABLE `categoria_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_productos`
--

DROP TABLE IF EXISTS `categorias_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_productos`
--

LOCK TABLES `categorias_productos` WRITE;
/*!40000 ALTER TABLE `categorias_productos` DISABLE KEYS */;
INSERT INTO `categorias_productos` VALUES (1,'Bebidas',1),(2,'Pepitos',1),(3,'Griegos',1),(4,'Perros Calientes',1),(5,'Papas',1),(6,'Club House',1),(7,'Burgers',1),(8,'Kids',1),(9,'Jira',0),(10,'Adicionales',1);
/*!40000 ALTER TABLE `categorias_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jose','Escalona','V-85652235','+584126742231','Avenida 15, local numero 5',1),(2,'Pedro','Escalona','V-29654423','+584161214717','una direccion cualquiera',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuraciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `llave` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `valor` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `fecha` datetime NOT NULL,
  `monto_credito` float NOT NULL,
  `monto_final` float NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idRegistroVentas` (`id_venta`),
  CONSTRAINT `credito_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverys`
--

DROP TABLE IF EXISTS `deliverys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario_delivery` int NOT NULL,
  `id_venta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venta_delivery_idx` (`id_venta`),
  KEY `id_usuario_delivery_idx` (`id_usuario_delivery`),
  CONSTRAINT `id_usuario_delivery` FOREIGN KEY (`id_usuario_delivery`) REFERENCES `usuario` (`id`),
  CONSTRAINT `id_venta_delivery` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverys`
--

LOCK TABLES `deliverys` WRITE;
/*!40000 ALTER TABLE `deliverys` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_orden`
--

DROP TABLE IF EXISTS `detalles_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_orden` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Orden` int NOT NULL,
  `Id_producto` int NOT NULL,
  `detalles_producto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Orden` (`Id_Orden`),
  KEY `Id_producto` (`Id_producto`),
  CONSTRAINT `Id_orden_ibfk_1` FOREIGN KEY (`Id_Orden`) REFERENCES `orden` (`Id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_orden`
--

LOCK TABLES `detalles_orden` WRITE;
/*!40000 ALTER TABLE `detalles_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_receta`
--

DROP TABLE IF EXISTS `detalles_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_receta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_receta` int NOT NULL,
  `Id_materia_prima` int NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_receta` (`Id_receta`,`Id_materia_prima`),
  KEY `Id_materia_prima_ibfk_1` (`Id_materia_prima`),
  CONSTRAINT `Id_materia_prima_ibfk_1` FOREIGN KEY (`Id_materia_prima`) REFERENCES `materia_prima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Id_receta_prima_ibfk_2` FOREIGN KEY (`Id_receta`) REFERENCES `recetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_receta`
--

LOCK TABLES `detalles_receta` WRITE;
/*!40000 ALTER TABLE `detalles_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_roles`
--

DROP TABLE IF EXISTS `detalles_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `modulo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `permisos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `detalles_roles_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_roles`
--

LOCK TABLES `detalles_roles` WRITE;
/*!40000 ALTER TABLE `detalles_roles` DISABLE KEYS */;
INSERT INTO `detalles_roles` VALUES (20,10,'combo','consultar,agregar,editar,eliminar'),(21,10,'supplier','consultar,agregar,editar,eliminar'),(22,10,'order','consultar,agregar,editar,eliminar'),(23,10,'delivery','consultar,agregar'),(24,10,'kitchen','consultar,agregar'),(25,10,'statistics','consultar'),(26,10,'calendar','consultar'),(27,10,'binnacle','consultar'),(28,10,'capital','consultar,agregar'),(29,10,'trash','consultar,editar'),(30,10,'clients','consultar,agregar,editar,eliminar'),(31,10,'cash','consultar,agregar,editar'),(32,10,'invoice','consultar'),(33,10,'credit','consultar,editar'),(34,10,'units','consultar,agregar,editar,eliminar'),(35,10,'category','consultar,agregar,editar,eliminar'),(36,10,'paymentMethod','consultar,agregar,editar,eliminar'),(37,10,'permissionsRol','consultar,agregar,editar,eliminar'),(38,10,'users','consultar,agregar,editar,eliminar');
/*!40000 ALTER TABLE `detalles_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_materia_prima`
--

DROP TABLE IF EXISTS `entradas_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_materia_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_provedor` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_provedor` (`id_provedor`),
  KEY `id_materia_prima_idx` (`id_materia_prima`),
  CONSTRAINT `id_materia_prima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_provedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_materia_prima`
--

LOCK TABLES `entradas_materia_prima` WRITE;
/*!40000 ALTER TABLE `entradas_materia_prima` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_unidad` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `stock_min` int NOT NULL,
  `stock_max` int NOT NULL,
  `existencia` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_unidad_idx` (`id_unidad`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_materia_prima` (`id`),
  CONSTRAINT `id_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,1,3,'Pollo',10,20,'0',1),(2,1,3,'Carne de res',10,20,'0',1),(3,3,3,'Cebolla',10,20,'0',1),(4,3,3,'Maíz',10,20,'0',1),(5,7,4,'Queso cheddar',10,20,'0',1),(6,4,3,'Salsa especial',10,20,'0',1),(7,1,3,'Tocineta',10,20,'0',1),(8,3,3,'Papas',10,20,'0',1),(9,2,4,'Pan de la casa',10,20,'0',1),(10,3,3,'Prueba',1,5,'0',1),(11,7,5,'CONSOLA',2,10,'0',0),(12,6,4,'CONN',2,3,'0',0);
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa_reservacion`
--

DROP TABLE IF EXISTS `mesa_reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa_reservacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mesa` int NOT NULL,
  `id_reservacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_reservacion_idx` (`id_reservacion`),
  KEY `id_mesa_idx` (`id_mesa`),
  CONSTRAINT `id_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  CONSTRAINT `id_reservacion` FOREIGN KEY (`id_reservacion`) REFERENCES `reservaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa_reservacion`
--

LOCK TABLES `mesa_reservacion` WRITE;
/*!40000 ALTER TABLE `mesa_reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesa_reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `sillas` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'LIBRE',
  `vip` varchar(45) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Mesa 2','5','LIBRE','0','29604004.jpg','1'),(2,'Mesa 45','10','OCUPADA','1','concepto-rpa-pantalla-tactil-mano-borrosa.jpg','1'),(3,'Mesa 9','4','LIBRE','0','5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg','0'),(4,'Mesa 10','7','LIBRE','1','championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg','0'),(5,'Mesa dios','58','LIBRE','0','depositphotos_66292255-stock-photo-dark-background-with-spotlights.jpg','0'),(6,'Mesa 99','10','LIBRE','1','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg','1');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `imagen` varchar(500) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descripcion` varchar(500) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Zelle',1,NULL,NULL),(2,'Binance',1,NULL,NULL),(3,'Pago Movil',1,NULL,NULL),(4,'Efectivo',1,NULL,NULL),(9,'Prueba infinity',1,NULL,NULL),(10,'Prueba 2',0,NULL,NULL);
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_capital`
--

DROP TABLE IF EXISTS `movimientos_capital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_capital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` float NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_capital`
--

LOCK TABLES `movimientos_capital` WRITE;
/*!40000 ALTER TABLE `movimientos_capital` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_capital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`id_usuario`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nro_Orden` int NOT NULL,
  `Id_cliente` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Referencia` int NOT NULL,
  `Comprobante` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Status` int NOT NULL DEFAULT '0',
  `tipo_orden` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_cliente` (`Id_cliente`),
  KEY `idx_cliente` (`Id_cliente`),
  KEY `idx_fecha` (`fecha`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL,
  `tasa` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idRegistroVentas` (`id_venta`),
  KEY `idMetodoPago` (`id_metodo_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id_receta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`id_categoria`),
  KEY `id_receta` (`id_receta`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,2,'PEPITO TRADICIONAL','',7,'22CM de pan, salsas, tomate, lechuga, cebolla, solomo o pollo, tocineta, queso parmesano y ración de papas fritas.',1,0),(2,2,'PEPITO MIXTO','',11,'22CM de pan, salsas, tomate, lechuga, cebolla, solomo, pollo, chorizo, tocineta, queso amarillo, queso parmesano, queso cheddar, maíz y ración de papas fritas.',1,0),(3,2,'PEPITO GRATINADO','',9,'22CM de pan, salsas, solomo, pollo o chorizo, tocineta, queso mozzarella, queso cheddar y ración de papas fritas.',1,0),(4,2,'PEPITO ESPECIAL','',10,'22CM de pan, mayonesa, pollo y camarones, queso mozzarella gratinado, queso parmesano y ración de papas fritas.',1,0),(5,4,'PERRO TRADICIONAL','',2,'Pan grande, salchicha, salsas, repollo, cebolla y ración de papas fritas.',1,0),(6,4,'PERRO ESPECIAL','',3.5,'Pan grande, salchicha, salsas, tocineta, queso amarillo, maíz y ración de papas fritas.',1,0),(7,4,'PERRO CON CARNE','',4.5,'Pan grande, salchicha, salsas, carne, queso amarillo y ración de papas fritas.',1,0),(8,6,'CLUB HOUSE','',8,'Pan de sándwich, salsas, vegetales, pollo, jamón, queso, tocineta, tortilla de huevo y ración de papas fritas.',1,0),(9,3,'GRIEGO TRADICIONAL','',7.7,'Pan, salsas, vegetales, salchicha, carne, pollo o mixto, queso parmesano, tocineta, jamón, queso amarillo y ración de papas fritas.',1,0),(10,3,'GRIEGO ESPECIAL','',9,'Pan, salsas, vegetales, carne, pollo y camarones, queso parmesano y ración de papas fritas.',1,0),(11,5,'PAPAS CON CARNE','',7.5,'300gr de papas, 200gr de carne o mixta, queso amarillo, tocineta, salsas.',1,0),(12,5,'SALCHIPAPAS','',3.5,'300gr de papa, salchicha, cubiertas con queso cheddar con topping de tocineta.',1,0),(13,5,'PAPAS CHEDDAR','',2.8,'300gr de papas fritas, cubiertas de queso cheddar y tocineta.',1,0),(14,8,'MINI BURGER','',3,'Pan de la casa, salsas, carne, queso cheddar y ración de papas fritas.',1,0),(15,8,'TENDERS DE POLLO','',4,'Tenders de pollo, salsas y ración de papas fritas.',1,0),(16,7,'CLÁSICA','',2.8,'Pan de la casa, carne, tomate, lechuga, cebolla, salsas, ración de papas fritas.',1,0),(17,7,'CHEESE BURGER','',4.1,'Pan de la casa, carne o pollo, tomate, lechuga, cebolla, salsas, queso cheddar, tocineta y ración de papas fritas.',1,0),(18,7,'CHICKEN BURGER','',5.6,'Pan de la casa, pollo crispy, salsa especial, doble cheddar, doble tocineta, ración de papas fritas.',1,0),(19,7,'CRISPY BURGER','',4,'Pan de la casa, salsa especial, pollo crispy, queso cheddar, lechuga, tocineta, ración de papas fritas.',1,0),(20,7,'TENTACIÓN BURGER','',7,'Pan de la casa, carne, pollo, tomate, lechuga, cebolla, salsas, queso cheddar, tocineta, maíz y ración de papas fritas.',1,0),(21,7,'BACON JAM BURGER','',5,'Pan de papa, mayonesa, doble carne, doble cheddar, mermelada de tocineta, ración de papas fritas.',1,0),(22,7,'ONION BURGER','',4,'Pan de la casa, carne o pollo, salsa especial, cebolla caramelizada o cebolla crispy, queso cheddar, tocineta y ración de papas fritas.',1,0),(23,7,'BURGER HOUSE','',6.5,'Pan de la casa, salsa especial, carne, pollo crispy, cebolla crispy, cebolla caramelizada, tocineta, queso cheddar, maíz y ración de papas fritas.',1,0),(24,7,'BIG BURGER','',6.5,'Pan de la casa, doble carne, doble queso cheddar, salsa Big Mac, pepinillo, lechuga, tocineta y ración de papas fritas.',1,0),(25,7,'TASTY BURGER','',8,'Pan de papa, salsa tasty, triple carne, triple cheddar, tocineta, tomate, cebolla, lechuga, ración de papas fritas.',1,NULL),(26,7,'SMASH BURGER','',8.8,'Pan de papa, salsa especial, triple carne, triple cheddar, tocineta, cebolla morada, pepinillo, ración de papas fritas.',1,0),(27,1,'Luis','',6.56,'awdk;oakd;kaw;odk;ad',0,2),(28,1,'Azucar','',656.56,'alwjdildjiladjiljdildwada',0,2),(29,2,'Shawarma','',50,'mailmdilwmlidmlwiadl',0,1),(40,7,'Combo Prueba1','banner_login.png',2.5,'texto descriptivo',0,NULL),(46,7,'Big burger','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg',4,'hamburguesa con queso y tocineta',0,NULL),(47,8,'Hola','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg',0.85,'ggageagagaegagaegagageag',0,NULL),(48,8,'JOjsad','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg',69.86,'rwqrrrqrq3r3rqrqr',0,NULL),(49,8,'Jojsdad','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg',0.99,'wdwfwfwfwfwfwfwfwf',0,NULL),(50,8,'Prueba','5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg',5656.56,'fefle[slfsfseffsfs',0,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `razon_social` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `documento` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `n_telefono1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `n_telefono2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Luis Perez','Montecarmelo','E-5435543','+584126742231','','una direccion para especificar',1);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_producto` int DEFAULT NULL,
  `id_adicional` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_p_idx` (`id_producto`),
  KEY `id_adicional_idx` (`id_adicional`),
  CONSTRAINT `id_adicional` FOREIGN KEY (`id_adicional`) REFERENCES `adicionales` (`id`),
  CONSTRAINT `id_p` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `cantidad_personas` float NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario_reservacion_idx` (`id_usuario`),
  CONSTRAINT `id_usuario_reservacion` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (10,'SuperAdmin','Rol con acceso a todas las funciones del e-commerce',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `alias` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'Litro','Lt','1'),(2,'Gramo','Gr','1'),(3,'Kilogramo','Kg','1'),(4,'Unidad','Ud','1'),(5,'Mililitro','Ml','1'),(7,'Prueba','P','0'),(8,'Prueba1','1','0'),(9,'Prueba2','2','0'),(10,'Prueba3','2','0');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `documento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `session_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1',
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento_UNIQUE` (`documento`),
  KEY `idRol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (11,10,'Alejandro','Luisgv202*','Vargas','V-30087582',1,'1','garnicaluis391@gmail.com'),(13,10,'Pedro','Pedro25**','Perez','V-58963325',1,'1','pedro202@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_caja` int NOT NULL,
  `id_orden` int NOT NULL,
  `IVA` float NOT NULL,
  `monto_final` float NOT NULL,
  `fecha` datetime NOT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCaja` (`id_caja`),
  KEY `id-orden_idx` (`id_orden`),
  CONSTRAINT `id-orden` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`Id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-09 15:12:51
