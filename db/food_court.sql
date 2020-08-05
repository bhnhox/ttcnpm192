-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: food_court
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `baotri`
--

DROP TABLE IF EXISTS `baotri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baotri` (
  `idbaotri` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `thoigian` varchar(100) DEFAULT NULL,
  `trangthai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idbaotri`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baotri`
--

LOCK TABLES `baotri` WRITE;
/*!40000 ALTER TABLE `baotri` DISABLE KEYS */;
INSERT INTO `baotri` VALUES (1,'admin2','test','on'),(2,'admin2','test','off'),(3,'admin2','test','off'),(4,'admin2','test','on'),(5,'admin3','test','off'),(6,'admin3','test','on'),(7,'admin3','test','off'),(8,'admin3','test','on'),(9,'admin3','test','off'),(10,'admin3','Sun Jun 28 2020 23:31:31 GMT+0700 (Indochina Time)','on'),(11,'admin3','Sun Jun 28 2020 23:33:28 GMT+0700 (Indochina Time)','off'),(12,'admin3','Sun Jun 28 2020 23:34:20 GMT+0700 (Indochina Time)','on'),(13,'admin3','Sun Jun 28 2020 23:34:31 GMT+0700 (Indochina Time)','off'),(14,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','on'),(15,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(16,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','on'),(17,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(18,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(19,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','on'),(20,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(21,'admin3','Sun Jun 28 2020 23:35:50 GMT+0700 (Indochina Time)','on'),(22,'admin3','Sun Jun 28 2020 23:42:37 GMT+0700 (Indochina Time)','off'),(23,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','on'),(24,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','off'),(25,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','on'),(26,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','off'),(27,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','on'),(28,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','off'),(29,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','off'),(30,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','on'),(31,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','off'),(32,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','on'),(33,'admin3','Tue Aug 04 2020 22:38:29 GMT+0700 (Indochina Time)','off');
/*!40000 ALTER TABLE `baotri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `idcart` int NOT NULL AUTO_INCREMENT,
  `namecard` varchar(45) DEFAULT NULL,
  `bankname` varchar(45) DEFAULT NULL,
  `usernameowner` varchar(45) DEFAULT NULL,
  `timecreate` varchar(100) DEFAULT NULL,
  `idbankcard` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'Thien','Vietcombank','undefined','Sun Jun 21 2020 15:33:26 GMT+0700 (Indochina Time)','undefined'),(2,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:34:27 GMT+0700 (Indochina Time)','undefined'),(3,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:46:29 GMT+0700 (Indochina Time)','undefined'),(4,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:47:26 GMT+0700 (Indochina Time)','undefined'),(5,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:51:55 GMT+0700 (Indochina Time)','undefined'),(6,'41421','Vietcombank','test456','Sun Jun 21 2020 15:56:56 GMT+0700 (Indochina Time)','undefined'),(7,'41421','Vietcombank','test456','Sun Jun 21 2020 15:56:56 GMT+0700 (Indochina Time)','undefined'),(8,'41421','Vietcombank','test456','Sun Jun 21 2020 15:57:44 GMT+0700 (Indochina Time)','123123'),(9,'Thien','Vietcombank','admin2','Mon Jun 22 2020 21:34:18 GMT+0700 (Indochina Time)','123123'),(10,'Thien','Vietcombank','guest','Mon Jun 29 2020 00:08:39 GMT+0700 (Indochina Time)','123'),(11,'Thien2','Vietcombank','guest','Mon Jun 29 2020 00:43:44 GMT+0700 (Indochina Time)','123123'),(12,'Thien','Vietcombank','admin3','Mon Jun 29 2020 00:43:44 GMT+0700 (Indochina Time)','123'),(13,'Thien2','Vietcombank','guest','Tue Jun 30 2020 00:07:56 GMT+0700 (Indochina Time)','123123123123');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chonhang`
--

DROP TABLE IF EXISTS `chonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chonhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idmon` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `idgiohang` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chonhang`
--

