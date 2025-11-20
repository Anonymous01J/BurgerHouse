-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: burgerhouse
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (27,11,150,3000,3796.16,158.88,'2025-07-07 14:07:09','2025-07-09 12:57:17',0,NULL),(28,11,150,25,2237.26,150,'2025-07-09 12:57:28','2025-07-10 14:45:38',0,NULL),(29,11,300,2500,4988.16,300,'2025-07-16 14:45:52','2025-07-25 12:23:49',0,NULL),(30,11,58.55,250,11657.2,58.55,'2025-08-06 12:24:01','2025-08-09 12:13:04',0,NULL),(31,11,150,25,7669.04,150,'2025-08-28 08:13:13','2025-10-01 11:50:14',0,NULL),(32,11,10,1000,1000,10,'2025-09-30 17:26:08','2025-10-01 11:50:10',0,NULL),(33,11,50,1000,2144.76,50,'2025-10-01 11:50:29','2025-10-13 21:34:05',0,NULL),(34,11,50,1000,1000,50,'2025-10-13 21:34:14','2025-10-14 19:50:03',0,NULL),(35,11,50,1000,2270.32,50,'2025-10-14 19:50:08','2025-10-28 13:08:55',0,NULL),(40,11,100,150,1541.92,100,'2025-10-28 13:09:04','2025-11-04 15:39:49',0,NULL),(41,11,450,250,250,450,'2025-11-04 15:34:04','2025-11-05 19:39:33',0,NULL),(42,11,100,150,3343.47,100,'2025-11-05 19:39:40','2025-11-06 07:35:39',0,NULL),(43,11,100,500,893.47,100,'2025-11-06 07:35:48','2025-11-19 10:15:26',0,NULL),(44,11,500,250,1766.85,500,'2025-11-19 10:15:34','2025-11-19 12:04:34',0,NULL),(45,20,500,250,NULL,NULL,'2025-11-19 12:05:28',NULL,1,NULL);
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
INSERT INTO `capital` VALUES (1,-53157.5,'2025-06-12 16:08:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_productos`
--

LOCK TABLES `categorias_productos` WRITE;
/*!40000 ALTER TABLE `categorias_productos` DISABLE KEYS */;
INSERT INTO `categorias_productos` VALUES (1,'Bebidas',1),(2,'Pepitos',1),(3,'Griegos',1),(4,'Perros Calientes',1),(5,'Papas',1),(6,'Club House',1),(7,'Burgers',1),(8,'Kids',1),(9,'Jira',0),(10,'Adicionales',0),(11,'Otra mas',0),(12,'UN a',0),(13,'Nueva categoria',0),(14,'Hola',0),(18,'Prueba de categoria',1),(19,'Quizas',1),(20,'Quizas',1),(21,'Tacos',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jose','Escalona','+584126742231',1,'V-30087582'),(36,'AMELIA','GARNICAR','+584266092231',1,'V-5435543'),(44,'ALI','PERNALETE','+584125695231',1,'V-30087583'),(45,'FELIX','DOMINGUEZ','+584121506791',1,'V-30554404'),(51,'PEDRO','VARGAS',NULL,1,'V-10120693'),(52,'JOSE','LINARES',NULL,1,'V-10120694'),(53,'DULCE','SEQUERA',NULL,1,'V-10120695'),(57,'Alfredo','Di Stefano','+584126742231',1,'V-30088956'),(58,'KEVIN','BARRETO',NULL,1,'V-26076685'),(59,'TULIO','GOMEZ','+584262364513',1,'V-26898713');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (4,11,61,1),(9,20,103,1);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_entradas_materia_prima`
--

DROP TABLE IF EXISTS `detalles_entradas_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_entradas_materia_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `id_materia_prima` int NOT NULL,
  `id_entrada` int NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `existencia` float NOT NULL,
  `cantidad` float DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `broken` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_materia_prima_idx` (`id_materia_prima`),
  KEY `id_entrada_materia_prima_1_idx` (`id_entrada`),
  CONSTRAINT `id_entrada_materia_prima_1` FOREIGN KEY (`id_entrada`) REFERENCES `entradas_materia_prima` (`id`),
  CONSTRAINT `id_materia_prima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_entradas_materia_prima`
--

LOCK TABLES `detalles_entradas_materia_prima` WRITE;
/*!40000 ALTER TABLE `detalles_entradas_materia_prima` DISABLE KEYS */;
INSERT INTO `detalles_entradas_materia_prima` VALUES (23,'545454',8,85,'2025-10-10 00:00:00',0,55,1,51.6),(24,'62626',9,86,'2025-10-30 00:00:00',0,10,1,3),(25,'654848',10,87,'2026-02-25 00:00:00',15,15,1,0),(26,'84848',8,88,'2025-10-29 00:00:00',0,50,1,48.64),(27,'515151',9,92,'2027-02-10 00:00:00',45,50,1,0),(28,'545454',8,93,'2026-07-05 00:00:00',77.66,80,1,0),(29,'62626',6,94,'2025-11-21 00:00:00',49.3,50,1,0);
/*!40000 ALTER TABLE `detalles_entradas_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `detalles_entradas_materia_prima_AFTER_INSERT` AFTER INSERT ON `detalles_entradas_materia_prima` FOR EACH ROW BEGIN
 -- Actualizar la existencia sumando la cantidad de la nueva entrada
    UPDATE materia_prima 
    SET existencia = CAST(existencia AS DECIMAL(10,2)) + NEW.cantidad
    WHERE id = NEW.id_materia_prima;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `detalles_entradas_materia_prima_BEFORE_UPDATE` BEFORE UPDATE ON `detalles_entradas_materia_prima` FOR EACH ROW BEGIN
-- Declarar la variable al principio del bloque, como exige MySQL
    DECLARE diferencia FLOAT DEFAULT 0;

    -- Lógica Condicional:
    -- Caso 1: Si se modifica la CANTIDAD de la compra
    IF NEW.cantidad <> OLD.cantidad THEN
        SET diferencia = NEW.cantidad - OLD.cantidad;
        
        -- Forzar el cálculo de la existencia del lote
        SET NEW.existencia = OLD.existencia + diferencia;
        
    -- Caso 2: Si solo se modifica la EXISTENCIA (y no la cantidad)
    ELSEIF NEW.existencia <> OLD.existencia THEN
        SET diferencia = NEW.existencia - OLD.existencia;
        -- Aquí se respeta el valor de NEW.existencia que puso el usuario.
    END IF;

    -- Si hubo algún cambio (diferencia no es 0), se actualiza el inventario maestro
    IF diferencia <> 0 THEN
        UPDATE materia_prima
        SET existencia = existencia + diferencia
        WHERE id = NEW.id_materia_prima;
    END IF;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `detalles_entradas_materia_prima_AFTER_UPDATE` AFTER UPDATE ON `detalles_entradas_materia_prima` FOR EACH ROW BEGIN
 DECLARE done INT DEFAULT FALSE;
    DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE precio_compra_entrada FLOAT;
    
    -- Cursor para múltiples pagos
    DECLARE pago_cursor CURSOR FOR 
        SELECT mp.nombre, pemp.tasa, pemp.precio_compra
        FROM pagos_entrada_materia_prima pemp
        INNER JOIN metodo_pago mp ON mp.id = pemp.id_metodo_pago
        WHERE pemp.id_entrada = NEW.id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Si se desactiva la entrada (active cambia de 1 a 0)
    IF OLD.active = 1 AND NEW.active = 0 THEN
        -- Restar la cantidad de la existencia total en materia_prima
        UPDATE materia_prima 
        SET existencia = existencia - OLD.cantidad 
        WHERE id = NEW.id_materia_prima;
        
        -- Procesar todos los pagos asociados
        OPEN pago_cursor;
        read_loop: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento positivo para compensar el egreso anterior
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                precio_compra_entrada, 
                CONCAT('Ingreso por eliminacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
        
        -- Reset del flag para el siguiente bloque
        SET done = FALSE;
    END IF;
    
    -- Si se reactiva la entrada (active cambia de 0 a 1)
    IF OLD.active = 0 AND NEW.active = 1 THEN
        -- Sumar la cantidad a la existencia total en materia_prima
        UPDATE materia_prima 
        SET existencia = existencia + NEW.cantidad 
        WHERE id = NEW.id_materia_prima;
        
        -- Procesar todos los pagos asociados para revertir compensación
        OPEN pago_cursor;
        read_loop2: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop2;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento negativo para revertir la compensación
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                -precio_compra_entrada, 
                CONCAT('Egreso por reactivacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_receta`
--

LOCK TABLES `detalles_receta` WRITE;
/*!40000 ALTER TABLE `detalles_receta` DISABLE KEYS */;
INSERT INTO `detalles_receta` VALUES (60,13,8,0.68),(68,16,1,0.15),(69,17,9,1),(70,17,8,0.15),(71,17,6,0.35),(73,19,5,0.15),(74,13,9,1),(75,18,8,0.5),(77,23,16,0.5),(78,23,9,2);
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
  `id_proveedor` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_provedor` (`id_proveedor`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_materia_prima`
--

LOCK TABLES `entradas_materia_prima` WRITE;
/*!40000 ALTER TABLE `entradas_materia_prima` DISABLE KEYS */;
INSERT INTO `entradas_materia_prima` VALUES (85,2,'2025-09-25 20:16:15'),(86,2,'2025-10-01 12:02:35'),(87,2,'2025-10-14 17:41:59'),(88,2,'2025-10-14 19:51:04'),(89,2,'2025-11-05 19:43:59'),(90,2,'2025-11-05 19:47:20'),(91,2,'2025-11-05 19:52:38'),(92,2,'2025-11-05 19:56:27'),(93,1,'2025-11-05 19:57:30'),(94,2,'2025-11-19 12:24:24');
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
  `existencia` float NOT NULL,
  `cantidad` float NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `broken` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rov_idx` (`id_proveedor`),
  KEY `pro_idx` (`id_producto`),
  KEY `nose_fg_idx` (`id_unidad`),
  CONSTRAINT `nose_fg` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  CONSTRAINT `pro` FOREIGN KEY (`id_producto`) REFERENCES `productos_procesados` (`id`),
  CONSTRAINT `rov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_producto_procesado`
--

LOCK TABLES `entradas_producto_procesado` WRITE;
/*!40000 ALTER TABLE `entradas_producto_procesado` DISABLE KEYS */;
INSERT INTO `entradas_producto_procesado` VALUES (26,'202020',42,1,1,'2025-09-03 14:02:05','2025-12-24 00:00:00',38,40,1,0),(27,'202020',41,2,1,'2025-09-04 10:37:22','2025-12-24 00:00:00',36,40,1,0);
/*!40000 ALTER TABLE `entradas_producto_procesado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_producto_procesado_AFTER_INSERT` AFTER INSERT ON `entradas_producto_procesado` FOR EACH ROW BEGIN
 -- Actualizar la existencia sumando la cantidad de la nueva entrada
    UPDATE productos_procesados
    SET existencia = CAST(existencia AS DECIMAL(10,2)) + NEW.cantidad
    WHERE id = NEW.id_producto;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_producto_procesado_BEFORE_UPDATE` BEFORE UPDATE ON `entradas_producto_procesado` FOR EACH ROW BEGIN
    -- Declarar la variable al principio del bloque, como exige MySQL
    DECLARE diferencia FLOAT DEFAULT 0;

    -- Lógica Condicional:
    -- Caso 1: Si se modifica la CANTIDAD de la compra
    IF NEW.cantidad <> OLD.cantidad THEN
        SET diferencia = NEW.cantidad - OLD.cantidad;
        
        -- Forzar el cálculo de la existencia del lote
        SET NEW.existencia = OLD.existencia + diferencia;
        
    -- Caso 2: Si solo se modifica la EXISTENCIA (y no la cantidad)
    ELSEIF NEW.existencia <> OLD.existencia THEN
        SET diferencia = NEW.existencia - OLD.existencia;
        -- Aquí se respeta el valor de NEW.existencia que puso el usuario.
    END IF;

    -- Si hubo algún cambio (diferencia no es 0), se actualiza el inventario maestro
    IF diferencia <> 0 THEN
        UPDATE productos_procesados
        SET existencia = existencia + diferencia
        WHERE id = NEW.id_producto;
    END IF;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entradas_producto_procesado_AFTER_UPDATE` AFTER UPDATE ON `entradas_producto_procesado` FOR EACH ROW BEGIN
 DECLARE done INT DEFAULT FALSE;
    DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE precio_compra_entrada FLOAT;
    
    -- Cursor para múltiples pagos
    DECLARE pago_cursor CURSOR FOR 
        SELECT mp.nombre, pemp.tasa, pemp.precio_compra
        FROM pagos_entrada_materia_prima pemp
        INNER JOIN metodo_pago mp ON mp.id = pemp.id_metodo_pago
        WHERE pemp.id_entrada = NEW.id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Si se desactiva la entrada (active cambia de 1 a 0)
    IF OLD.active = 1 AND NEW.active = 0 THEN
        -- Restar la cantidad de la existencia total en materia_prima
        UPDATE productos_procesados 
        SET existencia = existencia - OLD.cantidad 
        WHERE id = NEW.id_producto;
        
        -- Procesar todos los pagos asociados
        OPEN pago_cursor;
        read_loop: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento positivo para compensar el egreso anterior
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                precio_compra_entrada, 
                CONCAT('Ingreso por eliminacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
        
        -- Reset del flag para el siguiente bloque
        SET done = FALSE;
    END IF;
    
    -- Si se reactiva la entrada (active cambia de 0 a 1)
    IF OLD.active = 0 AND NEW.active = 1 THEN
        -- Sumar la cantidad a la existencia total en materia_prima
        UPDATE productos_procesados 
        SET existencia = existencia + NEW.cantidad 
        WHERE id = NEW.id_producto;
        
        -- Procesar todos los pagos asociados para revertir compensación
        OPEN pago_cursor;
        read_loop2: LOOP
            FETCH pago_cursor INTO metodo_nombre, tasa_movimiento, precio_compra_entrada;
            IF done THEN
                LEAVE read_loop2;
            END IF;
            
            -- Determinar la tasa según el método de pago
            IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
                SET tasa_movimiento = tasa_movimiento; -- usar la tasa real
            ELSE
                SET tasa_movimiento = 1; -- otros métodos
            END IF;
            
            -- Insertar movimiento negativo para revertir la compensación
            INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
            VALUES (
                -precio_compra_entrada, 
                CONCAT('Egreso por reactivacion de entrada de materia prima nro ', NEW.id),
                NOW(),
                tasa_movimiento
            );
        END LOOP;
        CLOSE pago_cursor;
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
  `existencia` float NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_unidad_idx` (`id_unidad`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_materia_prima` (`id`),
  CONSTRAINT `id_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,1,3,'Pollo',10,20,0,1),(2,1,3,'Carne de res',10,50,0,1),(3,3,3,'Cebolla',10,20,0,1),(4,3,3,'Maíz',10,20,0,1),(5,7,4,'Queso cheddar',10,20,0,1),(6,4,3,'Salsa especial',10,20,49.3,1),(7,1,3,'Tocineta',10,20,0,1),(8,3,3,'Papas',10,100,77.66,1),(9,2,4,'Pan de la casa',10,20,45,1),(10,3,3,'Prueba',1,5,15,1),(11,7,5,'CONSOLA',2,10,0,0),(12,6,4,'CONN',2,3,0,0),(16,7,2,'Queso Amarillo',10,50,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Mesa 2','5','LIBRE','0','camisa_new.png','1'),(2,'Mesa 45','10','OCUPADA','1','7b37d828-2d86-40c5-b54a-9424c5dcc288.jpeg','1'),(3,'Mesa 9','4','LIBRE','0','5f395e0a-584d-4540-bc2b-3dba66a98c31.jpeg','1'),(4,'Mesa 10','7','LIBRE','1','championship-leblanc-league-of-legends_3840x2161_xtrafondos.com.jpg','0'),(5,'Mesa inf','58','LIBRE','0','2551fe44-3bc1-476e-b084-e7ff84eb8600.jpeg','0'),(6,'Mesa 99','10','LIBRE','1','7112d1a7-cfb2-4f35-8848-0394ac5c335d.jpeg','0'),(7,'Mesa 5','8','LIBRE','1','5ce0e0f8-46df-4654-b37b-7d7f40d9bc6a.jpeg','1'),(8,'Mesa 6','5','LIBRE','0','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg','1'),(9,'Mesa 2000','10','LIBRE','0','19085819.jpg','0'),(10,'Mesa 85','15','LIBRE','1','103327.jpg','1'),(11,'Otra mesa','10','LIBRE','0','camisa_neww.png','0'),(12,'Mesa prueba','12','LIBRE','0','53571.jpg','0'),(13,'Mesa prueba','12','LIBRE','0','53571.jpg','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
  `tasa` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_capital`
--

LOCK TABLES `movimientos_capital` WRITE;
/*!40000 ALTER TABLE `movimientos_capital` DISABLE KEYS */;
INSERT INTO `movimientos_capital` VALUES (1,50.58,'Ingreso por venta','2025-06-12 15:38:52',1),(2,-2117.4,'Egreso por nuevas entradas','2025-06-12 15:44:58',1),(4,-2117.4,'Ingreso por entrada de materia prima nro 8','2025-06-12 16:00:05',1),(6,609,'Ingreso por eliminacion de entrada de producto procesado nro 20','2025-06-12 16:29:51',1),(7,-609,'Egreso por entrada de producto procesado nro 20','2025-06-12 16:29:51',1),(8,-1015,'Egreso por nueva entradas','2025-06-12 16:03:46',1),(9,10000,'Ingreso por aporte de alidado','2025-06-12 16:14:45',1),(12,10,'aporte de aliado','2025-06-13 15:06:38',1),(13,-10,'me gaste en un toston','2025-06-13 15:07:46',1),(14,4796.41,'Ingreso por venta','2025-06-16 14:51:05',1),(15,66.36,'Ingreso por venta','2025-06-16 15:56:19',1),(16,24.7,'Ingreso por venta','2025-06-18 09:42:46',1),(17,760.34,'Ingreso por venta','2025-06-18 09:46:31',1),(18,2385.19,'Ingreso por venta','2025-06-18 09:59:39',1),(19,940.26,'Ingreso por venta','2025-06-18 10:02:22',1),(20,4770.38,'Ingreso por venta','2025-06-18 10:03:42',1),(21,888.85,'Ingreso por venta','2025-06-18 10:05:11',1),(22,1584.34,'Ingreso por venta','2025-06-18 10:08:35',1),(23,734.64,'Ingreso por venta','2025-06-18 10:10:25',1),(24,2385.19,'Ingreso por venta','2025-06-18 10:11:50',1),(25,2385.19,'Ingreso por venta','2025-06-18 10:12:55',1),(26,1144.85,'Ingreso por venta','2025-06-18 14:10:10',1),(27,2463.82,'Ingreso por venta','2025-06-19 10:53:54',1),(28,2463.82,'Ingreso por venta','2025-06-19 10:53:54',1),(29,741.28,'Ingreso por venta','2025-06-19 17:18:44',1),(30,2463.82,'Ingreso por venta','2025-06-19 17:19:52',1),(31,2463.82,'Ingreso por venta','2025-06-19 17:19:52',1),(32,799.38,'Ingreso por venta','2025-06-19 17:21:58',1),(33,274.87,'Ingreso por venta','2025-06-19 17:23:21',1),(34,2432.7,'Ingreso por venta','2025-06-19 17:24:07',1),(35,482.35,'Ingreso por venta','2025-06-19 17:27:33',1),(36,2463.82,'Ingreso por venta','2025-06-19 17:28:35',1),(37,896.89,'Ingreso por venta','2025-06-19 17:30:49',1),(38,67.39,'Ingreso por venta','2025-06-19 17:31:38',1),(39,-2000,'no se mucho','2025-06-20 10:16:04',1),(40,348.69,'Ingreso por venta','2025-07-02 10:58:52',1),(41,755.23,'Ingreso por venta','2025-07-02 11:07:10',1),(42,695.29,'Ingreso por venta','2025-07-02 11:10:10',1),(43,695.29,'Ingreso por venta','2025-07-02 11:14:02',1),(44,695.29,'Ingreso por venta','2025-07-02 13:01:28',1),(45,778.73,'Ingreso por venta','2025-07-02 13:19:14',1),(46,72.38,'Ingreso por venta','2025-07-05 15:27:16',1),(47,796.16,'Ingreso por venta','2025-07-07 14:08:50',1),(48,8.88,'Ingreso por venta','2025-07-07 14:11:23',1),(49,719.86,'Ingreso por venta','2025-07-09 13:49:23',1),(50,758.71,'Ingreso por venta','2025-07-09 19:21:51',1),(51,535.76,'Ingreso por venta','2025-07-09 19:28:52',1),(52,197.93,'Ingreso por venta','2025-07-09 20:49:13',1),(53,147.88,'Ingreso por venta','2025-07-10 14:46:48',1),(54,2340.28,'Ingreso por venta','2025-07-16 14:29:07',1),(55,2340.28,'Ingreso por venta','2025-07-16 14:31:33',1),(56,2340.28,'Ingreso por venta','2025-07-16 14:36:18',1),(57,2340.28,'Ingreso por venta','2025-07-16 14:38:59',1),(58,2340.28,'Ingreso por venta','2025-07-16 14:45:17',1),(59,2340.28,'Ingreso por venta','2025-07-16 14:47:29',1),(60,2340.28,'Ingreso por venta','2025-07-16 15:20:47',1),(61,2340.28,'Ingreso por venta','2025-07-16 15:23:56',1),(62,424.72,'Ingreso por venta','2025-07-25 13:17:13',1),(63,424.72,'Ingreso por venta','2025-07-25 13:23:27',1),(64,673.49,'Ingreso por venta','2025-07-25 14:07:52',1),(65,424.72,'Ingreso por venta','2025-07-25 14:09:34',1),(66,673.49,'Ingreso por venta','2025-07-25 14:12:14',1),(67,673.49,'Ingreso por venta','2025-07-25 14:21:42',1),(68,916.92,'Ingreso por venta','2025-08-06 12:51:57',1),(69,818.17,'Ingreso por venta','2025-08-06 12:57:59',1),(70,1636.34,'Ingreso por venta','2025-08-06 13:10:04',1),(71,83.36,'Ingreso por venta','2025-08-06 13:24:44',1),(72,166.71,'Ingreso por venta','2025-08-06 13:26:44',1),(73,1295.22,'Ingreso por venta','2025-08-06 13:28:11',1),(74,916.92,'Ingreso por venta','2025-08-06 13:35:00',1),(75,734.79,'Ingreso por venta','2025-08-06 13:48:31',1),(76,855.36,'Ingreso por venta','2025-08-06 14:04:46',1),(77,743.79,'Ingreso por venta','2025-08-06 14:06:41',1),(78,223.14,'Ingreso por venta','2025-08-06 14:19:23',1),(79,954.11,'Ingreso por venta','2025-08-06 14:21:35',1),(80,83.36,'Ingreso por venta','2025-08-06 14:35:31',1),(81,165.43,'Ingreso por venta','2025-08-06 14:37:43',1),(82,1140.05,'Ingreso por venta','2025-08-06 14:38:35',1),(83,7.79788,'Ingreso por Transferencia','2025-08-06 15:51:08',1),(84,9.4656,'Ingreso por Pago Movil','2025-08-09 12:16:53',1),(85,7.14559,'Ingreso por Pago Movil','2025-08-09 12:27:27',1),(86,6.38003,'Ingreso por Pago Movil','2025-08-09 13:16:22',1),(87,1.2876,'Ingreso por Pago Movil','2025-08-09 13:20:45',1),(88,5,'Ingreso por Pago Movil','2025-08-09 13:24:45',1),(89,7.55858,'Ingreso por Pago Movil','2025-08-12 13:03:42',1),(90,7.4452,'Ingreso por Transferencia','2025-08-12 13:03:43',1),(91,10.4105,'Ingreso por Pago Movil','2025-08-14 13:52:14',1),(92,10.4105,'Ingreso por Pago Movil','2025-08-14 13:55:25',1),(93,0.594884,'Ingreso por Pago Movil','2025-08-14 14:11:31',1),(94,0.148721,'Ingreso por Pago Movil','2025-08-14 14:20:36',1),(95,0.743605,'Ingreso por Pago Movil','2025-08-14 14:25:12',1),(96,0.148721,'Ingreso por Pago Movil','2025-08-14 14:28:29',1),(97,0.148721,'Ingreso por Pago Movil','2025-08-14 14:32:27',1),(98,0.148721,'Ingreso por Pago Movil','2025-08-14 14:34:04',1),(99,5.79165,'Ingreso por Pago Movil','2025-08-20 12:36:23',1),(100,7.23956,'Ingreso por Pago Movil','2025-08-20 12:50:58',1),(101,7.23956,'Ingreso por Pago Movil','2025-08-20 12:58:14',1),(102,7.23956,'Ingreso por Pago Movil','2025-08-20 13:03:17',1),(103,5.79165,'Ingreso por Pago Movil','2025-08-20 13:04:12',1),(104,-1250,'Egreso por nueva entradas','2025-08-25 11:20:23',1),(105,-2500,'Egreso por nueva entradas','2025-08-25 11:21:23',1),(106,-600,'Egreso por nueva entradas','2025-08-25 11:22:04',1),(107,-1800,'Egreso por nueva entradas','2025-08-25 11:23:52',1),(108,-750,'Egreso por nueva entradas','2025-08-26 10:57:08',1),(109,-36750,'Egreso por nueva entradas','2025-08-26 13:49:47',1),(113,-2000,'Egreso por entrada de materia prima nro 39','2025-09-01 14:11:54',148.44),(114,-1500,'Egreso por entrada de materia prima nro 39','2025-09-01 14:11:54',148.44),(115,-1500,'Egreso por entrada de materia prima nro 40','2025-09-01 14:46:24',148.44),(116,-3500,'Egreso por entrada de materia prima nro 27','2025-09-04 10:37:23',151.76),(117,-42.34,'Egreso por entrada de materia prima nro 71','2025-09-25 14:08:19',171.85),(118,-49848.9,'Egreso por entrada de materia prima nro 72','2025-09-25 14:08:19',171.85),(119,-42.34,'Egreso por entrada de materia prima nro 73','2025-09-25 14:09:24',171.85),(120,-49848.9,'Egreso por entrada de materia prima nro 74','2025-09-25 14:09:24',171.85),(121,-350,'Egreso por entrada de materia prima nro 75','2025-09-25 14:16:40',171.85),(122,-489.48,'Egreso por entrada de materia prima nro 76','2025-09-25 14:19:37',171.85),(123,-150,'Egreso por entrada de materia prima nro 78','2025-09-25 15:06:06',171.85),(124,-150,'Egreso por entrada de materia prima nro 79','2025-09-25 15:06:34',171.85),(125,-48.48,'Egreso por entrada de materia prima nro 80','2025-09-25 15:09:32',171.85),(126,-848.48,'Egreso por entrada de materia prima nro 81','2025-09-25 15:12:37',171.85),(127,-94.94,'Egreso por entrada de materia prima nro 82','2025-09-25 15:15:07',171.85),(128,-484.84,'Egreso por entrada de materia prima nro 83','2025-09-25 15:16:13',171.85),(129,-155,'Egreso por entrada de materia prima nro 84','2025-09-25 15:23:05',171.85),(130,-1500,'Egreso por entrada de materia prima nro 85','2025-09-25 20:16:15',171.85),(131,-10,'Egreso por entrada de materia prima nro 86','2025-10-01 12:02:35',179.43),(132,1144.76,'Ingreso por Pago Movil','2025-10-01 12:18:17',179.43),(133,1144.76,'Ingreso por Pago Movil','2025-10-01 14:21:47',179.43),(134,-1500,'Egreso por entrada de materia prima nro 87','2025-10-14 17:41:59',199.11),(135,-2500,'Egreso por entrada de materia prima nro 88','2025-10-14 19:51:04',199.11),(136,1270.32,'Ingreso por Pago Movil','2025-10-14 19:52:11',199.11),(143,1391.92,'Ingreso por Pago Movil','2025-10-28 13:10:07',218.17),(144,-4500,'Egreso por entrada de materia prima nro 92','2025-11-05 19:56:27',226.13),(145,-150,'Egreso por entrada de materia prima nro 93','2025-11-05 19:57:30',1),(146,2800,'Ingreso por Pago Movil','2025-11-05 20:59:00',226.13),(147,393.47,'Ingreso por Pago Movil','2025-11-05 21:03:44',226.13),(148,393.47,'Ingreso por Pago Movil','2025-11-06 07:36:57',226.13),(149,1516.85,'Ingreso por Pago Movil','2025-11-19 10:16:30',237.75),(150,-150,'Egreso por entrada de materia prima nro 94','2025-11-19 12:24:24',237.75),(151,154.54,'Ingreso por Pago Movil','2025-11-19 12:25:52',237.75),(152,-100,'gasto x','2025-11-19 15:25:23',1),(153,3000,'Ingreso por Pago Movil','2025-11-19 16:31:39',240.32);
/*!40000 ALTER TABLE `movimientos_capital` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (80,NULL,91485100,'2025-07-03 15:46:14','en cocina','local'),(81,1,63411000,'2025-07-03 19:52:49','pagado','local'),(83,1,57834000,'2025-07-07 18:08:46','anulada','llevar'),(84,1,45966800,'2025-07-07 18:11:22','en cocina','llevar'),(85,1,66983700,'2025-07-09 17:49:12','entregada','delivery'),(86,1,48539300,'2025-07-09 23:21:49','anulada','delivery'),(87,1,53998900,'2025-07-09 23:28:50','en camino','delivery'),(88,1,46259600,'2025-07-10 00:49:12','para despachar','delivery'),(89,1,87626000,'2025-07-10 18:46:47','en cocina','llevar'),(90,NULL,40394500,'2025-07-16 17:47:21','en cocina','local'),(91,NULL,61900800,'2025-07-16 17:50:57','en mesa','local'),(101,44,10431500,'2025-07-25 18:21:42','pagado','reserva'),(102,1,44910200,'2025-08-06 16:51:53','en cocina','delivery'),(103,36,81645900,'2025-08-06 16:57:55','en cocina','delivery'),(104,1,94405200,'2025-08-06 17:10:03','en cocina','llevar'),(105,1,60740500,'2025-08-06 17:24:43','en cocina','delivery'),(106,1,74482600,'2025-08-06 17:26:43','en cocina','delivery'),(107,36,91673300,'2025-08-06 17:28:10','en cocina','llevar'),(108,1,54932400,'2025-08-06 17:34:59','en cocina','delivery'),(109,1,87668500,'2025-08-06 17:48:29','en cocina','llevar'),(110,36,26105400,'2025-08-06 18:04:45','en cocina','delivery'),(111,1,44316100,'2025-08-06 18:06:39','en cocina','llevar'),(112,1,63058700,'2025-08-06 18:19:20','en cocina','delivery'),(113,1,39248300,'2025-08-06 18:21:33','en cocina','llevar'),(114,36,62197100,'2025-08-06 18:35:24','para despachar','delivery'),(115,1,43673800,'2025-08-06 18:37:42','en cocina','llevar'),(116,1,22618600,'2025-08-06 18:38:34','en preparacion','delivery'),(117,36,72337000,'2025-08-09 16:13:49','pagado','local'),(118,36,52566000,'2025-08-09 16:25:56','pagado','local'),(119,NULL,63436300,'2025-08-09 16:29:01','en mesa','local'),(126,NULL,93394400,'2025-08-09 16:57:23','en cocina','local'),(127,NULL,35454300,'2025-08-09 16:59:59','para despachar','local'),(128,36,12591700,'2025-08-09 17:01:15','pagado','local'),(129,36,44447700,'2025-08-09 17:01:37','pagado','local'),(130,36,95047700,'2025-08-09 17:18:34','pagado','local'),(131,36,29741700,'2025-08-09 17:24:44','en mesa','reserva'),(132,1,31299400,'2025-08-12 17:03:42','pagado','reserva'),(185,1,26044600,'2025-10-01 18:21:34','en cocina','delivery'),(186,1,95053300,'2025-10-14 23:51:58','en cocina','delivery'),(190,1,24241400,'2025-10-28 17:10:01','en cocina','delivery'),(191,1,41355700,'2025-11-06 00:58:58','en cocina','delivery'),(192,1,11411700,'2025-11-06 01:03:43','en cocina','delivery'),(193,1,92714500,'2025-11-06 11:36:57','en preparacion','delivery'),(194,1,99533400,'2025-11-19 14:16:28','en cocina','llevar'),(195,59,14410200,'2025-11-19 16:25:50','en camino','delivery'),(196,NULL,38794200,'2025-11-19 16:44:43','en cocina','local'),(197,1,65401700,'2025-11-19 20:31:37','para despachar','delivery');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_mesa`
--

LOCK TABLES `orden_mesa` WRITE;
/*!40000 ALTER TABLE `orden_mesa` DISABLE KEYS */;
INSERT INTO `orden_mesa` VALUES (1,80,1),(2,81,3),(3,90,7),(4,91,8),(5,117,3),(6,118,3),(7,119,3),(14,126,3),(15,127,3),(16,128,1),(17,129,3),(18,130,1),(19,196,7);
/*!40000 ALTER TABLE `orden_mesa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_mesa_AFTER_INSERT` AFTER INSERT ON `orden_mesa` FOR EACH ROW BEGIN
 UPDATE mesas
    SET estado = 'OCUPADA'
    WHERE id = NEW.id_mesa;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_reserva`
--

LOCK TABLES `pago_reserva` WRITE;
/*!40000 ALTER TABLE `pago_reserva` DISABLE KEYS */;
INSERT INTO `pago_reserva` VALUES (5,8,70),(6,9,91),(7,10,92),(8,10,93),(15,9,101),(17,10,106);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_venta`
--

LOCK TABLES `pago_venta` WRITE;
/*!40000 ALTER TABLE `pago_venta` DISABLE KEYS */;
INSERT INTO `pago_venta` VALUES (5,57,50),(6,58,51),(7,59,52),(8,60,53),(9,61,54),(10,62,55),(11,63,56),(19,71,64),(20,72,71),(21,73,72),(22,74,73),(23,75,74),(24,76,75),(25,77,76),(26,78,77),(27,79,78),(28,80,79),(29,81,80),(30,82,81),(31,83,82),(32,84,83),(33,85,84),(34,86,85),(35,87,87),(36,88,88),(37,89,89),(38,90,90),(39,91,105),(40,93,108),(41,94,109),(45,98,113),(46,99,114),(47,100,115),(48,101,116),(49,102,117),(50,103,118),(51,104,119);
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (50,3,796.16,'2025-07-07 14:08:50',111.42,'cap.jpg','2569',1),(51,12,8.88,'2025-07-07 14:11:23',111.42,'cap.jpg','1456',1),(52,3,836.55,'2025-08-09 15:53:03',112.83,'cap.jpg','7841',1),(53,3,758.71,'2025-07-09 19:21:51',113.75,'cap.jpg','1247',1),(54,3,535.76,'2025-07-09 19:28:52',113.75,'cap.jpg','7896',1),(55,3,197.93,'2025-07-09 20:49:13',113.75,'cap.jpg','2998',1),(56,11,147.88,'2025-07-10 14:46:48',113.75,'cap.jpg','6484',1),(64,3,2340.28,'2025-07-16 15:23:56',116.82,'cap.jpg','8484',1),(70,3,673.49,'2025-07-25 14:21:42',121.35,'cap.jpg','59595',1),(71,3,916.92,'2025-08-06 12:51:57',128.24,'cap.jpg','59595',1),(72,3,818.17,'2025-08-06 12:57:59',128.24,'cap.jpg','1891',1),(73,3,1636.34,'2025-08-06 13:10:04',128.24,'cap.jpg','5494',1),(74,3,83.36,'2025-08-06 13:24:44',128.24,'cap.jpg','995',1),(75,3,166.71,'2025-08-06 13:26:44',128.24,'cap.jpg','13123',1),(76,3,1295.22,'2025-08-06 13:28:11',128.24,'cap.jpg','1323',1),(77,11,916.92,'2025-08-06 13:35:00',128.24,'cap.jpg','49489',1),(78,3,734.79,'2025-08-06 13:48:31',128.24,'cap.jpg','81981',1),(79,3,855.36,'2025-08-06 14:04:46',128.24,'cap.jpg','2313',1),(80,3,743.79,'2025-08-06 14:06:41',128.24,'cap.jpg','58948',1),(81,3,223.14,'2025-08-06 14:19:23',128.24,'cap.jpg','9595',1),(82,3,954.11,'2025-08-06 14:21:35',128.24,'cap.jpg','9595',1),(83,3,83.36,'2025-08-06 14:35:31',128.24,'cap.jpg','8962',1),(84,3,165.43,'2025-08-06 14:37:43',128.24,'cap.jpg','48648',1),(85,11,1140.05,'2025-08-06 14:38:35',128.24,'cap.jpg','9780',1),(87,3,1241.13,'2025-08-09 12:16:53',131.12,'cap.jpg','59595',1),(88,3,936.93,'2025-08-09 12:27:27',131.12,'cap.jpg','8984',1),(89,3,836.55,'2025-08-09 13:16:22',131.12,'cap.jpg','9595',1),(90,3,168.83,'2025-08-09 13:20:45',131.12,'cap.jpg','9445',1),(91,3,655.6,'2025-08-09 13:24:45',131.12,'cap.jpg','994',1),(92,3,1000,'2025-08-12 13:03:42',132.3,'cap.jpg','6262',1),(93,11,985,'2025-08-12 13:03:43',132.3,'cap.jpg','69292',1),(101,3,20,'2025-08-14 14:34:04',134.48,'cap.jpg','9594',1),(105,3,1000,'2025-08-20 13:03:17',138.13,'cap.jpg','6484',1),(106,3,800,'2025-08-20 13:04:12',138.13,'cap.jpg','94884',1),(107,3,1144.76,'2025-10-01 12:18:17',179.43,'2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg','27477',1),(108,3,1144.76,'2025-10-01 14:21:47',179.43,'cap.jpg','62626',1),(109,3,1270.32,'2025-10-14 19:52:11',199.11,'cap.jpg','65656',1),(113,3,1391.92,'2025-10-28 13:10:07',218.17,'cap.jpg','4848',1),(114,3,2800,'2025-11-05 20:59:00',226.13,'cap.jpg','288282',1),(115,3,393.47,'2025-11-05 21:03:44',226.13,'cap.jpg','58959',1),(116,3,393.47,'2025-11-06 07:36:57',226.13,'cap.jpg','48484',1),(117,3,1516.85,'2025-11-19 10:16:30',237.75,'cap.jpg','6292929',1),(118,3,154.54,'2025-11-19 12:25:52',237.75,'cap.jpg','65656',1),(119,3,3000,'2025-11-19 16:31:39',240.32,'5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg','8489484',1);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagos_AFTER_INSERT` AFTER INSERT ON `pagos` FOR EACH ROW BEGIN
	 DECLARE metodo VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;

    -- Obtener nombre del método de pago
    SELECT nombre 
    INTO metodo
    FROM metodo_pago
    WHERE id = NEW.id_metodo_pago;

    -- Determinar la tasa según el método de pago
    IF metodo IN ('Transferencia', 'Pago Movil', 'Efectivo') THEN
        SET tasa_movimiento = NEW.tasa;
    ELSE
        SET tasa_movimiento = 1;
    END IF;

    -- Insertar en movimientos_capital
    INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
    VALUES (
        NEW.monto, 
        CONCAT('Ingreso por ', metodo), 
        NOW(),
        tasa_movimiento
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pagos_entrada_materia_prima`
--

DROP TABLE IF EXISTS `pagos_entrada_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_entrada_materia_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_metodo_pago` int NOT NULL,
  `id_entrada` int NOT NULL,
  `tasa` float NOT NULL DEFAULT '1',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` float NOT NULL,
  `comprobante` varchar(500) NOT NULL,
  `referencia` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_entrada_materia_prima_pago_idx` (`id_entrada`),
  KEY `id_pago_materia_prima_pago_idx` (`id_metodo_pago`),
  CONSTRAINT `id_entrada_materia_prima_pago` FOREIGN KEY (`id_entrada`) REFERENCES `entradas_materia_prima` (`id`),
  CONSTRAINT `id_pago_materia_prima_pago` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_entrada_materia_prima`
--

LOCK TABLES `pagos_entrada_materia_prima` WRITE;
/*!40000 ALTER TABLE `pagos_entrada_materia_prima` DISABLE KEYS */;
INSERT INTO `pagos_entrada_materia_prima` VALUES (42,3,85,171.85,'2025-09-25 20:16:15',1500,'cap.jpg','48484'),(43,4,86,179.43,'2025-10-01 12:02:35',10,'2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg','59595'),(44,3,87,199.11,'2025-10-14 17:41:59',1500,'cap.jpg','54848'),(45,3,88,199.11,'2025-10-14 19:51:04',2500,'cap.jpg','66565'),(46,11,92,226.13,'2025-11-05 19:56:27',4500,'cap.jpg','585959'),(47,12,93,226.13,'2025-11-05 19:57:30',150,'cap.jpg','62626'),(48,3,94,237.75,'2025-11-19 12:24:24',150,'2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg','62626');
/*!40000 ALTER TABLE `pagos_entrada_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagos_entrada_materia_prima_AFTER_INSERT` AFTER INSERT ON `pagos_entrada_materia_prima` FOR EACH ROW BEGIN
DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE monto_egreso FLOAT;
    
    -- Obtener el nombre del método de pago
    SELECT nombre INTO metodo_nombre 
    FROM metodo_pago 
    WHERE id = NEW.id_metodo_pago;
    
    -- Determinar la tasa según el método de pago
    IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
        SET tasa_movimiento = NEW.tasa;
    ELSE
        SET tasa_movimiento = 1;
    END IF;
    
    -- Calcular el monto del egreso (negativo porque es un gasto)
    SET monto_egreso = -NEW.precio_compra;
    
    -- Insertar el movimiento de capital
    INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
    VALUES (
        monto_egreso, 
        CONCAT('Egreso por entrada de materia prima nro ', NEW.id_entrada),
        NEW.fecha,
        tasa_movimiento
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pagos_entrada_producto_procesado`
--

DROP TABLE IF EXISTS `pagos_entrada_producto_procesado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_entrada_producto_procesado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrada` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `tasa` float NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `precio_compra` float NOT NULL,
  `comprobante` varchar(500) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_entrada_producto_procesado_idx` (`id_entrada`),
  KEY `id_pago_producto_procesado_idx` (`id_metodo_pago`),
  CONSTRAINT `id_entrada_producto_procesado` FOREIGN KEY (`id_entrada`) REFERENCES `entradas_producto_procesado` (`id`),
  CONSTRAINT `id_pago_producto_procesado` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_entrada_producto_procesado`
--

LOCK TABLES `pagos_entrada_producto_procesado` WRITE;
/*!40000 ALTER TABLE `pagos_entrada_producto_procesado` DISABLE KEYS */;
INSERT INTO `pagos_entrada_producto_procesado` VALUES (3,26,3,150.8,'2025-09-03 14:02:05',5500,'cap.jpg','62626'),(4,27,3,151.76,'2025-09-04 10:37:23',3500,'cap.jpg','62626');
/*!40000 ALTER TABLE `pagos_entrada_producto_procesado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagos_entrada_producto_procesado_AFTER_INSERT` AFTER INSERT ON `pagos_entrada_producto_procesado` FOR EACH ROW BEGIN
DECLARE metodo_nombre VARCHAR(25);
    DECLARE tasa_movimiento FLOAT;
    DECLARE monto_egreso FLOAT;
    
    -- Obtener el nombre del método de pago
    SELECT nombre INTO metodo_nombre 
    FROM metodo_pago 
    WHERE id = NEW.id_metodo_pago;
    
    -- Determinar la tasa según el método de pago
    IF metodo_nombre IN ('Pago Movil', 'Transferencia', 'Efectivo') THEN
        SET tasa_movimiento = NEW.tasa;
    ELSE
        SET tasa_movimiento = 1;
    END IF;
    
    -- Calcular el monto del egreso (negativo porque es un gasto)
    SET monto_egreso = -NEW.precio_compra;
    
    -- Insertar el movimiento de capital
    INSERT INTO movimientos_capital (monto, descripcion, fecha, tasa)
    VALUES (
        monto_egreso, 
        CONCAT('Egreso por entrada de materia prima nro ', NEW.id_entrada),
        NEW.fecha,
        tasa_movimiento
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes_mesas`
--

LOCK TABLES `paquetes_mesas` WRITE;
/*!40000 ALTER TABLE `paquetes_mesas` DISABLE KEYS */;
INSERT INTO `paquetes_mesas` VALUES (11,4,1),(12,4,3),(14,6,8),(15,7,7),(16,8,4);
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
  `nombre` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes_reservacion`
--

LOCK TABLES `paquetes_reservacion` WRITE;
/*!40000 ALTER TABLE `paquetes_reservacion` DISABLE KEYS */;
INSERT INTO `paquetes_reservacion` VALUES (4,'Paquete Basico',5.55,1),(6,'Paquete Normal',3.5,1),(7,'Paquete Maximus',15,1),(8,'Paquete prueba',5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_preparado_detalle_orden`
--

LOCK TABLES `producto_preparado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_preparado_detalle_orden` DISABLE KEYS */;
INSERT INTO `producto_preparado_detalle_orden` VALUES (142,41,80,'1','','',1),(143,52,81,'1','','Salsa Inglesa',1),(144,50,81,'1',NULL,NULL,1),(145,45,81,'1','','',1),(147,52,83,'1','','',1),(148,41,84,'1','','Jamon',1),(149,51,84,'1',NULL,NULL,1),(150,41,85,'1','','',1),(151,41,86,'1','sin mostaza','Papitas',1),(152,47,86,'1',NULL,NULL,1),(153,45,87,'1','','Nuggets',1),(154,48,87,'1',NULL,NULL,1),(155,45,89,'2','','',1),(156,52,90,'1','','',1),(157,52,102,'1','','Salsa Inglesa',1),(158,50,102,'1',NULL,NULL,1),(159,41,103,'1','','',1),(160,41,104,'1','','Jamon,Ensalada',1),(161,49,104,'1',NULL,NULL,1),(162,51,104,'1',NULL,NULL,1),(163,45,105,'1','','',1),(164,45,106,'1','','',1),(165,45,106,'1','','',1),(166,52,107,'1','','Salsa Inglesa,Nuggets',1),(167,48,107,'1',NULL,NULL,1),(168,50,107,'1',NULL,NULL,1),(169,52,108,'1','','',1),(170,41,110,'1','','Papitas',1),(171,47,110,'1',NULL,NULL,1),(172,52,113,'1','','Papitas',1),(173,47,113,'1',NULL,NULL,1),(174,45,114,'1','','',1),(175,45,115,'1','','Salsa Inglesa',1),(176,50,115,'1',NULL,NULL,1),(177,52,116,'1','','Ensalada',1),(178,49,116,'1',NULL,NULL,1),(179,52,117,'1','','Nuggets',1),(180,48,117,'1',NULL,NULL,1),(181,52,118,'1','','',1),(182,41,119,'1','','',1),(189,41,126,'1','','',1),(190,52,127,'1','','',1),(191,52,128,'1','','',1),(192,41,129,'1','','',1),(193,45,130,'1','','Salsa Inglesa',1),(194,50,130,'1',NULL,NULL,1),(195,45,132,'1','','Ensalada',1),(196,49,132,'1',NULL,NULL,1),(197,52,132,'1','','',1),(198,52,132,'1','','',1),(199,41,131,'1','','',1),(203,41,127,'1','','',1),(208,41,185,'1','','',1),(209,41,186,'1','','',1),(210,41,190,'1','','',1),(211,41,191,'1',NULL,NULL,1),(212,41,194,'1',NULL,NULL,1),(213,45,195,'1','sin papas',NULL,1),(214,45,196,'1',NULL,NULL,1),(215,41,197,'1',NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_procesado_detalle_orden`
--

LOCK TABLES `producto_procesado_detalle_orden` WRITE;
/*!40000 ALTER TABLE `producto_procesado_detalle_orden` DISABLE KEYS */;
INSERT INTO `producto_procesado_detalle_orden` VALUES (16,42,80,'1'),(17,41,81,'1'),(18,42,80,'1'),(19,41,81,'1'),(20,42,87,'1'),(21,42,88,'1'),(22,42,91,'1'),(23,42,104,'1'),(24,41,109,'1'),(25,41,111,'1'),(26,42,112,'1'),(27,42,132,'1'),(28,42,132,'1'),(29,42,131,'1'),(30,42,101,'1'),(40,41,191,'1'),(41,42,192,'1'),(42,42,193,'1'),(43,41,197,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_preparados`
--

LOCK TABLES `productos_preparados` WRITE;
/*!40000 ALTER TABLE `productos_preparados` DISABLE KEYS */;
INSERT INTO `productos_preparados` VALUES (41,7,'Hamburguesa sencilla','banner_captcha.png',5.5,'mucho detalle aqui',1,'producto'),(42,7,'Pruba','7893000979932.jpg',0.56,'dadkawpdkpoakdokada',0,'producto'),(43,7,'Ninncwda','7702535011805-20-281-29.webp',74.87,'dawdalwdmawldmwadaw',0,'producto'),(44,7,'SWSADA','harina-pan.jpg',0.56,'DAWDADAWDADADADA',0,'producto'),(45,7,'Super Smasher','banner_register.png',0.56,'mucha descripcion',1,'producto'),(46,10,'Carne','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg',0.56,NULL,1,'adicional'),(47,10,'Papitas','DIABLITOS-UNDERWOOD.jpg',0.25,NULL,1,'adicional'),(48,10,'Nuggets','arroz.jpeg',2,NULL,1,'adicional'),(49,10,'Ensalada','7594005430045.jpg',1.5,NULL,1,'adicional'),(50,10,'Salsa Inglesa','harina-pan.jpg',0.55,NULL,1,'adicional'),(51,10,'Jamon','7502223708136_1.jpg',2.5,NULL,1,'adicional'),(52,5,'Smash Burger','5e5294ee-d7d2-424d-ac2e-5802bbad41ab.jpeg',6.16,'dawdawdawdawdadawd',1,'producto'),(53,4,'Perro Caliente Max','banner_register.png',3.8,'algun detalle q poner',1,'producto'),(54,8,'Pizza Max','banner_login.png',15,'una pizza muy grande',1,'producto'),(55,10,'Prueba','2c51307c-9d9f-41fb-9419-1e61a44891f0.jpeg',50,NULL,1,'adicional');
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
  `existencia` float NOT NULL DEFAULT '0',
  `stock_min` float NOT NULL DEFAULT '0',
  `stock_max` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id20_idx` (`id_categoria`),
  CONSTRAINT `id20` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_procesados`
--

LOCK TABLES `productos_procesados` WRITE;
/*!40000 ALTER TABLE `productos_procesados` DISABLE KEYS */;
INSERT INTO `productos_procesados` VALUES (41,'Gloup 1L','ImgThumb.jpg',5,'dawdwdwadascacacac',1,1,36,2,20),(42,'Coca Cola','OIP.jpeg',1.5,'Coca cola de 1.5L',1,1,38,10,50),(43,'Sun 1L','ImgThumb.jpg',1,'bebida alternativa a gloup',1,1,0,3,10);
/*!40000 ALTER TABLE `productos_procesados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products_details_order`
--

DROP TABLE IF EXISTS `products_details_order`;
/*!50001 DROP VIEW IF EXISTS `products_details_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products_details_order` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `imagen`,
 1 AS `precio`,
 1 AS `detalles`,
 1 AS `categoria`,
 1 AS `tipo_producto`,
 1 AS `cantidad_disponible`,
 1 AS `estado_stock`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (13,41,1),(16,48,1),(17,45,1),(18,50,1),(19,54,1),(23,54,1);
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
  `id_paquete` int NOT NULL,
  `id_orden` int NOT NULL,
  `id_caja` int NOT NULL,
  `descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_bloqueo` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `metodo_pedido` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id1231446_idx` (`id_paquete`),
  KEY `ioeiofjpowjf_idx` (`id_orden`),
  KEY `poppuo_idx` (`id_caja`),
  CONSTRAINT `id1231446` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes_reservacion` (`id`),
  CONSTRAINT `ioeiofjpowjf` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id`),
  CONSTRAINT `poppuo` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
INSERT INTO `reservaciones` VALUES (8,6,101,30,NULL,'2025-08-19 18:30:00','2025-08-19 19:30:00',NULL,'Sistema','finalizada'),(9,8,131,31,NULL,'2025-08-21 18:30:00','2025-08-21 19:30:00',NULL,'Sistema','confirmada'),(10,7,132,31,NULL,'2025-08-30 18:30:00','2025-08-30 19:30:00','2025-08-20 13:04:11','Sistema','finalizada');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (57,27,83,NULL,7.15,'2025-07-07 14:08:46','circunvalacion',1),(58,27,84,NULL,8.88,'2025-07-07 14:11:23','fraternidad',1),(59,28,85,NULL,6.38,'2025-07-09 13:49:15','direccion de envio',1),(60,28,86,NULL,6.67,'2025-07-09 19:21:51','en mi casa',1),(61,28,87,NULL,4.71,'2025-07-09 19:28:51','en mi casa',1),(62,28,88,NULL,1.74,'2025-07-09 20:49:13','NAAD',1),(63,29,89,NULL,1.3,'2025-07-10 14:46:47','nada',1),(71,29,81,NULL,20.03,'2025-07-16 15:23:56','BURGER HOUSE',1),(72,30,102,NULL,7.15,'2025-08-06 12:51:54','en mi casa',1),(73,30,103,NULL,6.38,'2025-08-06 12:57:55','nose',1),(74,30,104,NULL,12.76,'2025-08-06 13:10:04','en mi casa',1),(75,30,105,NULL,0.65,'2025-08-06 13:24:43','nada',1),(76,30,106,NULL,1.3,'2025-08-06 13:26:43','dasda',1),(77,30,107,NULL,10.1,'2025-08-06 13:28:11','quien sabe',1),(78,30,108,NULL,7.15,'2025-08-06 13:34:59','uguig',1),(79,30,109,NULL,5.8,'2025-08-06 13:48:30','dadwda',1),(80,30,110,NULL,6.67,'2025-08-06 14:04:45','nose',1),(81,30,111,NULL,5.8,'2025-08-06 14:06:40','ijij',1),(82,30,112,NULL,1.74,'2025-08-06 14:19:21','en mi casa',1),(83,30,113,NULL,7.44,'2025-08-06 14:21:34','nose',1),(84,30,114,NULL,0.65,'2025-08-06 14:35:30','nada',1),(85,30,115,NULL,1.29,'2025-08-06 14:37:43','add',1),(86,30,116,NULL,8.89,'2025-08-06 14:38:35','dadwad',1),(87,31,117,NULL,9.47,'2025-08-09 12:16:53','BURGER HOUSE',1),(88,31,118,NULL,7.15,'2025-08-09 12:27:27','BURGER HOUSE',1),(89,31,129,NULL,6.38,'2025-08-09 13:16:22','BURGER HOUSE',1),(90,31,130,NULL,1.29,'2025-08-09 13:20:45','BURGER HOUSE',1),(91,31,128,NULL,7.15,'2025-08-20 13:03:17','BURGER HOUSE',1),(93,33,185,NULL,6.38,'2025-10-01 14:21:46','BURGER HOUSE',1),(94,35,186,NULL,6.38,'2025-10-14 19:52:11','BH',1),(98,40,190,NULL,6.38,'2025-10-28 13:10:06','en casa',1),(99,42,191,NULL,12.18,'2025-11-05 20:59:00','BH',1),(100,42,192,NULL,1.74,'2025-11-05 21:03:44','DAWDAD',1),(101,43,193,NULL,1.74,'2025-11-06 07:36:57','BH',1),(102,44,194,NULL,6.38,'2025-11-19 10:16:30','BH',1),(103,45,195,NULL,0.65,'2025-11-19 12:25:51','calle 4 entre 9 y 10',1),(104,45,197,NULL,12.18,'2025-11-19 16:31:38','bh',1);
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
 1 AS `materia_prima`,
 1 AS `entradas`,
 1 AS `salidas`,
 1 AS `valor_stock`,
 1 AS `stock_actual`,
 1 AS `unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_inventario_productos_procesados`
--

DROP TABLE IF EXISTS `vista_inventario_productos_procesados`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_productos_procesados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_productos_procesados` AS SELECT 
 1 AS `producto`,
 1 AS `entradas`,
 1 AS `salidas`,
 1 AS `valor_stock`,
 1 AS `stock_actual`*/;
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
-- Dumping events for database 'burgerhouse'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `actualizar_inventario_materia_prima` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `actualizar_inventario_materia_prima` ON SCHEDULE EVERY 1 DAY STARTS '2025-11-19 16:09:00' ON COMPLETION PRESERVE ENABLE COMMENT 'Actualiza la existencia de materia prima considerando entradas vencidas' DO BEGIN
     DECLARE done INT DEFAULT FALSE;
    DECLARE v_id_materia INT;
    DECLARE v_existencia_actual FLOAT;
    DECLARE v_existencia_real FLOAT;
    DECLARE v_diferencia FLOAT;
    
    -- Cursor para todas las materias primas activas
    DECLARE cursor_materias CURSOR FOR
        SELECT 
            mp.id,
            mp.existencia,
            IFNULL(SUM(demp.existencia), 0) AS existencia_real
        FROM materia_prima mp
        LEFT JOIN detalles_entradas_materia_prima demp 
            ON demp.id_materia_prima = mp.id AND demp.active = 1
        WHERE mp.active = 1
        GROUP BY mp.id, mp.existencia;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Crear tabla temporal para log de ajustes
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_log_sincronizacion (
        id_materia INT,
        nombre_materia VARCHAR(50),
        existencia_anterior FLOAT,
        existencia_corregida FLOAT,
        diferencia FLOAT,
        fecha_ajuste DATETIME
    );
    
    -- Limpiar tabla temporal
    TRUNCATE temp_log_sincronizacion;
    
    -- Abrir cursor
    OPEN cursor_materias;
    
    read_loop: LOOP
        FETCH cursor_materias INTO 
            v_id_materia, 
            v_existencia_actual,
            v_existencia_real;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Calcular diferencia
        SET v_diferencia = v_existencia_actual - v_existencia_real;
        
        -- Solo actualizar si hay diferencia significativa (> 0.01)
        IF ABS(v_diferencia) > 0.01 THEN
            
            -- Registrar en log antes de actualizar
            INSERT INTO temp_log_sincronizacion
            SELECT 
                v_id_materia,
                mp.nombre,
                v_existencia_actual,
                v_existencia_real,
                v_diferencia,
                NOW()
            FROM materia_prima mp
            WHERE mp.id = v_id_materia;
            
            -- Actualizar existencia con el valor correcto
            UPDATE materia_prima
            SET existencia = v_existencia_real
            WHERE id = v_id_materia;
            
        END IF;
        
    END LOOP;
    
    CLOSE cursor_materias;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'burgerhouse'
--
/*!50003 DROP PROCEDURE IF EXISTS `Caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Caja`(IN idCaja INT)
BEGIN
    SELECT 
        mp.id AS id_metodo_pago,
        mp.nombre AS metodo_pago,
        CONCAT(c.nombre, ' ', c.apellido) AS cliente,
        pc.monto,
        pc.tasa,
        pc.fecha,
        pc.nro_orden,
        pc.tipo_pago
    FROM metodo_pago mp
    LEFT JOIN (
        -- Pagos de ventas
        SELECT 
            p.id_metodo_pago,
            p.monto,
            p.tasa,
            p.fecha,
            o.id_cliente,
            o.nro_orden,
            'venta' AS tipo_pago
        FROM pagos p
        INNER JOIN pago_venta pv ON pv.id_pago = p.id
        INNER JOIN ventas v ON v.id = pv.id_venta
        INNER JOIN orden o ON o.id = v.id_orden
        WHERE v.id_caja = idCaja

        UNION ALL

        -- Pagos de reservaciones
        SELECT 
            p.id_metodo_pago,
            p.monto,
            p.tasa,
            p.fecha,
            o.id_cliente,
            o.nro_orden,
            'reserva' AS tipo_pago
        FROM pagos p
        INNER JOIN pago_reserva pr ON pr.id_pago = p.id
        INNER JOIN reservaciones r ON r.id = pr.id_reserva
        LEFT JOIN orden o ON o.id = r.id_orden
        WHERE r.id_caja = idCaja
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CerrarCaja`(IN cajaId INT)
BEGIN
    DECLARE inicial_bs FLOAT DEFAULT 0;
    DECLARE inicial_dolar FLOAT DEFAULT 0;
    DECLARE total_bs FLOAT DEFAULT 0;
    DECLARE total_dolar FLOAT DEFAULT 0;
    DECLARE tasa_promedio_dolar FLOAT DEFAULT 0;

    -- Montos iniciales
    SELECT monto_inicial_bs, monto_inicial_dolar
    INTO inicial_bs, inicial_dolar
    FROM caja
    WHERE id = cajaId;

    -- Total pagos en Bs (de ventas y reservaciones)
    SELECT IFNULL(SUM(p.monto), 0)
    INTO total_bs
    FROM pagos p
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE m.nombre NOT IN ('Zelle', 'Binance', 'Divisa')
      AND p.id IN (
        -- pagos asociados a ventas
        SELECT pv.id_pago
        FROM pago_venta pv
        JOIN ventas v ON v.id = pv.id_venta
        WHERE v.id_caja = cajaId

        UNION ALL

        -- pagos asociados a reservaciones
        SELECT pr.id_pago
        FROM pago_reserva pr
        JOIN reservaciones r ON r.id = pr.id_reserva
        WHERE r.id_caja = cajaId
    );

    -- Total pagos en dólares (ventas y reservaciones)
    SELECT IFNULL(SUM(p.monto), 0)
    INTO total_dolar
    FROM pagos p
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE m.nombre IN ('Zelle', 'Binance', 'Divisa')
      AND p.id IN (
        SELECT pv.id_pago
        FROM pago_venta pv
        JOIN ventas v ON v.id = pv.id_venta
        WHERE v.id_caja = cajaId

        UNION ALL

        SELECT pr.id_pago
        FROM pago_reserva pr
        JOIN reservaciones r ON r.id = pr.id_reserva
        WHERE r.id_caja = cajaId
    );

    -- Tasa promedio dólar para pagos en Bs
    SELECT IFNULL(AVG(p.tasa), 0)
    INTO tasa_promedio_dolar
    FROM pagos p
    JOIN metodo_pago m ON m.id = p.id_metodo_pago
    WHERE m.nombre NOT IN ('Zelle', 'Binance', 'Divisa')
      AND p.id IN (
        SELECT pv.id_pago
        FROM pago_venta pv
        JOIN ventas v ON v.id = pv.id_venta
        WHERE v.id_caja = cajaId

        UNION ALL

        SELECT pr.id_pago
        FROM pago_reserva pr
        JOIN reservaciones r ON r.id = pr.id_reserva
        WHERE r.id_caja = cajaId
    );

    -- Actualizar caja con totales
    UPDATE caja
    SET 
        monto_final_bs = inicial_bs + total_bs,
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoClienteAnual`(IN p_anio INT)
BEGIN
    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoClienteMes`(IN p_anio INT, IN p_mes INT)
BEGIN
 DECLARE fecha_inicio DATE;
    DECLARE fecha_fin DATE;

    
    SET lc_time_names = 'es_ES';

    
    SET fecha_inicio = DATE(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01'));
    SET fecha_fin = LAST_DAY(fecha_inicio);

    
    DROP TEMPORARY TABLE IF EXISTS fechas_mes;
    CREATE TEMPORARY TABLE fechas_mes (
        fecha DATE,
        semana_iso INT
    );

    
    WHILE fecha_inicio <= fecha_fin DO
        INSERT INTO fechas_mes (fecha, semana_iso)
        VALUES (fecha_inicio, WEEK(fecha_inicio, 3));
        SET fecha_inicio = DATE_ADD(fecha_inicio, INTERVAL 1 DAY);
    END WHILE;

    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GastoClienteSemana`(
    IN p_anio INT,
    IN p_semana INT
)
BEGIN
    DECLARE target_yearweek INT;

    
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
/*!50003 DROP PROCEDURE IF EXISTS `porcentaje_reservaciones_anio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje_reservaciones_anio`(
    IN p_anio INT
)
BEGIN
    DECLARE total_reservaciones INT;

    -- Calcular el total de reservaciones para el año especificado
    SELECT COUNT(*) INTO total_reservaciones
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio;

    -- Calcular reservaciones por cada hora
    SELECT 
        '5 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 17

    UNION ALL

    SELECT 
        '6 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 18

    UNION ALL

    SELECT 
        '7 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 19

    UNION ALL

    SELECT 
        '8 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 20

    UNION ALL

    SELECT 
        '9 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 21

    UNION ALL

    SELECT 
        '10 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 22

    UNION ALL

    SELECT 
        '11 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 23;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `porcentaje_reservaciones_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje_reservaciones_mes`(
    IN p_mes INT,
    IN p_anio INT
)
BEGIN
    DECLARE total_reservaciones INT;

    -- Calcular el total de reservaciones para el mes y año especificados
    SELECT COUNT(*) INTO total_reservaciones
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio;

    -- Calcular reservaciones por cada hora
    SELECT 
        '5 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 17

    UNION ALL

    SELECT 
        '6 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 18

    UNION ALL

    SELECT 
        '7 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 19

    UNION ALL

    SELECT 
        '8 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 20

    UNION ALL

    SELECT 
        '9 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 21

    UNION ALL

    SELECT 
        '10 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 22

    UNION ALL

    SELECT 
        '11 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    WHERE MONTH(r.fecha_inicio) = p_mes
    AND YEAR(r.fecha_inicio) = p_anio
    AND HOUR(r.fecha_inicio) = 23;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `porcentaje_reservaciones_semana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentaje_reservaciones_semana`(
    IN p_semana INT,
    IN p_anio INT
)
BEGIN
    DECLARE total_reservaciones INT;

    -- Calcular el total de reservaciones para la semana y año especificados
    SELECT COUNT(*) INTO total_reservaciones
    FROM (
        WITH 
        RECURSIVE calendario AS (
            SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
            UNION ALL
            SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
            FROM calendario
            WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
        )
        SELECT fecha
        FROM calendario
        WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
    ) AS semana_iso
    JOIN reservaciones r ON DATE(r.fecha_inicio) = semana_iso.fecha;

    -- Calcular reservaciones por cada hora
    SELECT 
        '5 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 17

    UNION ALL

    SELECT 
        '6 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 18

    UNION ALL

    SELECT 
        '7 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 19

    UNION ALL

    SELECT 
        '8 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 20

    UNION ALL

    SELECT 
        '9 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 21

    UNION ALL

    SELECT 
        '10 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 22

    UNION ALL

    SELECT 
        '11 PM' AS hora,
        COUNT(*) AS cantidad,
        CASE 
            WHEN total_reservaciones = 0 THEN 0 
            ELSE ROUND((COUNT(*) / total_reservaciones) * 100, 2) 
        END AS porcentaje
    FROM reservaciones r
    JOIN (
        SELECT fecha
        FROM (
            WITH 
            RECURSIVE calendario AS (
                SELECT DATE(CONCAT(p_anio, '-01-01')) AS fecha
                UNION ALL
                SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
                FROM calendario
                WHERE fecha < DATE(CONCAT(p_anio, '-12-31'))
            )
            SELECT fecha
            FROM calendario
            WHERE YEARWEEK(fecha, 1) = (p_anio * 100 + p_semana)
        ) AS semana_iso
    ) AS si ON DATE(r.fecha_inicio) = si.fecha
    WHERE HOUR(r.fecha_inicio) = 23;

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoAnio`(IN p_anio INT)
BEGIN

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoMes`(IN p_anio INT, IN p_mes INT)
BEGIN
SET lc_time_names = 'es_ES';

    
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

    
    ranking AS (
        SELECT
            vs.*,
            ROW_NUMBER() OVER (
                PARTITION BY vs.semana
                ORDER BY vs.total_cantidad DESC
            ) AS rn
        FROM ventas_semanales vs
    ),

    
    top_ventas AS (
        SELECT
            semana,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMasVendidoSemana`(IN p_anio INT, IN p_semana INT)
BEGIN
    
    SET lc_time_names = 'es_ES';

    
    WITH dias_semana AS (
        SELECT 0 AS dia_orden, 'Lunes' AS dia UNION ALL
        SELECT 1, 'Martes' UNION ALL
        SELECT 2, 'Miércoles' UNION ALL
        SELECT 3, 'Jueves' UNION ALL
        SELECT 4, 'Viernes' UNION ALL
        SELECT 5, 'Sábado' UNION ALL
        SELECT 6, 'Domingo'
    ),

    
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

    
    ranking AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY dia_orden
                ORDER BY total_cantidad DESC
            ) AS rn
        FROM ventas_semanales
    ),

    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoAnio`(IN p_anio INT)
BEGIN

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoMes`(IN p_anio INT, IN p_mes INT)
BEGIN
SET lc_time_names = 'es_ES';

    
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

    
    ranking AS (
        SELECT
            vs.*,
            ROW_NUMBER() OVER (
                PARTITION BY vs.semana
                ORDER BY vs.total_cantidad ASC
            ) AS rn
        FROM ventas_semanales vs
    ),

    
    top_ventas AS (
        SELECT
            semana,
            producto_nombre,
            total_cantidad,
            ROUND(total_monto, 2) AS total_monto
        FROM ranking
        WHERE rn <= 3
    )

    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosMenosVendidoSemana`(IN p_anio INT, IN p_semana INT)
BEGIN
    
    SET lc_time_names = 'es_ES';

    
    WITH dias_semana AS (
        SELECT 0 AS dia_orden, 'Lunes' AS dia UNION ALL
        SELECT 1, 'Martes' UNION ALL
        SELECT 2, 'Miércoles' UNION ALL
        SELECT 3, 'Jueves' UNION ALL
        SELECT 4, 'Viernes' UNION ALL
        SELECT 5, 'Sábado' UNION ALL
        SELECT 6, 'Domingo'
    ),

    
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

    
    ranking AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY dia_orden
                ORDER BY total_cantidad DESC
            ) AS rn
        FROM ventas_semanales
    ),

    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoAnual`(IN `p_anio` INT)
BEGIN
    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoMes`(IN `p_anio` INT, IN `p_mes` INT)
BEGIN
    
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
/*!50003 DROP PROCEDURE IF EXISTS `ReservasPorMetodoSemana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservasPorMetodoSemana`(
    IN p_anio INT,
    IN p_semana INT
)
BEGIN
    -- Versión adaptada para trabajar por semana y año
    SELECT
        metodo_pedido,
        COUNT(*) AS cantidad_reservas
    FROM reservaciones
    WHERE YEARWEEK(fecha_inicio, 1) = (p_anio * 100 + p_semana)
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaAnual`(IN p_anio INT)
BEGIN
    
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
    
    utilidad_por_mes AS (
        SELECT 
            MONTH(mc.fecha) AS mes_numero,
            ROUND(SUM(CASE WHEN mc.monto / mc.tasa > 0 THEN mc.monto / mc.tasa ELSE 0 END), 2) AS ingresos,
            ROUND(SUM(CASE WHEN mc.monto / mc.tasa > 0 AND mc.descripcion LIKE '%Ingreso por venta%' 
                           THEN mc.monto / mc.tasa ELSE 0 END), 2) AS ventas,
            ROUND(SUM(CASE WHEN mc.monto / mc.tasa < 0 THEN mc.monto / mc.tasa ELSE 0 END), 2) AS gastos,
            ROUND(
                SUM(CASE WHEN mc.monto / mc.tasa > 0 THEN mc.monto / mc.tasa ELSE 0 END) +
                SUM(CASE WHEN mc.monto / mc.tasa < 0 THEN mc.monto / mc.tasa ELSE 0 END), 2
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaMes`(IN p_anio INT, IN p_mes INT)
BEGIN
    
    WITH RECURSIVE calendario AS (
        SELECT DATE(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01')) AS fecha
        UNION ALL
        SELECT DATE_ADD(fecha, INTERVAL 1 DAY)
        FROM calendario
        WHERE MONTH(fecha) = p_mes
          AND fecha < LAST_DAY(CONCAT(p_anio, '-', LPAD(p_mes, 2, '0'), '-01'))
    ),

    semanas_del_mes AS (
        SELECT 
            YEARWEEK(fecha, 1) AS anio_semana,
            WEEK(fecha, 1)     AS semana,
            MIN(fecha) OVER (PARTITION BY WEEK(fecha, 1)) AS inicio_semana,
            MAX(fecha) OVER (PARTITION BY WEEK(fecha, 1)) AS fin_semana,
            fecha
        FROM calendario
    ),

    semanas_agrupadas AS (
        SELECT DISTINCT 
            semana,
            DATE_FORMAT(MIN(fecha), '%Y-%m-%d') AS fecha_inicio,
            DATE_FORMAT(MAX(fecha), '%Y-%m-%d') AS fecha_fin
        FROM semanas_del_mes
        GROUP BY semana
    )

    SELECT 
        sa.semana                               AS semana,
        sa.fecha_inicio                         AS fecha_inicio,
        sa.fecha_fin                            AS fecha_fin,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ingresos,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 
                 AND mc.descripcion LIKE '%Ingreso por venta%' 
            THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ventas,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS gastos,
        
        ROUND(
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END) +
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END)
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UtilidadNetaSemana`(IN p_anio INT, IN p_semana INT)
BEGIN
    DECLARE target_yearweek INT;

    -- Construir el formato de YEARWEEK
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
            WEEKDAY(si.fecha) + 1  AS dia_orden,
            dn.dia_nombre
        FROM semana_iso si
        JOIN dias_nombres dn ON dn.dia_orden = WEEKDAY(si.fecha) + 1
    )

    SELECT
        ds.dia_nombre                                AS dia,
        DATE_FORMAT(ds.fecha, '%Y-%m-%d')            AS fecha,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ingresos,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) > 0 
                 AND mc.descripcion LIKE '%Ingreso por venta%' 
            THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS ventas,
        
        ROUND(SUM(CASE 
            WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0)
        END), 2) AS gastos,
        
        ROUND(
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) > 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END) +
            SUM(CASE WHEN mc.monto / NULLIF(mc.tasa,0) < 0 THEN mc.monto / NULLIF(mc.tasa,0) ELSE 0 END)
        , 2) AS utilidad_neta

    FROM dias_semana ds
    LEFT JOIN movimientos_capital mc 
           ON DATE(mc.fecha) = ds.fecha
    GROUP BY ds.dia_orden, ds.dia_nombre, ds.fecha
    ORDER BY ds.dia_orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `products_details_order`
--

/*!50001 DROP VIEW IF EXISTS `products_details_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_details_order` AS with `productos_preparables` as (select `r`.`id_producto` AS `id_producto`,min(floor((`demp`.`existencia` / `dr`.`cantidad`))) AS `unidades_preparables` from (((`recetas` `r` join `detalles_receta` `dr` on((`dr`.`id_receta` = `r`.`id`))) join `materia_prima` `mp` on((`mp`.`id` = `dr`.`id_materia_prima`))) join (select `detalles_entradas_materia_prima`.`id_materia_prima` AS `id_materia_prima`,sum(`detalles_entradas_materia_prima`.`existencia`) AS `existencia` from `detalles_entradas_materia_prima` where ((`detalles_entradas_materia_prima`.`active` = 1) and (now() < `detalles_entradas_materia_prima`.`fecha_vencimiento`)) group by `detalles_entradas_materia_prima`.`id_materia_prima`) `demp` on((`demp`.`id_materia_prima` = `mp`.`id`))) where ((`r`.`active` = 1) and (`mp`.`active` = 1)) group by `r`.`id_producto`), `preparados` as (select `pp`.`id` AS `id`,(cast(`pp`.`nombre` as char charset utf8mb4) collate utf8mb4_general_ci) AS `nombre`,(cast(`pp`.`imagen` as char charset utf8mb4) collate utf8mb4_general_ci) AS `imagen`,`pp`.`precio` AS `precio`,(cast(`pp`.`detalles` as char charset utf8mb4) collate utf8mb4_general_ci) AS `detalles`,(cast(`cp`.`nombre` as char charset utf8mb4) collate utf8mb4_general_ci) AS `categoria`,'preparado' AS `tipo_producto`,coalesce(`prep`.`unidades_preparables`,0) AS `cantidad_disponible`,`pp`.`active` AS `active` from ((`productos_preparados` `pp` join `categorias_productos` `cp` on((`cp`.`id` = `pp`.`id_categoria`))) left join `productos_preparables` `prep` on((`prep`.`id_producto` = `pp`.`id`))) where ((`pp`.`tipo` = 'producto') and (`pp`.`active` = 1))), `procesados` as (select `p`.`id` AS `id`,(cast(`p`.`nombre` as char charset utf8mb4) collate utf8mb4_general_ci) AS `nombre`,(cast(`p`.`imagen` as char charset utf8mb4) collate utf8mb4_general_ci) AS `imagen`,`p`.`precio` AS `precio`,(cast(`p`.`detalles` as char charset utf8mb4) collate utf8mb4_general_ci) AS `detalles`,(cast(`cp`.`nombre` as char charset utf8mb4) collate utf8mb4_general_ci) AS `categoria`,'procesado' AS `tipo_producto`,`p`.`existencia` AS `cantidad_disponible`,`p`.`active` AS `active` from (`productos_procesados` `p` join `categorias_productos` `cp` on((`cp`.`id` = `p`.`id_categoria`)))) select `preparados`.`id` AS `id`,`preparados`.`nombre` AS `nombre`,`preparados`.`imagen` AS `imagen`,`preparados`.`precio` AS `precio`,`preparados`.`detalles` AS `detalles`,`preparados`.`categoria` AS `categoria`,`preparados`.`tipo_producto` AS `tipo_producto`,`preparados`.`cantidad_disponible` AS `cantidad_disponible`,(case when (`preparados`.`cantidad_disponible` > 0) then 'Disponible' else 'Sin stock' end) AS `estado_stock`,`preparados`.`active` AS `active` from `preparados` union all select `procesados`.`id` AS `id`,`procesados`.`nombre` AS `nombre`,`procesados`.`imagen` AS `imagen`,`procesados`.`precio` AS `precio`,`procesados`.`detalles` AS `detalles`,`procesados`.`categoria` AS `categoria`,`procesados`.`tipo_producto` AS `tipo_producto`,`procesados`.`cantidad_disponible` AS `cantidad_disponible`,(case when (`procesados`.`cantidad_disponible` > 0) then 'Disponible' else 'Sin stock' end) AS `estado_stock`,`procesados`.`active` AS `active` from `procesados` order by `tipo_producto`,`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `vista_inventario_materia_prima` AS with `entradas_totales` as (select `detalles_entradas_materia_prima`.`id_materia_prima` AS `id_materia_prima`,sum(`detalles_entradas_materia_prima`.`cantidad`) AS `total_comprado` from `detalles_entradas_materia_prima` group by `detalles_entradas_materia_prima`.`id_materia_prima`), `valor_entradas_normalizado` as (select `emp`.`id_materia_prima` AS `id_materia_prima`,sum((case when (`pemp`.`id_metodo_pago` in (1,2,12,13)) then `pemp`.`precio_compra` else (`pemp`.`precio_compra` / `pemp`.`tasa`) end)) AS `costo_total_dolares`,sum(`emp`.`cantidad`) AS `cantidad_total` from (`pagos_entrada_materia_prima` `pemp` join `detalles_entradas_materia_prima` `emp` on((`pemp`.`id_entrada` = `emp`.`id_entrada`))) group by `emp`.`id_materia_prima`) select `mp`.`nombre` AS `materia_prima`,coalesce(`et`.`total_comprado`,0) AS `entradas`,(coalesce(`et`.`total_comprado`,0) - `mp`.`existencia`) AS `salidas`,(case when (`ven`.`cantidad_total` > 0) then round(((`ven`.`costo_total_dolares` / `ven`.`cantidad_total`) * `mp`.`existencia`),2) else 0 end) AS `valor_stock`,`mp`.`existencia` AS `stock_actual`,`u`.`alias` AS `unidad` from (((`materia_prima` `mp` left join `unidades` `u` on((`mp`.`id_unidad` = `u`.`id`))) left join `entradas_totales` `et` on((`mp`.`id` = `et`.`id_materia_prima`))) left join `valor_entradas_normalizado` `ven` on((`mp`.`id` = `ven`.`id_materia_prima`))) where (`mp`.`active` = 1) */;
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
/*!50001 VIEW `vista_inventario_productos_procesados` AS with `entradas_totales` as (select `entradas_producto_procesado`.`id_producto` AS `id_producto`,sum(`entradas_producto_procesado`.`cantidad`) AS `total_comprado` from `entradas_producto_procesado` group by `entradas_producto_procesado`.`id_producto`), `valor_entradas_normalizado` as (select `epp`.`id_producto` AS `id_producto`,sum((case when (`pepp`.`id_metodo_pago` in (1,2,12,13)) then `pepp`.`precio_compra` else (`pepp`.`precio_compra` / `pepp`.`tasa`) end)) AS `costo_total_dolares`,sum(`epp`.`cantidad`) AS `cantidad_total` from (`pagos_entrada_producto_procesado` `pepp` join `entradas_producto_procesado` `epp` on((`pepp`.`id_entrada` = `epp`.`id`))) group by `epp`.`id_producto`) select `pp`.`nombre` AS `producto`,coalesce(`et`.`total_comprado`,0) AS `entradas`,(coalesce(`et`.`total_comprado`,0) - `pp`.`existencia`) AS `salidas`,(case when (`ven`.`cantidad_total` > 0) then round(((`ven`.`costo_total_dolares` / `ven`.`cantidad_total`) * `pp`.`existencia`),2) else 0 end) AS `valor_stock`,`pp`.`existencia` AS `stock_actual` from ((`productos_procesados` `pp` left join `entradas_totales` `et` on((`pp`.`id` = `et`.`id_producto`))) left join `valor_entradas_normalizado` `ven` on((`pp`.`id` = `ven`.`id_producto`))) where (`pp`.`active` = 1) */;
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
/*!50001 VIEW `vista_resumen_clientes` AS with `total_gasto` as (select `o`.`id_cliente` AS `id_cliente`,sum(`v`.`monto_final`) AS `total_gastado` from (`ventas` `v` join `orden` `o` on((`o`.`id` = `v`.`id_orden`))) where (`o`.`id_cliente` is not null) group by `o`.`id_cliente`), `ultima_orden` as (select `orden`.`id_cliente` AS `id_cliente`,max(`orden`.`fecha`) AS `ultima_fecha` from `orden` where (`orden`.`id_cliente` is not null) group by `orden`.`id_cliente`), `productos_cliente` as (select `o`.`id_cliente` AS `id_cliente`,`p`.`nombre` AS `producto`,`p`.`imagen` AS `imagen`,sum(`od`.`cantidad`) AS `total_consumido`,row_number() OVER (PARTITION BY `o`.`id_cliente` ORDER BY sum(`od`.`cantidad`) desc )  AS `rn` from ((`orden` `o` join `producto_preparado_detalle_orden` `od` on((`od`.`id_orden` = `o`.`id`))) join `productos_preparados` `p` on((`p`.`id` = `od`.`id_producto`))) where ((`p`.`tipo` = 'producto') and (`o`.`id_cliente` is not null)) group by `o`.`id_cliente`,`p`.`nombre`,`p`.`imagen`), `clientes_con_productos` as (select distinct `productos_cliente`.`id_cliente` AS `id_cliente` from `productos_cliente`), `top_1` as (select `productos_cliente`.`id_cliente` AS `id_cliente`,`productos_cliente`.`producto` AS `producto1`,`productos_cliente`.`imagen` AS `imagen1` from `productos_cliente` where (`productos_cliente`.`rn` = 1)), `top_2` as (select `productos_cliente`.`id_cliente` AS `id_cliente`,`productos_cliente`.`producto` AS `producto2`,`productos_cliente`.`imagen` AS `imagen2` from `productos_cliente` where (`productos_cliente`.`rn` = 2)), `top_3` as (select `productos_cliente`.`id_cliente` AS `id_cliente`,`productos_cliente`.`producto` AS `producto3`,`productos_cliente`.`imagen` AS `imagen3` from `productos_cliente` where (`productos_cliente`.`rn` = 3)) select `c`.`nombre` AS `cliente`,`c`.`apellido` AS `apellido`,`c`.`telefono` AS `telefono`,date_format(`uo`.`ultima_fecha`,'%Y-%m-%d %H:%i:%s') AS `ultima_orden`,round(coalesce(`tg`.`total_gastado`,0),2) AS `total_gastado`,coalesce(`t1`.`producto1`,'Sin producto') AS `producto_1`,`t1`.`imagen1` AS `imagen_1`,coalesce(`t2`.`producto2`,'Sin producto') AS `producto_2`,`t2`.`imagen2` AS `imagen_2`,coalesce(`t3`.`producto3`,'Sin producto') AS `producto_3`,`t3`.`imagen3` AS `imagen_3` from ((((((`clientes` `c` join `clientes_con_productos` `cp` on((`c`.`id` = `cp`.`id_cliente`))) left join `total_gasto` `tg` on((`c`.`id` = `tg`.`id_cliente`))) left join `ultima_orden` `uo` on((`c`.`id` = `uo`.`id_cliente`))) left join `top_1` `t1` on((`c`.`id` = `t1`.`id_cliente`))) left join `top_2` `t2` on((`c`.`id` = `t2`.`id_cliente`))) left join `top_3` `t3` on((`c`.`id` = `t3`.`id_cliente`))) where (`c`.`active` = 1) */;
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
/*!50001 VIEW `vista_resumen_financiero` AS select round(ifnull(sum((case when ((`movimientos_capital`.`monto` / `movimientos_capital`.`tasa`) > 0) then (`movimientos_capital`.`monto` * `movimientos_capital`.`tasa`) end)),0),2) AS `ingresos`,round(ifnull(sum((case when (((`movimientos_capital`.`monto` / `movimientos_capital`.`tasa`) > 0) and (`movimientos_capital`.`descripcion` like '%Ingreso por venta%')) then (`movimientos_capital`.`monto` / `movimientos_capital`.`tasa`) end)),0),2) AS `ventas`,round(ifnull(sum((case when ((`movimientos_capital`.`monto` / `movimientos_capital`.`tasa`) < 0) then (`movimientos_capital`.`monto` * `movimientos_capital`.`tasa`) end)),0),2) AS `gastos`,round((ifnull(sum((case when ((`movimientos_capital`.`monto` / `movimientos_capital`.`tasa`) > 0) then (`movimientos_capital`.`monto` * `movimientos_capital`.`tasa`) end)),0) + ifnull(sum((case when ((`movimientos_capital`.`monto` / `movimientos_capital`.`tasa`) < 0) then (`movimientos_capital`.`monto` * `movimientos_capital`.`tasa`) end)),0)),2) AS `utilidad_neta` from `movimientos_capital` */;
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

-- Dump completed on 2025-11-19 20:55:52
