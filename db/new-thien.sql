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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baotri`
--

LOCK TABLES `baotri` WRITE;
/*!40000 ALTER TABLE `baotri` DISABLE KEYS */;
INSERT INTO `baotri` VALUES (1,'admin3',NULL,'off');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chonhang`
--

LOCK TABLES `chonhang` WRITE;
/*!40000 ALTER TABLE `chonhang` DISABLE KEYS */;
INSERT INTO `chonhang` VALUES (1,1,2,'2020-08-06',2),(2,1,4,'2020-08-06',4),(3,1,2,'2020-08-06',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgia`
--

LOCK TABLES `danhgia` WRITE;
/*!40000 ALTER TABLE `danhgia` DISABLE KEYS */;
INSERT INTO `danhgia` VALUES (1,NULL,'1','vendor1',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daubep`
--

LOCK TABLES `daubep` WRITE;
/*!40000 ALTER TABLE `daubep` DISABLE KEYS */;
INSERT INTO `daubep` VALUES (1,'daubep1','2020-08-06 09:53:27','active',NULL,'vendor1');
/*!40000 ALTER TABLE `daubep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` varchar(45) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `idcard` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (1,'2'),(2,'4'),(3,'5');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Cơm tấm','image-1596682642093-480766826-download.jpeg',10000,'Cơm',1,'2020-08-06 09:57:22',0,'vendor1');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (1,'vendor1'),(2,'daubep1'),(3,'nhanvien1'),(4,'daubep1'),(5,'daubep1'),(6,'daubep1');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichsunaptienvendor`
--

LOCK TABLES `lichsunaptienvendor` WRITE;
/*!40000 ALTER TABLE `lichsunaptienvendor` DISABLE KEYS */;
INSERT INTO `lichsunaptienvendor` VALUES (1,'vendor1','2',20000,1),(2,'vendor1','4',40000,1),(3,'vendor1','5',20000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2020-08-06 09:57:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_foods`
--

LOCK TABLES `menu_foods` WRITE;
/*!40000 ALTER TABLE `menu_foods` DISABLE KEYS */;
INSERT INTO `menu_foods` VALUES (1,1,1,92,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'nhanvien1','2020-08-06 09:53:33',NULL,'active','vendor1');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thungan`
--

LOCK TABLES `thungan` WRITE;
/*!40000 ALTER TABLE `thungan` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin3','202cb962ac59075b964b07152d234b70','admin',123,NULL,9999999),(2,'vendor1','202cb962ac59075b964b07152d234b70','vendor',123,'2020-08-06 09:52:58',80000),(3,'daubep1','202cb962ac59075b964b07152d234b70','daubep',123,'2020-08-06 09:53:27',9919999),(4,'nhanvien1','202cb962ac59075b964b07152d234b70','nhanvien',123,'2020-08-06 09:53:33',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'vendor1','vendor1','2020-08-06 09:52:58',NULL,'active','admin3');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vnpay`
--

LOCK TABLES `vnpay` WRITE;
/*!40000 ALTER TABLE `vnpay` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacnhan`
--

LOCK TABLES `xacnhan` WRITE;
/*!40000 ALTER TABLE `xacnhan` DISABLE KEYS */;
INSERT INTO `xacnhan` VALUES (1,'daubep1','nhanvien1','2020-08-06 10:00:28','2020-08-06 10:00:40','2','vendor1'),(2,NULL,NULL,NULL,NULL,'4','vendor1'),(3,NULL,NULL,NULL,NULL,'5','vendor1');
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thanhtoangiohang`(`name` VARCHAR(20), `tongtien` INT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `themspvaogiohang`(`id` INT, `amount` INT, `usrname` VARCHAR(45))
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

-- Dump completed on 2020-08-06 10:12:42
