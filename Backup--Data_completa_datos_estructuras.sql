CREATE DATABASE  IF NOT EXISTS `exportacion_banano` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exportacion_banano`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: exportacion_banano
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `agencias_navieras`
--

DROP TABLE IF EXISTS `agencias_navieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencias_navieras` (
  `id_naviera` int NOT NULL AUTO_INCREMENT,
  `nombre_naviera` varchar(20) NOT NULL,
  `id_cliente` int NOT NULL,
  `destino` varchar(20) NOT NULL,
  `tiempo_transito` decimal(10,0) NOT NULL,
  `id_contenedor` int DEFAULT NULL,
  PRIMARY KEY (`id_naviera`),
  KEY `FK_agencias_navieras_clientes` (`id_cliente`),
  CONSTRAINT `FK_agencias_navieras_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencias_navieras`
--

LOCK TABLES `agencias_navieras` WRITE;
/*!40000 ALTER TABLE `agencias_navieras` DISABLE KEYS */;
INSERT INTO `agencias_navieras` VALUES (2215,'hapag lloyd',1254,'usa',9,4280095),(2216,'Seatrade_sealand',1255,'vlissingen',15,3335085),(2217,'maersk',1256,'pivdenyi',21,3314307),(2218,'cma cgm',1257,'rusia',21,4243300),(2219,'Cosco_Group',1257,'usa',9,4108145);
/*!40000 ALTER TABLE `agencias_navieras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_agencia_naviera_after` AFTER DELETE ON `agencias_navieras` FOR EACH ROW BEGIN 
INSERT INTO NEW_AGENCY ( id_naviera, nombre_naviera, id_cliente , destino, deleated_date, delete_user)
VALUES (
		OLD.id_naviera, OLD.nombre_naviera, OLD.id_cliente, OLD.destino, current_timestamp(), USER()
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `agencias_navieras_v`
--

DROP TABLE IF EXISTS `agencias_navieras_v`;
/*!50001 DROP VIEW IF EXISTS `agencias_navieras_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `agencias_navieras_v` AS SELECT 
 1 AS `tiempo_transito`,
 1 AS `destino`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(20) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `agencia_naviera` varchar(20) NOT NULL,
  `id_producto` int NOT NULL,
  `ref_insumos_requeridos` decimal(50,0) NOT NULL,
  `id_contenedor` int NOT NULL,
  `cantidad_contenedores` int NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1254,'fyffes','usa','hapag lloyd',1,3778805,4280095,300),(1255,'hhk','vlissingen','seatrade',2,25002,3335085,2),(1256,'banabest','pivdenyi','maersk',3,87502,3314307,7),(1257,'optifruit','rusia','hapag lloyd',4,100002,4243300,8),(1258,'tropical','polonia','seatrade',5,25002,2152496,2),(1259,'simba','francia','cma cgm',6,187502,2103866,15),(1260,'fratelli','italia','maersk',7,125002,3341703,10),(1261,'citronex','rumania','maersk',8,62502,7210415,5),(1262,'battaglio','italia','hapag lloyd',9,25002,7230267,2),(1263,'uniban','london','hapag lloyd',10,125002,2104137,10);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_clientes_after` AFTER DELETE ON `clientes` FOR EACH ROW BEGIN 
INSERT INTO NEW_CLIENTES ( id_cliente, nombre_cliente, agencia_naviera , cantidad_contenedores, deleated_date, delete_user)
VALUES (
		OLD.id_cliente, OLD.nombre_cliente, OLD.agencia_naviera, OLD.cantidad_contenedores, current_timestamp(), USER()
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `clientes_agencias`
--

DROP TABLE IF EXISTS `clientes_agencias`;
/*!50001 DROP VIEW IF EXISTS `clientes_agencias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientes_agencias` AS SELECT 
 1 AS `nombre_cliente`,
 1 AS `agencia_naviera`,
 1 AS `cantidad_contenedores`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id_materiales` int NOT NULL AUTO_INCREMENT,
  `nombre_materiales` varchar(20) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_proveedor` varchar(20) NOT NULL,
  `cantidades_stock` decimal(50,0) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id_materiales`),
  KEY `FK_insumos_clientes` (`id_cliente`),
  CONSTRAINT `FK_insumos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1401311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (140111,'sellos',1254,'T9581',4000000,'2022-12-23 00:00:00.000000'),(140112,'cajas carton',1254,'T9581',330000,'2022-12-23 00:00:00.000000'),(140113,'cintas',1254,'T9581',4000000,'2022-12-23 00:00:00.000000'),(140114,'daipas',1254,'T9581',800000,'2022-12-23 00:00:00.000000'),(140115,'hojas papel',1254,'T9581',800000,'2022-12-23 00:00:00.000000'),(140116,'pegante',1254,'T9581',20,'2022-12-23 00:00:00.000000'),(140117,'sunchos',1254,'T9581',1400000,'2022-12-23 00:00:00.000000'),(140118,'esquineros',1254,'D6366',700000,'2022-12-23 00:00:00.000000'),(140119,'estibas',1254,'D6366',300000,'2022-12-23 00:00:00.000000'),(140120,'estibas migros',1254,'D6366',30000,'2022-12-23 00:00:00.000000'),(140121,'sellos',1255,'T9581',6000,'2022-12-23 00:00:00.000000'),(140122,'cintas',1255,'T9581',6000,'2022-12-23 00:00:00.000000'),(140123,'daipas',1255,'T9581',5800,'2022-12-23 00:00:00.000000'),(140124,'hojas papel',1255,'T9581',5800,'2022-12-23 00:00:00.000000'),(140125,'pegante',1255,'T9581',5,'2022-12-23 00:00:00.000000'),(140126,'sunchos',1255,'T9581',9600,'2022-12-23 00:00:00.000000'),(140127,'esquineros',1255,'D6366',5000,'2022-12-23 00:00:00.000000'),(140128,'estibas',1255,'D6366',2200,'2022-12-23 00:00:00.000000'),(140129,'estibas migros',1255,'D6366',0,'2022-12-23 00:00:00.000000'),(140141,'sellos',1257,'T9581',21000,'2022-12-23 00:00:00.000000'),(140142,'cajas carton',1257,'T9581',8000,'2022-12-23 00:00:00.000000'),(140143,'cintas',1257,'T9581',21000,'2022-12-23 00:00:00.000000'),(140144,'daipas',1257,'T9581',7000,'2022-12-23 00:00:00.000000'),(140145,'hojas papel',1257,'T9581',28000,'2022-12-23 00:00:00.000000'),(140146,'pegante',1257,'T9581',10,'2022-12-23 00:00:00.000000'),(140147,'sunchos',1257,'T9581',40000,'2022-12-23 00:00:00.000000'),(140148,'esquineros',1257,'D6366',25000,'2022-12-23 00:00:00.000000'),(140149,'estibas',1257,'D6366',4000,'2022-12-23 00:00:00.000000'),(140150,'estibas migros',1257,'D6366',0,'2022-12-23 00:00:00.000000'),(140151,'sellos',1258,'T9581',6000,'2022-12-23 00:00:00.000000'),(140152,'cajas carton',1258,'T9581',3000,'2022-12-23 00:00:00.000000'),(140153,'cintas',1258,'T9581',6000,'2022-12-23 00:00:00.000000'),(140154,'daipas',1258,'T9581',5800,'2022-12-23 00:00:00.000000'),(140155,'hojas papel',1258,'T9581',5800,'2022-12-23 00:00:00.000000'),(140156,'pegante',1258,'T9581',5,'2022-12-23 00:00:00.000000'),(140157,'sunchos',1258,'T9581',9600,'2022-12-23 00:00:00.000000'),(140158,'esquineros',1258,'D6366',5000,'2022-12-23 00:00:00.000000'),(140159,'estibas',1258,'D6366',2200,'2022-12-23 00:00:00.000000'),(140160,'estibas migros',1258,'D6366',0,'2022-12-23 00:00:00.000000'),(140161,'sellos',1259,'T9581',400000,'2022-12-23 00:00:00.000000'),(140162,'cajas carton',1259,'T9581',30000,'2022-12-23 00:00:00.000000'),(140163,'cintas',1259,'T9581',400000,'2022-12-23 00:00:00.000000'),(140164,'daipas',1259,'T9581',30000,'2022-12-23 00:00:00.000000'),(140165,'hojas papel',1259,'T9581',5000,'2022-12-23 00:00:00.000000'),(140166,'pegante',1259,'T9581',5,'2022-12-23 00:00:00.000000'),(140167,'sunchos',1259,'T9581',48000,'2022-12-23 00:00:00.000000'),(140168,'esquineros',1259,'D6366',40000,'2022-12-23 00:00:00.000000'),(140169,'estibas',1259,'D6366',10000,'2022-12-23 00:00:00.000000'),(140170,'estibas migros',1259,'D6366',0,'2022-12-23 00:00:00.000000'),(140171,'sellos',1260,'T9581',21000,'2022-12-23 00:00:00.000000'),(140172,'cajas carton',1260,'T9581',5000,'2022-12-23 00:00:00.000000'),(140173,'cintas',1260,'T9581',21000,'2022-12-23 00:00:00.000000'),(140174,'daipas',1260,'T9581',7000,'2022-12-23 00:00:00.000000'),(140175,'hojas papel',1260,'T9581',28000,'2022-12-23 00:00:00.000000'),(140176,'pegante',1260,'T9581',10,'2022-12-23 00:00:00.000000'),(140177,'sunchos',1260,'T9581',40000,'2022-12-23 00:00:00.000000'),(140178,'esquineros',1260,'D6366',25000,'2022-12-23 00:00:00.000000'),(140179,'estibas',1260,'D6366',4000,'2022-12-23 00:00:00.000000'),(140180,'estibas migros',1260,'D6366',0,'2022-12-23 00:00:00.000000'),(140181,'sellos',1261,'T9581',21000,'2022-12-23 00:00:00.000000'),(140182,'cajas carton',1261,'T9581',5000,'2022-12-23 00:00:00.000000'),(140183,'cintas',1261,'T9581',21000,'2022-12-23 00:00:00.000000'),(140184,'daipas',1261,'T9581',7000,'2022-12-23 00:00:00.000000'),(140185,'hojas papel',1261,'T9581',28000,'2022-12-23 00:00:00.000000'),(140186,'pegante',1261,'T9581',10,'2022-12-23 00:00:00.000000'),(140187,'sunchos',1261,'T9581',40000,'2022-12-23 00:00:00.000000'),(140188,'esquineros',1261,'D6366',25000,'2022-12-23 00:00:00.000000'),(140189,'estibas',1261,'D6366',4000,'2022-12-23 00:00:00.000000'),(140190,'estibas migros',1261,'D6366',0,'2022-12-23 00:00:00.000000'),(140191,'sellos',1262,'T9581',6000,'2022-12-23 00:00:00.000000'),(140192,'cajas carton',1262,'T9581',3000,'2022-12-23 00:00:00.000000'),(140193,'cintas',1262,'T9581',6000,'2022-12-23 00:00:00.000000'),(140194,'daipas',1262,'T9581',5800,'2022-12-23 00:00:00.000000'),(140195,'hojas papel',1262,'T9581',5800,'2022-12-23 00:00:00.000000'),(140196,'pegante',1262,'T9581',5,'2022-12-23 00:00:00.000000'),(140197,'sunchos',1262,'T9581',9600,'2022-12-23 00:00:00.000000'),(140198,'esquineros',1262,'D6366',5000,'2022-12-23 00:00:00.000000'),(140199,'estibas',1262,'D6366',2200,'2022-12-23 00:00:00.000000'),(140200,'estibas migros',1262,'D6366',0,'2022-12-23 00:00:00.000000'),(140201,'sellos',1263,'T9581',21000,'2022-12-23 00:00:00.000000'),(140202,'cajas carton',1263,'T9581',5000,'2022-12-23 00:00:00.000000'),(140203,'cintas',1263,'T9581',21000,'2022-12-23 00:00:00.000000'),(140204,'daipas',1263,'T9581',7000,'2022-12-23 00:00:00.000000'),(140205,'hojas papel',1263,'T9581',28000,'2022-12-23 00:00:00.000000'),(140206,'pegante',1263,'T9581',10,'2022-12-23 00:00:00.000000'),(140207,'sunchos',1263,'T9581',40000,'2022-12-23 00:00:00.000000'),(140208,'esquineros',1263,'D6366',25000,'2022-12-23 00:00:00.000000'),(140209,'estibas',1263,'D6366',4000,'2022-12-23 00:00:00.000000'),(140210,'estibas migros',1263,'D6366',0,'2022-12-23 00:00:00.000000'),(1401301,'sellos',1256,'T9581',21000,'2022-12-23 00:00:00.000000'),(1401302,'cajas carton',1256,'T9581',7000,'2022-12-23 00:00:00.000000'),(1401303,'cintas',1256,'T9581',21000,'2022-12-23 00:00:00.000000'),(1401304,'daipas',1256,'T9581',7000,'2022-12-23 00:00:00.000000'),(1401305,'hojas papel',1256,'T9581',28000,'2022-12-23 00:00:00.000000'),(1401306,'pegante',1256,'T9581',10,'2022-12-23 00:00:00.000000'),(1401307,'sunchos',1256,'T9581',40000,'2022-12-23 00:00:00.000000'),(1401308,'esquineros',1256,'D6366',25000,'2022-12-23 00:00:00.000000'),(1401309,'estibas',1256,'D6366',4000,'2022-12-23 00:00:00.000000'),(1401310,'estibas migros',1256,'D6366',0,'2022-12-23 00:00:00.000000');
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `insumos_cl`
--

DROP TABLE IF EXISTS `insumos_cl`;
/*!50001 DROP VIEW IF EXISTS `insumos_cl`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `insumos_cl` AS SELECT 
 1 AS `cantidades_stock`,
 1 AS `nombre_materiales`,
 1 AS `cantidad_contenedores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `insumos_cli`
