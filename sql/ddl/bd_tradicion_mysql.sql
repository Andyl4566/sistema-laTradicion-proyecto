CREATE DATABASE  IF NOT EXISTS `bd_tradicion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_tradicion`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_tradicion
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '98f05444-8b7b-11f1-b030-28c5c84728d6:1-432';

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_cliente_correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'David','1222 4432','aridavid@gmail.com','35AvC 10A-61 zona 8'),(4,'andy','1116 6666','andy@gmail.com','CalleHuerta Marcos 19 Puerta 828'),(5,'Mario','2123 5443','margonzalez@gmail.com',NULL),(6,'Cliente Prueba 01','5000-0001','cliente01@prueba.com','Zona 1, Guatemala'),(7,'Cliente Prueba 02','5000-0002','cliente02@prueba.com','Zona 2, Guatemala'),(8,'Cliente Prueba 03','5000-0003','cliente03@prueba.com','Zona 3, Guatemala'),(9,'Cliente Prueba 04','5000-0004','cliente04@prueba.com','Zona 4, Guatemala'),(10,'Cliente Prueba 05','5000-0005','cliente05@prueba.com','Zona 5, Guatemala'),(11,'Cliente Prueba 06','5000-0006','cliente06@prueba.com','Zona 6, Guatemala'),(12,'Cliente Prueba 07','5000-0007','cliente07@prueba.com','Zona 7, Guatemala'),(13,'Cliente Prueba 08','5000-0008','cliente08@prueba.com','Zona 8, Guatemala'),(14,'Cliente Prueba 09','5000-0009','cliente09@prueba.com','Zona 9, Guatemala'),(15,'Cliente Prueba 10','5000-0010','cliente10@prueba.com','Zona 10, Guatemala'),(16,'Cliente Prueba 11','5000-0011','cliente11@prueba.com','Zona 11, Guatemala'),(17,'Cliente Prueba 12','5000-0012','cliente12@prueba.com','Zona 12, Guatemala'),(18,'Cliente Prueba 13','5000-0013','cliente13@prueba.com','Zona 13, Guatemala'),(19,'Cliente Prueba 14','5000-0014','cliente14@prueba.com','Zona 14, Guatemala'),(20,'Cliente Prueba 15','5000-0015','cliente15@prueba.com','Zona 15, Guatemala'),(21,'Cliente Prueba 16','5000-0016','cliente16@prueba.com','Zona 16, Guatemala'),(22,'Cliente Prueba 17','5000-0017','cliente17@prueba.com','Zona 17, Guatemala'),(23,'Cliente Prueba 18','5000-0018','cliente18@prueba.com','Zona 18, Guatemala'),(24,'Cliente Prueba 19','5000-0019','cliente19@prueba.com','Zona 19, Guatemala'),(25,'Cliente Prueba 20','5000-0020','cliente20@prueba.com','Zona 20, Guatemala'),(26,'Cliente Prueba 21','5000-0021','cliente21@prueba.com','Zona 21, Guatemala'),(27,'Cliente Prueba 22','5000-0022','cliente22@prueba.com','Zona 22, Guatemala'),(28,'Cliente Prueba 23','5000-0023','cliente23@prueba.com','Zona 23, Guatemala'),(29,'Cliente Prueba 24','5000-0024','cliente24@prueba.com','Zona 24, Guatemala'),(30,'Cliente Prueba 25','5000-0025','cliente25@prueba.com','Quetzaltenango'),(31,'Cliente Prueba 26','5000-0026','cliente26@prueba.com','Quetzaltenango'),(32,'Cliente Prueba 27','5000-0027','cliente27@prueba.com','Quetzaltenango'),(33,'Cliente Prueba 28','5000-0028','cliente28@prueba.com','Quetzaltenango'),(34,'Cliente Prueba 29','5000-0029','cliente29@prueba.com','Quetzaltenango'),(35,'Cliente Prueba 30','5000-0030','cliente30@prueba.com','Quetzaltenango'),(36,'Cliente Prueba 31','5000-0031','cliente31@prueba.com','Quetzaltenango'),(37,'Cliente Prueba 32','5000-0032','cliente32@prueba.com','Quetzaltenango'),(38,'Cliente Prueba 33','5000-0033','cliente33@prueba.com','Quetzaltenango'),(39,'Cliente Prueba 34','5000-0034','cliente34@prueba.com','Quetzaltenango'),(40,'Cliente Prueba 35','5000-0035','cliente35@prueba.com','Quetzaltenango'),(41,'Cliente Prueba 36','5000-0036','cliente36@prueba.com','Totonicapan'),(42,'Cliente Prueba 37','5000-0037','cliente37@prueba.com','Totonicapan'),(43,'Cliente Prueba 38','5000-0038','cliente38@prueba.com','Totonicapan'),(44,'Cliente Prueba 39','5000-0039','cliente39@prueba.com','Totonicapan'),(45,'Cliente Prueba 40','5000-0040','cliente40@prueba.com','Totonicapan'),(46,'Cliente Prueba 41','5000-0041','cliente41@prueba.com','San Marcos'),(47,'Cliente Prueba 42','5000-0042','cliente42@prueba.com','San Marcos'),(48,'Cliente Prueba 43','5000-0043','cliente43@prueba.com','San Marcos'),(49,'Cliente Prueba 44','5000-0044','cliente44@prueba.com','San Marcos'),(50,'Cliente Prueba 45','5000-0045','cliente45@prueba.com','San Marcos'),(51,'Cliente Prueba 46','5000-0046','cliente46@prueba.com','Huehuetenango'),(52,'Cliente Prueba 47','5000-0047','cliente47@prueba.com','Huehuetenango'),(53,'Cliente Prueba 48','5000-0048','cliente48@prueba.com','Huehuetenango'),(54,'Cliente Prueba 49','5000-0049','cliente49@prueba.com','Retalhuleu'),(55,'Cliente Prueba 50','5000-0050','cliente50@prueba.com','Retalhuleu');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compras` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  `estado` enum('ACTIVA','ANULADA') NOT NULL DEFAULT 'ACTIVA',
  `motivo_anulacion` varchar(500) DEFAULT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `fk_compras_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_compras_monto` CHECK ((`monto` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2026-07-03',750.00,1,'ACTIVA',NULL,NULL),(2,'2026-08-12',24.00,2,'ACTIVA',NULL,NULL),(3,'2026-09-20',50.00,1,'ANULADA','prueba','2026-10-18 10:26:16'),(4,'2026-10-14',22.00,1,'ANULADA','pruba','2026-10-18 10:26:08'),(6,'2026-10-15',22.00,1,'ANULADA','Prueba de anulacion de compras para Entrega 4','2026-10-15 16:46:27'),(7,'2026-10-16',22.00,1,'ANULADA','Prueba de anulación desde pagina','2026-10-16 13:53:11'),(9,'2026-10-18',12.00,1,'ANULADA','Prueba','2026-10-17 18:16:32'),(10,'2026-10-17',12.00,1,'ANULADA','Prueba','2026-10-17 18:30:51');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_proveedor` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  PRIMARY KEY (`id_proveedor`,`id_materia_prima`),
  KEY `fk_detcompra_materiaprima` (`id_materia_prima`),
  CONSTRAINT `fk_detcompra_materiaprima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_detcompra_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra_materia_prima`
--

