-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: burgerhouse
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
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `monto_inicial_dolar` float NOT NULL,
  `monto_inicial_bs` float NOT NULL,
  `monto_final_bs` float DEFAULT NULL,
  `monto_final_dolar` float DEFAULT NULL,
  `fecha_apertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `total_ventas` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (8,11,5,2,NULL,NULL,'2025-05-24 18:47:30',NULL,0,NULL),(10,11,10,1000,NULL,NULL,'2025-05-28 12:55:33',NULL,0,NULL),(11,11,10,1500,641664,10,'2025-06-17 12:19:25','2025-06-17 12:19:25',0,NULL),(13,11,150,500,880479,150,'2025-06-17 12:12:40','2025-06-17 12:12:40',0,NULL),(14,11,500,8.56,270650,500,'2025-06-17 12:13:45','2025-06-17 12:13:45',0,NULL),(15,11,31.51,646.84,1061120,31.51,'2025-06-17 12:15:17','2025-06-17 12:15:17',0,NULL),(16,11,500,500,497281,500,'2025-06-17 12:16:11','2025-06-17 12:16:11',0,NULL),(18,11,50,50,50,50,'2025-06-17 14:09:59','2025-06-17 19:03:25',0,NULL),(19,11,20,1000,1849440,44.7,'2025-06-18 09:41:30','2025-06-19 10:52:41',0,NULL),(20,11,10,255,1869020,10,'2025-06-19 10:52:52','2025-06-19 20:33:04',0,NULL),(21,11,500,250,NULL,NULL,'2025-06-20 10:15:08',NULL,1,NULL);
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
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capital`
--

LOCK TABLES `capital` WRITE;
/*!40000 ALTER TABLE `capital` DISABLE KEYS */;
INSERT INTO `capital` VALUES (1,43681.4,'2025-06-12 16:08:49');
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
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `documento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jose','Escalona','+584126742231',1,'V-30087582'),(2,'Pedro','Escalona','+584161214717',0,''),(3,'Pedro ','Perex','+584162589318',1,''),(4,'AMELIA','GARNICAR',NULL,1,'V-5435543'),(5,'FELIX','DOMINGUEZ',NULL,1,'V-30554404'),(6,'PETER','HOFER',NULL,1,'V-1000000'),(7,'KENDERSON','TORREALBA',NULL,0,'V-19572137'),(17,'JOSE','PEREZ',NULL,1,'V-30218990'),(18,'Rodrigo','Hernandezz','+584122578963',1,'E-14586325'),(19,'Nombre','Nombre','+584159949468',0,'E-4984894894'),(20,'Nombrequiza','Alomen','+584267959595',0,'V-468468468'),(21,'Otromas','Sadada','+584126468464',0,'V-68464648'),(22,'FRANCISCA','GUTIERREZ',NULL,1,'V-3087582'),(23,'ALI','PERNALETE',NULL,1,'V-30087583'),(24,'PEDRO','VARGAS',NULL,1,'V-10120693'),(25,'JOSE','LINARES',NULL,1,'V-10120694'),(26,'LORIANNYS','URDANETA',NULL,1,'V-30085263'),(27,'JEAN','PUENTE',NULL,1,'V-30120693'),(28,'EDITH','VARGAS',NULL,1,'V-2912734'),(29,'EDITH','VARGAS',NULL,1,'V-2912734');
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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario_delivery` int NOT NULL,
  `id_venta` int NOT NULL,
  `active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `asdfg_idx` (`id_usuario_delivery`),
  KEY `asdfgh_idx` (`id_venta`),
  CONSTRAINT `asdfgh` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,11,16,1),(2,11,15,1);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_receta`
--

DROP TABLE IF EXISTS `detalles_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_receta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_receta` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Id_receta` (`id_receta`,`id_materia_prima`),
  KEY `Id_materia_prima_ibfk_1` (`id_materia_prima`),
  CONSTRAINT `Id_materia_prima_ibfk_1` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Id_receta_prima_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_receta`
--

