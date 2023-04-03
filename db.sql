-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: LittleExplorer
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Kindergarten`
--

DROP TABLE IF EXISTS `Kindergarten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kindergarten` (
  `kindergarten_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `region` varchar(100) NOT NULL,
  `min_age` smallint unsigned NOT NULL,
  `max_age` smallint unsigned NOT NULL,
  `capacity` smallint unsigned NOT NULL,
  `kids_count` smallint unsigned NOT NULL,
  `teachers_count` smallint unsigned NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `has_zaharon` tinyint unsigned NOT NULL,
  `has_parking` tinyint unsigned NOT NULL,
  PRIMARY KEY (`kindergarten_id`),
  UNIQUE KEY `kindergarten_id_UNIQUE` (`kindergarten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kindergarten`
--

LOCK TABLES `Kindergarten` WRITE;
/*!40000 ALTER TABLE `Kindergarten` DISABLE KEYS */;
INSERT INTO `Kindergarten` VALUES (1,'פעוטון זנבנבון','האורניום 6, דימונה','דימונה',3,36,20,10,5,'07:00:00','16:00:00',0,1);
/*!40000 ALTER TABLE `Kindergarten` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-03 11:51:12
