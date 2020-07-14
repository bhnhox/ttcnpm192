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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baotri`
--

LOCK TABLES `baotri` WRITE;
/*!40000 ALTER TABLE `baotri` DISABLE KEYS */;
INSERT INTO `baotri` VALUES (1,'admin2','test','on'),(2,'admin2','test','off'),(3,'admin2','test','off'),(4,'admin2','test','on'),(5,'admin3','test','off'),(6,'admin3','test','on'),(7,'admin3','test','off'),(8,'admin3','test','on'),(9,'admin3','test','off'),(10,'admin3','Sun Jun 28 2020 23:31:31 GMT+0700 (Indochina Time)','on'),(11,'admin3','Sun Jun 28 2020 23:33:28 GMT+0700 (Indochina Time)','off'),(12,'admin3','Sun Jun 28 2020 23:34:20 GMT+0700 (Indochina Time)','on'),(13,'admin3','Sun Jun 28 2020 23:34:31 GMT+0700 (Indochina Time)','off'),(14,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','on'),(15,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(16,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','on'),(17,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(18,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(19,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','on'),(20,'admin3','Sun Jun 28 2020 23:34:38 GMT+0700 (Indochina Time)','off'),(21,'admin3','Sun Jun 28 2020 23:35:50 GMT+0700 (Indochina Time)','on'),(22,'admin3','Sun Jun 28 2020 23:42:37 GMT+0700 (Indochina Time)','off');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chonhang`
--