LOCK TABLES `detalles_receta` WRITE;
/*!40000 ALTER TABLE `detalles_receta` DISABLE KEYS */;
INSERT INTO `detalles_receta` VALUES (60,13,8,0.56),(65,15,9,1),(66,15,8,0.56),(67,15,5,1.2);
/*!40000 ALTER TABLE `detalles_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_materia_prima`
--

DROP TABLE IF EXISTS `entradas_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_materia_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` float NOT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `broken` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_provedor` (`id_proveedor`),
  KEY `id_materia_prima_idx` (`id_materia_prima`),
  CONSTRAINT `id_materia_prima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_materia_prima`
--

LOCK TABLES `entradas_materia_prima` WRITE;
/*!40000 ALTER TABLE `entradas_materia_prima` DISABLE KEYS */;
INSERT INTO `entradas_materia_prima` VALUES (6,'586325',1,7,'2025-05-19 12:33:41',96.36,'5959494','2025-07-31 00:00:00',10.5,10.5,'tutorials-9832-0-35951100-1501582894.png',1,0),(7,'56568468',1,8,'2025-06-06 11:24:27',25,'9780','2025-10-31 00:00:00',10.5,10.5,'M.E.R.png',1,0),(8,'68468484',1,8,'2025-06-12 15:44:58',70.58,'3515','2025-10-31 00:00:00',30,30,'M.E.R.png',0,0);
/*!40000 ALTER TABLE `entradas_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_materia_prima_AFTER_INSERT` AFTER INSERT ON `entradas_materia_prima` FOR EACH ROW BEGIN
	DECLARE total_egreso FLOAT;
    SET total_egreso = NEW.cantidad * NEW.precio_compra;
    INSERT INTO movimientos_capital (monto, descripcion)
    VALUES (-total_egreso, 'Egreso por nueva entradas');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_materia_prima_AFTER_UPDATE` AFTER UPDATE ON `entradas_materia_prima` FOR EACH ROW BEGIN
    DECLARE total_movimiento FLOAT;
    SET total_movimiento = NEW.cantidad * NEW.precio_compra;
    IF OLD.active = 1 AND NEW.active = 0 THEN
        INSERT INTO movimientos_capital (monto, descripcion)
        VALUES (total_movimiento,CONCAT('Egreso por eliminacion de entrada de materia prima nro ', NEW.id));

    ELSEIF OLD.active = 0 AND NEW.active = 1 THEN
        INSERT INTO movimientos_capital (monto, descripcion)
        VALUES (-total_movimiento,CONCAT('Ingreso por entrada de materia prima nro ', NEW.id));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entradas_producto_procesado`
--

DROP TABLE IF EXISTS `entradas_producto_procesado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_producto_procesado` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `active` int NOT NULL DEFAULT '1',
  `broken` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rov_idx` (`id_proveedor`),
  KEY `pro_idx` (`id_producto`),
  KEY `nose_fg_idx` (`id_unidad`),
  CONSTRAINT `nose_fg` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  CONSTRAINT `pro` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`),
  CONSTRAINT `rov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_producto_procesado`
--

LOCK TABLES `entradas_producto_procesado` WRITE;
/*!40000 ALTER TABLE `entradas_producto_procesado` DISABLE KEYS */;
INSERT INTO `entradas_producto_procesado` VALUES (18,'6462',42,1,4,'2025-06-06 13:20:37','2025-09-30 00:00:00',4.84,'9780',10,10,'banner_productos.png',1,0),(19,'6464',41,1,3,'2025-06-07 12:50:19','2025-07-11 00:00:00',5.63,'4646',26.66,26.66,'53571.jpg',1,0),(20,'7896',42,1,4,'2025-06-07 12:53:07','2025-12-03 00:00:00',58,'684648',10,10,'banner_productos.png',1,0),(21,'5486',42,1,4,'2025-06-12 16:03:46','2025-12-03 00:00:00',20.3,'6684',50,50,'banner_productos.png',1,0);
/*!40000 ALTER TABLE `entradas_producto_procesado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_producto_procesado_AFTER_INSERT` AFTER INSERT ON `entradas_producto_procesado` FOR EACH ROW BEGIN
	DECLARE total_egreso FLOAT;
    SET total_egreso = NEW.cantidad * NEW.precio_compra;
    INSERT INTO movimientos_capital (monto, descripcion)
    VALUES (-total_egreso, 'Egreso por nueva entradas');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_producto_procesado_AFTER_UPDATE` AFTER UPDATE ON `entradas_producto_procesado` FOR EACH ROW BEGIN
 DECLARE total_movimiento FLOAT;
    SET total_movimiento = NEW.cantidad * NEW.precio_compra;
    IF OLD.active = 1 AND NEW.active = 0 THEN
        INSERT INTO movimientos_capital (monto, descripcion)
        VALUES (total_movimiento,CONCAT('Ingreso por eliminacion de entrada de producto procesado nro ', NEW.id));

    ELSEIF OLD.active = 0 AND NEW.active = 1 THEN
        INSERT INTO movimientos_capital (monto, descripcion)
        VALUES (-total_movimiento,CONCAT('Egreso por entrada de producto procesado nro ', NEW.id));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `existencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '0',
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
INSERT INTO `materia_prima` VALUES (1,1,3,'Pollo',10,20,'0',1),(2,1,3,'Carne de res',10,20,'0',1),(3,3,3,'Cebolla',10,20,'0',1),(4,3,3,'Maíz',10,20,'0',1),(5,7,4,'Queso cheddar',10,20,'3.999999761581421',1),(6,4,3,'Salsa especial',10,20,'0',1),(7,1,3,'Tocineta',10,20,'0',1),(8,3,3,'Papas',10,20,'4.399999976158142',1),(9,2,4,'Pan de la casa',10,20,'5',1),(10,3,3,'Prueba',1,5,'0',1),(11,7,5,'CONSOLA',2,10,'0',0),(12,6,4,'CONN',2,3,'0',0);
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
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sillas` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LIBRE',
  `vip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Mesa 2','5','LIBRE','0','29604004.jpg','1'),(2,'Mesa 45','10','OCUPADA','1','concepto-rpa-pantalla-tactil-mano-borrosa.jpg','1'),(3,'Mesa 9','4','LIBRE','0','5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg','1'),(4,'Mesa 10','7','LIBRE','1','championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg','0'),(5,'Mesa inf','58','LIBRE','0','depositphotos_66292255-stock-photo-dark-background-with-spotlights.jpg','1'),(6,'Mesa 99','10','LIBRE','1','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg','1');
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
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Zelle',0,NULL,NULL),(2,'Binance',0,NULL,NULL),(3,'Pago Movil',1,NULL,NULL),(4,'Efectivo',1,NULL,NULL),(9,'Prueba infinity',0,NULL,NULL),(10,'Prueba 2',0,NULL,NULL),(11,'Transferencia',1,NULL,NULL),(12,'Divisa',1,NULL,NULL),(13,'Zinli',0,NULL,NULL),(14,'Cashea',0,NULL,NULL);
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
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_capital`
--

LOCK TABLES `movimientos_capital` WRITE;
/*!40000 ALTER TABLE `movimientos_capital` DISABLE KEYS */;
INSERT INTO `movimientos_capital` VALUES (1,50.58,'Ingreso por venta','2025-06-12 15:38:52'),(2,-2117.4,'Egreso por nuevas entradas','2025-06-12 15:44:58'),(4,-2117.4,'Ingreso por entrada de materia prima nro 8','2025-06-12 16:00:05'),(6,609,'Ingreso por eliminacion de entrada de producto procesado nro 20','2025-06-12 16:29:51'),(7,-609,'Egreso por entrada de producto procesado nro 20','2025-06-12 16:29:51'),(8,-1015,'Egreso por nueva entradas','2025-06-12 16:03:46'),(9,10000,'Ingreso por aporte de alidado','2025-06-12 16:14:45'),(12,10,'aporte de aliado','2025-06-13 15:06:38'),(13,-10,'me gaste en un toston','2025-06-13 15:07:46'),(14,4796.41,'Ingreso por venta','2025-06-16 14:51:05'),(15,66.36,'Ingreso por venta','2025-06-16 15:56:19'),(16,24.7,'Ingreso por venta','2025-06-18 09:42:46'),(17,760.34,'Ingreso por venta','2025-06-18 09:46:31'),(18,2385.19,'Ingreso por venta','2025-06-18 09:59:39'),(19,940.26,'Ingreso por venta','2025-06-18 10:02:22'),(20,4770.38,'Ingreso por venta','2025-06-18 10:03:42'),(21,888.85,'Ingreso por venta','2025-06-18 10:05:11'),(22,1584.34,'Ingreso por venta','2025-06-18 10:08:35'),(23,734.64,'Ingreso por venta','2025-06-18 10:10:25'),(24,2385.19,'Ingreso por venta','2025-06-18 10:11:50'),(25,2385.19,'Ingreso por venta','2025-06-18 10:12:55'),(26,1144.85,'Ingreso por venta','2025-06-18 14:10:10'),(27,2463.82,'Ingreso por venta','2025-06-19 10:53:54'),(28,2463.82,'Ingreso por venta','2025-06-19 10:53:54'),(29,741.28,'Ingreso por venta','2025-06-19 17:18:44'),(30,2463.82,'Ingreso por venta','2025-06-19 17:19:52'),(31,2463.82,'Ingreso por venta','2025-06-19 17:19:52'),(32,799.38,'Ingreso por venta','2025-06-19 17:21:58'),(33,274.87,'Ingreso por venta','2025-06-19 17:23:21'),(34,2432.7,'Ingreso por venta','2025-06-19 17:24:07'),(35,482.35,'Ingreso por venta','2025-06-19 17:27:33'),(36,2463.82,'Ingreso por venta','2025-06-19 17:28:35'),(37,896.89,'Ingreso por venta','2025-06-19 17:30:49'),(38,67.39,'Ingreso por venta','2025-06-19 17:31:38'),(39,-2000,'no se mucho','2025-06-20 10:16:04');
/*!40000 ALTER TABLE `movimientos_capital` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `movimientos_capital_AFTER_INSERT` AFTER INSERT ON `movimientos_capital` FOR EACH ROW BEGIN
UPDATE capital SET monto = monto + NEW.monto WHERE id = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_orden` float NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '0',
  `tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Id_cliente` (`id_cliente`),
  KEY `idx_cliente` (`id_cliente`),
  KEY `idx_fecha` (`fecha`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (33,83599400,1,'2025-06-06 18:41:50',0,'delivery'),(34,10466000,1,'2025-06-06 18:41:50',0,'delivery'),(38,93000700,1,'2025-06-06 18:59:34',1,'delivery'),(39,61130500,1,'2025-06-06 21:51:37',0,'delivery'),(40,42777800,1,'2025-06-06 21:51:37',0,'llevar'),(41,84542000,1,'2025-06-10 19:56:04',1,'delivery'),(42,82779000,1,'2025-06-11 16:09:06',1,'delivery'),(43,64880000,1,'2025-06-11 16:09:07',1,'llevar'),(44,86455600,1,'2025-06-11 16:11:32',1,'delivery'),(45,28000700,4,'2025-06-11 16:14:19',1,'llevar'),(46,87932200,23,'2025-06-11 16:16:59',1,'delivery'),(47,67066000,24,'2025-06-16 18:51:04',1,'delivery'),(48,12803500,1,'2025-06-16 19:56:18',1,'delivery'),(49,23945500,1,'2025-06-18 13:42:45',1,'delivery'),(50,51879300,4,'2025-06-18 13:46:30',1,'delivery'),(51,11611100,4,'2025-06-18 13:59:38',1,'delivery'),(52,17550100,24,'2025-06-18 14:02:22',1,'delivery'),(53,15790600,25,'2025-06-18 14:03:41',1,'delivery'),(54,12817500,26,'2025-06-18 14:05:11',1,'delivery'),(55,30227400,27,'2025-06-18 14:08:34',1,'delivery'),(56,16514200,1,'2025-06-18 14:10:24',1,'delivery'),(57,47128400,1,'2025-06-18 14:11:49',1,'delivery'),(58,40975500,4,'2025-06-18 14:18:16',2,'delivery'),(59,51894300,1,'2025-06-18 18:10:08',1,'delivery'),(60,96940300,1,'2025-06-19 14:53:53',1,'delivery'),(61,68109000,1,'2025-06-19 14:53:54',1,'llevar'),(62,37360500,4,'2025-06-19 21:18:43',1,'llevar'),(63,86910200,1,'2025-06-19 21:19:50',1,'llevar'),(64,12831900,1,'2025-06-19 21:19:51',1,'delivery'),(65,72340500,24,'2025-06-19 21:21:58',1,'delivery'),(66,16909800,29,'2025-06-19 21:23:21',1,'llevar'),(67,71179100,1,'2025-06-19 21:24:07',1,'llevar'),(68,85653700,1,'2025-06-19 21:27:33',1,'delivery'),(69,70574200,4,'2025-06-19 21:28:34',1,'delivery'),(70,43371500,1,'2025-06-19 21:30:49',1,'delivery'),(71,48200700,29,'2025-06-19 21:31:38',1,'llevar');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
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
  `comprobante` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tasa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id8_idx` (`id_reserva`),
  KEY `id59_idx` (`id_metodo_pago`),
  CONSTRAINT `id59` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id8` FOREIGN KEY (`id_reserva`) REFERENCES `reservaciones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tasa` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idRegistroVentas` (`id_venta`),
  KEY `idMetodoPago` (`id_metodo_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (4,15,11,85.65,'2025-05-28 11:38:22',95.81,'cap.jpg','52662'),(5,16,11,6595.95,'2025-05-28 13:41:29',95.81,'cap.jpg','5684684'),(6,17,3,6156.88,'2025-06-06 15:10:53',98.51,'modelo_caja.png','5454'),(7,18,3,2776.01,'2025-06-06 16:54:58',98.51,'cap.jpg','6466'),(8,19,3,2730.44,'2025-06-10 15:56:07',99.12,'cap.jpg','64868'),(9,20,3,2486.52,'2025-06-11 12:09:08',99.7,'cap.jpg','5468'),(10,21,3,2486.52,'2025-06-11 12:09:08',99.7,'cap.jpg','5468'),(11,22,3,2517.43,'2025-06-11 12:11:33',99.7,'cap.jpg','8484'),(12,23,3,3025.46,'2025-06-11 12:14:19',99.7,'cap.jpg','64864'),(13,24,3,64.77,'2025-06-11 12:17:01',99.7,'cap.jpg','5161'),(17,24,3,50.58,'2025-06-11 12:17:01',100,'cap.jpg','5689'),(18,25,11,4796.41,'2025-06-16 14:51:05',102.16,'cap.jpg','6468'),(19,26,3,66.36,'2025-06-16 15:56:19',102.16,'cap.jpg','6468'),(20,27,12,24.7,'2025-06-18 09:42:46',102.81,'cap.jpg','6768'),(21,28,3,760.34,'2025-06-18 09:46:31',102.81,'cap.jpg','8956'),(22,29,11,2385.19,'2025-06-18 09:59:39',102.81,'cap.jpg','6468'),(23,30,11,940.26,'2025-06-18 10:02:22',102.81,'cap.jpg','6446'),(24,31,11,4770.38,'2025-06-18 10:03:42',102.81,'cap.jpg','6468'),(25,32,3,888.85,'2025-06-18 10:05:11',102.81,'cap.jpg','7413'),(26,33,3,1584.34,'2025-06-18 10:08:35',102.81,'cap.jpg','6468'),(27,34,11,734.64,'2025-06-18 10:10:25',102.81,'cap.jpg','8623'),(28,35,11,2385.19,'2025-06-18 10:11:50',102.81,'cap.jpg','8961'),(29,36,11,2385.19,'2025-06-18 10:12:55',102.81,'cap.jpg','5236'),(30,37,3,1144.85,'2025-06-18 14:10:10',102.81,'cap.jpg','9318'),(31,38,3,2463.82,'2025-06-19 10:53:54',103.74,'cap.jpg','6846'),(32,39,3,2463.82,'2025-06-19 10:53:54',103.74,'cap.jpg','6846'),(33,40,3,741.28,'2025-06-19 17:18:44',103.74,'cap.jpg','9874'),(34,41,3,2463.82,'2025-06-19 17:19:52',103.74,'cap.jpg','3656'),(35,42,3,2463.82,'2025-06-19 17:19:52',103.74,'cap.jpg','3656'),(36,43,3,799.38,'2025-06-19 17:21:58',103.74,'cap.jpg','2012'),(37,44,11,274.87,'2025-06-19 17:23:21',103.74,'cap.jpg','7316'),(38,45,11,2432.7,'2025-06-19 17:24:07',103.74,'cap.jpg','7714'),(39,46,11,482.35,'2025-06-19 17:27:33',103.74,'cap.jpg','1848'),(40,47,11,2463.82,'2025-06-19 17:28:35',103.74,'cap.jpg','8797'),(41,48,3,896.89,'2025-06-19 17:30:49',103.74,'cap.jpg','9484'),(42,49,3,67.39,'2025-06-19 17:31:38',103.74,'cap.jpg','6742');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagos_AFTER_INSERT` AFTER INSERT ON `pagos` FOR EACH ROW BEGIN
	INSERT INTO movimientos_capital (monto, descripcion)
    VALUES (NEW.monto, "Ingreso por venta");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto_preparado_detalle_orden`
--

DROP TABLE IF EXISTS `producto_preparado_detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_preparado_detalle_orden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `adicionales` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id11_idx` (`id_producto`),
  KEY `id12_idx` (`id_orden`),
  CONSTRAINT `id11` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`),
  CONSTRAINT `id12` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_preparado_detalle_orden`
--

LOCK TABLES `producto_preparado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_preparado_detalle_orden` DISABLE KEYS */;
INSERT INTO `producto_preparado_detalle_orden` VALUES (51,41,33,'1',NULL,'Salsa Inglesa,Nuggets',1),(52,48,33,'1',NULL,NULL,1),(53,50,33,'1',NULL,NULL,1),(54,45,34,'1',NULL,'Salsa Inglesa',1),(55,41,34,'1',NULL,'Carne',1),(56,46,34,'1',NULL,NULL,1),(57,50,34,'1',NULL,NULL,1),(62,41,38,'1',NULL,'Ensalada,Nuggets',1),(63,41,39,'2',NULL,'Nuggets,Papitas',1),(64,47,39,'2',NULL,NULL,1),(65,48,39,'2',NULL,NULL,1),(66,41,40,'1',NULL,'Ensalada',1),(67,49,40,'1',NULL,NULL,1),(68,52,41,'1',NULL,'Salsa Inglesa,Carne',1),(69,52,41,'2',NULL,'Jamon',1),(70,46,41,'1',NULL,NULL,1),(71,50,41,'1',NULL,NULL,1),(72,51,41,'2',NULL,NULL,1),(73,41,42,'1',NULL,'',1),(74,41,43,'1',NULL,'',1),(75,41,44,'1',NULL,'Salsa Inglesa,Ensalada',1),(76,49,44,'1',NULL,NULL,1),(77,50,44,'1',NULL,NULL,1),(78,52,45,'1',NULL,'',1),(79,41,45,'1',NULL,'',1),(80,45,46,'1',NULL,'',1),(81,41,47,'1',NULL,'Salsa Inglesa',1),(82,41,47,'1',NULL,'',1),(83,50,47,'1',NULL,NULL,1),(84,45,48,'1',NULL,'',1),(85,41,49,'1',NULL,'Ensalada',1),(86,49,49,'1',NULL,NULL,1),(87,52,50,'1',NULL,'Papitas',1),(88,47,50,'1',NULL,NULL,1),(89,41,51,'1','sin carne','',1),(90,52,52,'1','sin carne','Nuggets',1),(91,48,52,'1',NULL,NULL,1),(92,41,53,'2','','',1),(93,52,54,'1','','Ensalada',1),(94,49,54,'1',NULL,NULL,1),(95,52,55,'2','','Carne',1),(96,46,55,'2',NULL,NULL,1),(97,52,56,'1','','',1),(98,41,57,'1','','',1),(99,41,58,'1','','',1),(100,52,59,'1','sin pepino','Papitas,Nuggets',1),(101,47,59,'1',NULL,NULL,1),(102,48,59,'1',NULL,NULL,1),(103,41,60,'1','','Salsa Inglesa',1),(104,50,60,'1',NULL,NULL,1),(105,41,61,'1','','Salsa Inglesa',1),(106,50,61,'1',NULL,NULL,1),(107,52,62,'1','','',1),(108,41,63,'1','','Salsa Inglesa',1),(109,50,63,'1',NULL,NULL,1),(110,41,64,'1','','Salsa Inglesa',1),(111,50,64,'1',NULL,NULL,1),(112,52,65,'1','','Carne',1),(113,46,65,'1',NULL,NULL,1),(114,45,66,'1','','Nuggets',1),(115,48,66,'1',NULL,NULL,1),(116,41,67,'1','','Papitas',1),(117,47,67,'1',NULL,NULL,1),(118,45,68,'1','','Jamon,Ensalada',1),(119,49,68,'1',NULL,NULL,1),(120,51,68,'1',NULL,NULL,1),(121,41,69,'1','','Salsa Inglesa',1),(122,50,69,'1',NULL,NULL,1),(123,52,70,'1','','Ensalada',1),(124,49,70,'1',NULL,NULL,1),(125,45,71,'1','','',1);
/*!40000 ALTER TABLE `producto_preparado_detalle_orden` ENABLE KEYS */;
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
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id12_idx` (`id_orden`),
  KEY `id110_idx` (`id_producto`),
  CONSTRAINT `id110` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id568` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_procesado_detalle_orden`
--

LOCK TABLES `producto_procesado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_procesado_detalle_orden` DISABLE KEYS */;
INSERT INTO `producto_procesado_detalle_orden` VALUES (10,41,39,'2'),(11,42,40,'2'),(12,42,42,'1'),(13,42,43,'1'),(14,42,59,'1');
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
  `id_categoria` int NOT NULL DEFAULT '10',
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_preparados`
--