DROP TABLE IF EXISTS `detalle_compra_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra_materia_prima` (
  `id_compras` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL DEFAULT '1.00',
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_compras`,`id_materia_prima`),
  KEY `fk_detcompmat_materiaprima` (`id_materia_prima`),
  CONSTRAINT `fk_detcompmat_compras` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_detcompmat_materiaprima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_det_compra_cantidad` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_det_compra_precio` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra_materia_prima`
--

LOCK TABLES `detalle_compra_materia_prima` WRITE;
/*!40000 ALTER TABLE `detalle_compra_materia_prima` DISABLE KEYS */;
INSERT INTO `detalle_compra_materia_prima` VALUES (1,1,150.00,5.00),(2,2,3.00,8.00),(3,1,10.00,5.00),(4,1,2.00,5.00),(4,2,1.50,8.00),(6,1,2.00,5.00),(6,2,1.50,8.00),(7,1,2.00,5.00),(7,2,1.50,8.00),(9,1,2.00,5.00),(9,3,1.00,2.00),(10,1,2.00,5.00),(10,3,1.00,2.00);
/*!40000 ALTER TABLE `detalle_compra_materia_prima` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_compra_aumentar_materia_prima` AFTER INSERT ON `detalle_compra_materia_prima` FOR EACH ROW BEGIN
    UPDATE materia_prima
    SET cantidad = cantidad + NEW.cantidad
    WHERE id_materia_prima = NEW.id_materia_prima;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_fabricacion`
--

DROP TABLE IF EXISTS `detalle_fabricacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_fabricacion` (
  `id_produccion` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_producida` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_produccion`,`id_producto`),
  KEY `fk_detfab_producto` (`id_producto`),
  CONSTRAINT `fk_detfab_produccion` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_detfab_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_detalle_fabricacion_cantidad` CHECK ((`cantidad_producida` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_fabricacion`
--

LOCK TABLES `detalle_fabricacion` WRITE;
/*!40000 ALTER TABLE `detalle_fabricacion` DISABLE KEYS */;
INSERT INTO `detalle_fabricacion` VALUES (1,1,10),(2,1,5),(3,1,8),(4,1,6),(5,1,10),(6,1,7),(7,1,5),(8,1,8),(9,1,6),(10,1,5),(11,1,5),(12,1,1),(13,1,2),(14,1,2),(15,1,2),(15,3,1),(16,1,15),(16,38,15),(17,1,2),(17,3,1),(18,1,2),(18,43,15),(18,51,2),(19,1,3),(20,1,3);
/*!40000 ALTER TABLE `detalle_fabricacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `dpi` varchar(100) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `uq_empleado_dpi` (`dpi`),
  CONSTRAINT `chk_empleado_salario` CHECK ((`salario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Mary','1234 55634 0103','1233 4333',4002.28,'2024-11-12','Activo'),(2,'Empleado Prueba 01','DPI-PRUEBA-0001','5100-0001',3500.00,'2024-01-15','Activo'),(3,'Empleado Prueba 02','DPI-PRUEBA-0002','5100-0002',3600.00,'2024-01-22','Activo'),(4,'Empleado Prueba 03','DPI-PRUEBA-0003','5100-0003',3700.00,'2024-02-05','Activo'),(5,'Empleado Prueba 04','DPI-PRUEBA-0004','5100-0004',3800.00,'2024-02-12','Activo'),(6,'Empleado Prueba 05','DPI-PRUEBA-0005','5100-0005',3900.00,'2024-03-01','Activo'),(7,'Empleado Prueba 06','DPI-PRUEBA-0006','5100-0006',4000.00,'2024-03-10','Activo'),(8,'Empleado Prueba 07','DPI-PRUEBA-0007','5100-0007',4100.00,'2024-03-18','Activo'),(9,'Empleado Prueba 08','DPI-PRUEBA-0008','5100-0008',4200.00,'2024-04-02','Activo'),(10,'Empleado Prueba 09','DPI-PRUEBA-0009','5100-0009',4300.00,'2024-04-15','Activo'),(11,'Empleado Prueba 10','DPI-PRUEBA-0010','5100-0010',4400.00,'2024-05-01','Activo'),(12,'Empleado Prueba 11','DPI-PRUEBA-0011','5100-0011',3500.00,'2024-05-12','Activo'),(13,'Empleado Prueba 12','DPI-PRUEBA-0012','5100-0012',3600.00,'2024-06-03','Activo'),(14,'Empleado Prueba 13','DPI-PRUEBA-0013','5100-0013',3700.00,'2024-06-17','Activo'),(15,'Empleado Prueba 14','DPI-PRUEBA-0014','5100-0014',3800.00,'2024-07-01','Activo'),(16,'Empleado Prueba 15','DPI-PRUEBA-0015','5100-0015',3900.00,'2024-07-15','Activo'),(17,'Empleado Prueba 16','DPI-PRUEBA-0016','5100-0016',4000.00,'2024-08-01','Activo'),(18,'Empleado Prueba 17','DPI-PRUEBA-0017','5100-0017',4100.00,'2024-08-12','Activo'),(19,'Empleado Prueba 18','DPI-PRUEBA-0018','5100-0018',4200.00,'2024-09-02','Activo'),(20,'Empleado Prueba 19','DPI-PRUEBA-0019','5100-0019',4300.00,'2024-09-16','Activo'),(21,'Empleado Prueba 20','DPI-PRUEBA-0020','5100-0020',4400.00,'2024-10-01','Activo'),(22,'Empleado Prueba 21','DPI-PRUEBA-0021','5100-0021',3500.00,'2024-10-14','Activo'),(23,'Empleado Prueba 22','DPI-PRUEBA-0022','5100-0022',3600.00,'2024-11-01','Activo'),(24,'Empleado Prueba 23','DPI-PRUEBA-0023','5100-0023',3700.00,'2024-11-18','Activo'),(25,'Empleado Prueba 24','DPI-PRUEBA-0024','5100-0024',3800.00,'2024-12-02','Activo'),(26,'Empleado Prueba 25','DPI-PRUEBA-0025','5100-0025',3900.00,'2024-12-16','Activo'),(27,'Empleado Prueba 26','DPI-PRUEBA-0026','5100-0026',4000.00,'2025-01-06','Activo'),(28,'Empleado Prueba 27','DPI-PRUEBA-0027','5100-0027',4100.00,'2025-01-20','Activo'),(29,'Empleado Prueba 28','DPI-PRUEBA-0028','5100-0028',4200.00,'2025-02-03','Activo'),(30,'Empleado Prueba 29','DPI-PRUEBA-0029','5100-0029',4300.00,'2025-02-17','Activo'),(31,'Empleado Prueba 30','DPI-PRUEBA-0030','5100-0030',4400.00,'2025-03-03','Activo'),(32,'Empleado Prueba 31','DPI-PRUEBA-0031','5100-0031',3500.00,'2025-03-17','Activo'),(33,'Empleado Prueba 32','DPI-PRUEBA-0032','5100-0032',3600.00,'2025-04-01','Activo'),(34,'Empleado Prueba 33','DPI-PRUEBA-0033','5100-0033',3700.00,'2025-04-14','Activo'),(35,'Empleado Prueba 34','DPI-PRUEBA-0034','5100-0034',3800.00,'2025-05-01','Activo'),(36,'Empleado Prueba 35','DPI-PRUEBA-0035','5100-0035',3900.00,'2025-05-19','Activo'),(37,'Empleado Prueba 36','DPI-PRUEBA-0036','5100-0036',4000.00,'2025-06-02','Activo'),(38,'Empleado Prueba 37','DPI-PRUEBA-0037','5100-0037',4100.00,'2025-06-16','Activo'),(39,'Empleado Prueba 38','DPI-PRUEBA-0038','5100-0038',4200.00,'2025-07-01','Activo'),(40,'Empleado Prueba 39','DPI-PRUEBA-0039','5100-0039',4300.00,'2025-07-14','Activo'),(41,'Empleado Prueba 40','DPI-PRUEBA-0040','5100-0040',4400.00,'2025-08-01','Activo'),(42,'Empleado Prueba 41','DPI-PRUEBA-0041','5100-0041',3500.00,'2025-08-18','Activo'),(43,'Empleado Prueba 42','DPI-PRUEBA-0042','5100-0042',3600.00,'2025-09-01','Activo'),(44,'Empleado Prueba 43','DPI-PRUEBA-0043','5100-0043',3700.00,'2025-09-15','Activo'),(45,'Empleado Prueba 44','DPI-PRUEBA-0044','5100-0044',3800.00,'2025-10-01','Activo'),(46,'Empleado Prueba 45','DPI-PRUEBA-0045','5100-0045',3900.00,'2025-10-20','Activo'),(47,'Empleado Prueba 46','DPI-PRUEBA-0046','5100-0046',4000.00,'2025-11-03','Activo'),(48,'Empleado Prueba 47','DPI-PRUEBA-0047','5100-0047',4100.00,'2025-11-17','Activo'),(49,'Empleado Prueba 48','DPI-PRUEBA-0048','5100-0048',4200.00,'2025-12-01','Activo'),(50,'Empleado Prueba 49','DPI-PRUEBA-0049','5100-0049',4300.00,'2025-12-15','Activo'),(51,'Empleado Prueba 50','DPI-PRUEBA-0050','5100-0050',4400.00,'2026-01-05','Activo'),(52,'empleado prueba','1234 4212 1234','5555-1234',3800.00,'2026-10-14','Activo'),(53,'Empleado Validación E4','E4-EMPLEADO-001','5555-5678',3800.00,'2026-10-17','Inactivo');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_operativos`
--

DROP TABLE IF EXISTS `gastos_operativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos_operativos` (
  `id_gastos_operativos` int NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `motivo` varchar(200) DEFAULT NULL,
  `fecha_gasto` date NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_gastos_operativos`),
  CONSTRAINT `chk_gastos_operativos_monto` CHECK ((`monto` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_operativos`
--

LOCK TABLES `gastos_operativos` WRITE;
/*!40000 ALTER TABLE `gastos_operativos` DISABLE KEYS */;
INSERT INTO `gastos_operativos` VALUES (1,'Pago de agua','Agua y tirado de basura','2026-07-02',120.00,'Pagado'),(2,'Pago de energía eléctrica','Servicio de luz','2026-07-05',450.00,'Pagado'),(3,'Compra de librería','Útiles administrativos','2026-07-07',85.00,'Pagado'),(4,'Compra de fósforos','Insumo operativo','2026-07-08',25.00,'Pagado'),(5,'Compra de gas','Reposición de gas para producción','2026-07-10',380.00,'Pagado'),(6,'Compra de aceite','Insumo para producción','2026-07-12',650.00,'Pagado'),(7,'Alquiler del local','Renta mensual','2026-07-15',2500.00,'Pagado'),(8,'Servicio municipal','Pago municipal','2026-07-18',180.00,'Pagado'),(9,'Mantenimiento','Reparación de equipo','2026-07-20',320.00,'Pagado'),(10,'Equipo y herramienta','Compra de herramienta menor','2026-07-24',210.00,'Pagado'),(11,'Papelería','Material administrativo','2026-08-02',95.00,'Pagado'),(12,'Servicios profesionales','Asesoría administrativa','2026-08-05',400.00,'Pagado'),(13,'Pago de IGSS','Obligación patronal','2026-08-08',950.00,'Pagado'),(14,'Impuestos SAT','Pago de impuestos','2026-08-10',1200.00,'Pagado'),(15,'Compra de gas','Reposición de gas','2026-08-12',390.00,'Pagado'),(16,'Compra de aceite','Reposición de aceite','2026-08-12',720.00,'Pagado'),(17,'Pago de agua','Agua y basura','2026-08-15',125.00,'Pagado'),(18,'Pago de energía eléctrica','Servicio de luz','2026-08-18',470.00,'Pagado'),(19,'Mantenimiento','Mantenimiento preventivo','2026-08-22',280.00,'Pagado'),(20,'Salarios','Pago de planilla','2026-08-30',5200.00,'Pagado');
/*!40000 ALTER TABLE `gastos_operativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id_materia_prima` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT '0.00',
  `costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_materia_prima`),
  CONSTRAINT `chk_materia_prima_cantidad` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `chk_materia_prima_costo` CHECK ((`costo` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,'Harina de maiz','Harina utilizada para elaborar nachos','Saco',51.05,5.00),(2,'Aceite','Aceite utilizado durante la produccion','Tonel',40.15,8.00),(3,'Sal','Sal utilizada para elaborar el producto','Libra',20.00,2.00),(4,'Gas','Gas utilizado durante el proceso de producción','Cilindro',15.00,120.00),(5,'Barbacoa preparada','Preparación utilizada para productos sabor barbacoa','Libra',25.00,18.00),(6,'Jalapeño','Ingrediente utilizado para productos con sabor jalapeño','Libra',18.00,12.00),(7,'Barbacoa Superb','Sazonador sabor barbacoa Superb utilizado en producción','Libra',20.00,20.00),(8,'Barbacoa GT','Sazonador sabor barbacoa GT utilizado en producción','Libra',22.00,19.00),(9,'Queso Cheddar','Ingrediente sabor queso utilizado en producción','Libra',30.00,25.00),(10,'Colorante anaranjado','Colorante utilizado durante la elaboración de productos','Libra',10.00,15.00),(11,'Queso seco','Queso utilizado como ingrediente en productos elaborados','Libra',25.00,22.00),(12,'Benzoato','Insumo utilizado durante la elaboración y conservación de productos','Libra',8.00,18.00),(13,'prueba MP','Registro creado desde la aplicación',NULL,100.00,1.99);
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima_produccion`
--

DROP TABLE IF EXISTS `materia_prima_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima_produccion` (
  `id_materia_prima` int NOT NULL,
  `id_produccion` int NOT NULL,
  `cantidad_consumida` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_materia_prima`,`id_produccion`),
  KEY `fk_matprod_produccion` (`id_produccion`),
  CONSTRAINT `fk_matprod_materiaprima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_matprod_produccion` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima_produccion`
--

LOCK TABLES `materia_prima_produccion` WRITE;
/*!40000 ALTER TABLE `materia_prima_produccion` DISABLE KEYS */;
INSERT INTO `materia_prima_produccion` VALUES (1,1,NULL),(1,2,NULL),(1,3,NULL),(1,4,NULL),(1,5,NULL),(1,6,NULL),(1,7,NULL),(1,8,NULL),(1,9,NULL),(1,10,NULL),(1,13,1.00),(1,14,1.00),(1,15,1.03),(1,16,7.95),(1,17,1.03),(1,18,1.51),(1,19,1.50),(1,20,1.50),(2,1,NULL),(2,2,NULL),(2,3,NULL),(2,4,NULL),(2,5,NULL),(2,6,NULL),(2,7,NULL),(2,8,NULL),(2,9,NULL),(2,10,NULL),(2,13,0.20),(2,14,0.20),(2,15,0.21),(2,16,1.65),(2,17,0.21),(2,18,0.37),(2,19,0.30),(2,20,0.30),(3,1,NULL),(3,2,NULL),(3,3,NULL),(3,4,NULL),(3,5,NULL),(3,6,NULL),(3,7,NULL),(3,8,NULL),(3,9,NULL),(3,10,NULL),(3,13,0.10),(3,14,0.10),(3,15,0.11),(3,16,0.90),(3,17,0.11),(3,18,0.27),(3,19,0.15),(3,20,0.15);
/*!40000 ALTER TABLE `materia_prima_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima_producto`
--

DROP TABLE IF EXISTS `materia_prima_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima_producto` (
  `id_materia_prima` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_materia_prima`,`id_producto`),
  KEY `fk_matprodc_producto` (`id_producto`),
  CONSTRAINT `fk_matprodc_materiaprima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_matprodc_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_materia_prima_producto_cantidad` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima_producto`
--

LOCK TABLES `materia_prima_producto` WRITE;
/*!40000 ALTER TABLE `materia_prima_producto` DISABLE KEYS */;
INSERT INTO `materia_prima_producto` VALUES (1,1,0.50),(1,2,0.02),(1,3,0.03),(1,4,0.03),(1,13,0.03),(1,29,0.02),(1,30,0.02),(1,31,0.02),(1,32,0.02),(1,33,0.02),(1,34,0.02),(1,35,0.03),(1,36,0.03),(1,37,0.03),(1,38,0.03),(1,39,0.03),(1,40,0.03),(1,41,0.03),(1,42,0.03),(1,43,0.03),(1,48,0.03),(1,49,0.03),(1,50,0.03),(1,51,0.03),(2,1,0.10),(2,3,0.01),(2,4,0.01),(2,13,0.01),(2,35,0.01),(2,36,0.01),(2,37,0.01),(2,38,0.01),(2,39,0.01),(2,40,0.01),(2,41,0.01),(2,42,0.01),(2,43,0.01),(2,48,0.01),(2,49,0.01),(2,50,0.01),(2,51,0.01),(3,1,0.05),(3,2,0.01),(3,3,0.01),(3,4,0.01),(3,13,0.01),(3,29,0.01),(3,30,0.01),(3,31,0.01),(3,32,0.01),(3,33,0.01),(3,34,0.01),(3,35,0.01),(3,36,0.01),(3,37,0.01),(3,38,0.01),(3,39,0.01),(3,40,0.01),(3,41,0.01),(3,42,0.01),(3,43,0.01),(3,48,0.01),(3,49,0.01),(3,50,0.01),(3,51,0.01);
/*!40000 ALTER TABLE `materia_prima_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion` (
  `id_produccion` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_produccion` date NOT NULL,
  `estado` enum('ACTIVA','ANULADA') NOT NULL DEFAULT 'ACTIVA',
  `motivo_anulacion` varchar(500) DEFAULT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (1,'Produccion de Nachos','Produccion de prueba para Nachos barbacoa','2026-09-15','ACTIVA',NULL,NULL),(2,'Produccion de Nachos 02','Produccion de prueba para Nachos barbacoa','2026-07-10','ACTIVA',NULL,NULL),(3,'Produccion de Nachos 03','Produccion de prueba para Nachos barbacoa','2026-07-20','ACTIVA',NULL,NULL),(4,'Produccion de Nachos 04','Produccion de prueba para Nachos barbacoa','2026-07-30','ACTIVA',NULL,NULL),(5,'Produccion de Nachos 05','Produccion de prueba para Nachos barbacoa','2026-08-05','ACTIVA',NULL,NULL),(6,'Produccion de Nachos 06','Produccion de prueba para Nachos barbacoa','2026-08-12','ACTIVA',NULL,NULL),(7,'Produccion de Nachos 07','Produccion de prueba para Nachos barbacoa','2026-08-20','ACTIVA',NULL,NULL),(8,'Produccion de Nachos 08','Produccion de prueba para Nachos barbacoa','2026-08-28','ACTIVA',NULL,NULL),(9,'Produccion de Nachos 09','Produccion de prueba para Nachos barbacoa','2026-09-05','ACTIVA',NULL,NULL),(10,'Produccion de Nachos 10','Produccion de prueba para Nachos barbacoa','2026-09-12','ACTIVA',NULL,NULL),(11,'CP-04 Produccion de Nachos','Prueba de registro de produccion e inventario','2026-09-20','ACTIVA',NULL,NULL),(12,'produccion web prueba','prueba de modulo de produccion','2026-09-23','ACTIVA',NULL,NULL),(13,'Produccion de prueba Entrega 4','Validacion de consumo de materias primas e inventario','2026-10-16','ANULADA','Prueba de anulacion de produccion para Entrega 4','2026-10-16 15:44:00'),(14,'anulacion prueba','Registro creado desde la aplicación','2026-10-16','ANULADA','Prueba anulacion','2026-10-16 16:25:00'),(15,'Produccion multiple Entrega 4','Fabricacion de nachos y tostadas','2026-10-16','ANULADA','Prueba de anulacion de produccion multiple Entrega 4','2026-10-16 16:44:33'),(16,'produccion ejemplo','Registro creado desde la aplicación','2026-10-16','ACTIVA',NULL,NULL),(17,'produccion ejemplo','Registro creado desde la aplicación','2026-10-16','ANULADA','Prueba anulacion','2026-10-16 17:00:05'),(18,'produccion ejemplo','Registro creado desde la aplicación','2026-10-17','ANULADA','prueba','2026-10-17 18:57:30'),(19,'produccion ejemplo','Registro creado desde la aplicación','2026-10-17','ACTIVA',NULL,NULL),(20,'produccion ejemplo','Registro creado desde la aplicación','2026-10-17','ACTIVA',NULL,NULL);
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion_empleado`
--

DROP TABLE IF EXISTS `produccion_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion_empleado` (
  `id_produccion` int NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_produccion`,`id_empleado`),
  KEY `fk_prodemp_empleado` (`id_empleado`),
  CONSTRAINT `fk_prodemp_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_prodemp_produccion` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion_empleado`
--

LOCK TABLES `produccion_empleado` WRITE;
/*!40000 ALTER TABLE `produccion_empleado` DISABLE KEYS */;
INSERT INTO `produccion_empleado` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `produccion_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `unidades` int DEFAULT '0',
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `chk_producto_precio` CHECK ((`precio_unitario` >= 0)),
  CONSTRAINT `chk_producto_unidades` CHECK ((`unidades` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Nachos barbacoa','Nachos sabor barbacoa',106,15.00),(2,'Tortilla X Lb.','Tortilla vendida por libra',115,8.00),(3,'Tostada Grande 25 Uni.','Paquete de 25 tostadas grandes',77,18.00),(4,'Tostada Mediana 25 Uni.','Paquete de 25 tostadas medianas',89,15.00),(5,'Tacos 10 Uni.','Paquete de 10 tacos',99,12.00),(6,'Tacos 25 Uni.','Paquete de 25 tacos',74,25.00),(7,'Nachos 1/2 Lb. Naturales','Nachos naturales presentación media libra',98,10.00),(8,'Nachos 1 Lb. Naturales','Nachos naturales presentación una libra',89,18.00),(9,'Nachos 1/2 Lb. Sabor','Nachos saborizados presentación media libra',84,12.00),(10,'Nachos 5 Lb. Barbacoa','Nachos sabor barbacoa presentación cinco libras',49,70.00),(11,'Nachos 5 Lb. Tradicional','Nachos tradicionales presentación cinco libras',49,65.00),(12,'Chiquitolina 1/2 Lb.','Producto de harina presentación media libra',69,10.00),(13,'Tostada Quebrada Lb.','Tostada quebrada vendida por libra',64,8.00),(14,'Queso Seco 5 Lb.','Queso seco presentación cinco libras',39,100.00),(15,'Queso Seco 2 Onz.','Queso seco presentación dos onzas',99,8.00),(16,'Queso Seco 4 Onz.','Queso seco presentación cuatro onzas',89,15.00),(17,'Queso Seco 1/2 Lbs.','Queso seco presentación media libra',69,25.00),(18,'Maseca 5 Lbs.','Harina Maseca presentación cinco libras',59,35.00),(19,'Maseca 2 Lbs.','Harina Maseca presentación dos libras',79,18.00),(20,'Maseca 1 Lbs.','Harina Maseca presentación una libra',99,10.00),(21,'Habas','Habas para reventa',69,12.00),(22,'Marañón','Marañón para reventa',50,20.00),(23,'Manía Dulce','Manía dulce para reventa',29,10.00),(24,'Manía Salada','Manía salada para reventa',79,10.00),(25,'Huevitos','Botana tipo huevitos para reventa',99,8.00),(26,'Botonetas','Botonetas para reventa',83,8.00),(27,'Manía Japonesa','Manía japonesa para reventa',80,12.00),(28,'Gomitas','Gomitas para reventa',90,8.00),(29,'Tortilla Harina Pequeña','Tortilla de harina tamaño pequeño',99,15.00),(30,'Tortilla Harina Mediana','Tortilla de harina tamaño mediano',89,20.00),(31,'Tortilla Harina Grande','Tortilla de harina tamaño grande',79,25.00),(32,'Tortilla Maíz Pequeña','Tortilla de maíz tamaño pequeño',119,10.00),(33,'Tortilla Maíz Mediana','Tortilla de maíz tamaño mediano',109,12.00),(34,'Tortilla Maíz Grande','Tortilla de maíz tamaño grande',89,15.00),(35,'Tostada Pequeña 25 Uni.','Paquete de 25 tostadas pequeñas',79,12.00),(36,'Tostada Grande 50 Uni.','Paquete de 50 tostadas grandes',59,32.00),(37,'Tostada Mediana 50 Uni.','Paquete de 50 tostadas medianas',59,28.00),(38,'Nachos Picantes 1/2 Lb.','Nachos sabor picante presentación media libra',104,12.00),(39,'Nachos Picantes 1 Lb.','Nachos sabor picante presentación una libra',74,20.00),(40,'Nachos Queso 1/2 Lb.','Nachos sabor queso presentación media libra',89,12.00),(41,'Nachos Queso 1 Lb.','Nachos sabor queso presentación una libra',74,20.00),(42,'Nachos Limón 1/2 Lb.','Nachos sabor limón presentación media libra',89,12.00),(43,'Nachos Limón 1 Lb.','Nachos sabor limón presentación una libra',74,20.00),(44,'Tacos 50 Uni.','Paquete de 50 tacos',59,45.00),(45,'Tacos 100 Uni.','Paquete de 100 tacos',39,80.00),(46,'Chiquitolina 1 Lb.','Producto de harina presentación una libra',69,18.00),(47,'Chiquitolina 5 Lb.','Producto de harina presentación cinco libras',39,75.00),(48,'Tostada Tradicional 10 Uni.','Paquete de 10 tostadas tradicionales',99,8.00),(49,'Tostada Tradicional 50 Uni.','Paquete de 50 tostadas tradicionales',60,30.00),(50,'Nachos Tradicionales 1/2 Lb.','Nachos tradicionales presentación media libra',100,10.00),(51,'Nachos Tradicionales 1 Lb.','Nachos tradicionales presentación una libra',90,18.00);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_venta`
--

DROP TABLE IF EXISTS `producto_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_venta` (
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_venta`,`id_producto`),
  KEY `fk_prodventa_producto` (`id_producto`),
  CONSTRAINT `fk_prodventa_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_prodventa_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `chk_producto_venta_cantidad` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_producto_venta_precio` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_venta`
--

LOCK TABLES `producto_venta` WRITE;
/*!40000 ALTER TABLE `producto_venta` DISABLE KEYS */;
INSERT INTO `producto_venta` VALUES (1,1,5,15.00),(2,7,1,10.00),(3,1,3,15.00),(4,2,1,8.00),(5,3,1,18.00),(6,4,1,15.00),(7,5,1,12.00),(8,6,1,25.00),(9,7,1,10.00),(10,8,1,18.00),(11,9,1,12.00),(12,10,1,70.00),(13,11,1,65.00),(14,12,1,10.00),(15,13,1,8.00),(16,14,1,100.00),(17,15,1,8.00),(18,16,1,15.00),(19,17,1,25.00),(20,18,1,35.00),(21,19,1,18.00),(22,20,1,10.00),(23,21,1,12.00),(24,22,1,20.00),(25,23,1,10.00),(26,24,1,10.00),(27,25,1,8.00),(28,26,1,8.00),(29,27,1,12.00),(30,28,1,8.00),(31,29,1,15.00),(32,30,1,20.00),(33,31,1,25.00),(34,32,1,10.00),(35,33,1,12.00),(36,34,1,15.00),(37,35,1,12.00),(38,36,1,32.00),(39,37,1,28.00),(40,38,1,12.00),(41,39,1,20.00),(42,40,1,12.00),(43,41,1,20.00),(44,42,1,12.00),(45,43,1,20.00),(46,44,1,45.00),(47,45,1,80.00),(48,46,1,18.00),(49,47,1,75.00),(50,48,1,8.00),(51,26,1,8.00),(52,1,1,15.00),(53,23,50,10.00),(54,1,2,15.00),(54,2,3,8.00),(54,3,2,18.00),(55,2,1,8.00),(56,26,5,8.00),(56,27,4,12.00),(57,34,10,15.00),(58,22,9,20.00),(58,28,9,8.00),(59,22,2,20.00),(59,28,3,8.00),(60,33,3,12.00),(60,46,3,18.00),(61,26,1,8.00),(62,1,2,15.00),(62,3,1,18.00),(63,26,1,8.00),(63,46,1,18.00);
/*!40000 ALTER TABLE `producto_venta` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validar_stock_venta` BEFORE INSERT ON `producto_venta` FOR EACH ROW BEGIN
    DECLARE stock_disponible INT;

    SELECT unidades
    INTO stock_disponible
    FROM producto
    WHERE id_producto = NEW.id_producto;

    IF stock_disponible IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto no existe';
    END IF;

    IF NEW.cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cantidad vendida debe ser mayor que cero';
    END IF;

    IF stock_disponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_descontar_stock_venta` AFTER INSERT ON `producto_venta` FOR EACH ROW BEGIN

    UPDATE producto
    SET unidades = unidades - NEW.cantidad
    WHERE id_producto = NEW.id_producto;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'MASECA','22220011','maseca@gmail.com'),(2,'dydis oil','55454566','didisblack@gmail.com'),(4,'qaaaa','22222222','asdadd@gmail.com'),(5,'Proveedor Prueba 01','5200-0001','proveedor01@prueba.com'),(6,'Proveedor Prueba 02','5200-0002','proveedor02@prueba.com'),(7,'Proveedor Prueba 03','5200-0003','proveedor03@prueba.com'),(8,'Proveedor Prueba 04','5200-0004','proveedor04@prueba.com'),(9,'Proveedor Prueba 05','5200-0005','proveedor05@prueba.com'),(10,'Proveedor Prueba 06','5200-0006','proveedor06@prueba.com'),(11,'Proveedor Prueba 07','5200-0007','proveedor07@prueba.com'),(12,'Proveedor Prueba 08','5200-0008','proveedor08@prueba.com'),(13,'Proveedor Prueba 09','5200-0009','proveedor09@prueba.com'),(14,'Proveedor Prueba 10','5200-0010','proveedor10@prueba.com'),(15,'Proveedor Prueba 11','5200-0011','proveedor11@prueba.com'),(16,'Proveedor Prueba 12','5200-0012','proveedor12@prueba.com'),(17,'Proveedor Prueba 13','5200-0013','proveedor13@prueba.com'),(18,'Proveedor Prueba 14','5200-0014','proveedor14@prueba.com'),(19,'Proveedor Prueba 15','5200-0015','proveedor15@prueba.com'),(20,'Proveedor Prueba 16','5200-0016','proveedor16@prueba.com'),(21,'Proveedor Prueba 17','5200-0017','proveedor17@prueba.com'),(22,'Proveedor Prueba 18','5200-0018','proveedor18@prueba.com'),(23,'Proveedor Prueba 19','5200-0019','proveedor19@prueba.com'),(24,'Proveedor Prueba 20','5200-0020','proveedor20@prueba.com'),(25,'Proveedor Prueba 21','5200-0021','proveedor21@prueba.com'),(26,'Proveedor Prueba 22','5200-0022','proveedor22@prueba.com'),(27,'Proveedor Prueba 23','5200-0023','proveedor23@prueba.com'),(28,'Proveedor Prueba 24','5200-0024','proveedor24@prueba.com'),(29,'Proveedor Prueba 25','5200-0025','proveedor25@prueba.com'),(30,'Proveedor Prueba 26','5200-0026','proveedor26@prueba.com'),(31,'Proveedor Prueba 27','5200-0027','proveedor27@prueba.com'),(32,'Proveedor Prueba 28','5200-0028','proveedor28@prueba.com'),(33,'Proveedor Prueba 29','5200-0029','proveedor29@prueba.com'),(34,'Proveedor Prueba 30','5200-0030','proveedor30@prueba.com'),(35,'Proveedor Prueba 31','5200-0031','proveedor31@prueba.com'),(36,'Proveedor Prueba 32','5200-0032','proveedor32@prueba.com'),(37,'Proveedor Prueba 33','5200-0033','proveedor33@prueba.com'),(38,'Proveedor Prueba 34','5200-0034','proveedor34@prueba.com'),(39,'Proveedor Prueba 35','5200-0035','proveedor35@prueba.com'),(40,'Proveedor Prueba 36','5200-0036','proveedor36@prueba.com'),(41,'Proveedor Prueba 37','5200-0037','proveedor37@prueba.com'),(42,'Proveedor Prueba 38','5200-0038','proveedor38@prueba.com'),(43,'Proveedor Prueba 39','5200-0039','proveedor39@prueba.com'),(44,'Proveedor Prueba 40','5200-0040','proveedor40@prueba.com'),(45,'Proveedor Prueba 41','5200-0041','proveedor41@prueba.com'),(46,'Proveedor Prueba 42','5200-0042','proveedor42@prueba.com'),(47,'Proveedor Prueba 43','5200-0043','proveedor43@prueba.com'),(48,'Proveedor Prueba 44','5200-0044','proveedor44@prueba.com'),(49,'Proveedor Prueba 45','5200-0045','proveedor45@prueba.com'),(50,'Proveedor Prueba 46','5200-0046','proveedor46@prueba.com'),(51,'Proveedor Prueba 47','5200-0047','proveedor47@prueba.com'),(52,'Proveedor Prueba 48','5200-0048','proveedor48@prueba.com'),(53,'Proveedor Prueba 49','5200-0049','proveedor49@prueba.com'),(54,'Proveedor Prueba 50','5200-0050','proveedor50@prueba.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secuencia_compras`
--

DROP TABLE IF EXISTS `secuencia_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secuencia_compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secuencia_compras`
--

LOCK TABLES `secuencia_compras` WRITE;
/*!40000 ALTER TABLE `secuencia_compras` DISABLE KEYS */;
INSERT INTO `secuencia_compras` VALUES (4),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `secuencia_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secuencia_produccion`
--

DROP TABLE IF EXISTS `secuencia_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secuencia_produccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secuencia_produccion`
--

LOCK TABLES `secuencia_produccion` WRITE;
/*!40000 ALTER TABLE `secuencia_produccion` DISABLE KEYS */;
INSERT INTO `secuencia_produccion` VALUES (13),(14),(15),(16),(17),(18),(19),(20);
/*!40000 ALTER TABLE `secuencia_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secuencia_venta`
--

DROP TABLE IF EXISTS `secuencia_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secuencia_venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secuencia_venta`
--

LOCK TABLES `secuencia_venta` WRITE;
/*!40000 ALTER TABLE `secuencia_venta` DISABLE KEYS */;
INSERT INTO `secuencia_venta` VALUES (55),(56),(57),(58),(59),(60),(61),(62),(63);
/*!40000 ALTER TABLE `secuencia_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `rol` enum('administrador','ventas','produccion') NOT NULL DEFAULT 'administrador',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uq_usuarios_nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `uq_usuarios_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin@empresa.com','$2a$10$J3QStAoQwIR9mfQyyYvhNO3yQVAA/DrNYpzU48StPQR/KPG21JLb2','Administrador','administrador',1,'2026-09-01 00:00:00'),(2,'ventas','ventas@tradicion.com','$2a$10$9924kHL4fyZutQMU7QaflO1sK0zKvaXS7P3uNH1S/kQ.hLdCMrJRq','Usuario Ventas','ventas',1,'2026-09-27 17:32:43'),(3,'produccion','produccion@tradicion.com','$2a$10$/wRtoJ0TqxdJPxsWE5xUf.t08vI0RbTkvBNeO9qsv6WdN2tX.P7RK','Usuario Produccion','produccion',1,'2026-09-27 17:32:43');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `fecha_venta` date NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `id_empleado` int NOT NULL,
  `id_cliente` int NOT NULL,
  `estado` enum('ACTIVA','ANULADA') NOT NULL DEFAULT 'ACTIVA',
  `motivo_anulacion` varchar(500) DEFAULT NULL,
  `fecha_anulacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_empleado` (`id_empleado`),
  KEY `fk_venta_cliente` (`id_cliente`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_venta_monto` CHECK ((`monto` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'compra de nachos de barbacoa','2026-09-15',75.00,1,1,'ACTIVA',NULL,NULL),(2,'Venta de prueba 48','2026-08-18',10.00,1,1,'ACTIVA',NULL,NULL),(3,'Venta mediante procedimiento','2026-09-15',45.00,1,1,'ACTIVA',NULL,NULL),(4,'Venta de prueba 1','2026-07-02',8.00,2,4,'ACTIVA',NULL,NULL),(5,'Venta de prueba 2','2026-07-03',18.00,3,5,'ACTIVA',NULL,NULL),(6,'Venta de prueba 3','2026-07-04',15.00,4,6,'ACTIVA',NULL,NULL),(7,'Venta de prueba 4','2026-07-05',12.00,5,7,'ACTIVA',NULL,NULL),(8,'Venta de prueba 5','2026-07-06',25.00,6,8,'ACTIVA',NULL,NULL),(9,'Venta de prueba 6','2026-07-07',10.00,7,9,'ACTIVA',NULL,NULL),(10,'Venta de prueba 7','2026-07-08',18.00,8,10,'ACTIVA',NULL,NULL),(11,'Venta de prueba 8','2026-07-09',12.00,9,11,'ACTIVA',NULL,NULL),(12,'Venta de prueba 9','2026-07-10',70.00,10,12,'ACTIVA',NULL,NULL),(13,'Venta de prueba 10','2026-07-11',65.00,11,13,'ACTIVA',NULL,NULL),(14,'Venta de prueba 11','2026-07-12',10.00,12,14,'ACTIVA',NULL,NULL),(15,'Venta de prueba 12','2026-07-13',8.00,13,15,'ACTIVA',NULL,NULL),(16,'Venta de prueba 13','2026-07-14',100.00,14,16,'ACTIVA',NULL,NULL),(17,'Venta de prueba 14','2026-07-15',8.00,15,17,'ACTIVA',NULL,NULL),(18,'Venta de prueba 15','2026-07-16',15.00,16,18,'ACTIVA',NULL,NULL),(19,'Venta de prueba 16','2026-07-17',25.00,17,19,'ACTIVA',NULL,NULL),(20,'Venta de prueba 17','2026-07-18',35.00,18,20,'ACTIVA',NULL,NULL),(21,'Venta de prueba 18','2026-07-19',18.00,19,21,'ACTIVA',NULL,NULL),(22,'Venta de prueba 19','2026-07-20',10.00,20,22,'ACTIVA',NULL,NULL),(23,'Venta de prueba 20','2026-07-21',12.00,21,23,'ACTIVA',NULL,NULL),(24,'Venta de prueba 21','2026-07-22',20.00,22,24,'ACTIVA',NULL,NULL),(25,'Venta de prueba 22','2026-07-23',10.00,23,25,'ACTIVA',NULL,NULL),(26,'Venta de prueba 23','2026-07-24',10.00,24,26,'ACTIVA',NULL,NULL),(27,'Venta de prueba 24','2026-07-25',8.00,25,27,'ACTIVA',NULL,NULL),(28,'Venta de prueba 25','2026-07-26',8.00,26,28,'ACTIVA',NULL,NULL),(29,'Venta de prueba 26','2026-07-27',12.00,27,29,'ACTIVA',NULL,NULL),(30,'Venta de prueba 27','2026-07-28',8.00,28,30,'ACTIVA',NULL,NULL),(31,'Venta de prueba 28','2026-07-29',15.00,29,31,'ACTIVA',NULL,NULL),(32,'Venta de prueba 29','2026-07-30',20.00,30,32,'ACTIVA',NULL,NULL),(33,'Venta de prueba 30','2026-07-31',25.00,31,33,'ACTIVA',NULL,NULL),(34,'Venta de prueba 31','2026-08-01',10.00,32,34,'ACTIVA',NULL,NULL),(35,'Venta de prueba 32','2026-08-02',12.00,33,35,'ACTIVA',NULL,NULL),(36,'Venta de prueba 33','2026-08-03',15.00,34,36,'ACTIVA',NULL,NULL),(37,'Venta de prueba 34','2026-08-04',12.00,35,37,'ACTIVA',NULL,NULL),(38,'Venta de prueba 35','2026-08-05',32.00,36,38,'ACTIVA',NULL,NULL),(39,'Venta de prueba 36','2026-08-06',28.00,37,39,'ACTIVA',NULL,NULL),(40,'Venta de prueba 37','2026-08-07',12.00,38,40,'ACTIVA',NULL,NULL),(41,'Venta de prueba 38','2026-08-08',20.00,39,41,'ACTIVA',NULL,NULL),(42,'Venta de prueba 39','2026-08-09',12.00,40,42,'ACTIVA',NULL,NULL),(43,'Venta de prueba 40','2026-08-10',20.00,41,43,'ACTIVA',NULL,NULL),(44,'Venta de prueba 41','2026-08-11',12.00,42,44,'ACTIVA',NULL,NULL),(45,'Venta de prueba 42','2026-08-12',20.00,43,45,'ACTIVA',NULL,NULL),(46,'Venta de prueba 43','2026-08-13',45.00,44,46,'ACTIVA',NULL,NULL),(47,'Venta de prueba 44','2026-08-14',80.00,45,47,'ACTIVA',NULL,NULL),(48,'Venta de prueba 45','2026-08-15',18.00,46,48,'ACTIVA',NULL,NULL),(49,'Venta de prueba 46','2026-08-16',75.00,47,49,'ACTIVA',NULL,NULL),(50,'Venta de prueba 47','2026-08-17',8.00,48,50,'ACTIVA',NULL,NULL),(51,'Venta desde aplicacion web','2026-09-23',8.00,2,6,'ACTIVA',NULL,NULL),(52,'venta ejemplo','2026-09-29',15.00,2,4,'ACTIVA',NULL,NULL),(53,'venta ejemplo','2026-09-29',500.00,2,4,'ACTIVA',NULL,NULL),(54,'Venta de prueba multiple','2026-10-13',90.00,1,1,'ACTIVA',NULL,NULL),(55,'Prueba compatibilidad venta individual','2026-10-13',8.00,1,1,'ACTIVA',NULL,NULL),(56,'Venta desde aplicacion web ejemplo','2026-10-13',88.00,1,4,'ACTIVA',NULL,NULL),(57,'Venta tortillas','2026-10-13',150.00,1,4,'ACTIVA',NULL,NULL),(58,'Nachos','2026-10-13',252.00,1,9,'ACTIVA',NULL,NULL),(59,'PRUEBA ANULACION ENTREGA 4','2026-10-14',64.00,1,4,'ANULADA','Prueba de anulación de ventas para la Entrega 4','2026-10-14 14:47:00'),(60,'Ejemplo venta','2026-10-14',90.00,1,4,'ANULADA','prueba de anulacion','2026-10-14 14:57:56'),(61,'venta ejemplo 2','2026-10-14',8.00,2,4,'ANULADA','ejemplo de anulacion de venta','2026-10-14 15:10:13'),(62,'Venta desde aplicacion web','2026-10-17',48.00,52,4,'ANULADA','prueba','2026-10-17 18:43:33'),(63,'Venta desde aplicacion web','2026-10-17',26.00,52,4,'ANULADA','prueba','2026-10-19 18:50:50');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_materia_prima`
--

DROP TABLE IF EXISTS `venta_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_materia_prima` (
  `id_venta` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  PRIMARY KEY (`id_venta`,`id_materia_prima`),
  KEY `fk_ventamat_materiaprima` (`id_materia_prima`),
  CONSTRAINT `fk_ventamat_materiaprima` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ventamat_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_materia_prima`
--

LOCK TABLES `venta_materia_prima` WRITE;
/*!40000 ALTER TABLE `venta_materia_prima` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_inventario_productos`
--

DROP TABLE IF EXISTS `vw_inventario_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_inventario_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inventario_productos` AS SELECT 
 1 AS `id_producto`,
 1 AS `producto`,
 1 AS `descripcion`,
 1 AS `stock_actual`,
 1 AS `precio_unitario`,
 1 AS `estado_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_detalladas`
--

DROP TABLE IF EXISTS `vw_ventas_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_detalladas` AS SELECT 
 1 AS `id_venta`,
 1 AS `fecha_venta`,
 1 AS `asunto`,
 1 AS `id_cliente`,
 1 AS `cliente`,
 1 AS `id_empleado`,
 1 AS `empleado`,
 1 AS `id_producto`,
 1 AS `producto`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `subtotal`,
 1 AS `total_venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bd_tradicion'
--

--
-- Dumping routines for database 'bd_tradicion'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_anular_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_anular_compra`(
    IN p_id_compras INT,
    IN p_motivo VARCHAR(500)
)
BEGIN
    DECLARE v_estado VARCHAR(10) DEFAULT NULL;
    DECLARE v_faltantes INT DEFAULT 0;
    DECLARE v_detalles INT DEFAULT 0;
    DECLARE v_no_existe BOOLEAN DEFAULT FALSE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_no_existe = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF p_id_compras IS NULL OR p_id_compras <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID de compra invalido';
    END IF;
    IF p_motivo IS NULL OR CHAR_LENGTH(TRIM(p_motivo)) < 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El motivo debe tener al menos 5 caracteres';
    END IF;

    START TRANSACTION;

    SET v_no_existe = FALSE;
    SELECT estado INTO v_estado
    FROM compras WHERE id_compras = p_id_compras FOR UPDATE;

    IF v_no_existe THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La compra no existe';
    END IF;
    IF v_estado = 'ANULADA' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La compra ya esta anulada';
    END IF;

    SELECT COUNT(*) INTO v_detalles
    FROM detalle_compra_materia_prima
    WHERE id_compras = p_id_compras;
    IF v_detalles = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La compra no tiene materias primas registradas';
    END IF;

    -- Bloquea todas las materias primas en orden estable para serializar
    -- la comprobacion y el descuento, evitando existencias negativas.
    BEGIN
        DECLARE v_fin BOOLEAN DEFAULT FALSE;
        DECLARE v_id_mp INT;
        DECLARE cur_mp CURSOR FOR
            SELECT mp.id_materia_prima
            FROM materia_prima mp
            INNER JOIN detalle_compra_materia_prima d
                ON d.id_materia_prima = mp.id_materia_prima
            WHERE d.id_compras = p_id_compras
            ORDER BY mp.id_materia_prima;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_fin = TRUE;
        OPEN cur_mp;
        ciclo: LOOP
            FETCH cur_mp INTO v_id_mp;
            IF v_fin THEN LEAVE ciclo; END IF;
            BEGIN
                DECLARE v_actual DECIMAL(10,2);
                SELECT cantidad INTO v_actual
                FROM materia_prima WHERE id_materia_prima = v_id_mp FOR UPDATE;
            END;
        END LOOP;
        CLOSE cur_mp;
    END;

    SELECT COUNT(*) INTO v_faltantes
    FROM detalle_compra_materia_prima d
    LEFT JOIN materia_prima mp ON mp.id_materia_prima = d.id_materia_prima
    WHERE d.id_compras = p_id_compras
      AND (mp.id_materia_prima IS NULL OR mp.cantidad IS NULL OR mp.cantidad < d.cantidad);

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inventario insuficiente para anular la compra';
    END IF;

    UPDATE materia_prima mp
    INNER JOIN detalle_compra_materia_prima d
        ON d.id_materia_prima = mp.id_materia_prima
    SET mp.cantidad = mp.cantidad - d.cantidad
    WHERE d.id_compras = p_id_compras;

    UPDATE compras
    SET estado = 'ANULADA',
        motivo_anulacion = TRIM(p_motivo),
        fecha_anulacion = NOW()
    WHERE id_compras = p_id_compras;

    COMMIT;
    SELECT p_id_compras AS id_compras,
           'Compra anulada; inventario descontado correctamente' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_anular_produccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_anular_produccion`(
    IN p_id_produccion INT,
    IN p_motivo VARCHAR(500)
)
BEGIN
    DECLARE v_estado VARCHAR(20);
    DECLARE v_existe INT DEFAULT 0;
    DECLARE v_detalles INT DEFAULT 0;
    DECLARE v_consumos INT DEFAULT 0;
    DECLARE v_invalidos INT DEFAULT 0;
    DECLARE v_faltantes INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF p_id_produccion IS NULL OR p_id_produccion <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ID de produccion invalido';
    END IF;

    IF p_motivo IS NULL OR CHAR_LENGTH(TRIM(p_motivo)) < 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El motivo debe tener al menos 5 caracteres';
    END IF;

    START TRANSACTION;

    -- Bloquear la producción durante la anulación.
    SELECT COUNT(*)
    INTO v_existe
    FROM produccion
    WHERE id_produccion = p_id_produccion;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La produccion no existe';
    END IF;

    SELECT estado
    INTO v_estado
    FROM produccion
    WHERE id_produccion = p_id_produccion
    FOR UPDATE;

    IF v_estado = 'ANULADA' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La produccion ya esta anulada';
    END IF;

    SELECT COUNT(*)
    INTO v_detalles
    FROM detalle_fabricacion
    WHERE id_produccion = p_id_produccion;

    IF v_detalles = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La produccion no tiene productos registrados';
    END IF;

    SELECT COUNT(*)
    INTO v_consumos
    FROM materia_prima_produccion
    WHERE id_produccion = p_id_produccion;

    SELECT COUNT(*)
    INTO v_invalidos
    FROM materia_prima_produccion
    WHERE id_produccion = p_id_produccion
      AND (cantidad_consumida IS NULL OR cantidad_consumida <= 0);

    -- Impedir anular producciones históricas sin consumos verificables.
    IF v_consumos = 0 OR v_invalidos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Produccion sin historial de consumo completo';
    END IF;

    -- Bloquear productos fabricados.
    UPDATE producto p
    INNER JOIN detalle_fabricacion df
        ON df.id_producto = p.id_producto
    SET p.unidades = p.unidades
    WHERE df.id_produccion = p_id_produccion;

    -- Comprobar que aún existan suficientes productos terminados.
    SELECT COUNT(*)
    INTO v_faltantes
    FROM detalle_fabricacion df
    INNER JOIN producto p
        ON p.id_producto = df.id_producto
    WHERE df.id_produccion = p_id_produccion
      AND (
          p.unidades IS NULL
          OR p.unidades < df.cantidad_producida
      );

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Inventario insuficiente para anular la produccion';
    END IF;

    -- Bloquear materias primas involucradas.
    UPDATE materia_prima mp
    INNER JOIN materia_prima_produccion mpp
        ON mpp.id_materia_prima = mp.id_materia_prima
    SET mp.cantidad = mp.cantidad
    WHERE mpp.id_produccion = p_id_produccion;

    -- Descontar los productos terminados.
    UPDATE producto p
    INNER JOIN detalle_fabricacion df
        ON df.id_producto = p.id_producto
    SET p.unidades = p.unidades - df.cantidad_producida
    WHERE df.id_produccion = p_id_produccion;

    -- Devolver exactamente las materias primas registradas.
    UPDATE materia_prima mp
    INNER JOIN materia_prima_produccion mpp
        ON mpp.id_materia_prima = mp.id_materia_prima
    SET mp.cantidad = mp.cantidad + mpp.cantidad_consumida
    WHERE mpp.id_produccion = p_id_produccion;

    UPDATE produccion
    SET estado = 'ANULADA',
        motivo_anulacion = TRIM(p_motivo),
        fecha_anulacion = NOW()
    WHERE id_produccion = p_id_produccion;

    COMMIT;

    SELECT
        p_id_produccion AS id_produccion,
        'Produccion anulada; inventario restaurado correctamente' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_anular_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_anular_venta`(IN p_id_venta INT, IN p_motivo VARCHAR(500))
BEGIN
  DECLARE v_estado VARCHAR(20) DEFAULT NULL;
  DECLARE v_existe INT DEFAULT 0;
  DECLARE v_detalles INT DEFAULT 0;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  IF p_id_venta IS NULL OR p_id_venta <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID de venta invalido';
  END IF;
  IF p_motivo IS NULL OR CHAR_LENGTH(TRIM(p_motivo)) < 5 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Indique un motivo de al menos 5 caracteres';
  END IF;

  START TRANSACTION;
  -- Bloquea la venta para impedir anulaciones simultáneas.
  SELECT COUNT(*) INTO v_existe FROM venta WHERE id_venta = p_id_venta;
  IF v_existe = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La venta no existe';
  END IF;

  SELECT estado INTO v_estado FROM venta WHERE id_venta = p_id_venta FOR UPDATE;
  IF v_estado = 'ANULADA' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La venta ya esta anulada';
  END IF;

  SELECT COUNT(*) INTO v_detalles FROM producto_venta WHERE id_venta = p_id_venta;
  IF v_detalles = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La venta no tiene detalle de productos';
  END IF;

  -- Restaura exactamente las unidades del detalle; no modifica los precios.
  UPDATE producto p
  JOIN producto_venta pv ON pv.id_producto = p.id_producto
  SET p.unidades = p.unidades + pv.cantidad
  WHERE pv.id_venta = p_id_venta;

  UPDATE venta SET estado = 'ANULADA',
                   motivo_anulacion = TRIM(p_motivo),
                   fecha_anulacion = NOW()
  WHERE id_venta = p_id_venta;
  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generar_ventas_prueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_ventas_prueba`()
BEGIN
    DECLARE v_contador INT DEFAULT 1;
    DECLARE v_cliente INT;
    DECLARE v_empleado INT;
    DECLARE v_producto INT;
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_id_venta INT;

    DECLARE v_offset_cliente INT;
    DECLARE v_offset_empleado INT;
    DECLARE v_offset_producto INT;

    WHILE v_contador <= 47 DO

        SET v_offset_cliente = MOD(v_contador, 53);
        SET v_offset_empleado = MOD(v_contador, 51);
        SET v_offset_producto = MOD(v_contador, 51);

        -- Obtener un cliente existente
        SELECT id_cliente
        INTO v_cliente
        FROM cliente
        ORDER BY id_cliente
        LIMIT v_offset_cliente, 1;

        -- Obtener un empleado existente
        SELECT id_empleado
        INTO v_empleado
        FROM empleado
        ORDER BY id_empleado
        LIMIT v_offset_empleado, 1;

        -- Obtener un producto existente
        SELECT id_producto, precio_unitario
        INTO v_producto, v_precio
        FROM producto
        ORDER BY id_producto
        LIMIT v_offset_producto, 1;

        -- Obtener el siguiente ID disponible
        SELECT COALESCE(MAX(id_venta), 0) + 1
        INTO v_id_venta
        FROM venta;

        -- Crear la venta
        INSERT INTO venta (
            id_venta,
            asunto,
            fecha_venta,
            monto,
            id_empleado,
            id_cliente
        )
        VALUES (
            v_id_venta,
            CONCAT('Venta de prueba ', v_contador),
            DATE_ADD(
                '2026-07-01',
                INTERVAL MOD(v_contador, 75) DAY
            ),
            v_precio,
            v_empleado,
            v_cliente
        );

        -- Registrar el producto vendido
        INSERT INTO producto_venta (
            id_venta,
            id_producto,
            cantidad,
            precio_unitario
        )
        VALUES (
            v_id_venta,
            v_producto,
            1,
            v_precio
        );

        SET v_contador = v_contador + 1;

    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_compra_multiple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_compra_multiple`(
    IN p_fecha_compra DATE,
    IN p_id_proveedor INT,
    IN p_materias_primas JSON
)
BEGIN
    DECLARE v_id_compra INT;
    DECLARE v_total DECIMAL(10,2) DEFAULT 0;
    DECLARE v_items INT DEFAULT 0;
    DECLARE v_i INT DEFAULT 0;
    DECLARE v_id_mp INT;
    DECLARE v_cantidad DECIMAL(10,2);
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_id_txt VARCHAR(100);
    DECLARE v_cantidad_txt VARCHAR(100);
    DECLARE v_precio_txt VARCHAR(100);
    DECLARE v_existe INT DEFAULT 0;
    DECLARE v_mensaje VARCHAR(255);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF p_fecha_compra IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de compra es obligatoria';
    END IF;
    IF p_id_proveedor IS NULL OR p_id_proveedor <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Proveedor invalido';
    END IF;
    IF p_materias_primas IS NULL OR JSON_TYPE(p_materias_primas) <> 'ARRAY' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe enviar un arreglo JSON de materias primas';
    END IF;
    SET v_items = JSON_LENGTH(p_materias_primas);
    IF v_items < 1 OR v_items > 500 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La compra debe tener entre 1 y 500 materias primas';
    END IF;

    START TRANSACTION;
    SELECT COUNT(*) INTO v_existe FROM proveedor WHERE id_proveedor = p_id_proveedor;
    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proveedor no existe';
    END IF;

    INSERT INTO secuencia_compras VALUES (NULL);
    SET v_id_compra = LAST_INSERT_ID();
    INSERT INTO compras (id_compras, fecha_compra, monto, id_proveedor)
    VALUES (v_id_compra, p_fecha_compra, 0, p_id_proveedor);

    WHILE v_i < v_items DO
        IF JSON_TYPE(JSON_EXTRACT(p_materias_primas, CONCAT('$[', v_i, ']'))) <> 'OBJECT' THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cada elemento debe ser un objeto JSON';
        END IF;
        SET v_id_txt = JSON_UNQUOTE(JSON_EXTRACT(p_materias_primas, CONCAT('$[', v_i, '].id_materia_prima')));
        SET v_cantidad_txt = JSON_UNQUOTE(JSON_EXTRACT(p_materias_primas, CONCAT('$[', v_i, '].cantidad')));
        SET v_precio_txt = JSON_UNQUOTE(JSON_EXTRACT(p_materias_primas, CONCAT('$[', v_i, '].precio_unitario')));

        IF v_id_txt IS NULL OR v_id_txt NOT REGEXP '^[0-9]{1,10}$'
           OR CAST(v_id_txt AS UNSIGNED) > 2147483647 OR CAST(v_id_txt AS UNSIGNED) = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID de materia prima invalido';
        END IF;
        IF v_cantidad_txt IS NULL OR v_cantidad_txt NOT REGEXP '^[0-9]{1,8}(\\.[0-9]{1,2})?$'
           OR CAST(v_cantidad_txt AS DECIMAL(10,2)) <= 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad invalida (maximo 2 decimales)';
        END IF;
        IF v_precio_txt IS NULL OR v_precio_txt NOT REGEXP '^[0-9]{1,8}(\\.[0-9]{1,2})?$' THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Precio unitario invalido (maximo 2 decimales)';
        END IF;
        SET v_id_mp = CAST(v_id_txt AS UNSIGNED);
        SET v_cantidad = CAST(v_cantidad_txt AS DECIMAL(10,2));
        SET v_precio = CAST(v_precio_txt AS DECIMAL(10,2));

        SELECT COUNT(*) INTO v_existe FROM materia_prima WHERE id_materia_prima = v_id_mp;
        IF v_existe = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Materia prima no existe';
        END IF;
        -- Rechaza duplicados antes de insertar (la PK tambien los impediria).
        SELECT COUNT(*) INTO v_existe FROM detalle_compra_materia_prima
        WHERE id_compras = v_id_compra AND id_materia_prima = v_id_mp;
        IF v_existe > 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Materia prima repetida en la misma compra';
        END IF;
        IF v_total + ROUND(v_cantidad * v_precio, 2) > 99999999.99 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El total excede el limite permitido';
        END IF;
        INSERT INTO detalle_compra_materia_prima
            (id_compras, id_materia_prima, cantidad, precio_unitario)
        VALUES (v_id_compra, v_id_mp, v_cantidad, v_precio);
        -- El trigger AFTER INSERT incrementa materia_prima.cantidad.
        SET v_total = v_total + ROUND(v_cantidad * v_precio, 2);
        SET v_i = v_i + 1;
    END WHILE;

    UPDATE compras SET monto = v_total WHERE id_compras = v_id_compra;
    COMMIT;
    SELECT v_id_compra AS id_compras, v_total AS total,
           'Compra multiple registrada correctamente' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_produccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_produccion`(
    IN p_nombre VARCHAR(200),
    IN p_descripcion VARCHAR(200),
    IN p_fecha_produccion DATE,
    IN p_id_producto INT,
    IN p_cantidad_producida INT
)
BEGIN
    DECLARE v_id_produccion INT;
    DECLARE v_materias INT DEFAULT 0;
    DECLARE v_faltantes INT DEFAULT 0;
    DECLARE v_invalidas INT DEFAULT 0;
    DECLARE v_producto_existe INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF p_nombre IS NULL OR TRIM(p_nombre) = ''
       OR p_fecha_produccion IS NULL
       OR p_id_producto IS NULL
       OR p_cantidad_producida IS NULL
       OR p_cantidad_producida <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Datos de produccion invalidos';
    END IF;

    START TRANSACTION;

    -- Bloquear el producto mientras se registra la producción.
    SELECT COUNT(*)
    INTO v_producto_existe
    FROM producto
    WHERE id_producto = p_id_producto;

    IF v_producto_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto indicado no existe';
    END IF;

    UPDATE producto
    SET unidades = unidades
    WHERE id_producto = p_id_producto;

    SELECT COUNT(*)
    INTO v_materias
    FROM materia_prima_producto
    WHERE id_producto = p_id_producto;

    IF v_materias = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto no tiene receta registrada';
    END IF;

    -- Bloquear materias primas de la receta.
    UPDATE materia_prima mp
    INNER JOIN materia_prima_producto mpp
        ON mp.id_materia_prima = mpp.id_materia_prima
    SET mp.cantidad = mp.cantidad
    WHERE mpp.id_producto = p_id_producto;

    -- Comprobar cantidades y precisión.
    SELECT COUNT(*)
    INTO v_invalidas
    FROM materia_prima_producto mpp
    WHERE mpp.id_producto = p_id_producto
      AND (
          mpp.cantidad IS NULL
          OR mpp.cantidad <= 0
          OR mpp.cantidad * p_cantidad_producida > 99999999.99
      );

    IF v_invalidas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Receta o cantidad de consumo invalida';
    END IF;

    SELECT COUNT(*)
    INTO v_faltantes
    FROM materia_prima_producto mpp
    INNER JOIN materia_prima mp
        ON mp.id_materia_prima = mpp.id_materia_prima
    WHERE mpp.id_producto = p_id_producto
      AND (
          mp.cantidad IS NULL
          OR mp.cantidad < mpp.cantidad * p_cantidad_producida
      );

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Materia prima insuficiente para producir';
    END IF;

    -- Generar ID sin utilizar MAX + 1.
    INSERT INTO secuencia_produccion VALUES (NULL);
    SET v_id_produccion = LAST_INSERT_ID();

    INSERT INTO produccion (
        id_produccion,
        nombre,
        descripcion,
        fecha_produccion
    )
    VALUES (
        v_id_produccion,
        TRIM(p_nombre),
        p_descripcion,
        p_fecha_produccion
    );

    INSERT INTO detalle_fabricacion (
        id_produccion,
        id_producto,
        cantidad_producida
    )
    VALUES (
        v_id_produccion,
        p_id_producto,
        p_cantidad_producida
    );

    -- Guardar el consumo exacto de esta producción.
    INSERT INTO materia_prima_produccion (
        id_materia_prima,
        id_produccion,
        cantidad_consumida
    )
    SELECT
        mpp.id_materia_prima,
        v_id_produccion,
        mpp.cantidad * p_cantidad_producida
    FROM materia_prima_producto mpp
    WHERE mpp.id_producto = p_id_producto;

    -- Descontar las materias primas utilizadas.
    UPDATE materia_prima mp
    INNER JOIN materia_prima_produccion mpp
        ON mp.id_materia_prima = mpp.id_materia_prima
    SET mp.cantidad = mp.cantidad - mpp.cantidad_consumida
    WHERE mpp.id_produccion = v_id_produccion;

    -- Aumentar productos terminados.
    UPDATE producto
    SET unidades = unidades + p_cantidad_producida
    WHERE id_producto = p_id_producto;

    COMMIT;

    SELECT
        v_id_produccion AS id_produccion,
        p_id_producto AS id_producto,
        p_cantidad_producida AS cantidad_producida,
        'Produccion registrada correctamente' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_produccion_multiple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_produccion_multiple`(
    IN p_nombre VARCHAR(200),
    IN p_descripcion VARCHAR(200),
    IN p_fecha_produccion DATE,
    IN p_productos JSON
)
BEGIN
    DECLARE v_id INT;
    DECLARE v_i INT DEFAULT 0;
    DECLARE v_n INT DEFAULT 0;
    DECLARE v_producto_txt VARCHAR(100);
    DECLARE v_cantidad_txt VARCHAR(100);
    DECLARE v_producto INT;
    DECLARE v_cantidad INT;
    DECLARE v_faltantes INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        DROP TEMPORARY TABLE IF EXISTS tmp_prod_consumos;
        DROP TEMPORARY TABLE IF EXISTS tmp_prod_items;
        RESIGNAL;
    END;

    IF p_nombre IS NULL
       OR CHAR_LENGTH(TRIM(p_nombre)) = 0
       OR p_fecha_produccion IS NULL
       OR p_productos IS NULL
       OR JSON_TYPE(p_productos) <> 'ARRAY'
       OR JSON_LENGTH(p_productos) = 0
       OR JSON_LENGTH(p_productos) > 100 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Datos de produccion invalidos';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_prod_consumos;
    DROP TEMPORARY TABLE IF EXISTS tmp_prod_items;

    CREATE TEMPORARY TABLE tmp_prod_items (
        id_producto INT NOT NULL PRIMARY KEY,
        cantidad INT NOT NULL
    ) ENGINE=InnoDB;

    CREATE TEMPORARY TABLE tmp_prod_consumos (
        id_materia_prima INT NOT NULL PRIMARY KEY,
        cantidad_consumida DECIMAL(10,2) NOT NULL
    ) ENGINE=InnoDB;

    SET v_n = JSON_LENGTH(p_productos);

    WHILE v_i < v_n DO

        IF JSON_TYPE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_i, ']')
            )
        ) <> 'OBJECT'
        OR JSON_TYPE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_i, '].id_producto')
            )
        ) NOT IN ('INTEGER', 'UNSIGNED INTEGER')
        OR JSON_TYPE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_i, '].cantidad')
            )
        ) NOT IN ('INTEGER', 'UNSIGNED INTEGER') THEN

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Producto o cantidad deben ser enteros';
        END IF;

        SET v_producto_txt = JSON_UNQUOTE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_i, '].id_producto')
            )
        );

        SET v_cantidad_txt = JSON_UNQUOTE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_i, '].cantidad')
            )
        );

        IF v_producto_txt NOT REGEXP '^[0-9]{1,10}$'
           OR v_cantidad_txt NOT REGEXP '^[0-9]{1,10}$'
           OR CAST(v_producto_txt AS DECIMAL(20,0))
              NOT BETWEEN 1 AND 2147483647
           OR CAST(v_cantidad_txt AS DECIMAL(20,0))
              NOT BETWEEN 1 AND 2147483647 THEN

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ID o cantidad fuera de rango';
        END IF;

        SET v_producto = CAST(v_producto_txt AS UNSIGNED);
        SET v_cantidad = CAST(v_cantidad_txt AS UNSIGNED);

        IF EXISTS (
            SELECT 1
            FROM tmp_prod_items
            WHERE id_producto = v_producto
        ) THEN

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Producto repetido en la misma produccion';
        END IF;

        INSERT INTO tmp_prod_items (
            id_producto,
            cantidad
        )
        VALUES (
            v_producto,
            v_cantidad
        );

        SET v_i = v_i + 1;

    END WHILE;

    START TRANSACTION;

    -- Bloquear productos involucrados.

    UPDATE producto p
    INNER JOIN tmp_prod_items t
        ON t.id_producto = p.id_producto
    SET p.unidades = p.unidades;

    -- Validar existencia y capacidad del inventario.

    SELECT COUNT(*)
    INTO v_faltantes
    FROM tmp_prod_items t
    LEFT JOIN producto p
        ON p.id_producto = t.id_producto
    WHERE p.id_producto IS NULL
       OR p.unidades IS NULL
       OR p.unidades + CAST(t.cantidad AS DECIMAL(20,0))
          > 2147483647;

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Producto inexistente o stock final fuera de rango';
    END IF;

    -- Comprobar que todos los productos tengan receta.

    SELECT COUNT(*)
    INTO v_faltantes
    FROM tmp_prod_items t
    WHERE NOT EXISTS (
        SELECT 1
        FROM materia_prima_producto r
        WHERE r.id_producto = t.id_producto
    );

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hay productos sin receta registrada';
    END IF;

    -- Validar cantidades de las recetas.

    SELECT COUNT(*)
    INTO v_faltantes
    FROM tmp_prod_items t
    INNER JOIN materia_prima_producto r
        ON r.id_producto = t.id_producto
    WHERE r.cantidad IS NULL
       OR r.cantidad <= 0
       OR r.cantidad * CAST(t.cantidad AS DECIMAL(20,0))
          > 99999999.99;

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Receta o consumo fuera de rango';
    END IF;

    -- Calcular consumo total de cada materia prima.

    INSERT INTO tmp_prod_consumos (
        id_materia_prima,
        cantidad_consumida
    )
    SELECT
        r.id_materia_prima,
        SUM(r.cantidad * t.cantidad)
    FROM tmp_prod_items t
    INNER JOIN materia_prima_producto r
        ON r.id_producto = t.id_producto
    GROUP BY r.id_materia_prima;

    -- Bloquear materias primas.

    UPDATE materia_prima mp
    INNER JOIN tmp_prod_consumos c
        ON c.id_materia_prima = mp.id_materia_prima
    SET mp.cantidad = mp.cantidad;

    -- Verificar inventario suficiente para toda la produccion.

    SELECT COUNT(*)
    INTO v_faltantes
    FROM tmp_prod_consumos c
    LEFT JOIN materia_prima mp
        ON mp.id_materia_prima = c.id_materia_prima
    WHERE mp.id_materia_prima IS NULL
       OR mp.cantidad IS NULL
       OR mp.cantidad < c.cantidad_consumida;

    IF v_faltantes > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Materia prima insuficiente para toda la produccion';
    END IF;

    -- Generar identificador seguro.

    INSERT INTO secuencia_produccion VALUES (NULL);

    SET v_id = LAST_INSERT_ID();

    -- Registrar encabezado de produccion.

    INSERT INTO produccion (
        id_produccion,
        nombre,
        descripcion,
        fecha_produccion
    )
    VALUES (
        v_id,
        TRIM(p_nombre),
        p_descripcion,
        p_fecha_produccion
    );

    -- Registrar todos los productos fabricados.

    INSERT INTO detalle_fabricacion (
        id_produccion,
        id_producto,
        cantidad_producida
    )
    SELECT
        v_id,
        id_producto,
        cantidad
    FROM tmp_prod_items;

    -- Guardar historial exacto de materias primas.

    INSERT INTO materia_prima_produccion (
        id_materia_prima,
        id_produccion,
        cantidad_consumida
    )
    SELECT
        id_materia_prima,
        v_id,
        cantidad_consumida
    FROM tmp_prod_consumos;

    -- Descontar materias primas.

    UPDATE materia_prima mp
    INNER JOIN tmp_prod_consumos c
        ON c.id_materia_prima = mp.id_materia_prima
    SET mp.cantidad =
        mp.cantidad - c.cantidad_consumida;

    -- Aumentar inventario de productos terminados.

    UPDATE producto p
    INNER JOIN tmp_prod_items t
        ON t.id_producto = p.id_producto
    SET p.unidades = p.unidades + t.cantidad;

    COMMIT;

    DROP TEMPORARY TABLE IF EXISTS tmp_prod_consumos;
    DROP TEMPORARY TABLE IF EXISTS tmp_prod_items;

    SELECT
        v_id AS id_produccion,
        'Produccion multiple registrada correctamente' AS mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_venta`(
    IN p_asunto VARCHAR(200),
    IN p_fecha_venta DATE,
    IN p_id_empleado INT,
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2)
)
BEGIN
    -- Utilizar el procedimiento de ventas múltiples,
    -- enviando un arreglo que contiene un solo producto.

    CALL sp_registrar_venta_multiple(
        p_asunto,
        p_fecha_venta,
        p_id_empleado,
        p_id_cliente,
        JSON_ARRAY(
            JSON_OBJECT(
                'id_producto', p_id_producto,
                'cantidad', p_cantidad,
                'precio_unitario', p_precio_unitario
            )
        )
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_venta_multiple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_venta_multiple`(
    IN p_asunto VARCHAR(200),
    IN p_fecha_venta DATE,
    IN p_id_empleado INT,
    IN p_id_cliente INT,
    IN p_productos JSON
)
BEGIN
    DECLARE v_id_venta INT;
    DECLARE v_total DECIMAL(10,2) DEFAULT 0;
    DECLARE v_indice INT DEFAULT 0;
    DECLARE v_numero_productos INT;

    DECLARE v_id_producto INT;
    DECLARE v_cantidad INT;
    DECLARE v_precio DECIMAL(10,2);

    DECLARE v_id_texto VARCHAR(100);
    DECLARE v_cantidad_texto VARCHAR(100);
    DECLARE v_precio_texto VARCHAR(100);

    DECLARE v_fin INT DEFAULT 0;

    DECLARE cursor_productos CURSOR FOR
        SELECT id_producto, cantidad, precio_unitario
        FROM tmp_venta_productos
        ORDER BY id_producto;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_fin = 1;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        DROP TEMPORARY TABLE IF EXISTS tmp_venta_productos;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Validaciones generales

    IF p_fecha_venta IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe indicar una fecha';
    END IF;

    IF p_id_cliente IS NULL OR NOT EXISTS (
        SELECT 1 FROM cliente
        WHERE id_cliente = p_id_cliente
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente indicado no existe';
    END IF;

    IF p_id_empleado IS NULL OR NOT EXISTS (
        SELECT 1 FROM empleado
        WHERE id_empleado = p_id_empleado
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado indicado no existe';
    END IF;

    IF p_productos IS NULL
       OR JSON_TYPE(p_productos) <> 'ARRAY'
       OR JSON_LENGTH(p_productos) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe agregar al menos un producto';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_venta_productos;

    CREATE TEMPORARY TABLE tmp_venta_productos (
        id_producto INT PRIMARY KEY,
        cantidad INT NOT NULL,
        precio_unitario DECIMAL(10,2) NOT NULL
    );

    SET v_numero_productos = JSON_LENGTH(p_productos);

    WHILE v_indice < v_numero_productos DO

        -- Validar estructura del elemento

        IF JSON_TYPE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_indice, ']')
            )
        ) <> 'OBJECT' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Formato de producto invalido';
        END IF;

        SET v_id_texto = JSON_UNQUOTE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_indice, '].id_producto')
            )
        );

        SET v_cantidad_texto = JSON_UNQUOTE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_indice, '].cantidad')
            )
        );

        SET v_precio_texto = JSON_UNQUOTE(
            JSON_EXTRACT(
                p_productos,
                CONCAT('$[', v_indice, '].precio_unitario')
            )
        );

        -- Validar formato antes de convertir

        IF v_id_texto IS NULL
           OR v_id_texto NOT REGEXP '^[1-9][0-9]*$'
           OR CHAR_LENGTH(v_id_texto) > 10
           OR CAST(v_id_texto AS DECIMAL(20,0)) > 2147483647
           OR v_cantidad_texto IS NULL
           OR v_cantidad_texto NOT REGEXP '^[1-9][0-9]*$'
           OR CHAR_LENGTH(v_cantidad_texto) > 10
           OR CAST(v_cantidad_texto AS DECIMAL(20,0)) > 2147483647
           OR v_precio_texto IS NULL
           OR v_precio_texto NOT REGEXP
              '^[0-9]{1,8}([.][0-9]{1,2})?$' THEN

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Datos de producto invalidos';
        END IF;

        SET v_id_producto = CAST(v_id_texto AS UNSIGNED);
        SET v_cantidad = CAST(v_cantidad_texto AS UNSIGNED);
        SET v_precio = CAST(v_precio_texto AS DECIMAL(10,2));

        IF NOT EXISTS (
            SELECT 1
            FROM producto
            WHERE id_producto = v_id_producto
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Uno de los productos no existe';
        END IF;

        -- Si se repite un producto, el precio debe coincidir

        IF EXISTS (
            SELECT 1
            FROM tmp_venta_productos
            WHERE id_producto = v_id_producto
              AND precio_unitario <> v_precio
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Producto repetido con precio diferente';
        END IF;

        -- Agrupar cantidades del mismo producto

        INSERT INTO tmp_venta_productos (
            id_producto,
            cantidad,
            precio_unitario
        )
        VALUES (
            v_id_producto,
            v_cantidad,
            v_precio
        )
        ON DUPLICATE KEY UPDATE
            cantidad = cantidad + v_cantidad;

        SET v_indice = v_indice + 1;

    END WHILE;

    -- Calcular total

    SELECT SUM(cantidad * precio_unitario)
    INTO v_total
    FROM tmp_venta_productos;

    -- Generar identificador

    INSERT INTO secuencia_venta VALUES (NULL);

    SET v_id_venta = LAST_INSERT_ID();

    -- Registrar encabezado

    INSERT INTO venta (
        id_venta,
        asunto,
        fecha_venta,
        monto,
        id_empleado,
        id_cliente
    )
    VALUES (
        v_id_venta,
        p_asunto,
        p_fecha_venta,
        v_total,
        p_id_empleado,
        p_id_cliente
    );

    -- Registrar detalles

    OPEN cursor_productos;

    ciclo: LOOP

        FETCH cursor_productos
        INTO v_id_producto, v_cantidad, v_precio;

        IF v_fin = 1 THEN
            LEAVE ciclo;
        END IF;

        INSERT INTO producto_venta (
            id_venta,
            id_producto,
            cantidad,
            precio_unitario
        )
        VALUES (
            v_id_venta,
            v_id_producto,
            v_cantidad,
            v_precio
        );

    END LOOP;

    CLOSE cursor_productos;

    DROP TEMPORARY TABLE IF EXISTS tmp_venta_productos;

    COMMIT;

    SELECT
        v_id_venta AS id_venta,
        v_total AS total,
        'Venta multiple registrada correctamente' AS mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_inventario_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_inventario_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inventario_productos` AS select `producto`.`id_producto` AS `id_producto`,`producto`.`nombre` AS `producto`,`producto`.`descripcion` AS `descripcion`,`producto`.`unidades` AS `stock_actual`,`producto`.`precio_unitario` AS `precio_unitario`,(case when (`producto`.`unidades` = 0) then 'SIN STOCK' when (`producto`.`unidades` <= 10) then 'STOCK BAJO' else 'DISPONIBLE' end) AS `estado_stock` from `producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_detalladas` AS select `v`.`id_venta` AS `id_venta`,`v`.`fecha_venta` AS `fecha_venta`,`v`.`asunto` AS `asunto`,`c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `cliente`,`e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `empleado`,`p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `producto`,`pv`.`cantidad` AS `cantidad`,`pv`.`precio_unitario` AS `precio_unitario`,(`pv`.`cantidad` * `pv`.`precio_unitario`) AS `subtotal`,`v`.`monto` AS `total_venta` from ((((`venta` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `empleado` `e` on((`v`.`id_empleado` = `e`.`id_empleado`))) join `producto_venta` `pv` on((`v`.`id_venta` = `pv`.`id_venta`))) join `producto` `p` on((`pv`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21 15:06:14
