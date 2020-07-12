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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'Thien','Vietcombank','undefined','Sun Jun 21 2020 15:33:26 GMT+0700 (Indochina Time)','undefined'),(2,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:34:27 GMT+0700 (Indochina Time)','undefined'),(3,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:46:29 GMT+0700 (Indochina Time)','undefined'),(4,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:47:26 GMT+0700 (Indochina Time)','undefined'),(5,'Thien','Vietcombank','test456','Sun Jun 21 2020 15:51:55 GMT+0700 (Indochina Time)','undefined'),(6,'41421','Vietcombank','test456','Sun Jun 21 2020 15:56:56 GMT+0700 (Indochina Time)','undefined'),(7,'41421','Vietcombank','test456','Sun Jun 21 2020 15:56:56 GMT+0700 (Indochina Time)','undefined'),(8,'41421','Vietcombank','test456','Sun Jun 21 2020 15:57:44 GMT+0700 (Indochina Time)','123123');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chief`
--

DROP TABLE IF EXISTS `chief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chief` (
  `stt_chief` int NOT NULL AUTO_INCREMENT,
  `id_chief` int NOT NULL,
  `name_chief` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthDate_chief` date DEFAULT NULL,
  PRIMARY KEY (`id_chief`),
  UNIQUE KEY `stt_chief_UNIQUE` (`stt_chief`),
  UNIQUE KEY `id_chief_UNIQUE` (`id_chief`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chief`
--

LOCK TABLES `chief` WRITE;
/*!40000 ALTER TABLE `chief` DISABLE KEYS */;
/*!40000 ALTER TABLE `chief` ENABLE KEYS */;
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
  `time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `idcard` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deposit`
--

LOCK TABLES `Deposit` WRITE;
/*!40000 ALTER TABLE `Deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `stt_food` int NOT NULL AUTO_INCREMENT,
  `id_food` int NOT NULL,
  `name_food` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quantities_food` int DEFAULT NULL,
  `price_food` int DEFAULT NULL,
  `description_food` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_chief` int NOT NULL,
  PRIMARY KEY (`id_food`),
  UNIQUE KEY `id_food_UNIQUE` (`id_food`),
  UNIQUE KEY `stt_food_UNIQUE` (`stt_food`),
  KEY `id_chief_idx` (`id_chief`),
  CONSTRAINT `food_id_chief` FOREIGN KEY (`id_chief`) REFERENCES `chief` (`id_chief`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `stt_order` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `dateTime_date` datetime DEFAULT NULL,
  `name_customer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_food` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quantities_food` int DEFAULT NULL,
  `confirmed` tinyint DEFAULT NULL,
  `done` tinyint DEFAULT NULL,
  `id_chief` int NOT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `id_order_UNIQUE` (`id_order`),
  UNIQUE KEY `stt_order_UNIQUE` (`stt_order`),
  KEY `id_chief_idx` (`id_chief`),
  CONSTRAINT `order_id_chief` FOREIGN KEY (`id_chief`) REFERENCES `chief` (`id_chief`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int DEFAULT NULL,
  `username` text,
  `password` text,
  `role` text,
  `phone` int DEFAULT NULL,
  `ngaydk` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','d41d8cd98f00b204e9800998ecf8427e','user',789,NULL),(2,'admin','202cb962ac59075b964b07152d234b70','user',394946767,NULL),(3,'admin2','202cb962ac59075b964b07152d234b70','user',394946767,NULL),(5,'admin3','202cb962ac59075b964b07152d234b70','admin',394946767,NULL),(NULL,'test456','202cb962ac59075b964b07152d234b70','user',123,'Sun Jun 21 2020 11:26:26 GMT+0700 (Indochina Time)');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-21 23:49:36