LOCK TABLES `productos_preparados` WRITE;
/*!40000 ALTER TABLE `productos_preparados` DISABLE KEYS */;
INSERT INTO `productos_preparados` VALUES (41,1,'Hamburguesa sencilla','banner_captcha.png',20,'mucho detalle aqui',1,'producto'),(42,7,'Pruba','7893000979932.jpg',0.56,'dadkawpdkpoakdokada',0,'producto'),(43,7,'Ninncwda','7702535011805-20-281-29.webp',74.87,'dawdalwdmawldmwadaw',0,'producto'),(44,7,'SWSADA','harina-pan.jpg',0.56,'DAWDADAWDADADADA',0,'producto'),(45,7,'Super Smasher Burguer','ImgThumb.jpg',0.56,'mucha descripcion',1,'producto'),(46,10,'Carne','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg',0.56,NULL,1,'adicional'),(47,10,'Papitas','DIABLITOS-UNDERWOOD.jpg',0.25,NULL,1,'adicional'),(48,10,'Nuggets','arroz.jpeg',2,NULL,1,'adicional'),(49,10,'Ensalada','7594005430045.jpg',1.5,NULL,1,'adicional'),(50,10,'Salsa Inglesa','harina-pan.jpg',0.55,NULL,1,'adicional'),(51,10,'Jamon','7502223708136_1.jpg',2.5,NULL,1,'adicional'),(52,5,'Smash Burger','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg',6.16,'dawdawdawdawdadawd',1,'producto');
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
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` float NOT NULL,
  `detalles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id20_idx` (`id_categoria`),
  CONSTRAINT `id20` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_procesados`