--

DROP TABLE IF EXISTS `insumos_cli`;
/*!50001 DROP VIEW IF EXISTS `insumos_cli`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `insumos_cli` AS SELECT 
 1 AS `cantidades_stock`,
 1 AS `nombre_materiales`,
 1 AS `cantidad_contenedores`,
 1 AS `nombre_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `new_agency`
--

DROP TABLE IF EXISTS `new_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_agency` (
  `id_naviera` int NOT NULL AUTO_INCREMENT,
  `nombre_naviera` varchar(20) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `destino` varchar(20) DEFAULT NULL,
  `deleated_date` timestamp NULL DEFAULT NULL,
  `delete_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_naviera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_agency`
--

LOCK TABLES `new_agency` WRITE;
/*!40000 ALTER TABLE `new_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_clientes`
--

DROP TABLE IF EXISTS `new_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(20) DEFAULT NULL,
  `agencia_naviera` varchar(20) DEFAULT NULL,
  `cantidad_contenedores` int DEFAULT NULL,
  `deleated_date` timestamp NULL DEFAULT NULL,
  `delete_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_clientes`
--

LOCK TABLES `new_clientes` WRITE;
/*!40000 ALTER TABLE `new_clientes` DISABLE KEYS */;
INSERT INTO `new_clientes` VALUES (1264,'frutire','maersk',30,'2023-01-17 04:01:09','root@localhost');
/*!40000 ALTER TABLE `new_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_pedido`
--

DROP TABLE IF EXISTS `orden_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_pedido` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `referencias_insumos` decimal(50,0) NOT NULL,
  `tiempo_transito` decimal(10,0) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_naviera` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `FK_orden_clientes` (`id_cliente`),
  KEY `FK_orden_navieras` (`id_naviera`),
  KEY `FK_orden_productos` (`id_producto`),
  CONSTRAINT `FK_orden_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `FK_orden_navieras` FOREIGN KEY (`id_naviera`) REFERENCES `agencias_navieras` (`id_naviera`),
  CONSTRAINT `FK_orden_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=20221023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pedido`
--

LOCK TABLES `orden_pedido` WRITE;
/*!40000 ALTER TABLE `orden_pedido` DISABLE KEYS */;
INSERT INTO `orden_pedido` VALUES (20221013,3778805,9,'2022-12-24 00:00:00.000000','usa',1254,2215,1),(20221014,25002,15,'2022-12-24 00:00:00.000000','vlissingen',1255,2216,2),(20221015,87502,21,'2022-12-25 00:00:00.000000','pivdenyi',1256,2217,3),(20221016,100002,21,'2022-12-25 00:00:00.000000','rusia',1257,2215,4),(20221017,25002,18,'2022-12-25 00:00:00.000000','polonia',1258,2216,5),(20221018,187502,16,'2022-12-25 00:00:00.000000','francia',1259,2218,6),(20221019,125002,15,'2022-12-25 00:00:00.000000','italia',1260,2217,7),(20221020,62502,21,'2022-12-25 00:00:00.000000','rumania',1261,2217,8),(20221021,25002,15,'2022-12-25 00:00:00.000000','italia',1262,2215,9);
/*!40000 ALTER TABLE `orden_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orden_pedidos`
--

DROP TABLE IF EXISTS `orden_pedidos`;
/*!50001 DROP VIEW IF EXISTS `orden_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orden_pedidos` AS SELECT 
 1 AS `id_cliente`,
 1 AS `destino`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orden_pedidos_c`
--

DROP TABLE IF EXISTS `orden_pedidos_c`;
/*!50001 DROP VIEW IF EXISTS `orden_pedidos_c`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orden_pedidos_c` AS SELECT 
 1 AS `id_cliente`,
 1 AS `cantidad_contenedores`,
 1 AS `agencia_naviera`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_productora` varchar(20) NOT NULL,
  `nombre_finca_productora` varchar(20) NOT NULL,
  `certificados_exportaciones` varchar(20) NOT NULL,
  `id_orden` int NOT NULL,
  `cantidad_cajas` int NOT NULL,
  `fecha_corte` datetime(6) NOT NULL,
  `fecha_empaque` datetime(6) NOT NULL,
  `nombre_producto` varchar(20) NOT NULL,
  `id_contenedor` int DEFAULT NULL,
  `id_materiales` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FK_productos_insumos` (`id_materiales`),
  CONSTRAINT `FK_productos_insumos` FOREIGN KEY (`id_materiales`) REFERENCES `insumos` (`id_materiales`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'A42','mrs','cfe1254',20221013,288000,'2022-12-21 00:00:00.000000','2022-12-22 00:00:00.000000','fyffes premium',4280095,140111),(2,'A207','neerlandia','cfe1255',20221014,1920,'2022-12-21 00:00:00.000000','2022-12-22 00:00:00.000000','terra 18k',3335085,140112),(3,'A210','san antonio','cfe1256',20221015,6720,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','bailla',3314307,140113),(4,'A315','sal alfredo','cfe1257',20221016,7680,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','yummyban',4243300,140114),(5,'A402','eva','cfe1258',20221017,1920,'2022-12-21 00:00:00.000000','2022-12-22 00:00:00.000000','tropy bananas',2152496,140115),(6,'A403','enano','cfe1259',20221018,14400,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','osero premium',2103866,140116),(7,'A406','eufemia','cfe1260',20221019,9600,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','fratelli premium',3341703,140117),(8,'A411','saleth','cfe1261',20221020,4800,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','bio billa',7210415,140118),(9,'T119','yunque','cfe1262',20221021,1920,'2022-12-24 00:00:00.000000','2022-12-25 00:00:00.000000','org battaglio',7230267,140119);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'exportacion_banano'
--
/*!50003 DROP FUNCTION IF EXISTS `contenedores_exportados_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `contenedores_exportados_cliente`(
id_cliente_cont int
) RETURNS int
    DETERMINISTIC
BEGIN 
	DECLARE cont_expor int ;
   
SELECT
cantidad_contenedores
INTO cont_expor
FROM clientes
WHERE id_cliente = id_cliente_cont;

RETURN cont_expor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `conte_export_clien` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `conte_export_clien`(
id_cliente_cont int
) RETURNS int
    DETERMINISTIC
BEGIN 

	DECLARE cont_expor INT; 
        
SELECT
cantidad_contenedores
INTO cont_expor
FROM clientes
WHERE id_cliente = id_cliente_cont;

RETURN cont_expor*52;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_destino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_destino`(
id_cliente_parm int
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
	DECLARE name_destino VARCHAR (20);

SELECT
destino
INTO name_destino
FROM clientes
WHERE id_cliente = id_cliente_parm;

RETURN name_destino;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_datos_productos_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_datos_productos_order`( IN id_producto_order int)
BEGIN

IF id_producto_order <=3 THEN 
	SELECT *  FROM productos
    ORDER BY cantidad_cajas;
ELSE
	SELECT *  FROM productos
    ORDER BY cantidad_cajas DESC;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_cliente`(
		  IN id_cliente_parametro INT
        , IN nombre_cliente_parametro_entrada VARCHAR(20)
        , IN destino_parametro_entrada VARCHAR(20)
        , IN agencia_naviera_parametro_entrada VARCHAR(20)
        , IN id_producto_parametro_entrada INT
        , IN ref_insumos_requeridos_parametro_entrada decimal (50,0)
        , IN id_contenedor_parametro_entrada INT
        , IN cantidad_contenedores_parametro_entrada INT
    )
BEGIN
        
        INSERT INTO clientes (
			id_cliente
            , nombre_cliente
            , destino
            , agencia_naviera
            , id_producto
            , ref_insumos_requeridos
            , id_contenedor
            , cantidad_contenedores
            
        )
        VALUES (
			  id_cliente_parametro
			, nombre_cliente_parametro_entrada
			, destino_parametro_entrada
			, agencia_naviera_parametro_entrada
			, id_producto_parametro_entrada
			, ref_insumos_requeridos_parametro_entrada
            , id_contenedor_parametro_entrada
			, cantidad_contenedores_parametro_entrada
        );

        SELECT 'cliente ingresado correctamente...';
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `agencias_navieras_v`
--

/*!50001 DROP VIEW IF EXISTS `agencias_navieras_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `agencias_navieras_v` AS select `agencias_navieras`.`tiempo_transito` AS `tiempo_transito`,`agencias_navieras`.`destino` AS `destino` from `agencias_navieras` where (`agencias_navieras`.`tiempo_transito` > 10) order by `agencias_navieras`.`destino` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clientes_agencias`
--

/*!50001 DROP VIEW IF EXISTS `clientes_agencias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_agencias` AS select `clientes`.`nombre_cliente` AS `nombre_cliente`,`clientes`.`agencia_naviera` AS `agencia_naviera`,`clientes`.`cantidad_contenedores` AS `cantidad_contenedores` from `clientes` where ((`clientes`.`agencia_naviera` like '%maersk%') and (`clientes`.`cantidad_contenedores` >= 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `insumos_cl`
--

/*!50001 DROP VIEW IF EXISTS `insumos_cl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `insumos_cl` AS select `i`.`cantidades_stock` AS `cantidades_stock`,`i`.`nombre_materiales` AS `nombre_materiales`,`cl`.`cantidad_contenedores` AS `cantidad_contenedores` from (`insumos` `i` join `clientes` `cl` on((`i`.`id_cliente` = `cl`.`id_cliente`))) where ((`cl`.`cantidad_contenedores` > 5) and (`i`.`cantidades_stock` > 50000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `insumos_cli`
--

/*!50001 DROP VIEW IF EXISTS `insumos_cli`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `insumos_cli` AS select `i`.`cantidades_stock` AS `cantidades_stock`,`i`.`nombre_materiales` AS `nombre_materiales`,`cl`.`cantidad_contenedores` AS `cantidad_contenedores`,`cl`.`nombre_cliente` AS `nombre_cliente` from (`insumos` `i` join `clientes` `cl` on((`i`.`id_cliente` = `cl`.`id_cliente`))) where ((`cl`.`cantidad_contenedores` > 5) and (`i`.`cantidades_stock` > 50000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orden_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `orden_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orden_pedidos` AS select `cl`.`id_cliente` AS `id_cliente`,`cl`.`destino` AS `destino` from (`orden_pedido` `c` join `clientes` `cl` on((`c`.`id_cliente` = `cl`.`id_cliente`))) where (`c`.`destino` = 'italia') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orden_pedidos_c`
--

/*!50001 DROP VIEW IF EXISTS `orden_pedidos_c`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orden_pedidos_c` AS select `cl`.`id_cliente` AS `id_cliente`,`cl`.`cantidad_contenedores` AS `cantidad_contenedores`,`cl`.`agencia_naviera` AS `agencia_naviera` from (`orden_pedido` `c` join `clientes` `cl` on((`c`.`id_cliente` = `cl`.`id_cliente`))) where ((`cl`.`agencia_naviera` = 'hapag lloyd') and (`cl`.`cantidad_contenedores` > 10)) */;
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

-- Dump completed on 2023-01-30 22:59:51