LOCK TABLES `chonhang` WRITE;
/*!40000 ALTER TABLE `chonhang` DISABLE KEYS */;
INSERT INTO `chonhang` VALUES (63,16,13,'2020-07-07',21),(75,17,17,'2020-07-07',21),(77,17,4,'2020-07-07',22),(78,16,60,'2020-07-07',22),(79,16,1,'2020-07-14',15),(80,16,1,'2020-07-14',80);
/*!40000 ALTER TABLE `chonhang` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daubep`
--

LOCK TABLES `daubep` WRITE;
/*!40000 ALTER TABLE `daubep` DISABLE KEYS */;
INSERT INTO `daubep` VALUES (1,'','2020-07-11 04:30:46','inactive','2020-07-11 06:25:19','test2'),(2,'testdb1','2020-07-11 04:32:06','inactive','2020-07-11 06:25:23','test2'),(3,'testdb2','2020-07-11 04:36:26','active',NULL,'test2'),(4,'testdb3','2020-07-11 05:00:32','active',NULL,'test2'),(5,'testdb4','2020-07-11 05:16:03','active',NULL,'test2');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deposit`
--

LOCK TABLES `Deposit` WRITE;
/*!40000 ALTER TABLE `Deposit` DISABLE KEYS */;
INSERT INTO `Deposit` VALUES (1,'10000','Mon Jun 22 2020 23:15:29 GMT+0700 (Indochina Time)','success',' 123123 ','test456'),(2,'10000','Mon Jun 22 2020 23:44:47 GMT+0700 (Indochina Time)','success',' undefined ','test456'),(3,'10000','Mon Jun 22 2020 23:44:47 GMT+0700 (Indochina Time)','success',' 123123 ','test456'),(4,'10000','Mon Jun 22 2020 23:47:28 GMT+0700 (Indochina Time)','success',' 123123 ','test456'),(5,'10000','Mon Jun 29 2020 00:08:39 GMT+0700 (Indochina Time)','success',' 123 ','guest'),(6,'10000','Mon Jun 29 2020 00:47:24 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(7,'10000','Mon Jun 29 2020 00:47:24 GMT+0700 (Indochina Time)','success',' 123123 ','guest'),(8,'2000','Mon Jun 29 2020 23:38:58 GMT+0700 (Indochina Time)','success',' 123 ','admin3'),(9,'10000','Tue Jun 30 2020 00:07:56 GMT+0700 (Indochina Time)','success',' 123 ','guest');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (1,'2'),(2,'4'),(3,'5'),(4,'6'),(5,'7'),(6,'8'),(7,'9'),(8,'10'),(9,'3'),(10,'13'),(11,'14'),(12,'11'),(13,'16'),(14,'17'),(15,'null'),(16,'19'),(17,'20'),(18,'21'),(19,'15'),(20,'79'),(21,'80'),(22,'81'),(23,'82'),(24,'83');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (15,'Bún bò Huế','/',30000,'Món này ngon vl',0,'2020-06-23 00:45:20',0),(16,'Cơm tấm','image-1593415140510-700375704-ke-hoach-kinh-doanh-com-tam.jpg',20000,'Cơm tấm',1,'2020-06-29 14:19:00',0),(17,'Phở','image-1593416908803-345158418-cach-lam-3-mon-pho-nuoc-ngon-nong-hoi-dam-da-huong-vi-viet 1.jpg',20000,'Phở',1,'2020-06-29 14:48:28',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (1,'test1'),(2,'admin3'),(3,'guest'),(4,'admin3'),(5,'admin3'),(6,'admin3'),(7,'admin3'),(8,'admin3'),(9,'admin3'),(10,'admin4'),(11,'admin3'),(12,'admin4'),(13,'guest'),(14,'guest'),(15,'guest'),(16,'admin3'),(17,'admin3'),(18,'admin3'),(19,'admin2'),(20,'admin2'),(21,'admin2'),(22,'admin2'),(23,'testvendor1'),(24,'testvendor2'),(34,'test3'),(35,'test4'),(36,'test5'),(37,'test6'),(38,'test7'),(39,'test8'),(40,'test9'),(41,'test2'),(42,'test10'),(43,'testthungan1'),(44,'testtn1'),(45,'testtn2'),(46,'test123'),(47,'testtn4'),(48,'test11'),(49,'test12'),(50,'test13'),(51,'test14'),(52,'test15'),(53,'test16'),(54,'test17'),(55,'testtn5'),(56,'testtn6'),(57,'testtn7'),(58,'testtn8'),(59,'testtn9'),(60,'testtn10'),(61,'testtn11'),(62,'testtn12'),(63,'testtn13'),(64,'testnv1'),(65,''),(66,'testdb1'),(67,'testtn14'),(68,'testdb2'),(69,'testdb3'),(70,'testdb4'),(71,'testnv11'),(72,'testnv112'),(73,'test18'),(74,'testvendor3'),(75,'testvendor4'),(76,'testvendor6'),(77,'testnv13'),(78,'testvendor5'),(79,'guest'),(80,'guest'),(81,'guest'),(82,'guest'),(83,'guest'),(84,'guest');
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2020-06-28 21:08:34'),(2,'2020-06-29 10:47:58'),(3,'2020-06-30 07:16:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_foods`
--