--

LOCK TABLES `productos_procesados` WRITE;
/*!40000 ALTER TABLE `productos_procesados` DISABLE KEYS */;
INSERT INTO `productos_procesados` VALUES (41,'Gloup 1L','ImgThumb.jpg',5,'dawdwdwadascacacac',1,1),(42,'Coca colaa','OIP.jpeg',1.5,'Coca cola de 1.5L',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Luis Perez','Montecarmelo','V-5435543','+584126742231','','una direccion para especificar',1),(2,'Lucas Martinez','El tunal','V-10254789','+584126879568','','sede central de tunal, quibor',1);
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
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_p_idx` (`id_producto`),
  CONSTRAINT `NON0ON` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (13,41,1),(15,45,1);
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
  `descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `metodo_pedido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id4_idx` (`id_cliente`),
  CONSTRAINT `id4` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
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
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_caja` int NOT NULL,
  `id_orden` int NOT NULL,
  `IVA` float DEFAULT NULL,
  `monto_final` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idCaja` (`id_caja`),
  KEY `id-orden_idx` (`id_orden`),
  CONSTRAINT `srxtrxrxr` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (15,11,33,NULL,25.75,'2025-05-28 11:38:22','mi casa',1),(16,11,34,NULL,24.96,'2025-05-28 13:41:29','en mi casa',1),(17,13,39,NULL,62.5,'2025-06-06 15:10:53','en frente de mi casa',1),(18,13,40,NULL,28.18,'2025-06-06 16:54:58','por algun lado',1),(19,14,41,NULL,27.55,'2025-06-10 15:56:07','en mi casa en no way home',1),(20,15,42,NULL,24.94,'2025-06-11 12:09:08','EN BURGER HOUSE',1),(21,15,43,NULL,24.94,'2025-06-11 12:09:08','EN BURGER HOUSE',1),(22,15,44,NULL,25.25,'2025-06-11 12:11:33','NOSE',1),(23,15,45,NULL,30.35,'2025-06-11 12:14:19','nose',1),(24,15,46,NULL,0.65,'2025-06-11 12:16:59','en algun laado',1),(25,16,47,NULL,46.95,'2025-06-16 14:51:05','carrera 10 entre 15 y 17',1),(26,16,48,NULL,0.65,'2025-06-16 15:56:19','en mi casa',1),(27,19,49,NULL,24.7,'2025-06-18 09:42:45','en mi casa',1),(28,19,50,NULL,7.4,'2025-06-18 09:46:31','avenida fraternidad',1),(29,19,51,NULL,23.2,'2025-06-18 09:59:39','naada',1),(30,19,52,NULL,9.15,'2025-06-18 10:02:22','avenida circunvalacion',1),(31,19,53,NULL,46.4,'2025-06-18 10:03:41','nada en peuba',1),(32,19,54,NULL,8.65,'2025-06-18 10:05:11','direccion cualquiera',1),(33,19,55,NULL,15.41,'2025-06-18 10:08:34','nada nuevo',1),(34,19,56,NULL,7.15,'2025-06-18 10:10:24','nda',1),(35,19,57,NULL,23.2,'2025-06-18 10:11:50','ioom',1),(36,19,58,NULL,23.2,'2025-06-18 10:12:55','pokpok',1),(37,19,59,NULL,11.14,'2025-06-18 14:10:09','en frente de mi casa',1),(38,20,60,NULL,23.75,'2025-06-19 10:53:54','villa acropolis casa #6',1),(39,20,61,NULL,23.75,'2025-06-19 10:53:54','villa acropolis casa #6',1),(40,20,62,NULL,7.15,'2025-06-19 17:18:44','NADA EN ESPECIAL',1),(41,20,63,NULL,23.75,'2025-06-19 17:19:52','NILN',1),(42,20,64,NULL,23.75,'2025-06-19 17:19:52','NILN',1),(43,20,65,NULL,7.71,'2025-06-19 17:21:58','nlin',1),(44,20,66,NULL,2.65,'2025-06-19 17:23:21','erxexe',1),(45,20,67,NULL,23.45,'2025-06-19 17:24:07','adwd',1),(46,20,68,NULL,4.65,'2025-06-19 17:27:33','dadw',1),(47,20,69,NULL,23.75,'2025-06-19 17:28:35','nada',1),(48,20,70,NULL,8.65,'2025-06-19 17:30:49','nada',1),(49,20,71,NULL,0.65,'2025-06-19 17:31:38','nada en particular',1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_inventario_materia_prima`
--

DROP TABLE IF EXISTS `vista_inventario_materia_prima`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_materia_prima`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_materia_prima` AS SELECT 
 1 AS `id_materia_prima`,
 1 AS `materia_prima`,
 1 AS `categoria`,
 1 AS `unidad`,
 1 AS `existencia_actual`,
 1 AS `stock_min`,
 1 AS `stock_max`,
 1 AS `valor_total`,
 1 AS `estado`,
 1 AS `estado_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_inventario_productos_procesados`
--

DROP TABLE IF EXISTS `vista_inventario_productos_procesados`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_productos_procesados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_productos_procesados` AS SELECT 
 1 AS `id_producto`,
 1 AS `producto`,
 1 AS `categoria`,
 1 AS `unidad`,
 1 AS `existencia_actual`,
 1 AS `valor_total`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resumen_clientes`
--

DROP TABLE IF EXISTS `vista_resumen_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_clientes` AS SELECT 
 1 AS `cliente`,
 1 AS `apellido`,
 1 AS `telefono`,
 1 AS `ultima_orden`,
 1 AS `total_gastado`,
 1 AS `producto_1`,
 1 AS `imagen_1`,
 1 AS `producto_2`,
 1 AS `imagen_2`,
 1 AS `producto_3`,
 1 AS `imagen_3`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resumen_financiero`
--

DROP TABLE IF EXISTS `vista_resumen_financiero`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_financiero`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_financiero` AS SELECT 
 1 AS `ingresos`,
 1 AS `ventas`,
 1 AS `gastos`,
 1 AS `utilidad_neta`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'burgerhouse'
--
/*!50003 DROP PROCEDURE IF EXISTS `Caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Caja`(IN idCaja INT)
BEGIN
    SELECT 
        mp.id AS id_metodo_pago,
        mp.nombre AS metodo_pago,
        CONCAT(c.nombre, ' ', c.apellido) AS cliente,
        COALESCE(pc.monto, 0) AS monto,
        pc.tasa,
        pc.fecha,
        pc.nro_orden
    FROM metodo_pago mp
    LEFT JOIN (
        SELECT 
            p.id_metodo_pago,
            p.monto,
            p.tasa,
            p.fecha,
            p.referencia,
            p.comprobante,
            o.id_cliente,
            o.nro_orden
        FROM pagos p
        INNER JOIN ventas v ON p.id_venta = v.id
        INNER JOIN orden o ON v.id_orden = o.id
        WHERE v.id_caja = idCaja
    ) AS pc ON pc.id_metodo_pago = mp.id
    LEFT JOIN clientes c ON pc.id_cliente = c.id
	WHERE mp.active = 1
    ORDER BY mp.id, cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CerrarCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CerrarCaja`(IN cajaId INT)
BEGIN
    DECLARE inicial_bs FLOAT DEFAULT 0;
    DECLARE inicial_dolar FLOAT DEFAULT 0;
    DECLARE total_bs FLOAT DEFAULT 0;
    DECLARE total_dolar FLOAT DEFAULT 0;
    DECLARE total_dolar_en_bs FLOAT DEFAULT 0;
    DECLARE tasa_promedio_dolar FLOAT DEFAULT 0;

    -- Obtener montos iniciales
    SELECT monto_inicial_bs, monto_inicial_dolar
    INTO inicial_bs, inicial_dolar
    FROM caja
    WHERE id = cajaId;

    -- Total en Bs (pagos nacionales)
    SELECT IFNULL(SUM(p.monto), 0) INTO total_bs
    FROM pagos p
    JOIN ventas v ON v.id = p.id_venta
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE v.id_caja = cajaId AND m.nombre NOT IN ('Zelle', 'Binance', 'Divisa');

    -- Total en $ (solo pagos en divisas)
    SELECT IFNULL(SUM(p.monto), 0) INTO total_dolar
    FROM pagos p
    JOIN ventas v ON v.id = p.id_venta
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE v.id_caja = cajaId AND m.nombre IN ('Zelle', 'Binance', 'Divisa');

    -- Total en $ convertido a Bs usando su tasa individual
    SELECT IFNULL(SUM(p.monto * p.tasa), 0) INTO total_dolar_en_bs
    FROM pagos p
    JOIN ventas v ON v.id = p.id_venta
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE v.id_caja = cajaId AND m.nombre NOT IN ('Zelle', 'Binance', 'Divisa');

    -- Tasa promedio de los pagos en dólares (por si se desea convertir el inicial_dolar a Bs)
    SELECT IFNULL(AVG(p.tasa), 0) INTO tasa_promedio_dolar
    FROM pagos p
    JOIN ventas v ON v.id = p.id_venta
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE v.id_caja = cajaId AND m.nombre NOT IN ('Zelle', 'Binance', 'Divisa');

    -- Actualizar la caja
    UPDATE caja
    SET 
        monto_final_bs = inicial_bs +  (total_bs * tasa_promedio_dolar),
        monto_final_dolar = inicial_dolar + total_dolar,
        fecha_cierre = NOW(),
        estado = 0
    WHERE id = cajaId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gastoClienteAnual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoClienteAnual`(IN p_anio INT)
BEGIN
    -- Tabla derivada con los 12 meses y sus nombres en español
    WITH meses AS (
        SELECT 1 AS mes_numero, 'Enero' AS nombre UNION
        SELECT 2, 'Febrero' UNION
        SELECT 3, 'Marzo' UNION
        SELECT 4, 'Abril' UNION
        SELECT 5, 'Mayo' UNION
        SELECT 6, 'Junio' UNION
        SELECT 7, 'Julio' UNION
        SELECT 8, 'Agosto' UNION
        SELECT 9, 'Septiembre' UNION
        SELECT 10, 'Octubre' UNION
        SELECT 11, 'Noviembre' UNION
        SELECT 12, 'Diciembre'
    ),

    -- Totales y promedios diarios por mes
    ventas_por_mes AS (
        SELECT 
            MONTH(fecha) AS mes_numero,
            SUM(monto_final) AS total_mes,
            COUNT(DISTINCT DATE(fecha)) AS dias_con_ventas,
            SUM(monto_final) / COUNT(DISTINCT DATE(fecha)) AS promedio_diario
        FROM ventas
        WHERE YEAR(fecha) = p_anio
        GROUP BY MONTH(fecha)
    )

    SELECT
        m.nombre AS mes,
        m.mes_numero,
        ROUND(COALESCE(v.total_mes, 0), 2) AS total_mes,
        ROUND(COALESCE(v.promedio_diario, 0), 2) AS promedio_diario
    FROM meses m
    LEFT JOIN ventas_por_mes v ON m.mes_numero = v.mes_numero
    ORDER BY m.mes_numero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gastoClienteMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoClienteMes`(IN p_anio INT, IN p_mes INT)
BEGIN
 DECLARE fecha_inicio DATE;
    DECLARE fecha_fin DATE;

    -- Localización en español
    SET lc_time_names = 'es_ES';

    -- Primer y último día del mes dado
    SET fecha_inicio = DATE(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01'));
    SET fecha_fin = LAST_DAY(fecha_inicio);

    -- Crear tabla temporal de fechas
    DROP TEMPORARY TABLE IF EXISTS fechas_mes;
    CREATE TEMPORARY TABLE fechas_mes (
        fecha DATE,
        semana_iso INT
    );

    -- Insertar cada día del mes con su semana ISO
    WHILE fecha_inicio <= fecha_fin DO
        INSERT INTO fechas_mes (fecha, semana_iso)
        VALUES (fecha_inicio, WEEK(fecha_inicio, 3));
        SET fecha_inicio = DATE_ADD(fecha_inicio, INTERVAL 1 DAY);
    END WHILE;

    -- Obtener resumen por semana
    SELECT 
        semana_iso AS semana,
        MIN(f.fecha) AS inicio_semana,
        MAX(f.fecha) AS fin_semana,
        ROUND(SUM(IFNULL(v.monto_final, 0)), 2) AS total_semana
    FROM fechas_mes f
    LEFT JOIN ventas v ON DATE(v.fecha) = f.fecha
    GROUP BY semana_iso
    ORDER BY semana_iso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GastoClienteSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GastoClienteSemana`(
    IN p_anio INT,
    IN p_semana INT
)
BEGIN
    DECLARE target_yearweek INT;

    -- Construir YEARWEEK ISO (YYYYWW)
    SET target_yearweek = p_anio * 100 + p_semana;

    WITH 
    RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio,'-01-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE fecha < DATE(CONCAT(p_anio,'-12-31'))
    ),
    semana_iso AS (
        SELECT fecha
        FROM calendario
        WHERE YEARWEEK(fecha,1) = target_yearweek
    ),
    dias_nombres AS (
        SELECT 1 AS dia_orden, 'Lunes'    AS dia_nombre UNION ALL
        SELECT 2, 'Martes'    UNION ALL
        SELECT 3, 'Miércoles' UNION ALL
        SELECT 4, 'Jueves'    UNION ALL
        SELECT 5, 'Viernes'   UNION ALL
        SELECT 6, 'Sábado'    UNION ALL
        SELECT 7, 'Domingo'
    ),
    dias_semana AS (
        SELECT
          si.fecha,
          WEEKDAY(si.fecha) + 1      AS dia_orden,
          dn.dia_nombre
        FROM semana_iso si
        JOIN dias_nombres dn ON dn.dia_orden = WEEKDAY(si.fecha) + 1
    )

    SELECT
        ds.dia_nombre               AS dia,
        DATE_FORMAT(ds.fecha, '%Y-%m-%d') AS fecha,
        ROUND(SUM(IFNULL(v.monto_final, 0)), 2)   AS total_dia
    FROM dias_semana ds
    LEFT JOIN ventas v
      ON DATE(v.fecha) = ds.fecha
    GROUP BY
        ds.dia_orden,
        ds.dia_nombre,
        ds.fecha
    ORDER BY
        ds.dia_orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerPagosPorCaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPagosPorCaja`(IN idCaja INT)
BEGIN
    SELECT 
        mp.id AS id_metodo_pago,
        mp.nombre AS metodo_pago,
        c.id AS id_cliente,
        CONCAT(c.nombre, ' ', c.apellido) AS cliente,
        c.telefono,
        COALESCE(p.monto, 0) AS monto,
        p.fecha,
		p.tasa
    FROM metodo_pago mp
    LEFT JOIN pagos p ON p.id_metodo_pago = mp.id
    LEFT JOIN ventas v ON p.id_venta = v.id AND v.id_caja = idCaja
    LEFT JOIN orden o ON v.id_orden = o.id
    LEFT JOIN clientes c ON o.id_cliente = c.id
    WHERE v.id_caja = idCaja OR v.id_caja IS NULL
    ORDER BY mp.id, cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosMasVendidoAnio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoAnio`(IN p_anio INT)
BEGIN
-- Tabla de traducción de meses
    WITH meses AS (
        SELECT 1 AS mes_num, 'Enero' AS mes_nombre UNION ALL
        SELECT 2, 'Febrero' UNION ALL
        SELECT 3, 'Marzo' UNION ALL
        SELECT 4, 'Abril' UNION ALL
        SELECT 5, 'Mayo' UNION ALL
        SELECT 6, 'Junio' UNION ALL
        SELECT 7, 'Julio' UNION ALL
        SELECT 8, 'Agosto' UNION ALL
        SELECT 9, 'Septiembre' UNION ALL
        SELECT 10, 'Octubre' UNION ALL
        SELECT 11, 'Noviembre' UNION ALL
        SELECT 12, 'Diciembre'
    ),

    -- Ventas reales por producto por mes
    ventas_mensuales AS (
        SELECT
            MONTH(o.fecha)                     AS mes,
            p.id                               AS producto_id,
            p.nombre                           AS producto_nombre,
            SUM(od.cantidad)                   AS total_cantidad,
            SUM(od.cantidad * p.precio)        AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND p.tipo = 'producto'
        GROUP BY mes, p.id, p.nombre
    ),

    -- Ranking top 3 por mes
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (
                PARTITION BY vm.mes
                ORDER BY vm.total_cantidad DESC
            ) AS rn
        FROM ventas_mensuales vm
    ),

    top_ventas AS (
        SELECT
            mes,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    -- Unión externa con todos los meses
    SELECT
        m.mes_num                        AS numero_mes,
        m.mes_nombre                    AS nombre_mes,
        COALESCE(tv.producto_nombre, 'Sin ventas') AS producto,
        COALESCE(tv.total_cantidad, 0) AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00) AS monto_generado
    FROM meses m
    LEFT JOIN top_ventas tv ON tv.mes = m.mes_num
    ORDER BY m.mes_num, unidades_vendidas DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosMasVendidoMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoMes`(IN p_anio INT, IN p_mes INT)
BEGIN
SET lc_time_names = 'es_ES';

    -- 1. Crea una tabla de semanas que caen parcialmente o totalmente en el mes
    WITH RECURSIVE fechas AS (
        SELECT DATE(CONCAT(p_anio, '-', p_mes, '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM fechas
        WHERE MONTH(fecha) = p_mes AND YEAR(fecha) = p_anio
    ),
    semanas_mes AS (
        SELECT DISTINCT WEEK(fecha, 1) AS semana
        FROM fechas
    ),

    -- 2. Ventas reales de productos en esas semanas
    ventas_semanales AS (
        SELECT
            WEEK(o.fecha, 1)                  AS semana,
            p.id                              AS producto_id,
            p.nombre                          AS producto_nombre,
            SUM(od.cantidad)                  AS total_cantidad,
            SUM(od.cantidad * p.precio)       AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND MONTH(o.fecha) = p_mes
          AND p.tipo = 'producto'
        GROUP BY semana, p.id, p.nombre
    ),

    -- 3. Ranking de productos por semana (top 3)
    ranking AS (
        SELECT
            vs.*,
            ROW_NUMBER() OVER (
                PARTITION BY vs.semana
                ORDER BY vs.total_cantidad DESC
            ) AS rn
        FROM ventas_semanales vs
    ),

    -- 4. Top 3 por semana (puede haber semanas sin registros en este paso)
    top_ventas AS (
        SELECT
            semana,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    -- 5. Unión externa con todas las semanas para incluir las sin ventas
    SELECT
        sm.semana                      AS semana_del_anio,
        COALESCE(tv.producto_nombre, 'Sin ventas')  AS producto,
        COALESCE(tv.total_cantidad, 0)              AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00)              AS monto_generado
    FROM semanas_mes sm
    LEFT JOIN top_ventas tv ON tv.semana = sm.semana
    ORDER BY sm.semana, unidades_vendidas DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosMasVendidoSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoSemana`(IN p_anio INT, IN p_semana INT)
BEGIN
    -- Configura nombres de días en español
    SET lc_time_names = 'es_ES';

    -- Tabla virtual de días de la semana (basada en WEEKDAY, donde Lunes = 0)
    WITH dias_semana AS (
        SELECT 0 AS dia_orden, 'Lunes' AS dia UNION ALL
        SELECT 1, 'Martes' UNION ALL
        SELECT 2, 'Miércoles' UNION ALL
        SELECT 3, 'Jueves' UNION ALL
        SELECT 4, 'Viernes' UNION ALL
        SELECT 5, 'Sábado' UNION ALL
        SELECT 6, 'Domingo'
    ),

    -- Ventas agrupadas por producto y día
    ventas_semanales AS (
        SELECT
            p.id                            AS producto_id,
            p.nombre                        AS producto_nombre,
            WEEKDAY(o.fecha)               AS dia_orden,
            DAYNAME(o.fecha)               AS dia_nombre,
            SUM(od.cantidad)               AS total_cantidad,
            SUM(od.cantidad * p.precio)    AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND WEEK(o.fecha, 1) = p_semana
          AND p.tipo = 'producto'
        GROUP BY p.id, p.nombre, WEEKDAY(o.fecha), DAYNAME(o.fecha)
    ),

    -- Ranking Top 3 por día
    ranking AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY dia_orden
                ORDER BY total_cantidad DESC
            ) AS rn
        FROM ventas_semanales
    ),

    -- Combinamos todos los días con sus top 3 productos (o NULL si no hay)
    dias_con_ventas AS (
        SELECT
            d.dia_orden,
            d.dia,
            COALESCE(r.producto_nombre, 'SIN VENTA') AS producto,
            IFNULL(r.total_cantidad, 0) AS unidades_vendidas,
            ROUND(IFNULL(r.total_monto, 0), 2) AS monto_generado
        FROM dias_semana d
        LEFT JOIN ranking r ON d.dia_orden = r.dia_orden AND r.rn <= 3
    )

    SELECT *
    FROM dias_con_ventas
    ORDER BY dia_orden, unidades_vendidas DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosMenosVendidoAnio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoAnio`(IN p_anio INT)
BEGIN
-- Tabla de traducción de meses
    WITH meses AS (
        SELECT 1 AS mes_num, 'Enero' AS mes_nombre UNION ALL
        SELECT 2, 'Febrero' UNION ALL
        SELECT 3, 'Marzo' UNION ALL
        SELECT 4, 'Abril' UNION ALL
        SELECT 5, 'Mayo' UNION ALL
        SELECT 6, 'Junio' UNION ALL
        SELECT 7, 'Julio' UNION ALL
        SELECT 8, 'Agosto' UNION ALL
        SELECT 9, 'Septiembre' UNION ALL
        SELECT 10, 'Octubre' UNION ALL
        SELECT 11, 'Noviembre' UNION ALL
        SELECT 12, 'Diciembre'
    ),

    -- Ventas reales por producto por mes
    ventas_mensuales AS (
        SELECT
            MONTH(o.fecha)                     AS mes,
            p.id                               AS producto_id,
            p.nombre                           AS producto_nombre,
            SUM(od.cantidad)                   AS total_cantidad,
            SUM(od.cantidad * p.precio)        AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND p.tipo = 'producto'
        GROUP BY mes, p.id, p.nombre
    ),

    -- Ranking top 3 por mes
    ranking AS (
        SELECT
            vm.*,
            ROW_NUMBER() OVER (
                PARTITION BY vm.mes
                ORDER BY vm.total_cantidad ASC
            ) AS rn
        FROM ventas_mensuales vm
    ),

    top_ventas AS (
        SELECT
            mes,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    -- Unión externa con todos los meses
    SELECT
        m.mes_num                        AS numero_mes,
        m.mes_nombre                    AS nombre_mes,
        COALESCE(tv.producto_nombre, 'Sin ventas') AS producto,
        COALESCE(tv.total_cantidad, 0) AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00) AS monto_generado
    FROM meses m
    LEFT JOIN top_ventas tv ON tv.mes = m.mes_num
    ORDER BY m.mes_num, unidades_vendidas ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosMenosVendidoMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoMes`(IN p_anio INT, IN p_mes INT)
BEGIN
SET lc_time_names = 'es_ES';

    -- 1. Crea una tabla de semanas que caen parcialmente o totalmente en el mes
    WITH RECURSIVE fechas AS (
        SELECT DATE(CONCAT(p_anio, '-', p_mes, '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM fechas
        WHERE MONTH(fecha) = p_mes AND YEAR(fecha) = p_anio
    ),
    semanas_mes AS (
        SELECT DISTINCT WEEK(fecha, 1) AS semana
        FROM fechas
    ),

    -- 2. Ventas reales de productos en esas semanas
    ventas_semanales AS (
        SELECT
            WEEK(o.fecha, 1)                  AS semana,
            p.id                              AS producto_id,
            p.nombre                          AS producto_nombre,
            SUM(od.cantidad)                  AS total_cantidad,
            SUM(od.cantidad * p.precio)       AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND MONTH(o.fecha) = p_mes
          AND p.tipo = 'producto'
        GROUP BY semana, p.id, p.nombre
    ),

    -- 3. Ranking de productos por semana (top 3)
    ranking AS (
        SELECT
            vs.*,
            ROW_NUMBER() OVER (
                PARTITION BY vs.semana
                ORDER BY vs.total_cantidad ASC
            ) AS rn
        FROM ventas_semanales vs
    ),

    -- 4. Top 3 por semana (puede haber semanas sin registros en este paso)
    top_ventas AS (
        SELECT
            semana,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    -- 5. Unión externa con todas las semanas para incluir las sin ventas
    SELECT
        sm.semana                      AS semana_del_anio,
        COALESCE(tv.producto_nombre, 'Sin ventas')  AS producto,
        COALESCE(tv.total_cantidad, 0)              AS unidades_vendidas,
        COALESCE(tv.total_monto, 0.00)              AS monto_generado
    FROM semanas_mes sm
    LEFT JOIN top_ventas tv ON tv.semana = sm.semana
    ORDER BY sm.semana, unidades_vendidas ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosMenosVendidoSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoSemana`(IN p_anio INT, IN p_semana INT)
BEGIN
    -- Configura nombres de días en español
    SET lc_time_names = 'es_ES';

    -- Tabla virtual de días de la semana (basada en WEEKDAY, donde Lunes = 0)
    WITH dias_semana AS (
        SELECT 0 AS dia_orden, 'Lunes' AS dia UNION ALL
        SELECT 1, 'Martes' UNION ALL
        SELECT 2, 'Miércoles' UNION ALL
        SELECT 3, 'Jueves' UNION ALL
        SELECT 4, 'Viernes' UNION ALL
        SELECT 5, 'Sábado' UNION ALL
        SELECT 6, 'Domingo'
    ),

    -- Ventas agrupadas por producto y día
    ventas_semanales AS (
        SELECT
            p.id                            AS producto_id,
            p.nombre                        AS producto_nombre,
            WEEKDAY(o.fecha)               AS dia_orden,
            DAYNAME(o.fecha)               AS dia_nombre,
            SUM(od.cantidad)               AS total_cantidad,
            SUM(od.cantidad * p.precio)    AS total_monto
        FROM producto_preparado_detalle_orden od
        JOIN productos_preparados p ON p.id = od.id_producto
        JOIN `orden` o              ON o.id = od.id_orden
        WHERE YEAR(o.fecha) = p_anio
          AND WEEK(o.fecha, 1) = p_semana
          AND p.tipo = 'producto'
        GROUP BY p.id, p.nombre, WEEKDAY(o.fecha), DAYNAME(o.fecha)
    ),

    -- Ranking Top 3 por día
    ranking AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY dia_orden
                ORDER BY total_cantidad DESC
            ) AS rn
        FROM ventas_semanales
    ),

    -- Combinamos todos los días con sus top 3 productos (o NULL si no hay)
    dias_con_ventas AS (
        SELECT
            d.dia_orden,
            d.dia,
            COALESCE(r.producto_nombre, 'SIN VENTA') AS producto,
            IFNULL(r.total_cantidad, 0) AS unidades_vendidas,
            ROUND(IFNULL(r.total_monto, 0), 2) AS monto_generado
        FROM dias_semana d
        LEFT JOIN ranking r ON d.dia_orden = r.dia_orden AND r.rn <= 3
    )

    SELECT *
    FROM dias_con_ventas
    ORDER BY dia_orden, unidades_vendidas ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReservasPorMetodoAnual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoAnual`(IN `p_anio` INT)
BEGIN
    -- Retornar número de reservas por método de pedido en un año dado
    SELECT
        metodo_pedido,
        COALESCE(COUNT(*),0) AS cantidad_reservas
    FROM reservaciones
    WHERE YEAR(fecha_inicio) = p_anio
    GROUP BY metodo_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReservasPorMetodoMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoMes`(IN `p_anio` INT, IN `p_mes` INT)
BEGIN
    -- Retornar número de reservas por método de pedido en un año dado
    SELECT
        metodo_pedido,
        COUNT(*) AS cantidad_reservas
    FROM reservaciones
    WHERE YEAR(fecha_inicio) = p_anio AND MONTH(fecha_inicio) =p_mes
    GROUP BY metodo_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalVentasAnio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalVentasAnio`(
    IN p_anio INT
)
BEGIN
    SELECT
        o.tipo AS tipo_orden,
        COUNT(DISTINCT o.id) AS total_ordenes,
        ROUND(SUM(v.monto_final), 2) AS total_recaudado
    FROM `orden` o
    JOIN ventas v ON v.id_orden = o.id
    WHERE YEAR(o.fecha) = p_anio
    GROUP BY o.tipo
    ORDER BY total_recaudado DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalVentasMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalVentasMes`(
    IN p_anio INT,
    IN p_mes INT
)
BEGIN
    SELECT
        o.tipo AS tipo_orden,
        COUNT(DISTINCT o.id) AS total_ordenes,
        ROUND(SUM(v.monto_final), 2) AS total_recaudado
    FROM `orden` o
    JOIN ventas v ON v.id_orden = o.id
    WHERE YEAR(o.fecha) = p_anio
      AND MONTH(o.fecha) = p_mes
    GROUP BY o.tipo
    ORDER BY total_recaudado DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalVentasSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalVentasSemana`(
    IN p_anio INT,
    IN p_semana INT
)
BEGIN
    SELECT
        o.tipo AS tipo_orden,
        COUNT(DISTINCT o.id) AS total_ordenes,
        ROUND(SUM(v.monto_final), 2) AS total_recaudado
    FROM `orden` o
    JOIN ventas v ON v.id_orden = o.id
    WHERE YEAR(o.fecha) = p_anio
      AND WEEK(o.fecha, 1) = p_semana
    GROUP BY o.tipo
    ORDER BY total_recaudado DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UtilidadNetaAnual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaAnual`(IN p_anio INT)
BEGIN
    -- Tabla fija con meses en español
    WITH meses AS (
        SELECT 1 AS mes_numero, 'Enero' AS nombre UNION
        SELECT 2, 'Febrero' UNION
        SELECT 3, 'Marzo' UNION
        SELECT 4, 'Abril' UNION
        SELECT 5, 'Mayo' UNION
        SELECT 6, 'Junio' UNION
        SELECT 7, 'Julio' UNION
        SELECT 8, 'Agosto' UNION
        SELECT 9, 'Septiembre' UNION
        SELECT 10, 'Octubre' UNION
        SELECT 11, 'Noviembre' UNION
        SELECT 12, 'Diciembre'
    ),
    -- Datos agrupados por mes
    utilidad_por_mes AS (
        SELECT 
            MONTH(mc.fecha) AS mes_numero,
            ROUND(SUM(CASE WHEN mc.monto > 0 THEN mc.monto ELSE 0 END), 2) AS ingresos,
            ROUND(SUM(CASE WHEN mc.monto > 0 AND mc.descripcion LIKE '%Ingreso por venta%' THEN mc.monto ELSE 0 END), 2) AS ventas,
            ROUND(SUM(CASE WHEN mc.monto < 0 THEN mc.monto ELSE 0 END), 2) AS gastos,
            ROUND(
                SUM(CASE WHEN mc.monto > 0 THEN mc.monto ELSE 0 END) +
                SUM(CASE WHEN mc.monto < 0 THEN mc.monto ELSE 0 END), 2
            ) AS utilidad_neta
        FROM movimientos_capital mc
        WHERE YEAR(mc.fecha) = p_anio
        GROUP BY MONTH(mc.fecha)
    )

    SELECT
        m.nombre AS mes,
        m.mes_numero,
        COALESCE(u.ingresos, 0) AS ingresos,
        COALESCE(u.ventas, 0) AS ventas,
        COALESCE(u.gastos, 0) AS gastos,
        COALESCE(u.utilidad_neta, 0) AS utilidad_neta
    FROM meses m
    LEFT JOIN utilidad_por_mes u ON m.mes_numero = u.mes_numero
    ORDER BY m.mes_numero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UtilidadNetaMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaMes`(IN p_anio INT, IN p_mes INT)
BEGIN
    -- Generar calendario completo del año
    WITH RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE MONTH(fecha) = p_mes
          AND fecha < LAST_DAY(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01'))
    ),

    -- Obtener fechas y su semana ISO
    semanas_del_mes AS (
        SELECT 
            YEARWEEK(fecha, 1) AS anio_semana,
            WEEK(fecha, 1)     AS semana,
            MIN(fecha) OVER (PARTITION BY WEEK(fecha, 1)) AS inicio_semana,
            MAX(fecha) OVER (PARTITION BY WEEK(fecha, 1)) AS fin_semana,
            fecha
        FROM calendario
    ),

    -- Agrupar por semana para calcular las fechas límites
    semanas_agrupadas AS (
        SELECT DISTINCT 
            semana,
            DATE_FORMAT(MIN(fecha), '%Y-%m-%d') AS fecha_inicio,
            DATE_FORMAT(MAX(fecha), '%Y-%m-%d') AS fecha_fin
        FROM semanas_del_mes
        GROUP BY semana
    )

    -- Consulta final con utilidad neta por semana
    SELECT 
        sa.semana                               AS semana,
        sa.fecha_inicio                         AS fecha_inicio,
        sa.fecha_fin                            AS fecha_fin,
        
        ROUND(SUM(CASE 
            WHEN mc.monto > 0 THEN mc.monto
        END), 2) AS ingresos,
        
        ROUND(SUM(CASE 
            WHEN mc.monto > 0 AND mc.descripcion LIKE '%Ingreso por venta%' THEN mc.monto
        END), 2) AS ventas,
        
        ROUND(SUM(CASE 
            WHEN mc.monto < 0 THEN mc.monto
        END), 2) AS gastos,
        
        ROUND(
            SUM(CASE WHEN mc.monto > 0 THEN mc.monto ELSE 0 END) +
            SUM(CASE WHEN mc.monto < 0 THEN mc.monto ELSE 0 END)
        , 2) AS utilidad_neta

    FROM semanas_agrupadas sa
    LEFT JOIN movimientos_capital mc 
      ON WEEK(mc.fecha, 1) = sa.semana AND YEAR(mc.fecha) = p_anio
    GROUP BY sa.semana, sa.fecha_inicio, sa.fecha_fin
    ORDER BY sa.semana;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UtilidadNetaSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_spanish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaSemana`(IN p_anio INT, IN p_semana INT)
BEGIN
    DECLARE target_yearweek INT;

    -- Construir formato ISO YEARWEEK (ej: 202524)
    SET target_yearweek = p_anio * 100 + p_semana;

    -- Generar calendario de fechas del año
    WITH 
    RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio,'-01-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE fecha < DATE(CONCAT(p_anio,'-12-31'))
    ),

    -- Filtrar solo las fechas que pertenecen a la semana ISO indicada
    semana_iso AS (
        SELECT fecha
        FROM calendario
        WHERE YEARWEEK(fecha,1) = target_yearweek
    ),

    -- Asignar nombres a los días de la semana (en español)
    dias_nombres AS (
        SELECT 1 AS dia_orden, 'Lunes'    AS dia_nombre UNION ALL
        SELECT 2, 'Martes'    UNION ALL
        SELECT 3, 'Miércoles' UNION ALL
        SELECT 4, 'Jueves'    UNION ALL
        SELECT 5, 'Viernes'   UNION ALL
        SELECT 6, 'Sábado'    UNION ALL
        SELECT 7, 'Domingo'
    ),

    -- Asociar las fechas de la semana con su día
    dias_semana AS (
        SELECT
            si.fecha,
            WEEKDAY(si.fecha) + 1  AS dia_orden,
            dn.dia_nombre
        FROM semana_iso si
        JOIN dias_nombres dn ON dn.dia_orden = WEEKDAY(si.fecha) + 1
    )

    -- Resultado final
    SELECT
        ds.dia_nombre                                AS dia,
        DATE_FORMAT(ds.fecha, '%Y-%m-%d')            AS fecha,
        ROUND(SUM(CASE 
            WHEN mc.monto > 0 THEN mc.monto
        END), 2) AS ingresos,
        
        ROUND(SUM(CASE 
            WHEN mc.monto > 0 AND mc.descripcion LIKE '%Ingreso por venta%' THEN mc.monto
        END), 2) AS ventas,
        
        ROUND(SUM(CASE 
            WHEN mc.monto < 0 THEN mc.monto
        END), 2) AS gastos,
        
        ROUND(
            SUM(CASE WHEN mc.monto > 0 THEN mc.monto ELSE 0 END) +
            SUM(CASE WHEN mc.monto < 0 THEN mc.monto ELSE 0 END)
        , 2) AS utilidad_neta

    FROM dias_semana ds
    LEFT JOIN movimientos_capital mc ON DATE(mc.fecha) = ds.fecha
    GROUP BY ds.dia_orden, ds.dia_nombre, ds.fecha
    ORDER BY ds.dia_orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_inventario_materia_prima`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_materia_prima`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_spanish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario_materia_prima` AS select `mp`.`id` AS `id_materia_prima`,`mp`.`nombre` AS `materia_prima`,`cat`.`nombre` AS `categoria`,`u`.`nombre` AS `unidad`,ifnull(sum((case when ((`em`.`active` = 1) and (`em`.`broken` = 0)) then `em`.`existencia` else 0 end)),0) AS `existencia_actual`,`mp`.`stock_min` AS `stock_min`,`mp`.`stock_max` AS `stock_max`,ifnull(sum((case when ((`em`.`active` = 1) and (`em`.`broken` = 0)) then (`em`.`existencia` * `em`.`precio_compra`) else 0 end)),0) AS `valor_total`,(case when (`mp`.`active` = 1) then 'Activo' else 'Inactivo' end) AS `estado`,(case when (ifnull(sum((case when ((`em`.`active` = 1) and (`em`.`broken` = 0)) then `em`.`existencia` else 0 end)),0) <= `mp`.`stock_min`) then 'Bajo stock' when (ifnull(sum((case when ((`em`.`active` = 1) and (`em`.`broken` = 0)) then `em`.`existencia` else 0 end)),0) >= `mp`.`stock_max`) then 'Sobre stock' else 'Stock adecuado' end) AS `estado_stock` from (((`materia_prima` `mp` left join `entradas_materia_prima` `em` on((`em`.`id_materia_prima` = `mp`.`id`))) left join `categoria_materia_prima` `cat` on((`cat`.`id` = `mp`.`id_categoria`))) left join `unidades` `u` on((`u`.`id` = `mp`.`id_unidad`))) where (`mp`.`active` = 1) group by `mp`.`id`,`mp`.`nombre`,`cat`.`nombre`,`u`.`nombre`,`mp`.`stock_min`,`mp`.`stock_max`,`mp`.`active` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_inventario_productos_procesados`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_productos_procesados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_spanish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario_productos_procesados` AS select `pp`.`id` AS `id_producto`,`pp`.`nombre` AS `producto`,`cat`.`nombre` AS `categoria`,`u`.`alias` AS `unidad`,ifnull(sum((case when ((`ep`.`active` = 1) and (`ep`.`broken` = 0)) then `ep`.`existencia` else 0 end)),0) AS `existencia_actual`,ifnull(sum((case when ((`ep`.`active` = 1) and (`ep`.`broken` = 0)) then (`ep`.`existencia` * `ep`.`precio_compra`) else 0 end)),0) AS `valor_total`,(case when (`pp`.`active` = 1) then 'Activo' else 'Inactivo' end) AS `estado` from (((`productos_procesados` `pp` left join `entradas_producto_procesado` `ep` on((`ep`.`id_producto` = `pp`.`id`))) left join `categorias_productos` `cat` on((`cat`.`id` = `pp`.`id_categoria`))) left join `unidades` `u` on((`u`.`id` = `ep`.`id_unidad`))) group by `pp`.`id`,`pp`.`nombre`,`cat`.`nombre`,`u`.`alias`,`pp`.`active` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resumen_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_spanish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_clientes` AS with `total_gasto` as (select `o`.`id_cliente` AS `id_cliente`,sum(`v`.`monto_final`) AS `total_gastado` from (`ventas` `v` join `orden` `o` on((`o`.`id` = `v`.`id_orden`))) group by `o`.`id_cliente`), `ultima_orden` as (select `orden`.`id_cliente` AS `id_cliente`,max(`orden`.`fecha`) AS `ultima_fecha` from `orden` group by `orden`.`id_cliente`), `productos_cliente` as (select `o`.`id_cliente` AS `id_cliente`,`p`.`nombre` AS `producto`,`p`.`imagen` AS `imagen`,sum(`od`.`cantidad`) AS `total_consumido`,row_number() OVER (PARTITION BY `o`.`id_cliente` ORDER BY sum(`od`.`cantidad`) desc )  AS `rn` from ((`orden` `o` join `producto_preparado_detalle_orden` `od` on((`od`.`id_orden` = `o`.`id`))) join `productos_preparados` `p` on((`p`.`id` = `od`.`id_producto`))) where (`p`.`tipo` = 'producto') group by `o`.`id_cliente`,`p`.`nombre`,`p`.`imagen`), `top_1` as (select `productos_cliente`.`id_cliente` AS `id_cliente`,`productos_cliente`.`producto` AS `producto1`,`productos_cliente`.`imagen` AS `imagen1` from `productos_cliente` where (`productos_cliente`.`rn` = 1)), `top_2` as (select `productos_cliente`.`id_cliente` AS `id_cliente`,`productos_cliente`.`producto` AS `producto2`,`productos_cliente`.`imagen` AS `imagen2` from `productos_cliente` where (`productos_cliente`.`rn` = 2)), `top_3` as (select `productos_cliente`.`id_cliente` AS `id_cliente`,`productos_cliente`.`producto` AS `producto3`,`productos_cliente`.`imagen` AS `imagen3` from `productos_cliente` where (`productos_cliente`.`rn` = 3)) select `c`.`nombre` AS `cliente`,`c`.`apellido` AS `apellido`,`c`.`telefono` AS `telefono`,date_format(`uo`.`ultima_fecha`,'%Y-%m-%d %H:%i:%s') AS `ultima_orden`,round(coalesce(`tg`.`total_gastado`,0),2) AS `total_gastado`,coalesce(`t1`.`producto1`,'Sin producto') AS `producto_1`,`t1`.`imagen1` AS `imagen_1`,coalesce(`t2`.`producto2`,'Sin producto') AS `producto_2`,`t2`.`imagen2` AS `imagen_2`,coalesce(`t3`.`producto3`,'Sin producto') AS `producto_3`,`t3`.`imagen3` AS `imagen_3` from ((((((`clientes` `c` join `orden` `o` on((`c`.`id` = `o`.`id_cliente`))) left join `total_gasto` `tg` on((`c`.`id` = `tg`.`id_cliente`))) left join `ultima_orden` `uo` on((`c`.`id` = `uo`.`id_cliente`))) left join `top_1` `t1` on((`c`.`id` = `t1`.`id_cliente`))) left join `top_2` `t2` on((`c`.`id` = `t2`.`id_cliente`))) left join `top_3` `t3` on((`c`.`id` = `t3`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resumen_financiero`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_financiero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_spanish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_financiero` AS select round(ifnull(sum((case when (`movimientos_capital`.`monto` > 0) then `movimientos_capital`.`monto` end)),0),2) AS `ingresos`,round(ifnull(sum((case when ((`movimientos_capital`.`monto` > 0) and (`movimientos_capital`.`descripcion` like '%Ingreso por venta%')) then `movimientos_capital`.`monto` end)),0),2) AS `ventas`,round(ifnull(sum((case when (`movimientos_capital`.`monto` < 0) then `movimientos_capital`.`monto` end)),0),2) AS `gastos`,round((ifnull(sum((case when (`movimientos_capital`.`monto` > 0) then `movimientos_capital`.`monto` end)),0) + ifnull(sum((case when (`movimientos_capital`.`monto` < 0) then `movimientos_capital`.`monto` end)),0)),2) AS `utilidad_neta` from `movimientos_capital` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-20 14:23:37