LOCK TABLES `chonhang` WRITE;
/*!40000 ALTER TABLE `chonhang` DISABLE KEYS */;
INSERT INTO `chonhang` VALUES (63,16,13,'2020-07-07',21),(75,17,17,'2020-07-07',21),(77,17,4,'2020-07-07',22),(78,16,60,'2020-07-07',22),(79,16,1,'2020-07-14',15),(80,16,1,'2020-07-14',80),(81,17,4,'2020-07-14',84),(82,17,2,'2020-07-14',85),(83,16,2,'2020-07-14',85),(84,17,2,'2020-07-14',86),(85,17,2,'2020-07-14',87),(86,19,1,'2020-07-14',88),(87,19,1,'2020-07-14',90),(88,19,1,'2020-07-14',91),(89,19,1,'2020-07-14',92),(90,19,2,'2020-07-15',94),(91,19,2,'2020-07-15',93),(92,19,1,'2020-07-17',96),(93,19,1,'2020-07-17',97),(94,19,5,'2020-07-17',95),(95,20,1,'2020-07-17',95),(96,20,1,'2020-07-17',98),(104,19,1,'2020-07-18',18),(105,19,1,'2020-07-18',101),(106,21,1,'2020-07-18',101),(107,21,1,'2020-07-18',78),(108,20,1,'2020-07-18',78),(113,20,1,'2020-07-18',89),(116,21,1,'2020-07-18',89),(117,19,1,'2020-07-18',89),(118,21,1,'2020-07-18',106),(119,20,1,'2020-07-18',106),(120,19,1,'2020-07-18',106),(121,21,1,'2020-07-18',107),(122,20,1,'2020-07-18',107),(123,19,1,'2020-07-18',107),(124,21,1,'2020-07-18',108),(125,20,1,'2020-07-18',108),(126,19,1,'2020-07-18',108),(127,21,1,'2020-07-18',109),(128,20,1,'2020-07-18',109),(129,19,1,'2020-07-18',109),(130,21,1,'2020-07-18',110),(131,20,1,'2020-07-18',110),(132,19,1,'2020-07-18',110),(133,21,2,'2020-07-18',111),(134,20,2,'2020-07-18',111),(137,21,1,'2020-07-18',124),(139,21,1,'2020-07-18',99),(140,20,2,'2020-07-19',112),(141,20,1,'2020-07-19',127),(142,20,1,'2020-07-19',128),(143,20,1,'2020-07-19',129),(144,20,1,'2020-07-19',130),(145,21,1,'2020-07-19',131),(146,20,1,'2020-07-19',131),(147,20,1,'2020-07-19',132),(148,20,1,'2020-07-19',134),(149,20,1,'2020-07-19',135),(150,20,1,'2020-07-19',136),(151,20,1,'2020-07-19',137),(152,20,1,'2020-07-19',138),(153,21,1,'2020-07-19',138),(154,20,1,'2020-07-19',139),(155,21,1,'2020-07-19',139),(156,20,1,'2020-07-19',140),(157,20,1,'2020-07-19',141),(158,20,1,'2020-07-19',142),(159,20,1,'2020-07-19',143),(160,20,1,'2020-07-19',144),(161,20,1,'2020-07-19',145),(162,21,1,'2020-07-19',145),(163,20,1,'2020-07-19',146),(164,21,1,'2020-07-19',146),(165,20,1,'2020-07-19',147),(166,21,1,'2020-07-19',147),(167,20,1,'2020-07-19',148),(168,21,1,'2020-07-19',148),(171,20,1,'2020-08-04',126),(172,20,1,'2020-08-04',149),(173,20,1,'2020-08-04',99),(174,20,1,'2020-08-04',151),(175,20,1,'2020-08-05',154),(176,19,1,'2020-08-05',154),(177,20,1,'2020-08-05',155),(178,19,1,'2020-08-05',155),(179,20,1,'2020-08-05',157),(180,19,1,'2020-08-05',157),(181,20,1,'2020-08-05',150),(182,20,1,'2020-08-05',159),(183,20,1,'2020-08-05',161);
/*!40000 ALTER TABLE `chonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `donhang` varchar(45) DEFAULT NULL,
  `vendorname` varchar(45) DEFAULT NULL,
  `rate` varchar(45) DEFAULT NULL,
  `nhanxet` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgia`
--

LOCK TABLES `danhgia` WRITE;
/*!40000 ALTER TABLE `danhgia` DISABLE KEYS */;
INSERT INTO `danhgia` VALUES (1,'daubep1','55','testvendor5','5',''),(2,'daubep1','56','testvendor5','4',''),(3,'daubep1','48','testvendor6','',''),(4,'daubep1','48','testvendor6','',''),(5,'daubep1','57','testvendor6','4',''),(6,'daubep1','57','testvendor5','4',''),(7,'daubep1','58','testvendor5','4','123'),(8,'daubep1','59','testvendor5','4','1'),(9,'daubep1','60','testvendor5','4',''),(10,'daubep1','61','testvendor5','4',''),(11,'daubep1','62','testvendor5','4',''),(12,'daubep1','63','testvendor6','',''),(13,NULL,'51','testvendor6',NULL,NULL),(14,NULL,'50','testvendor6',NULL,NULL),(15,'daubep1','49','testvendor6','5',''),(16,'','63','testvendor5','',''),(17,'daubep1','64','testvendor6','5',''),(18,'daubep1','64','testvendor5','5',''),(19,'daubep1','65','testvendor5','4',''),(20,'daubep1','66','testvendor5','5',''),(21,'daubep1','67','testvendor5','5',''),(22,'daubep1','68','testvendor5','5',''),(23,'daubep1','69','testvendor5','5',''),(24,'daubep1','70','testvendor6','1',''),(25,'daubep1','70','testvendor5','1',''),(26,'daubep1','71','testvendor5','5',''),(27,'daubep1','71','testvendor6','5',''),(28,'daubep1','72','testvendor5','5',''),(29,'daubep1','72','testvendor6','1',''),(30,'daubep1','73','testvendor5','5',''),(31,'daubep1','73','testvendor6','5',''),(32,NULL,'75','testvendor5',NULL,NULL),(33,NULL,'43','testvendor5',NULL,NULL);
/*!40000 ALTER TABLE `danhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daubep`
--

DROP TABLE IF EXISTS `daubep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daubep` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `ngayvaolam` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` varchar(45) NOT NULL DEFAULT 'active',
  `ngaynghiviec` datetime DEFAULT NULL,
  `vendorowner` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daubep`
--

LOCK TABLES `daubep` WRITE;
/*!40000 ALTER TABLE `daubep` DISABLE KEYS */;
INSERT INTO `daubep` VALUES (1,'','2020-07-11 04:30:46','inactive','2020-07-11 06:25:19','test2'),(2,'testdb1','2020-07-11 04:32:06','inactive','2020-07-11 06:25:23','test2'),(3,'testdb2','2020-07-11 04:36:26','active',NULL,'test2'),(4,'testdb3','2020-07-11 05:00:32','active',NULL,'test2'),(5,'testdb4','2020-07-11 05:16:03','active',NULL,'test2'),(6,'daubep1','2020-07-14 23:06:12','active',NULL,'testvendor5'),(7,'daubep6','2020-07-18 21:49:24','active',NULL,'testvendor6');
/*!40000 ALTER TABLE `daubep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deposit`
--

DROP TABLE IF EXISTS `Deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` varchar(45) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `idcard` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deposit`
--

LOCK TABLES `Deposit` WRITE;
/*!40000 ALTER TABLE `Deposit` DISABLE KEYS */;
INSERT INTO `Deposit` VALUES (1,'10000','Mon Jun 22 2020 23:15:29 GMT+0700 (Indochina Time)','success',' 123123 ','test456'),(2,'10000','Mon Jun 22 2020 23:44:47 GMT+0700 (Indochina Time)','success',' undefined ','test456'),(3,'10000','Mon Jun 22 2020 23:44:47 GMT+0700 (Indochina Time)','success',' 123123 ','test456'),(4,'10000','Mon Jun 22 2020 23:47:28 GMT+0700 (Indochina Time)','success',' 123123 ','test456'),(5,'10000','Mon Jun 29 2020 00:08:39 GMT+0700 (Indochina Time)','success',' 123 ','guest'),(6,'10000','Mon Jun 29 2020 00:47:24 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(7,'10000','Mon Jun 29 2020 00:47:24 GMT+0700 (Indochina Time)','success',' 123123 ','guest'),(8,'2000','Mon Jun 29 2020 23:38:58 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(9,'10000','Tue Jun 30 2020 00:07:56 GMT+0700 (Indochina Time)','success',' 123 ','guest'),(10,'100000','Sat Jul 18 2020 08:17:29 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(11,'100000','Sat Jul 18 2020 08:37:15 GMT+0700 (Indochina Time)','success','undefined','testvendor5'),(12,'1000000','Sat Jul 18 2020 10:33:49 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(13,'NaN','Sat Jul 18 2020 13:40:03 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(14,'NaN','Sat Jul 18 2020 13:40:27 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(15,'1','Sat Jul 18 2020 13:41:00 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(16,'1000','Sat Jul 18 2020 13:41:42 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(17,'1000','Sat Jul 18 2020 13:41:42 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(18,'1000','Sat Jul 18 2020 13:41:42 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(19,'1000','Sat Jul 18 2020 13:44:21 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(20,'1000','Sat Jul 18 2020 13:44:21 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(21,'1000','Sat Jul 18 2020 13:45:38 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(22,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(23,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(24,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(25,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(26,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(27,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(28,'NaN','Sat Jul 18 2020 13:45:53 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(29,'1000','Sat Jul 18 2020 13:55:55 GMT+0700 (Indochina Time)','success','undefined','daubep1'),(30,'123000','Sun Jul 19 2020 21:12:17 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(31,'100000','Sun Jul 19 2020 21:18:05 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(32,'10000','Sun Jul 19 2020 21:18:42 GMT+0700 (Indochina Time)','success',' 123 ','admin3');
/*!40000 ALTER TABLE `Deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idgiohang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (1,'2'),(2,'4'),(3,'5'),(4,'6'),(5,'7'),(6,'8'),(7,'9'),(8,'10'),(9,'3'),(10,'13'),(11,'14'),(12,'11'),(13,'16'),(14,'17'),(15,'null'),(16,'19'),(17,'20'),(18,'21'),(19,'15'),(20,'79'),(21,'80'),(22,'81'),(23,'82'),(24,'83'),(25,'84'),(26,'85'),(27,'86'),(28,'87'),(29,'88'),(30,'90'),(31,'91'),(32,'92'),(33,'94'),(34,'93'),(35,'96'),(36,'95'),(37,'98'),(38,'18'),(39,'78'),(43,'89'),(44,'106'),(45,'107'),(46,'108'),(47,'109'),(48,'110'),(49,'111'),(50,'101'),(51,'124'),(52,'112'),(53,'127'),(54,'128'),(55,'129'),(56,'130'),(57,'131'),(58,'132'),(59,'134'),(60,'135'),(61,'136'),(62,'137'),(63,'138'),(64,'139'),(65,'140'),(66,'141'),(67,'142'),(68,'143'),(69,'144'),(70,'145'),(71,'146'),(72,'147'),(73,'148'),(74,'126'),(75,'149'),(76,'151'),(77,'155'),(78,'157'),(79,'150'),(80,'159'),(81,'159'),(82,'159'),(83,'159'),(84,'159'),(85,'159'),(86,'159'),(87,'159'),(88,'159'),(89,'159'),(90,'159'),(91,'161');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `in_menu` int NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `trash` int NOT NULL DEFAULT '0',
  `vendorowner` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (15,'Bún bò Huế','/',30000,'Món này ngon vl',0,'2020-06-23 00:45:20',0,NULL),(16,'Cơm tấm','image-1593415140510-700375704-ke-hoach-kinh-doanh-com-tam.jpg',20000,'Cơm tấm',0,'2020-06-29 14:19:00',0,NULL),(17,'Phở','image-1593416908803-345158418-cach-lam-3-mon-pho-nuoc-ngon-nong-hoi-dam-da-huong-vi-viet 1.jpg',20000,'Phở',0,'2020-06-29 14:48:28',0,NULL),(18,'Cơm gà','image-1594742683411-926616826-recipe40048-cook-step5-636894576207321843.jpg',25000,'Cơm gà làm từ thịt gà',0,'2020-07-14 23:04:43',1,'undefined'),(19,'Cơm gà','image-1594742813984-403707011-recipe40048-cook-step5-636894576207321843.jpg',25000,'Cơm gà',0,'2020-07-14 23:06:53',0,'testvendor5'),(20,'Bún bò','image-1594978127096-528597338-cach-nau-bun-bo-hue-mien-nam-de-ban-don-gia-chuan-vi-ngon-nhat.jpg',30000,'Bún bò',0,'2020-07-17 16:28:47',0,'testvendor5'),(21,'Xôi gà','image-1595036467826-775921500-cach-nau-xoi-ga-de-ban.jpg',10000,'Xôi gà',0,'2020-07-18 08:41:07',0,'testvendor6');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `idgiohang` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgiohang`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (1,'test1'),(2,'admin3'),(3,'guest'),(4,'admin3'),(5,'admin3'),(6,'admin3'),(7,'admin3'),(8,'admin3'),(9,'admin3'),(10,'admin4'),(11,'admin3'),(12,'admin4'),(13,'guest'),(14,'guest'),(15,'guest'),(16,'admin3'),(17,'admin3'),(18,'admin3'),(19,'admin2'),(20,'admin2'),(21,'admin2'),(22,'admin2'),(23,'testvendor1'),(24,'testvendor2'),(34,'test3'),(35,'test4'),(36,'test5'),(37,'test6'),(38,'test7'),(39,'test8'),(40,'test9'),(41,'test2'),(42,'test10'),(43,'testthungan1'),(44,'testtn1'),(45,'testtn2'),(46,'test123'),(47,'testtn4'),(48,'test11'),(49,'test12'),(50,'test13'),(51,'test14'),(52,'test15'),(53,'test16'),(54,'test17'),(55,'testtn5'),(56,'testtn6'),(57,'testtn7'),(58,'testtn8'),(59,'testtn9'),(60,'testtn10'),(61,'testtn11'),(62,'testtn12'),(63,'testtn13'),(64,'testnv1'),(65,''),(66,'testdb1'),(67,'testtn14'),(68,'testdb2'),(69,'testdb3'),(70,'testdb4'),(71,'testnv11'),(72,'testnv112'),(73,'test18'),(74,'testvendor3'),(75,'testvendor4'),(76,'testvendor6'),(77,'testnv13'),(78,'testvendor5'),(79,'guest'),(80,'guest'),(81,'guest'),(82,'guest'),(83,'guest'),(84,'guest'),(85,'guest'),(86,'guest'),(87,'guest'),(88,'guest'),(89,'daubep1'),(90,'guest'),(91,'guest'),(92,'guest'),(93,'guest'),(94,'nhanvien1'),(95,'nhanvien1'),(96,'guest'),(97,'guest'),(98,'nhanvien1'),(99,'nhanvien1'),(100,'testvendor7'),(101,'admin3'),(102,'testvendor5'),(106,'daubep1'),(107,'daubep1'),(108,'daubep1'),(109,'daubep1'),(110,'daubep1'),(111,'daubep1'),(112,'daubep1'),(113,'test123123123123'),(114,'undefined'),(115,'123123123123'),(116,'3213123123'),(117,'32131231233123123'),(118,'admin5'),(119,'admin6'),(120,'admin7'),(121,'admin8'),(122,'admin9'),(123,'admin10'),(124,'admin3'),(125,'daubep6'),(126,'admin3'),(127,'daubep1'),(128,'daubep1'),(129,'daubep1'),(130,'daubep1'),(131,'daubep1'),(132,'daubep1'),(133,'nhanvien6'),(134,'daubep1'),(135,'daubep1'),(136,'daubep1'),(137,'daubep1'),(138,'daubep1'),(139,'daubep1'),(140,'daubep1'),(141,'daubep1'),(142,'daubep1'),(143,'daubep1'),(144,'daubep1'),(145,'daubep1'),(146,'daubep1'),(147,'daubep1'),(148,'daubep1'),(149,'daubep1'),(150,'admin3'),(151,'daubep1'),(152,'daubep1'),(153,'nguoidung1'),(154,'user1'),(155,'user2'),(156,'user2'),(157,'user3'),(158,'user3'),(159,'admin3'),(160,'admin3'),(161,'admin3'),(162,'admin3');
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoantien`
--

DROP TABLE IF EXISTS `hoantien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoantien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenvendor` varchar(45) NOT NULL,
  `iddonhang` int NOT NULL,
  `vendorxacnhan` varchar(45) DEFAULT NULL,
  `lydo` varchar(100) DEFAULT NULL,
  `idfood` int NOT NULL,
  `soluong` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoantien`
--

LOCK TABLES `hoantien` WRITE;
/*!40000 ALTER TABLE `hoantien` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoantien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichsunaptienvendor`
--

DROP TABLE IF EXISTS `lichsunaptienvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lichsunaptienvendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenquay` varchar(45) NOT NULL,
  `iddonhang` varchar(45) NOT NULL,
  `sotien` int NOT NULL,
  `idfood` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichsunaptienvendor`
--

LOCK TABLES `lichsunaptienvendor` WRITE;
/*!40000 ALTER TABLE `lichsunaptienvendor` DISABLE KEYS */;
INSERT INTO `lichsunaptienvendor` VALUES (1,'testvendor6','109',10000,21),(2,'testvendor5','109',30000,20),(3,'testvendor5','109',25000,19),(4,'testvendor6','110',10000,21),(5,'testvendor5','110',30000,20),(6,'testvendor5','110',25000,19),(7,'testvendor6','111',20000,21),(8,'testvendor5','111',60000,20),(9,'testvendor5','101',25000,19),(10,'testvendor6','101',10000,21),(11,'testvendor6','124',10000,21),(12,'testvendor5','112',60000,20),(13,'testvendor5','127',30000,20),(14,'testvendor5','128',30000,20),(15,'testvendor5','129',30000,20),(16,'testvendor5','130',30000,20),(17,'testvendor6','131',10000,21),(18,'testvendor5','131',30000,20),(19,'testvendor5','132',30000,20),(20,'testvendor5','134',30000,20),(21,'testvendor5','135',30000,20),(22,'testvendor5','136',30000,20),(23,'testvendor5','137',30000,20),(24,'testvendor5','138',30000,20),(25,'testvendor6','138',10000,21),(26,'testvendor5','139',30000,20),(27,'testvendor6','139',10000,21),(28,'testvendor5','140',30000,20),(29,'testvendor5','141',30000,20),(30,'testvendor5','142',30000,20),(31,'testvendor5','143',30000,20),(32,'testvendor5','144',30000,20),(33,'testvendor5','145',30000,20),(34,'testvendor6','145',10000,21),(35,'testvendor5','146',30000,20),(36,'testvendor6','146',10000,21),(37,'testvendor5','147',30000,20),(38,'testvendor6','147',10000,21),(39,'testvendor5','148',30000,20),(40,'testvendor6','148',10000,21),(41,'testvendor5','126',30000,20),(42,'testvendor5','149',30000,20),(43,'testvendor5','151',30000,20),(44,'testvendor5','155',30000,20),(45,'testvendor5','155',25000,19),(46,'testvendor5','157',30000,20),(47,'testvendor5','157',25000,19),(48,'testvendor5','150',30000,20),(49,'testvendor5','159',30000,20),(50,'testvendor5','159',30000,20),(51,'testvendor5','159',30000,20),(52,'testvendor5','159',30000,20),(53,'testvendor5','159',30000,20),(54,'testvendor5','159',30000,20),(55,'testvendor5','159',30000,20),(56,'testvendor5','159',30000,20),(57,'testvendor5','159',30000,20),(58,'testvendor5','159',30000,20),(59,'testvendor5','159',30000,20),(60,'testvendor5','159',30000,20),(61,'testvendor5','159',30000,20),(62,'testvendor5','159',30000,20),(63,'testvendor5','159',30000,20),(64,'testvendor5','159',30000,20),(65,'testvendor5','159',30000,20),(66,'testvendor5','159',30000,20),(67,'testvendor5','159',30000,20),(68,'testvendor5','159',30000,20),(69,'testvendor5','159',30000,20),(70,'testvendor5','159',30000,20),(71,'testvendor5','159',30000,20),(72,'testvendor5','159',30000,20),(73,'testvendor5','159',30000,20),(74,'testvendor5','159',30000,20),(75,'testvendor5','159',30000,20),(76,'testvendor5','159',30000,20),(77,'testvendor5','159',30000,20),(78,'testvendor5','159',30000,20),(79,'testvendor5','159',30000,20),(80,'testvendor5','159',30000,20),(81,'testvendor5','159',30000,20),(82,'testvendor5','159',30000,20),(83,'testvendor5','159',30000,20),(84,'testvendor5','159',30000,20),(85,'testvendor5','159',30000,20),(86,'testvendor5','159',30000,20),(87,'testvendor5','159',30000,20),(88,'testvendor5','159',30000,20),(89,'testvendor5','159',30000,20),(90,'testvendor5','159',30000,20),(91,'testvendor5','159',30000,20),(92,'testvendor5','159',30000,20),(93,'testvendor5','159',30000,20),(94,'testvendor5','159',30000,20),(95,'testvendor5','159',30000,20),(96,'testvendor5','159',30000,20),(97,'testvendor5','159',30000,20),(98,'testvendor5','159',30000,20),(99,'testvendor5','159',30000,20),(100,'testvendor5','159',30000,20),(101,'testvendor5','159',30000,20),(102,'testvendor5','159',30000,20),(103,'testvendor5','159',30000,20),(104,'testvendor5','159',30000,20),(105,'testvendor5','159',30000,20),(106,'testvendor5','159',30000,20),(107,'testvendor5','159',30000,20),(108,'testvendor5','159',30000,20),(109,'testvendor5','159',30000,20),(110,'testvendor5','159',30000,20),(111,'testvendor5','159',30000,20),(112,'testvendor5','159',30000,20),(113,'testvendor5','159',30000,20),(114,'testvendor5','159',30000,20),(115,'testvendor5','161',30000,20);
/*!40000 ALTER TABLE `lichsunaptienvendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2020-06-28 21:08:34'),(2,'2020-06-29 10:47:58'),(3,'2020-06-30 07:16:30'),(4,'2020-07-14 16:40:33'),(5,'2020-07-17 13:15:25'),(6,'2020-07-18 08:41:07'),(7,'2020-07-19 13:17:46'),(8,'2020-08-04 23:48:38'),(9,'2020-08-05 00:00:21');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_foods`
--

DROP TABLE IF EXISTS `menu_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menuID` int NOT NULL,
  `foodID` int NOT NULL,
  `amount` int NOT NULL,
  `trash` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_foods`
--

LOCK TABLES `menu_foods` WRITE;
/*!40000 ALTER TABLE `menu_foods` DISABLE KEYS */;
INSERT INTO `menu_foods` VALUES (1,1,15,0,1),(2,2,15,100,1),(3,2,16,200,1),(4,2,17,200,1),(5,3,16,100,1),(6,3,17,100,1),(7,4,17,100,1),(8,4,16,100,1),(9,4,15,0,1),(10,4,18,0,1),(11,4,19,100,1),(12,5,19,10,1),(13,5,20,8,1),(14,6,21,100,1),(15,6,20,98,1),(16,6,19,100,1),(17,7,20,98,1),(18,7,19,100,1),(19,7,21,100,1),(20,9,20,98,1),(21,9,19,200,1),(22,9,21,100,1);
/*!40000 ALTER TABLE `menu_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `ngayvaolam` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngaynghiviec` datetime DEFAULT NULL,
  `trangthai` varchar(45) NOT NULL DEFAULT 'active',
  `vendorowner` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'testnv1','2020-07-11 04:25:21',NULL,'active','test2'),(2,'testnv11','2020-07-11 06:07:22',NULL,'active','test3'),(3,'testnv112','2020-07-11 06:07:29',NULL,'active','test3'),(4,'testnv13','2020-07-11 06:29:10',NULL,'active','test3'),(5,'nhanvien1','2020-07-14 23:53:12',NULL,'active','testvendor5'),(6,'nhanvien6','2020-07-19 13:17:59',NULL,'active','testvendor6');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thungan`
--

DROP TABLE IF EXISTS `thungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thungan` (
  `idthungan` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `ngayvaolam` datetime NOT NULL,
  `ngaynghiviec` datetime DEFAULT NULL,
  `trangthai` varchar(45) NOT NULL,
  PRIMARY KEY (`idthungan`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thungan`
--

LOCK TABLES `thungan` WRITE;
/*!40000 ALTER TABLE `thungan` DISABLE KEYS */;
INSERT INTO `thungan` VALUES (1,'demo','2020-07-10 19:43:31','2020-07-11 06:30:40','inactive'),(3,'testtn1','2020-07-10 20:51:49','2020-07-11 03:24:35','inactive'),(4,'testtn2','2020-07-10 20:57:58',NULL,'active'),(5,'test123','2020-07-10 21:01:39',NULL,'active'),(6,'testtn4','2020-07-10 21:03:08',NULL,'active'),(7,'testtn5','2020-07-11 02:09:16',NULL,'active'),(8,'testtn6','2020-07-11 02:09:31',NULL,'active'),(9,'testtn7','2020-07-11 02:10:44',NULL,'active'),(10,'testtn8','2020-07-11 02:12:14',NULL,'active'),(11,'testtn9','2020-07-11 02:14:51',NULL,'active'),(12,'testtn10','2020-07-11 02:17:03',NULL,'active'),(13,'testtn11','2020-07-11 02:17:53',NULL,'active'),(14,'testtn12','2020-07-11 02:18:33',NULL,'active'),(15,'testtn13','2020-07-11 03:30:59',NULL,'active'),(16,'testtn14','2020-07-11 04:33:39',NULL,'active');
/*!40000 ALTER TABLE `thungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` text,
  `role` text,
  `phone` int DEFAULT NULL,
  `ngaydk` text,
  `balance` int DEFAULT '0',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','d41d8cd98f00b204e9800998ecf8427e','admin',394946767,NULL,0),(3,'admin2','202cb962ac59075b964b07152d234b70','user',394946767,NULL,0),(5,'admin3','202cb962ac59075b964b07152d234b70','admin',394946767,NULL,999909999),(6,'guest','202cb962ac59075b964b07152d234b70','user',123,'Mon Jun 29 2020 00:38:01 GMT+0700 (Indochina Time)',20000),(7,'test1','202cb962ac59075b964b07152d234b70','user',123,'Mon Jun 29 2020 10:44:45 GMT+0700 (Indochina Time)',0),(8,'admin4','202cb962ac59075b964b07152d234b70','admin',123,'Mon Jun 29 2020 23:48:16 GMT+0700 (Indochina Time)',0),(9,'testvendor1','202cb962ac59075b964b07152d234b70','vendor',13,'2020-07-09 22:14:12',0),(10,'testvendor2','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-09 22:23:49',0),(22,'test3','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:36:16',0),(23,'test4','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:36:39',0),(24,'test5','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:38:11',0),(25,'test6','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:44:02',0),(26,'test7','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:56:09',0),(27,'test8','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:56:51',0),(28,'test9','739969b53246b2c727850dbb3490ede6','vendor',123,'2020-07-10 15:00:11',0),(30,'test2','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 15:01:09',0),(32,'test10','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 16:32:38',0),(35,'testthungan1','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 20:50:04',0),(41,'testtn1','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 20:51:49',0),(43,'testtn2','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 20:57:58',0),(47,'test123','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 21:01:39',0),(50,'testtn4','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 21:03:08',0),(51,'test11','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:38:30',0),(52,'test12','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:38:43',0),(53,'test13','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:39:09',0),(54,'test14','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:50:23',0),(55,'test15','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 01:19:49',0),(56,'test16','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 01:21:22',0),(57,'test17','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 01:21:56',0),(58,'testtn5','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:05:34',0),(61,'testtn6','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:09:31',0),(62,'testtn7','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:10:44',0),(63,'testtn8','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:12:14',0),(64,'testtn9','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:14:51',0),(65,'testtn10','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:17:03',0),(66,'testtn11','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:17:53',0),(67,'testtn12','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:18:33',0),(68,'testtn13','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 03:30:59',0),(69,'testnv1','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:25:21',0),(70,'','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:30:46',0),(71,'testdb1','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:32:06',0),(72,'testtn14','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 04:33:39',0),(73,'testdb2','202cb962ac59075b964b07152d234b70','daubep',123,'2020-07-11 04:36:26',0),(77,'testdb3','202cb962ac59075b964b07152d234b70','daubep',123,'2020-07-11 05:00:32',0),(78,'testdb4','202cb962ac59075b964b07152d234b70','daubep',123,'2020-07-11 05:16:03',0),(80,'testnv11','202cb962ac59075b964b07152d234b70','nhanvien',132,'2020-07-11 06:07:22',0),(82,'testnv112','202cb962ac59075b964b07152d234b70','nhanvien',132,'2020-07-11 06:07:29',0),(83,'test18','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:26:20',0),(86,'testvendor3','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:27:18',0),(87,'testvendor4','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:27:41',0),(91,'testvendor6','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:28:21',130000),(92,'testnv13','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 06:29:10',0),(93,'testvendor5','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:31:24',3185000),(96,'daubep1','202cb962ac59075b964b07152d234b70','daubep',123,'2020-07-14 23:06:12',9520000),(97,'nhanvien1','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-14 23:53:12',0),(98,'testvendor7','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-17 20:01:34',0),(99,'test123123123123','202cb962ac59075b964b07152d234b70','user',123,'Sat Jul 18 2020 14:41:11 GMT+0700 (Indochina Time)',0),(101,'undefined','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 16:01:00 GMT+0700 (Indochina Time)',0),(102,'123123123123','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 16:01:00 GMT+0700 (Indochina Time)',0),(103,'3213123123','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 16:01:00 GMT+0700 (Indochina Time)',0),(104,'32131231233123123','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 16:10:22 GMT+0700 (Indochina Time)',0),(113,'admin5','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 16:10:46 GMT+0700 (Indochina Time)',0),(114,'admin6','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 16:10:46 GMT+0700 (Indochina Time)',0),(115,'admin7','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 20:27:33 GMT+0700 (Indochina Time)',0),(116,'admin8','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 20:27:33 GMT+0700 (Indochina Time)',0),(118,'admin9','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 20:27:33 GMT+0700 (Indochina Time)',0),(120,'admin10','202cb962ac59075b964b07152d234b70','admin',123,'Sat Jul 18 2020 20:27:33 GMT+0700 (Indochina Time)',0),(121,'daubep6','202cb962ac59075b964b07152d234b70','daubep',123,'2020-07-18 21:49:24',0),(122,'nhanvien6','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-19 13:17:59',0),(123,'nguoidung1','202cb962ac59075b964b07152d234b70','user',123,'Tue Aug 04 2020 23:59:25 GMT+0700 (Indochina Time)',0),(124,'user1','202cb962ac59075b964b07152d234b70','user',123,'Tue Aug 04 2020 23:59:25 GMT+0700 (Indochina Time)',100000),(125,'user2','202cb962ac59075b964b07152d234b70','user',123,'Wed Aug 05 2020 00:20:29 GMT+0700 (Indochina Time)',45000),(126,'user3','202cb962ac59075b964b07152d234b70','user',123,'Wed Aug 05 2020 00:20:29 GMT+0700 (Indochina Time)',45000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `tenquay` varchar(45) NOT NULL,
  `ngaytao` datetime NOT NULL,
  `ngaydong` datetime DEFAULT NULL,
  `trangthai` varchar(10) NOT NULL DEFAULT 'active',
  `adminthuchien` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `tenquay_UNIQUE` (`tenquay`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'testvendor2','tesst2','2020-07-09 22:14:12','2020-08-04 23:43:31','inactive','admin3'),(11,'test2','test2','2020-07-10 14:17:44',NULL,'active','admin3'),(12,'test3','test3','2020-07-10 14:36:16',NULL,'active','admin3'),(13,'test4','test4','2020-07-10 14:36:39',NULL,'active','admin3'),(14,'test5','test5','2020-07-10 14:38:11',NULL,'active','admin3'),(15,'test6','test6','2020-07-10 14:44:02',NULL,'active','admin3'),(16,'test7','test7','2020-07-10 14:56:09',NULL,'active','admin3'),(17,'test8','test8','2020-07-10 14:56:51',NULL,'active','admin3'),(18,'test9','123','2020-07-10 15:00:11',NULL,'active','admin3'),(20,'test10','test10','2020-07-10 16:32:38',NULL,'active','admin3'),(21,'test11','test11','2020-07-11 00:38:30',NULL,'active','admin3'),(22,'test12','test12','2020-07-11 00:38:43',NULL,'active','admin3'),(23,'test13','test13','2020-07-11 00:39:09',NULL,'active','admin3'),(24,'test14','test14','2020-07-11 00:50:23',NULL,'active','admin3'),(25,'test15','test15','2020-07-11 01:19:49',NULL,'active','admin3'),(26,'test16','test16','2020-07-11 01:21:22',NULL,'active','admin3'),(27,'test17','test17','2020-07-11 01:21:56',NULL,'active','admin3'),(29,'testvendor3','testvendor3','2020-07-11 06:27:18',NULL,'active','admin3'),(31,'testvendor6','testvendor6','2020-07-11 06:28:21',NULL,'active','admin3'),(32,'testvendor5','testvendor5','2020-07-11 06:31:24',NULL,'active','admin3'),(33,'testvendor7','testvendor7','2020-07-17 20:01:34',NULL,'active','admin3');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vnpay`
--

DROP TABLE IF EXISTS `vnpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vnpay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `transNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vnpay`
--

LOCK TABLES `vnpay` WRITE;
/*!40000 ALTER TABLE `vnpay` DISABLE KEYS */;
INSERT INTO `vnpay` VALUES (5,'admin3','2020-08-02 22:35:48',10000,'13348813'),(12,'user1','2020-08-05 00:12:40',100000,'13351752'),(13,'user1','2020-08-05 00:21:03',100000,'13351753'),(14,'user2','2020-08-05 00:25:06',100000,'13351754'),(15,'user3','2020-08-05 00:31:31',100000,'13351755');
/*!40000 ALTER TABLE `vnpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xacnhan`
--

DROP TABLE IF EXISTS `xacnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xacnhan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `daubepxacnhan` varchar(45) DEFAULT NULL,
  `quayhangxacnhan` varchar(45) DEFAULT NULL,
  `timedaubepxacnhan` varchar(45) DEFAULT NULL,
  `timequayhangxacnhan` varchar(45) DEFAULT NULL,
  `idgiohang` varchar(45) DEFAULT NULL,
  `vendorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacnhan`
--

LOCK TABLES `xacnhan` WRITE;
/*!40000 ALTER TABLE `xacnhan` DISABLE KEYS */;
INSERT INTO `xacnhan` VALUES (28,'daubep1','nhanvien1','2020-07-15 01:27:46','2020-07-15 01:28:16','93',NULL),(29,'daubep1','nhanvien1','2020-07-17 14:13:19','2020-07-17 14:14:22','96',NULL),(30,NULL,NULL,NULL,NULL,'95',NULL),(31,NULL,NULL,NULL,NULL,'98',NULL),(32,NULL,NULL,NULL,NULL,'18',NULL),(33,NULL,NULL,NULL,NULL,'78',NULL),(36,'daubep1','nhanvien1','2020-08-05 00:03:42','2020-08-05 00:06:16','89','testvendor5'),(37,NULL,NULL,NULL,NULL,'89','testvendor6'),(38,NULL,NULL,NULL,NULL,'106','testvendor6'),(39,NULL,NULL,NULL,NULL,'106','testvendor5'),(40,NULL,NULL,NULL,NULL,'109','testvendor6'),(41,NULL,NULL,NULL,NULL,'109','testvendor5'),(42,NULL,'nhanvien6',NULL,'2020-07-19 13:28:38','110','testvendor6'),(43,NULL,NULL,NULL,NULL,'110','testvendor5'),(44,'daubep6','nhanvien6','2020-07-18 21:50:32','2020-07-19 16:56:28','111','testvendor6'),(45,NULL,NULL,NULL,NULL,'111','testvendor5'),(46,NULL,NULL,NULL,NULL,'101','testvendor5'),(47,'daubep6','nhanvien6','2020-07-18 21:49:47','2020-07-19 16:56:26','101','testvendor6'),(48,'daubep6','nhanvien6','2020-07-18 21:50:08','2020-07-19 16:55:57','124','testvendor6'),(49,'daubep1','nhanvien1','2020-07-19 11:09:58','2020-07-19 11:11:36','112','testvendor5'),(50,'daubep1','nhanvien1','2020-07-19 12:29:21','2020-07-19 12:29:27','127','testvendor5'),(51,'daubep1','nhanvien1','2020-07-19 12:34:12','2020-07-19 12:34:34','128','testvendor5'),(52,'daubep1','nhanvien1','2020-07-19 12:49:37','2020-07-19 12:49:41','129','testvendor5'),(53,'daubep1','nhanvien1','2020-07-19 13:00:15','2020-07-19 13:00:20','130','testvendor5'),(54,'daubep6','nhanvien6','2020-07-19 13:18:25','2020-07-19 13:30:22','131','testvendor6'),(55,'daubep1','nhanvien1','2020-07-19 13:17:12','2020-07-19 13:31:46','131','testvendor5'),(56,'daubep1','nhanvien1','2020-07-19 13:41:29','2020-07-19 13:41:53','132','testvendor5'),(57,'daubep1','nhanvien1','2020-07-19 16:21:33','2020-07-19 16:21:38','134','testvendor5'),(58,'daubep1','nhanvien1','2020-07-19 16:27:40','2020-07-19 16:27:46','135','testvendor5'),(59,'daubep1','nhanvien1','2020-07-19 16:29:34','2020-07-19 16:29:39','136','testvendor5'),(60,'daubep1','nhanvien1','2020-07-19 16:32:07','2020-07-19 16:32:11','137','testvendor5'),(61,'daubep1','nhanvien1','2020-07-19 16:54:40','2020-07-19 16:56:46','138','testvendor5'),(62,'daubep6','nhanvien6','2020-07-19 16:55:00','2020-07-19 16:55:31','138','testvendor6'),(63,'daubep1','nhanvien1','2020-07-19 17:04:42','2020-07-19 17:06:21','139','testvendor5'),(64,'daubep6','nhanvien6','2020-07-19 17:05:32','2020-07-19 17:05:48','139','testvendor6'),(65,'daubep1','nhanvien1','2020-07-19 17:19:12','2020-07-19 17:19:21','140','testvendor5'),(66,'daubep1','nhanvien1','2020-07-19 17:25:13','2020-07-19 17:25:20','141','testvendor5'),(67,'daubep1','nhanvien1','2020-07-19 17:26:47','2020-07-19 17:26:50','142','testvendor5'),(68,'daubep1','nhanvien1','2020-07-19 17:29:40','2020-07-19 17:29:43','143','testvendor5'),(69,'daubep1','nhanvien1','2020-07-19 17:32:12','2020-07-19 17:32:17','144','testvendor5'),(70,'daubep1','nhanvien1','2020-07-19 17:33:53','2020-07-19 17:34:04','145','testvendor5'),(71,'daubep6','nhanvien6','2020-07-19 17:33:57','2020-07-19 17:34:01','145','testvendor6'),(72,'daubep1','nhanvien1','2020-07-19 17:36:39','2020-07-19 17:36:46','146','testvendor5'),(73,'daubep6','nhanvien6','2020-07-19 17:36:42','2020-07-19 17:36:50','146','testvendor6'),(74,'daubep1','nhanvien1','2020-07-19 17:40:47','2020-07-19 17:40:53','147','testvendor5'),(75,'daubep6','nhanvien6','2020-07-19 17:40:58','2020-07-19 17:41:02','147','testvendor6'),(76,'daubep1','nhanvien1','2020-07-19 18:25:52','2020-07-19 18:25:56','148','testvendor5'),(77,'daubep6','nhanvien6','2020-07-19 18:25:16','2020-07-19 18:26:15','148','testvendor6'),(78,NULL,NULL,NULL,NULL,'126','testvendor5'),(79,'daubep1','nhanvien1','2020-08-04 16:55:04','2020-08-04 16:55:32','149','testvendor5'),(80,NULL,NULL,NULL,NULL,'151','testvendor5'),(81,NULL,NULL,NULL,NULL,'155','testvendor5'),(82,NULL,NULL,NULL,NULL,'157','testvendor5'),(83,NULL,NULL,NULL,NULL,'150','testvendor5'),(84,NULL,NULL,NULL,NULL,'159','testvendor5'),(85,NULL,NULL,NULL,NULL,'159','testvendor5'),(86,NULL,NULL,NULL,NULL,'159','testvendor5'),(87,NULL,NULL,NULL,NULL,'159','testvendor5'),(88,NULL,NULL,NULL,NULL,'159','testvendor5'),(89,NULL,NULL,NULL,NULL,'159','testvendor5'),(90,NULL,NULL,NULL,NULL,'159','testvendor5'),(91,NULL,NULL,NULL,NULL,'159','testvendor5'),(92,NULL,NULL,NULL,NULL,'159','testvendor5'),(93,NULL,NULL,NULL,NULL,'159','testvendor5'),(94,NULL,NULL,NULL,NULL,'159','testvendor5'),(95,NULL,NULL,NULL,NULL,'161','testvendor5');
/*!40000 ALTER TABLE `xacnhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'food_court'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `xxxEVENTxxx` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `xxxEVENTxxx` ON SCHEDULE EVERY 1 DAY STARTS '2020-08-05 23:59:59' ON COMPLETION NOT PRESERVE ENABLE DO SET SQL_SAFE_UPDATES = 0 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'food_court'
--
/*!50003 DROP PROCEDURE IF EXISTS `thanhtoangiohang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thanhtoangiohang`(
		 name VARCHAR(20), tongtien int )
BEGIN
declare gh int;
declare dh int;
select max(idgiohang)  into gh from giohang where username = name;
-- insert into donhang(idgiohang) values(gh);
insert into giohang(username) values(name);
select (idgiohang) into dh from donhang where idgiohang = gh;
update user set balance = balance - tongtien where username = name;
-- insert into xacnhan(idgiohang) values(dh);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `themspvaogiohang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `themspvaogiohang`(
			id int, amount int, usrname varchar(45)  )
BEGIN
declare ht int;
declare giohang int;

select max(idgiohang)  into giohang from giohang where username = usrname;
 select soluong into ht from chonhang where idmon = id and idgiohang = giohang;
if (ht > 0) then update chonhang set soluong = soluong + amount where idmon = id and idgiohang = giohang;
else insert into chonhang(idmon, soluong, time, idgiohang)values( id, amount,DATE(NOW()), giohang);
end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 22:50:39