LOCK TABLES `menu_foods` WRITE;
/*!40000 ALTER TABLE `menu_foods` DISABLE KEYS */;
INSERT INTO `menu_foods` VALUES (1,1,15,0,0),(2,2,15,100,1),(3,2,16,200,0),(4,2,17,200,0),(5,3,16,100,0),(6,3,17,100,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'testnv1','2020-07-11 04:25:21',NULL,'active','test2'),(2,'testnv11','2020-07-11 06:07:22',NULL,'active','test3'),(3,'testnv112','2020-07-11 06:07:29',NULL,'active','test3'),(4,'testnv13','2020-07-11 06:29:10',NULL,'active','test3');
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'test456','202cb962ac59075b964b07152d234b70','user',123,'Sun Jun 21 2020 11:26:26 GMT+0700 (Indochina Time)',0),(1,'123','d41d8cd98f00b204e9800998ecf8427e','user',789,NULL,0),(2,'admin','202cb962ac59075b964b07152d234b70','user',394946767,NULL,0),(3,'admin2','202cb962ac59075b964b07152d234b70','user',394946767,NULL,0),(5,'admin3','202cb962ac59075b964b07152d234b70','admin',394946767,NULL,12001),(6,'guest','202cb962ac59075b964b07152d234b70','user',123,'Mon Jun 29 2020 00:38:01 GMT+0700 (Indochina Time)',20000),(7,'test1','202cb962ac59075b964b07152d234b70','user',123,'Mon Jun 29 2020 10:44:45 GMT+0700 (Indochina Time)',0),(8,'admin4','202cb962ac59075b964b07152d234b70','admin',123,'Mon Jun 29 2020 23:48:16 GMT+0700 (Indochina Time)',0),(9,'testvendor1','202cb962ac59075b964b07152d234b70','vendor',13,'2020-07-09 22:14:12',0),(10,'testvendor2','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-09 22:23:49',0),(22,'test3','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:36:16',0),(23,'test4','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:36:39',0),(24,'test5','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:38:11',0),(25,'test6','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:44:02',0),(26,'test7','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:56:09',0),(27,'test8','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 14:56:51',0),(28,'test9','739969b53246b2c727850dbb3490ede6','vendor',123,'2020-07-10 15:00:11',0),(30,'test2','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 15:01:09',0),(32,'test10','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-10 16:32:38',0),(35,'testthungan1','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 20:50:04',0),(41,'testtn1','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 20:51:49',0),(43,'testtn2','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 20:57:58',0),(47,'test123','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 21:01:39',0),(50,'testtn4','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-10 21:03:08',0),(51,'test11','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:38:30',0),(52,'test12','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:38:43',0),(53,'test13','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:39:09',0),(54,'test14','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 00:50:23',0),(55,'test15','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 01:19:49',0),(56,'test16','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 01:21:22',0),(57,'test17','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 01:21:56',0),(58,'testtn5','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:05:34',0),(61,'testtn6','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:09:31',0),(62,'testtn7','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:10:44',0),(63,'testtn8','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:12:14',0),(64,'testtn9','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:14:51',0),(65,'testtn10','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:17:03',0),(66,'testtn11','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:17:53',0),(67,'testtn12','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 02:18:33',0),(68,'testtn13','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 03:30:59',0),(69,'testnv1','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:25:21',0),(70,'','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:30:46',0),(71,'testdb1','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:32:06',0),(72,'testtn14','202cb962ac59075b964b07152d234b70','thungan',123,'2020-07-11 04:33:39',0),(73,'testdb2','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 04:36:26',0),(77,'testdb3','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 05:00:32',0),(78,'testdb4','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 05:16:03',0),(80,'testnv11','202cb962ac59075b964b07152d234b70','nhanvien',132,'2020-07-11 06:07:22',0),(82,'testnv112','202cb962ac59075b964b07152d234b70','nhanvien',132,'2020-07-11 06:07:29',0),(83,'test18','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:26:20',0),(86,'testvendor3','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:27:18',0),(87,'testvendor4','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:27:41',0),(91,'testvendor6','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:28:21',0),(92,'testnv13','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-07-11 06:29:10',0),(93,'testvendor5','202cb962ac59075b964b07152d234b70','vendor',123,'2020-07-11 06:31:24',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'testvendor2','tesst2','2020-07-09 22:14:12',NULL,'active','admin3'),(11,'test2','test2','2020-07-10 14:17:44',NULL,'active','admin3'),(12,'test3','test3','2020-07-10 14:36:16',NULL,'active','admin3'),(13,'test4','test4','2020-07-10 14:36:39',NULL,'active','admin3'),(14,'test5','test5','2020-07-10 14:38:11',NULL,'active','admin3'),(15,'test6','test6','2020-07-10 14:44:02',NULL,'active','admin3'),(16,'test7','test7','2020-07-10 14:56:09',NULL,'active','admin3'),(17,'test8','test8','2020-07-10 14:56:51',NULL,'active','admin3'),(18,'test9','123','2020-07-10 15:00:11',NULL,'active','admin3'),(20,'test10','test10','2020-07-10 16:32:38',NULL,'active','admin3'),(21,'test11','test11','2020-07-11 00:38:30',NULL,'active','admin3'),(22,'test12','test12','2020-07-11 00:38:43',NULL,'active','admin3'),(23,'test13','test13','2020-07-11 00:39:09',NULL,'active','admin3'),(24,'test14','test14','2020-07-11 00:50:23',NULL,'active','admin3'),(25,'test15','test15','2020-07-11 01:19:49',NULL,'active','admin3'),(26,'test16','test16','2020-07-11 01:21:22',NULL,'active','admin3'),(27,'test17','test17','2020-07-11 01:21:56',NULL,'active','admin3'),(29,'testvendor3','testvendor3','2020-07-11 06:27:18',NULL,'active','admin3'),(31,'testvendor6','testvendor6','2020-07-11 06:28:21',NULL,'active','admin3'),(32,'testvendor5','testvendor5','2020-07-11 06:31:24',NULL,'active','admin3');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
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
  `userxacnhan` varchar(45) DEFAULT NULL,
  `quayhangxacnhan` varchar(45) DEFAULT NULL,
  `timedaubepxacnhan` varchar(45) DEFAULT NULL,
  `timeuserxacnhan` varchar(45) DEFAULT NULL,
  `timequayhangxacnhan` varchar(45) DEFAULT NULL,
  `iddonhang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iddonhang_UNIQUE` (`iddonhang`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacnhan`
--

LOCK TABLES `xacnhan` WRITE;
/*!40000 ALTER TABLE `xacnhan` DISABLE KEYS */;
INSERT INTO `xacnhan` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'7'),(2,NULL,NULL,NULL,NULL,NULL,NULL,'8'),(3,NULL,NULL,NULL,NULL,NULL,NULL,'9'),(4,NULL,NULL,NULL,NULL,NULL,NULL,'10'),(5,NULL,NULL,NULL,NULL,NULL,NULL,'3'),(6,NULL,NULL,NULL,NULL,NULL,NULL,'13'),(7,NULL,NULL,NULL,NULL,NULL,NULL,'14'),(8,NULL,NULL,NULL,NULL,NULL,NULL,'11'),(9,NULL,NULL,NULL,NULL,NULL,NULL,'16'),(10,NULL,NULL,NULL,NULL,NULL,NULL,'17'),(11,NULL,NULL,NULL,NULL,NULL,NULL,'null'),(12,NULL,NULL,NULL,NULL,NULL,NULL,'19'),(13,NULL,NULL,NULL,NULL,NULL,NULL,'20'),(14,NULL,NULL,NULL,NULL,NULL,NULL,'21'),(15,NULL,NULL,NULL,NULL,NULL,NULL,'15'),(16,NULL,NULL,NULL,NULL,NULL,NULL,'79'),(17,NULL,NULL,NULL,NULL,NULL,NULL,'80'),(18,NULL,NULL,NULL,NULL,NULL,NULL,'81'),(19,NULL,NULL,NULL,NULL,NULL,NULL,'82'),(20,NULL,NULL,NULL,NULL,NULL,NULL,'83');
/*!40000 ALTER TABLE `xacnhan` ENABLE KEYS */;
UNLOCK TABLES;

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
		 name VARCHAR(20) )
BEGIN
declare gh int;
select max(idgiohang)  into gh from giohang where username = name;
insert into donhang(idgiohang) values(gh);
insert into giohang(username) values(name);
insert into xacnhan(iddonhang) values(gh);

    
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
			id int, amount int, giohang int )
BEGIN
declare ht int;
 select soluong into ht from chonhang where idmon = id and idgiohang = giohang;
if (ht > 0) then update chonhang set soluong = soluong + amount where idmon = id and idgiohang = giohang;
else insert into chonhang(idmon, soluong, time, idgiohang)values( id, amount,DATE(NOW()), giohang);
end if;
select ht;
SELECT * FROM food_court.chonhang;
    /*Code*/
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

-- Dump completed on 2020-07-14 16:26:10
