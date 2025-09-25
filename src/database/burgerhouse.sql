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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (27,11,150,3000,3796.16,158.88,'2025-07-07 14:07:09','2025-07-09 12:57:17',0,NULL),(28,11,150,25,2237.26,150,'2025-07-09 12:57:28','2025-07-10 14:45:38',0,NULL),(29,11,300,2500,NULL,NULL,'2025-07-10 14:45:52',NULL,1,NULL);
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
INSERT INTO `capital` VALUES (1,50887.5,'2025-06-12 16:08:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_productos`
--

LOCK TABLES `categorias_productos` WRITE;
/*!40000 ALTER TABLE `categorias_productos` DISABLE KEYS */;
INSERT INTO `categorias_productos` VALUES (1,'Bebidas',1),(2,'Pepitos',1),(3,'Griegos',1),(4,'Perros Calientes',1),(5,'Papas',1),(6,'Club House',1),(7,'Burgers',1),(8,'Kids',1),(9,'Jira',0),(10,'Adicionales',0),(11,'Otra mas',0),(12,'UN a',0),(13,'Nueva categoria',0),(14,'Hola',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jose','Escalona','+584126742231',1,'V-30087582'),(2,'Pedro','Escalona','+584161214717',0,''),(3,'Pedro ','Perex','+584162589318',1,''),(35,'AMELIA','GARNICAR',NULL,1,'V-5435543');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Mesa 2','5','LIBRE','0','5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg','1'),(2,'Mesa 45','10','OCUPADA','1','7b37d828-2d86-40c5-b54a-9424c5dcc288.jpeg','1'),(3,'Mesa 9','4','LIBRE','0','5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg','1'),(4,'Mesa 10','7','LIBRE','1','championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg','0'),(5,'Mesa inf','58','LIBRE','0','2551fe44-3bc1-476e-b084-e7ff84eb8600.jpeg','0'),(6,'Mesa 99','10','LIBRE','1','7112d1a7-cfb2-4f35-8848-0394ac5c335d.jpeg','0'),(7,'Mesa 5','8','LIBRE','1','5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg','1'),(8,'Mesa 6','5','LIBRE','0','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg','1'),(9,'Mesa 2000','10','LIBRE','0','19085819.jpg','0'),(10,'Mesa 85','15','LIBRE','1','9503026.png','0'),(11,'Otra mesa','10','LIBRE','0','camisa_neww.png','0'),(12,'Mesa prueba','12','LIBRE','0','53571.jpg','0'),(13,'Mesa prueba','12','LIBRE','0','53571.jpg','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_capital`
--

LOCK TABLES `movimientos_capital` WRITE;
/*!40000 ALTER TABLE `movimientos_capital` DISABLE KEYS */;
INSERT INTO `movimientos_capital` VALUES (1,50.58,'Ingreso por venta','2025-06-12 15:38:52'),(2,-2117.4,'Egreso por nuevas entradas','2025-06-12 15:44:58'),(4,-2117.4,'Ingreso por entrada de materia prima nro 8','2025-06-12 16:00:05'),(6,609,'Ingreso por eliminacion de entrada de producto procesado nro 20','2025-06-12 16:29:51'),(7,-609,'Egreso por entrada de producto procesado nro 20','2025-06-12 16:29:51'),(8,-1015,'Egreso por nueva entradas','2025-06-12 16:03:46'),(9,10000,'Ingreso por aporte de alidado','2025-06-12 16:14:45'),(12,10,'aporte de aliado','2025-06-13 15:06:38'),(13,-10,'me gaste en un toston','2025-06-13 15:07:46'),(14,4796.41,'Ingreso por venta','2025-06-16 14:51:05'),(15,66.36,'Ingreso por venta','2025-06-16 15:56:19'),(16,24.7,'Ingreso por venta','2025-06-18 09:42:46'),(17,760.34,'Ingreso por venta','2025-06-18 09:46:31'),(18,2385.19,'Ingreso por venta','2025-06-18 09:59:39'),(19,940.26,'Ingreso por venta','2025-06-18 10:02:22'),(20,4770.38,'Ingreso por venta','2025-06-18 10:03:42'),(21,888.85,'Ingreso por venta','2025-06-18 10:05:11'),(22,1584.34,'Ingreso por venta','2025-06-18 10:08:35'),(23,734.64,'Ingreso por venta','2025-06-18 10:10:25'),(24,2385.19,'Ingreso por venta','2025-06-18 10:11:50'),(25,2385.19,'Ingreso por venta','2025-06-18 10:12:55'),(26,1144.85,'Ingreso por venta','2025-06-18 14:10:10'),(27,2463.82,'Ingreso por venta','2025-06-19 10:53:54'),(28,2463.82,'Ingreso por venta','2025-06-19 10:53:54'),(29,741.28,'Ingreso por venta','2025-06-19 17:18:44'),(30,2463.82,'Ingreso por venta','2025-06-19 17:19:52'),(31,2463.82,'Ingreso por venta','2025-06-19 17:19:52'),(32,799.38,'Ingreso por venta','2025-06-19 17:21:58'),(33,274.87,'Ingreso por venta','2025-06-19 17:23:21'),(34,2432.7,'Ingreso por venta','2025-06-19 17:24:07'),(35,482.35,'Ingreso por venta','2025-06-19 17:27:33'),(36,2463.82,'Ingreso por venta','2025-06-19 17:28:35'),(37,896.89,'Ingreso por venta','2025-06-19 17:30:49'),(38,67.39,'Ingreso por venta','2025-06-19 17:31:38'),(39,-2000,'no se mucho','2025-06-20 10:16:04'),(40,348.69,'Ingreso por venta','2025-07-02 10:58:52'),(41,755.23,'Ingreso por venta','2025-07-02 11:07:10'),(42,695.29,'Ingreso por venta','2025-07-02 11:10:10'),(43,695.29,'Ingreso por venta','2025-07-02 11:14:02'),(44,695.29,'Ingreso por venta','2025-07-02 13:01:28'),(45,778.73,'Ingreso por venta','2025-07-02 13:19:14'),(46,72.38,'Ingreso por venta','2025-07-05 15:27:16'),(47,796.16,'Ingreso por venta','2025-07-07 14:08:50'),(48,8.88,'Ingreso por venta','2025-07-07 14:11:23'),(49,719.86,'Ingreso por venta','2025-07-09 13:49:23'),(50,758.71,'Ingreso por venta','2025-07-09 19:21:51'),(51,535.76,'Ingreso por venta','2025-07-09 19:28:52'),(52,197.93,'Ingreso por venta','2025-07-09 20:49:13'),(53,147.88,'Ingreso por venta','2025-07-10 14:46:48');
/*!40000 ALTER TABLE `movimientos_capital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `nro_orden` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(500) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Id_cliente` (`id_cliente`),
  KEY `idx_cliente` (`id_cliente`),
  KEY `idx_fecha` (`fecha`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (80,NULL,91485100,'2025-07-03 15:46:14','en cocina','local'),(81,NULL,63411000,'2025-07-03 19:52:49','en mesa','local'),(83,1,57834000,'2025-07-07 18:08:46','en cocina','llevar'),(84,1,45966800,'2025-07-07 18:11:22','en cocina','llevar'),(85,1,66983700,'2025-07-09 17:49:12','en cocina','delivery'),(86,1,48539300,'2025-07-09 23:21:49','en cocina','delivery'),(87,1,53998900,'2025-07-09 23:28:50','en cocina','delivery'),(88,1,46259600,'2025-07-10 00:49:12','en cocina','delivery'),(89,1,87626000,'2025-07-10 18:46:47','en cocina','llevar');
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
  `id_orden` int NOT NULL,
  `id_mesa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pokpoj_idx` (`id_mesa`),
  KEY `qwrqwripo_idx` (`id_orden`),
  CONSTRAINT `pokpoj` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`),
  CONSTRAINT `qwrqwripo` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_mesa`
--

LOCK TABLES `orden_mesa` WRITE;
/*!40000 ALTER TABLE `orden_mesa` DISABLE KEYS */;
INSERT INTO `orden_mesa` VALUES (1,80,1),(2,81,3);
/*!40000 ALTER TABLE `orden_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_reserva`
--

DROP TABLE IF EXISTS `pago_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id8_idx` (`id_reserva`),
  KEY `id59_idx` (`id_pago`),
  CONSTRAINT `id59` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
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
-- Table structure for table `pago_venta`
--

DROP TABLE IF EXISTS `pago_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id59_idx` (`id_pago`),
  KEY `id80333_idx` (`id_venta`),
  CONSTRAINT `id59022` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id80333` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_venta`
--

LOCK TABLES `pago_venta` WRITE;
/*!40000 ALTER TABLE `pago_venta` DISABLE KEYS */;
INSERT INTO `pago_venta` VALUES (5,57,50),(6,58,51),(7,59,52),(8,60,53),(9,61,54),(10,62,55),(11,63,56);
/*!40000 ALTER TABLE `pago_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_metodo_pago` int NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tasa` float NOT NULL,
  `comprobante` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `referencia` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idMetodoPago` (`id_metodo_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (50,3,796.16,'2025-07-07 14:08:50',111.42,'cap.jpg','2569',1),(51,12,8.88,'2025-07-07 14:11:23',111.42,'cap.jpg','1456',1),(52,3,719.86,'2025-07-09 13:49:23',112.83,'cap.jpg','7841',1),(53,3,758.71,'2025-07-09 19:21:51',113.75,'cap.jpg','1247',1),(54,3,535.76,'2025-07-09 19:28:52',113.75,'cap.jpg','7896',1),(55,3,197.93,'2025-07-09 20:49:13',113.75,'cap.jpg','2998',1),(56,11,147.88,'2025-07-10 14:46:48',113.75,'cap.jpg','6484',1);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes_mesas`
--

DROP TABLE IF EXISTS `paquetes_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquetes_mesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_paquete` int DEFAULT NULL,
  `id_mesa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id121426_idx` (`id_paquete`),
  KEY `id134135346_idx` (`id_mesa`),
  CONSTRAINT `id121426` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes_reservacion` (`id`),
  CONSTRAINT `id134135346` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes_mesas`
--

LOCK TABLES `paquetes_mesas` WRITE;
/*!40000 ALTER TABLE `paquetes_mesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `paquetes_mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes_reservacion`
--

DROP TABLE IF EXISTS `paquetes_reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquetes_reservacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes_reservacion`
--

LOCK TABLES `paquetes_reservacion` WRITE;
/*!40000 ALTER TABLE `paquetes_reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `paquetes_reservacion` ENABLE KEYS */;
UNLOCK TABLES;

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
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adicionales` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id11_idx` (`id_producto`),
  KEY `id12_idx` (`id_orden`),
  CONSTRAINT `id11` FOREIGN KEY (`id_producto`) REFERENCES `productos_preparados` (`id`),
  CONSTRAINT `id12` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_preparado_detalle_orden`
--

LOCK TABLES `producto_preparado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_preparado_detalle_orden` DISABLE KEYS */;
INSERT INTO `producto_preparado_detalle_orden` VALUES (142,41,80,'1','','',1),(143,52,81,'1','','Salsa Inglesa',1),(144,50,81,'1',NULL,NULL,1),(145,45,81,'1','','',1),(147,52,83,'1','','',1),(148,41,84,'1','','Jamon',1),(149,51,84,'1',NULL,NULL,1),(150,41,85,'1','','',1),(151,41,86,'1','sin mostaza','Papitas',1),(152,47,86,'1',NULL,NULL,1),(153,45,87,'1','','Nuggets',1),(154,48,87,'1',NULL,NULL,1),(155,45,89,'2','','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_procesado_detalle_orden`
--

LOCK TABLES `producto_procesado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_procesado_detalle_orden` DISABLE KEYS */;
INSERT INTO `producto_procesado_detalle_orden` VALUES (16,42,80,'1'),(17,41,81,'1'),(18,42,80,'1'),(19,41,81,'1'),(20,42,87,'1'),(21,42,88,'1');
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
INSERT INTO `productos_preparados` VALUES (41,7,'Hamburguesa sencilla','banner_captcha.png',5.5,'mucho detalle aqui',1,'producto'),(42,7,'Pruba','7893000979932.jpg',0.56,'dadkawpdkpoakdokada',0,'producto'),(43,7,'Ninncwda','7702535011805-20-281-29.webp',74.87,'dawdalwdmawldmwadaw',0,'producto'),(44,7,'SWSADA','harina-pan.jpg',0.56,'DAWDADAWDADADADA',0,'producto'),(45,7,'Super Smasher','banner_register.png',0.56,'mucha descripcion',1,'producto'),(46,10,'Carne','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg',0.56,NULL,1,'adicional'),(47,10,'Papitas','DIABLITOS-UNDERWOOD.jpg',0.25,NULL,1,'adicional'),(48,10,'Nuggets','arroz.jpeg',2,NULL,1,'adicional'),(49,10,'Ensalada','7594005430045.jpg',1.5,NULL,1,'adicional'),(50,10,'Salsa Inglesa','harina-pan.jpg',0.55,NULL,1,'adicional'),(51,10,'Jamon','7502223708136_1.jpg',2.5,NULL,1,'adicional'),(52,5,'Smash Burger','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg',6.16,'dawdawdawdawdadawd',1,'producto');
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
INSERT INTO `productos_procesados` VALUES (41,'Gloup 1L','ImgThumb.jpg',5,'dawdwdwadascacacac',1,1),(42,'Coca Cola','OIP.jpeg',1.5,'Coca cola de 1.5L',1,1);
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
  `id_paquete` int DEFAULT NULL,
  `id_orden` int DEFAULT NULL,
  `id_caja` int DEFAULT NULL,
  `descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_bloqueo` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `metodo_pedido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id1231446_idx` (`id_paquete`),
  KEY `ioeiofjpowjf_idx` (`id_orden`),
  KEY `poppuo_idx` (`id_caja`),
  CONSTRAINT `id1231446` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes_reservacion` (`id`),
  CONSTRAINT `ioeiofjpowjf` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`),
  CONSTRAINT `poppuo` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'Litro','Lt','1'),(2,'Gramo','Gr','1'),(3,'Kilogramo','Kg','1'),(4,'Unidad','Ud','1'),(5,'Mililitro','Ml','1'),(7,'Prueba','P','0'),(8,'Prueba1','1','0'),(9,'Prueba2','2','0'),(10,'Prueba3','2','0'),(11,'PRUEBS','pr','0'),(12,'Otra','ass','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (57,27,83,NULL,7.15,'2025-07-07 14:08:46','circunvalacion',1),(58,27,84,NULL,8.88,'2025-07-07 14:11:23','fraternidad',1),(59,28,85,NULL,6.38,'2025-07-09 13:49:15','direccion de envio',1),(60,28,86,NULL,6.67,'2025-07-09 19:21:51','en mi casa',1),(61,28,87,NULL,4.71,'2025-07-09 19:28:51','en mi casa',1),(62,28,88,NULL,1.74,'2025-07-09 20:49:13','NAAD',1),(63,29,89,NULL,1.3,'2025-07-10 14:46:47','nada',1);
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
-- Final view structure for view `vista_inventario_materia_prima`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_materia_prima`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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

-- Dump completed on 2025-07-10 15:46:42
