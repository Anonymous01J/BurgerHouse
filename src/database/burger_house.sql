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
INSERT INTO `categorias_productos` VALUES (1,'Bebidas',1),(2,'Pepitos',1),(3,'Griegos',1),(4,'Perros Calientes',1),(5,'Papas',1),(6,'Club House',1),(7,'Burgers',1),(8,'Kids',1),(9,'Jira',0),(10,'Adicionales',0);
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
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jose','Escalona','+584126742231',1),(2,'Pedro','Escalona','+584161214717',0),(3,'Pedro ','Perex','+584162589318',1);
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
  KEY `id_usuario_delivery_idx` (`id_usuario_delivery`) /*!80000 INVISIBLE */,
  KEY `del_comb_1` (`id_venta`,`id_usuario_delivery`) /*!80000 INVISIBLE */,
  CONSTRAINT `id_usuario_delivery` FOREIGN KEY (`id_usuario_delivery`) REFERENCES `usuario` (`id`),
  CONSTRAINT `id_venta_delivery` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverys`
--

LOCK TABLES `deliverys` WRITE;
/*!40000 ALTER TABLE `deliverys` DISABLE KEYS */;
INSERT INTO `deliverys` VALUES (1,1,1),(2,2,3),(3,2,3);
/*!40000 ALTER TABLE `deliverys` ENABLE KEYS */;
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
-- Table structure for table `entradas_producto_procesado`
--

DROP TABLE IF EXISTS `entradas_producto_procesado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_producto_procesado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `id _proveedor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rov_idx` (`id _proveedor`),
  KEY `pro_idx` (`id_producto`),
  CONSTRAINT `pro` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`),
  CONSTRAINT `rov` FOREIGN KEY (`id _proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_producto_procesado`
--

LOCK TABLES `entradas_producto_procesado` WRITE;
/*!40000 ALTER TABLE `entradas_producto_procesado` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas_producto_procesado` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Mesa 2','5','LIBRE','0','29604004.jpg','1'),(2,'Mesa 45','10','OCUPADA','1','concepto-rpa-pantalla-tactil-mano-borrosa.jpg','1'),(3,'Mesa 9','4','LIBRE','0','5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg','0'),(4,'Mesa 10','7','LIBRE','1','championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg','0'),(5,'Mesa inf','58','LIBRE','0','depositphotos_66292255-stock-photo-dark-background-with-spotlights.jpg','1'),(6,'Mesa 99','10','LIBRE','1','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg','1');
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
  `active` tinyint NOT NULL DEFAULT '0',
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
-- Table structure for table `orden_mesa`
--

DROP TABLE IF EXISTS `orden_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_mesa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mesa` int DEFAULT NULL,
  `id_orden` int DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id5_idx` (`id_mesa`),
  KEY `id6_idx` (`id_orden`),
  CONSTRAINT `id5` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  CONSTRAINT `id6` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_mesa`
--

LOCK TABLES `orden_mesa` WRITE;
/*!40000 ALTER TABLE `orden_mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_reserva`
--

DROP TABLE IF EXISTS `orden_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_reserva` (
  `id` int NOT NULL,
  `id_orden` int DEFAULT NULL,
  `id_reserva` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id6_idx` (`id_orden`),
  KEY `id7_idx` (`id_reserva`),
  CONSTRAINT `id10` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id7` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_reserva`
--

LOCK TABLES `orden_reserva` WRITE;
/*!40000 ALTER TABLE `orden_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_reserva`
--

DROP TABLE IF EXISTS `pago_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_reserva` (
  `id` int NOT NULL,
  `id_reserva` int DEFAULT NULL,
  `id_metodo_pago` int DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `comprobante` varchar(45) DEFAULT NULL,
  `tasa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id8_idx` (`id_reserva`),
  KEY `id59_idx` (`id_metodo_pago`),
  CONSTRAINT `id59` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id8` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_reserva`
--

LOCK TABLES `pago_reserva` WRITE;
/*!40000 ALTER TABLE `pago_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_reserva` ENABLE KEYS */;
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
-- Table structure for table `producto_detalle_orden`
--

DROP TABLE IF EXISTS `producto_detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_detalle_orden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `adicionales` varchar(45) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id11_idx` (`id_producto`),
  KEY `id12_idx` (`id_orden`),
  CONSTRAINT `id11` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`),
  CONSTRAINT `id12` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_detalle_orden`
--

LOCK TABLES `producto_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_detalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_procesado_detalle_orden`
--

DROP TABLE IF EXISTS `producto_procesado_detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_procesado_detalle_orden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id12_idx` (`id_orden`),
  KEY `id110_idx` (`id_producto`),
  CONSTRAINT `id110` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id120` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_procesado_detalle_orden`
--

LOCK TABLES `producto_procesado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_procesado_detalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_procesado_detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_preparados`
--

DROP TABLE IF EXISTS `productos_preparados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_preparados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int DEFAULT NULL,
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tipo` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_preparados`
--

LOCK TABLES `productos_preparados` WRITE;
/*!40000 ALTER TABLE `productos_preparados` DISABLE KEYS */;
INSERT INTO `productos_preparados` VALUES (41,1,'hamburguesa','',20,'mucho detalle',1,'producto');
/*!40000 ALTER TABLE `productos_preparados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_procesados`
--

DROP TABLE IF EXISTS `productos_procesados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_procesados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id20_idx` (`id_categoria`),
  CONSTRAINT `id20` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_procesados`
--

LOCK TABLES `productos_procesados` WRITE;
/*!40000 ALTER TABLE `productos_procesados` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_procesados` ENABLE KEYS */;
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
INSERT INTO `proveedores` VALUES (1,'Luis Perez','Montecarmelo','V-5435543','+584126742231','','una direccion para especificar',1);
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
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_p_idx` (`id_producto`),
  CONSTRAINT `id_p` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (4,41);
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
  `id_cliente` int NOT NULL,
  `cantidad_personas` float NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id4_idx` (`id_cliente`),
  CONSTRAINT `id4` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'Litro','Lt','1'),(2,'Gramo','Gr','1'),(3,'Kilogramo','Kg','1'),(4,'Unidad','Ud','1'),(5,'Mililitro','Ml','1'),(7,'Prueba','P','0'),(8,'Prueba1','1','0'),(9,'Prueba2','2','0'),(10,'Prueba3','2','0'),(11,'PRUEBS','pr','1');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuari_cliente`
--

DROP TABLE IF EXISTS `usuari_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuari_cliente` (
  `id` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id1_idx` (`id_cliente`),
  KEY `id2_idx` (`id_usuario`),
  CONSTRAINT `id1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuari_cliente`
--

LOCK TABLES `usuari_cliente` WRITE;
/*!40000 ALTER TABLE `usuari_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuari_cliente` ENABLE KEYS */;
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `session_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1',
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idRol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (11,10,'Alejandro','Luisgv202*','Vargas',1,'1','garnicaluis391@gmail.com'),(13,10,'Pedro','Pedro25**','Perez',1,'1','pedro202@gmail.com');
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

-- Dump completed on 2025-05-17 12:22:52
