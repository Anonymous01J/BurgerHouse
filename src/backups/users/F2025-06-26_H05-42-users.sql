-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: usuarios_burgerhouse
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
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  PRIMARY KEY (`id`),
  KEY `Usuario` (`id_usuario`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (26,11,'Adicionales','Agregar','2025-05-28 08:17:19','Se agrego un nuevo adicional'),(27,11,'Adicionales','Eliminacion','2025-05-28 08:18:35','Se ha eliminado un adicional'),(28,11,'Clientes','Eliminacion','2025-05-28 08:49:48','Se elimino un cliente'),(29,11,'Clientes','Actualizacion','2025-05-28 08:51:01','Se actualizo un cliente'),(30,11,'Clientes','Agregar','2025-05-28 08:51:47','Se agrego un nuevo cliente'),(31,11,'Clientes','Actualizacion','2025-05-28 08:54:06','Se actualizo un cliente'),(32,11,'Papelera','Restaurar','2025-05-28 10:05:24','Se ha restaurado un elemento de la papelera'),(33,11,'Producto procesado','Agregar','2025-05-28 10:35:32','Se agrego un producto procesado'),(34,11,'Papelera','Restaurar','2025-05-28 10:47:39','Se ha restaurado un elemento de la papelera'),(35,11,'Orden de domicilio','Creacion','2025-05-28 11:38:22','Se creo una orden de domicilio'),(36,11,'Producto procesado','Actualizacion','2025-05-28 11:48:27','Se agrego un producto procesado'),(37,11,'Clientes','Agregar','2025-05-28 11:48:54','Se agrego un nuevo cliente'),(38,11,'Caja','Agregar','2025-05-28 12:51:06','Se abrio una caja'),(39,11,'Orden de domicilio','Creacion','2025-05-28 13:41:29','Se creo una orden de domicilio'),(40,11,'Orden de cocina','Preparado','2025-05-28 14:36:13','Se preparo una orden de cocina'),(41,11,'Orden de cocina','Preparado','2025-05-28 14:40:43','Se preparo una orden de cocina'),(42,11,'Orden de delivery','Orden aceptada','2025-05-28 15:13:47','Se acepto una orden de delivery'),(43,11,'Usuarios','Login','2025-05-29 10:11:20','inicio de sesion'),(44,11,'orden','Actualizacion','2025-05-29 13:22:41','Se verifico la orden 10466000'),(45,11,'Orden de cocina','Preparado','2025-05-29 13:31:15','Se preparo una orden de cocina'),(46,11,'orden','Actualizacion','2025-05-29 13:33:38','Se anulo la orden 83599400'),(47,11,'orden','Actualizacion','2025-05-29 13:33:44','Se verifico la orden 10466000'),(48,11,'Orden de cocina','Preparado','2025-05-29 13:33:50','Se preparo una orden de cocina'),(49,11,'Orden de cocina','Preparado','2025-05-29 17:24:23','Se preparo una orden de cocina'),(50,11,'orden','Actualizacion','2025-05-29 17:27:48','Se anulo la orden 83599400'),(51,11,'Usuarios','Login','2025-05-29 19:53:06','inicio de sesion'),(52,11,'Usuarios','Agregar','2025-05-29 21:47:47','Se agrego un usuario'),(53,11,'Clientes','Eliminacion','2025-05-29 21:50:38','Se elimino un cliente'),(54,11,'Clientes','Eliminacion','2025-05-29 21:50:42','Se elimino un cliente'),(55,11,'orden','Actualizacion','2025-05-29 22:00:50','Se verifico la orden 83599400'),(56,11,'Orden de cocina','Preparado','2025-05-29 22:00:59','Se preparo una orden de cocina'),(57,11,'Orden de delivery','Orden aceptada','2025-05-29 22:01:35','Se acepto una orden de delivery'),(58,11,'Orden de delivery','Orden aceptada','2025-05-29 22:08:21','Se acepto una orden de delivery'),(59,11,'Orden de delivery','Orden aceptada','2025-05-29 22:19:25','Se acepto una orden de delivery'),(60,11,'Orden de delivery','Orden aceptada','2025-05-29 22:20:24','Se acepto una orden de delivery'),(61,11,'Orden de delivery','Orden aceptada','2025-05-29 22:21:35','Se acepto una orden de delivery'),(62,14,'Usuarios','Login','2025-06-02 13:52:53','inicio de sesion'),(63,11,'Orden de delivery','Orden aceptada','2025-06-04 14:22:56','Se acepto una orden de delivery'),(64,11,'Usuarios','Login','2025-06-05 12:25:50','inicio de sesion'),(65,11,'Usuarios','Login','2025-06-06 11:19:40','inicio de sesion'),(66,11,'orden','Actualizacion','2025-06-06 11:20:23','Se verifico la orden 10466000'),(67,11,'Entradas','Agregado','2025-06-06 11:24:28','Se ha agregado una entrada de materia prima'),(68,11,'Caja','Agregar','2025-06-06 14:58:16','Se abrio una caja'),(69,11,'Orden de domicilio','Creacion','2025-06-06 15:10:54','Se creo una orden de domicilio'),(70,11,'Orden de domicilio','Creacion','2025-06-06 16:54:58','Se creo una orden de domicilio'),(71,11,'orden','Actualizacion','2025-06-06 16:56:33','Se anulo la orden 42777800'),(72,11,'orden','Actualizacion','2025-06-06 16:58:21','Se verifico la orden 42777800'),(73,11,'orden','Actualizacion','2025-06-06 17:02:27','Se verifico la orden 42777800'),(74,11,'orden','Actualizacion','2025-06-06 17:11:20','Se verifico la orden 42777800'),(75,11,'Orden de cocina','Preparado','2025-06-06 17:23:16','Se preparo una orden de cocina'),(76,11,'Orden de cocina','Preparado','2025-06-06 17:24:11','Se preparo una orden de cocina'),(77,11,'orden','Actualizacion','2025-06-06 17:25:30','Se entrego la orden 42777800'),(78,11,'orden','Actualizacion','2025-06-06 17:25:49','Se verifico la orden 42777800'),(79,11,'orden','Actualizacion','2025-06-06 17:29:37','Se verifico la orden 42777800'),(80,11,'Orden de cocina','Preparado','2025-06-06 17:29:48','Se preparo una orden de cocina'),(81,11,'orden','Actualizacion','2025-06-06 17:30:00','Se entrego la orden 42777800'),(82,11,'orden','Actualizacion','2025-06-06 17:41:37','Se verifico la orden 42777800'),(83,11,'Orden de cocina','Preparado','2025-06-06 17:45:55','Se preparo una orden de cocina'),(84,11,'Orden de cocina','Preparado','2025-06-06 17:49:35','Se preparo una orden de cocina'),(85,11,'Usuarios','Login','2025-06-06 21:05:09','inicio de sesion'),(86,11,'Usuarios','Login','2025-06-06 21:17:43','inicio de sesion'),(87,11,'Usuarios','Login','2025-06-06 22:11:54','inicio de sesion'),(88,11,'Usuarios','Login','2025-06-06 22:24:05','inicio de sesion'),(89,11,'Usuarios','Login','2025-06-07 12:36:46','inicio de sesion'),(90,11,'Proveedores','Agregar','2025-06-07 12:56:54','Se Agrego un proveedor'),(91,11,'Usuarios','Login','2025-06-09 11:06:06','inicio de sesion'),(92,11,'Usuarios','Login','2025-06-10 10:11:46','inicio de sesion'),(93,11,'Caja','Agregar','2025-06-10 15:51:36','Se abrio una caja'),(94,11,'Orden de domicilio','Creacion','2025-06-10 15:56:08','Se creo una orden de domicilio'),(95,11,'Productos Preparados','Actualizacion','2025-06-10 16:35:05','Se actualizo un producto preparado'),(96,11,'Usuarios','Login','2025-06-11 10:12:25','inicio de sesion'),(97,11,'Caja','Agregar','2025-06-11 12:08:15','Se abrio una caja'),(98,11,'Orden de domicilio','Creacion','2025-06-11 12:11:34','Se creo una orden de domicilio'),(99,11,'Orden de domicilio','Creacion','2025-06-11 12:14:19','Se creo una orden de domicilio'),(100,11,'Orden de domicilio','Creacion','2025-06-11 12:17:01','Se creo una orden de domicilio'),(101,11,'Usuarios','Login','2025-06-12 15:27:59','inicio de sesion'),(102,11,'Usuarios','Login','2025-06-13 09:41:13','inicio de sesion'),(103,11,'capital','Agregar','2025-06-13 15:06:39','Guardar Ingreso en capital de 10 $'),(104,11,'capital','Agregar','2025-06-13 15:07:46','Guardar Gasto en capital de 10 $'),(105,11,'Usuarios','Login','2025-06-16 10:29:57','inicio de sesion'),(106,11,'Caja','Agregar','2025-06-16 14:49:43','Se abrio una caja'),(107,11,'Orden de domicilio','Creacion','2025-06-16 14:51:06','Se creo una orden de domicilio'),(108,11,'Orden de domicilio','Creacion','2025-06-16 15:56:19','Se creo una orden de domicilio'),(109,11,'Usuarios','Login','2025-06-17 12:00:59','inicio de sesion'),(110,11,'Caja','Cerrar','2025-06-17 12:15:17','Se cerro la caja 15'),(111,11,'Caja','Cerrar','2025-06-17 12:16:11','Se cerro la caja 16'),(112,11,'Caja','Cerrar','2025-06-17 12:19:25','Se cerro la caja 11'),(113,11,'Caja','Agregar','2025-06-17 14:03:35','Se abrio una caja'),(114,11,'Caja','Cerrar','2025-06-17 14:04:58','Se cerro la caja 17'),(115,11,'Caja','Agregar','2025-06-17 14:09:59','Se abrio una caja'),(116,11,'Caja','Cerrar','2025-06-17 14:11:09','Se cerro la caja 18'),(117,11,'Producto procesado','Actualizacion','2025-06-17 16:44:44','Se agrego un producto procesado'),(118,11,'Caja','Cerrar','2025-06-17 19:03:26','Se cerro la caja 18'),(119,11,'Usuarios','Login','2025-06-18 09:34:14','inicio de sesion'),(120,11,'Caja','Agregar','2025-06-18 09:41:30','Se abrio una caja'),(121,11,'Orden de domicilio','Creacion','2025-06-18 09:42:46','Se creo una orden de domicilio'),(122,11,'Orden de domicilio','Creacion','2025-06-18 09:46:31','Se creo una orden de domicilio'),(123,11,'Orden de domicilio','Creacion','2025-06-18 09:59:39','Se creo una orden de domicilio'),(124,11,'Orden de domicilio','Creacion','2025-06-18 10:02:23','Se creo una orden de domicilio'),(125,11,'Orden de domicilio','Creacion','2025-06-18 10:03:42','Se creo una orden de domicilio'),(126,11,'Orden de domicilio','Creacion','2025-06-18 10:05:12','Se creo una orden de domicilio'),(127,11,'Orden de domicilio','Creacion','2025-06-18 10:08:35','Se creo una orden de domicilio'),(128,11,'Orden de domicilio','Creacion','2025-06-18 10:10:25','Se creo una orden de domicilio'),(129,11,'Orden de domicilio','Creacion','2025-06-18 10:11:50','Se creo una orden de domicilio'),(130,11,'Orden de domicilio','Creacion','2025-06-18 10:12:55','Se creo una orden de domicilio'),(131,11,'Orden de cocina','Preparado','2025-06-18 10:18:16','Se preparo una orden de cocina'),(132,11,'Orden de domicilio','Creacion','2025-06-18 14:10:10','Se creo una orden de domicilio'),(133,11,'Usuarios','Login','2025-06-19 10:51:43','inicio de sesion'),(134,11,'Caja','Cerrar','2025-06-19 10:52:41','Se cerro la caja 19'),(135,11,'Caja','Agregar','2025-06-19 10:52:52','Se abrio una caja'),(136,11,'Orden de domicilio','Creacion','2025-06-19 10:53:54','Se creo una orden de domicilio'),(137,11,'Orden de domicilio','Creacion','2025-06-19 10:53:54','Se creo una orden de domicilio'),(138,11,'Orden de domicilio','Creacion','2025-06-19 17:18:44','Se creo una orden de domicilio'),(139,11,'Orden de domicilio','Creacion','2025-06-19 17:19:52','Se creo una orden de domicilio'),(140,11,'Orden de domicilio','Creacion','2025-06-19 17:19:52','Se creo una orden de domicilio'),(141,11,'Orden de domicilio','Creacion','2025-06-19 17:21:59','Se creo una orden de domicilio'),(142,11,'Orden de domicilio','Creacion','2025-06-19 17:23:22','Se creo una orden de domicilio'),(143,11,'Orden de domicilio','Creacion','2025-06-19 17:24:07','Se creo una orden de domicilio'),(144,11,'Orden de domicilio','Creacion','2025-06-19 17:27:34','Se creo una orden de domicilio'),(145,11,'Orden de domicilio','Creacion','2025-06-19 17:28:35','Se creo una orden de domicilio'),(146,11,'Orden de domicilio','Creacion','2025-06-19 17:30:50','Se creo una orden de domicilio'),(147,11,'Orden de domicilio','Creacion','2025-06-19 17:31:38','Se creo una orden de domicilio'),(148,11,'Productos Preparados','Actualizacion','2025-06-19 20:09:54','Se actualizo un producto preparado'),(149,11,'Productos Preparados','Actualizacion','2025-06-19 20:10:37','Se actualizo un producto preparado'),(150,11,'Productos Preparados','Actualizacion','2025-06-19 20:10:37','Se actualizo un producto preparado'),(151,11,'Caja','Cerrar','2025-06-19 20:33:04','Se cerro la caja 20'),(152,11,'Usuarios','Login','2025-06-20 08:34:11','inicio de sesion'),(153,11,'Usuarios','Login','2025-06-20 10:13:59','inicio de sesion'),(154,11,'Caja','Agregar','2025-06-20 10:15:09','Se abrio una caja'),(155,11,'capital','Agregar','2025-06-20 10:16:04','Guardar Gasto en capital de 2000 $'),(156,11,'Usuarios','Login','2025-06-20 14:47:41','inicio de sesion'),(157,11,'Usuarios','Login','2025-06-21 12:32:56','inicio de sesion'),(158,11,'Usuarios','Login','2025-06-23 09:37:36','inicio de sesion'),(159,11,'Rol','Agregar','2025-06-23 11:42:31','Se creo un rol'),(160,11,'Rol','Editar','2025-06-23 11:56:28','Se edito un rol'),(161,11,'Rol','Editar','2025-06-23 11:56:40','Se edito un rol'),(162,11,'Rol','Editar','2025-06-23 11:58:29','Se edito un rol'),(163,11,'Rol','Editar','2025-06-23 11:59:48','Se edito un rol'),(164,11,'Rol','Editar','2025-06-23 12:01:04','Se edito un rol'),(165,11,'Rol','Editar','2025-06-23 12:01:25','Se edito un rol'),(166,11,'Rol','Editar','2025-06-23 12:04:31','Se edito un rol'),(167,11,'Rol','Editar','2025-06-23 12:04:37','Se edito un rol'),(168,11,'Producto procesado','Actualizacion','2025-06-23 12:05:42','Se agrego un producto procesado'),(169,11,'Producto procesado','Actualizacion','2025-06-23 12:05:48','Se agrego un producto procesado'),(170,11,'Producto procesado','Actualizacion','2025-06-23 12:05:48','Se agrego un producto procesado'),(171,11,'Rol','Editar','2025-06-24 14:48:20','Se actualizo un rol'),(172,11,'Rol','Editar','2025-06-24 14:48:20','Se actualizo un rol'),(173,11,'Rol','Editar','2025-06-24 14:48:20','Se actualizo un rol'),(174,11,'Rol','Editar','2025-06-24 14:48:20','Se actualizo un rol'),(175,11,'Rol','Editar','2025-06-24 14:48:20','Se actualizo un rol'),(176,11,'Rol','Eliminacion','2025-06-23 12:31:51','Se elimino un rol'),(177,11,'Usuarios','Login','2025-06-24 14:36:45','inicio de sesion'),(178,11,'Usuarios','Actualizacion','2025-06-24 14:59:01','Se actualizo un usuario'),(179,11,'Usuarios','Actualizacion','2025-06-24 16:39:56','Se actualizo un usuario'),(180,11,'Rol','Editar','2025-06-24 16:42:34','Se actualizo un rol'),(181,11,'Usuarios','Login','2025-06-24 17:03:35','inicio de sesion'),(182,11,'Perfil','Actualizacion','2025-06-24 17:11:04','Se actualizo la imagen de perfil'),(183,11,'Perfil','Actualizacion','2025-06-24 17:11:19','Se actualizo la imagen de perfil'),(184,11,'Perfil','Actualizacion','2025-06-24 17:12:43','Se actualizo la imagen de perfil'),(185,11,'Perfil','Actualizacion','2025-06-24 17:13:00','Se actualizo la imagen de perfil'),(186,11,'Perfil','Perfil actualizado','2025-06-24 17:14:02','Se actualizo el perfil'),(187,11,'Perfil','Perfil actualizado','2025-06-24 17:14:10','Se actualizo el perfil'),(188,11,'Perfil','Perfil actualizado','2025-06-24 17:21:50','Se actualizo el perfil'),(189,11,'Perfil','Actualizacion','2025-06-24 17:27:58','Se actualizo la imagen de perfil'),(190,11,'Perfil','Actualizacion','2025-06-24 17:28:13','Se actualizo la imagen de perfil'),(191,11,'Perfil','Perfil actualizado','2025-06-24 17:28:21','Se actualizo el perfil'),(192,11,'Caja','Cerrar','2025-06-24 18:51:28','Se cerro la caja 21'),(193,11,'Usuario','Perfil actualizado','2025-06-24 19:59:56','Se actualizo el perfil'),(194,11,'Usuario','Perfil actualizado','2025-06-24 20:09:19','Se actualizo la contraseña'),(195,11,'Perfil','Actualizacion','2025-06-24 20:12:55','Se actualizo la imagen de perfil'),(196,11,'Perfil','Actualizacion','2025-06-24 20:13:15','Se actualizo la imagen de perfil'),(197,11,'Usuarios','Login','2025-06-25 10:12:36','inicio de sesion'),(198,11,'Usuarios','Agregar','2025-06-25 10:17:20','Se agrego un usuario'),(199,15,'Usuarios','Login','2025-06-25 10:17:51','inicio de sesion'),(200,11,'Usuarios','Login','2025-06-25 10:48:19','inicio de sesion'),(201,15,'Usuarios','Login','2025-06-25 10:48:43','inicio de sesion'),(202,15,'Usuarios','Login','2025-06-25 11:17:08','inicio de sesion'),(203,15,'Usuarios','Login','2025-06-25 11:36:08','inicio de sesion'),(204,11,'Usuarios','Login','2025-06-25 12:10:57','inicio de sesion'),(205,11,'Usuarios','Login','2025-06-25 12:25:22','inicio de sesion'),(206,15,'Perfil','Actualizacion','2025-06-25 12:59:07','Se actualizo la imagen de perfil'),(207,15,'Usuarios','Login','2025-06-25 13:00:26','inicio de sesion'),(208,11,'Usuarios','Login','2025-06-25 13:51:24','inicio de sesion'),(209,11,'Usuarios','Login','2025-06-25 13:55:04','inicio de sesion'),(210,11,'Orden de cocina','Preparado','2025-06-25 15:49:27','Se preparo una orden de cocina'),(211,15,'Productos Preparados','Actualizacion','2025-06-25 16:57:41','Se actualizo un producto preparado'),(212,15,'Productos Preparados','Eliminacion','2025-06-25 16:57:50','Se elimino un producto preparado'),(213,15,'Papelera','Restaurar','2025-06-25 16:58:13','Se ha restaurado un elemento de la papelera'),(214,15,'Producto procesado','Actualizacion','2025-06-25 17:28:55','Se agrego un producto procesado'),(215,15,'Producto procesado','Actualizacion','2025-06-25 17:29:02','Se agrego un producto procesado'),(216,15,'Producto procesado','Actualizacion','2025-06-25 17:29:02','Se agrego un producto procesado'),(217,15,'Caja','Agregar','2025-06-25 17:48:51','Se abrio una caja'),(218,11,'Usuarios','Login','2025-06-26 10:52:56','inicio de sesion'),(219,15,'Usuarios','Login','2025-06-26 10:53:34','inicio de sesion'),(220,11,'Mesas','Edicion','2025-06-26 12:13:53','Se Edito un mesa'),(221,11,'Mesas','Edicion','2025-06-26 12:13:53','Se Edito un mesa'),(222,11,'Mesas','Edicion','2025-06-26 12:14:02','Se Edito un mesa'),(223,11,'Mesas','Edicion','2025-06-26 12:14:02','Se Edito un mesa'),(224,11,'Mesas','Edicion','2025-06-26 12:14:02','Se Edito un mesa'),(225,11,'Mesas','Edicion','2025-06-26 12:14:17','Se Edito un mesa'),(226,11,'Mesas','Edicion','2025-06-26 12:14:17','Se Edito un mesa'),(227,11,'Mesas','Edicion','2025-06-26 12:14:17','Se Edito un mesa'),(228,11,'Mesas','Edicion','2025-06-26 12:14:17','Se Edito un mesa'),(229,11,'Mesas','Edicion','2025-06-26 12:14:31','Se Edito un mesa'),(230,11,'Mesas','Edicion','2025-06-26 12:14:31','Se Edito un mesa'),(231,11,'Mesas','Edicion','2025-06-26 12:14:31','Se Edito un mesa'),(232,11,'Mesas','Edicion','2025-06-26 12:14:31','Se Edito un mesa'),(233,11,'Mesas','Edicion','2025-06-26 12:14:31','Se Edito un mesa'),(234,11,'Mesas','Edicion','2025-06-26 12:25:22','Se Edito un mesa'),(235,11,'Mesas','Edicion','2025-06-26 12:25:23','Se Edito un mesa'),(236,11,'Orden de cocina','Preparado','2025-06-26 13:26:47','Se preparo una orden de cocina'),(237,11,'Orden de cocina','Preparado','2025-06-26 13:26:50','Se preparo una orden de cocina'),(238,11,'Orden de cocina','Preparado','2025-06-26 13:26:53','Se preparo una orden de cocina'),(239,11,'Orden de cocina','Preparado','2025-06-26 13:26:56','Se preparo una orden de cocina'),(240,11,'Orden de cocina','Preparado','2025-06-26 13:26:58','Se preparo una orden de cocina'),(241,11,'Orden de cocina','Preparado','2025-06-26 13:27:01','Se preparo una orden de cocina'),(242,11,'Orden de cocina','Preparado','2025-06-26 13:27:04','Se preparo una orden de cocina'),(243,11,'Orden de cocina','Preparado','2025-06-26 13:27:07','Se preparo una orden de cocina'),(244,11,'Orden de delivery','Orden aceptada','2025-06-26 13:49:22','Se acepto una orden de delivery'),(245,11,'Rol','Agregar','2025-06-26 14:25:56','Se creo un rol'),(246,11,'Rol','Editar','2025-06-26 14:26:02','Se actualizo un rol');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_roles`
--

LOCK TABLES `detalles_roles` WRITE;
/*!40000 ALTER TABLE `detalles_roles` DISABLE KEYS */;
INSERT INTO `detalles_roles` VALUES (33,11,'mesas','consultar,agregar,editar,eliminar'),(34,11,'ordenes','consultar'),(35,11,'Producto preparado','consultar,agregar,editar,eliminar'),(36,11,'Producto procesado','consultar,agregar,editar,eliminar'),(37,11,'Materia prima','consultar,agregar,editar,eliminar'),(38,11,'Entradas de materia prima','agregar,editar,eliminar'),(39,11,'Recetas','consultar,agregar,editar,eliminar'),(40,11,'Adicionales','consultar,agregar,editar,eliminar'),(41,11,'Entradas de productos procesados','agregar,editar,eliminar'),(42,11,'proveedores','consultar,agregar,editar,eliminar'),(43,11,'estadisticas','consultar'),(44,11,'bitacora','consultar'),(45,11,'clientes','consultar,agregar,editar,eliminar'),(46,11,'unidades','consultar,agregar,editar,eliminar'),(47,11,'categorias','consultar,agregar,editar,eliminar'),(48,11,'metodo pago','consultar,agregar,editar,eliminar'),(49,11,'usuarios','consultar,agregar,editar,eliminar'),(50,11,'cocina','consultar,preparar,ver detalles'),(51,11,'Ordenes (delivery)','consultar,verificar,anular,crear'),(52,11,'Ordenes (llevar)','consultar,verificar,anular,despachar,crear'),(53,11,'delivery','consultar,aceptar entrega,ver detalles'),(54,11,'capital','consultar,guardar gasto,guardar ingreso'),(55,11,'caja','consultar,abrir,cerrar,ver detalles'),(56,11,'roles y permisos','consultar,agregar,asignar roles,editar,eliminar'),(57,11,'Mantenimiento','consultar,importar,exportar,eliminar'),(59,11,'Papelera','consultar,restaurar'),(78,10,'cocina','consultar,preparar,ver detalles'),(79,10,'mesas',''),(80,10,'Materia prima',''),(81,10,'ordenes',''),(82,10,'Ordenes (delivery)',''),(83,10,'Ordenes (llevar)',''),(84,10,'estadisticas',''),(85,10,'capital',''),(86,10,'Papelera',''),(87,10,'Producto preparado',''),(88,10,'Entradas de materia prima',''),(89,10,'Recetas',''),(90,10,'Adicionales',''),(91,10,'Producto procesado',''),(92,10,'Entradas de productos procesados',''),(93,10,'proveedores',''),(94,10,'clientes',''),(95,10,'caja',''),(96,10,'categorias',''),(97,10,'metodo pago',''),(98,10,'usuarios',''),(99,10,'unidades',''),(101,10,'Mantenimiento',''),(103,10,'roles y permisos','');
/*!40000 ALTER TABLE `detalles_roles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (10,'Cocinero','Rol destinado a la preparacion de comida de Burger House',1),(11,'Super Admin','Rol con acceso a todas las funciones del e-commerce',1),(12,'Cajero','Rol destinado a la atencion de usuarios y recibir pagos en BurgerHouse',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
  `token` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'token',
  `token_expiracion` datetime DEFAULT NULL,
  `imagen` varchar(500) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idRol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (11,11,'Alejandro','Alejandro202**','Vargas',1,'1','garnicaluis391@gmail.com','9070','2025-06-24 20:16:33','nacht-black-clover_3840x2160_xtrafondos.com.jpg'),(13,10,'Pedro','Pedro25**','Perez',1,'1','pedro202@gmail.com','token',NULL,''),(14,11,'Rolando','Martinez25/','Martinez',1,'1','martinezj@gmail.com','token',NULL,''),(15,10,'Luis','Luisgv202*','Garnica',1,'1','l4rius2002@gmail.com','token',NULL,'103327.jpg');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'usuarios_burgerhouse'
--

--
-- Dumping routines for database 'usuarios_burgerhouse'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-26 17:42:53
