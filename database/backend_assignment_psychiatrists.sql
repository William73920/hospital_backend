-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: backend_assignment
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `psychiatrists`
--

DROP TABLE IF EXISTS `psychiatrists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrists` (
  `psychiatrist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hospital_id` int DEFAULT NULL,
  PRIMARY KEY (`psychiatrist_id`),
  UNIQUE KEY `unique_hospital_name` (`name`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `psychiatrists_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrists`
--

LOCK TABLES `psychiatrists` WRITE;
/*!40000 ALTER TABLE `psychiatrists` DISABLE KEYS */;
INSERT INTO `psychiatrists` VALUES (1,'Dr. Smith',1),(2,'Dr. Johnson',2),(3,'Dr. Davis',1),(4,'Dr. White',2),(5,'Dr. Garcia',3),(6,'Dr. Thompson',1),(7,'Dr. Miller',3),(8,'Dr. Moore',2),(9,'Dr. Martin',3),(10,'Dr. Clark',1),(11,'Dr. Rodriguez',2),(12,'Dr. Lewis',3),(13,'Dr. Hall',1),(14,'Dr. Allen',2),(15,'Dr. Young',3),(16,'Dr. Hill',4),(17,'Dr. Scott',4),(18,'Dr. Green',4),(19,'Dr. Adams',4),(20,'Dr. Baker',4);
/*!40000 ALTER TABLE `psychiatrists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 16:11:18
