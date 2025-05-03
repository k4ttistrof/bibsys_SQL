-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bbd
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` bigint NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `publisher` char(50) NOT NULL,
  `publishingYear` year NOT NULL,
  `bookCategory` int NOT NULL,
  `placement` char(10) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `idx_bookTitle` (`title`),
  KEY `idx_author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (9780008376116,'The Hobbit','J.R.R Tolkien','HarperCollins',2020,1,'He'),(9780750662246,'Contemporary Theory of Conservation','Salvador Munoz-Vinas','Butterworth-Heinemann Ltd',2004,2,'INK'),(9781292061184,'Database Systems: A Practical Approach to Design, Implementation, and \nManagement','Thomas Connolly, Carolyn Begg, Addison Wesley','Pearson',2014,2,'Pud'),(9781408883358,'The Priory of the Orange Tree','Samantha Shannon','Bloomsburt Publishing PLC',2020,1,'He'),(9781684204519,'Atlas of Anatomy','Anne M Gilroy, Brian R MacPherson, Jamie Wikenheiser, Michael \nSchuenke, Erik Schulte','Thieme Medical Publishers Inc',2021,2,'Vb'),(9789132211676,'Boktjuven','Markus Zusak','B Wahlströms',2019,1,'He'),(9789178876235,'Kaka på kaka: godare  fika året runt','Camilla Hamid','Bonnier Fakta',2023,1,'Qca');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookcopy`
--

DROP TABLE IF EXISTS `bookcopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookcopy` (
  `bookCopyID` int NOT NULL AUTO_INCREMENT,
  `ISBN` bigint DEFAULT NULL,
  `isReferenceCopy` int DEFAULT NULL,
  `onLoan` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `bookCategory` int DEFAULT NULL,
  PRIMARY KEY (`bookCopyID`),
  KEY `idx_bookCopies` (`ISBN`),
  CONSTRAINT `bookcopy_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookcopy`
--

LOCK TABLES `bookcopy` WRITE;
/*!40000 ALTER TABLE `bookcopy` DISABLE KEYS */;
INSERT INTO `bookcopy` VALUES (1,9781292061184,0,0,'Database Systems: A Practical Approach to Design, Implementation, and \nManagement',2),(2,9781684204519,0,1,'Atlas of Anatomy',2),(3,9780750662246,1,0,'Contemporary Theory of Conservation',2),(4,9781408883358,0,0,'The Priory of the Orange Tree',1),(5,9780008376116,0,1,'The Hobbit',1),(6,9789132211676,0,0,'Boktjuven',1),(7,9789178876235,1,0,'Kaka på kaka: godare fika året runt',1),(8,9781292061184,1,0,'Database Systems: A Practical Approach to Design, Implementation, and \nManagement',2),(9,9781684204519,0,0,'Atlas of Anatomy',2),(10,9780750662246,0,0,'Contemporary Theory of Conservation',2),(11,9781408883358,0,0,'The Priory of the Orange Tree',1),(12,9780008376116,1,0,'The Hobbit',1),(13,9789132211676,0,0,'Boktjuven',1),(14,9789178876235,0,0,'Kaka på kaka: godare fika året runt',1),(15,9781292061184,0,1,'Database Systems: A Practical Approach to Design, Implementation, and \nManagement',2),(16,9781684204519,1,0,'Atlas of Anatomy',2),(17,9780750662246,0,1,'Contemporary Theory of Conservation',2),(18,9781408883358,1,0,'The Priory of the Orange Tree',1),(19,9780008376116,0,0,'The Hobbit',1),(20,9789132211676,1,0,'Boktjuven',1);
/*!40000 ALTER TABLE `bookcopy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvd`
--

DROP TABLE IF EXISTS `dvd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvd` (
  `dvdNo` int NOT NULL,
  `title` char(50) NOT NULL,
  `director` char(50) NOT NULL,
  `releaseYear` year NOT NULL,
  `genre` enum('documentary','romance','comedy','drama','thriller','horror') NOT NULL,
  `loanTime` int DEFAULT '14',
  PRIMARY KEY (`dvdNo`),
  KEY `idx_dvdTitle` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvd`
--

LOCK TABLES `dvd` WRITE;
/*!40000 ALTER TABLE `dvd` DISABLE KEYS */;
INSERT INTO `dvd` VALUES (1,'Dune: Part Two','Denis Villeneuve',2024,'drama',14),(2,'The Holiday','Nancy \nMeyers',2006,'romance',14),(3,'The Ritual','David \nBruckner',2017,'horror',14),(4,'Modig','Mark \nAndrews, Brenda Chapman, Steve Purcell',2012,'drama',14),(5,'Hammarskjöld','Per \nFly',2023,'drama',14);
/*!40000 ALTER TABLE `dvd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvdcopy`
--

DROP TABLE IF EXISTS `dvdcopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvdcopy` (
  `dvdCopyID` int NOT NULL AUTO_INCREMENT,
  `dvdNo` int DEFAULT NULL,
  `title` char(50) DEFAULT NULL,
  `onLoan` int DEFAULT NULL,
  PRIMARY KEY (`dvdCopyID`),
  KEY `idx_dvdCopies` (`dvdNo`),
  CONSTRAINT `dvdcopy_ibfk_1` FOREIGN KEY (`dvdNo`) REFERENCES `dvd` (`dvdNo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvdcopy`
--

LOCK TABLES `dvdcopy` WRITE;
/*!40000 ALTER TABLE `dvdcopy` DISABLE KEYS */;
INSERT INTO `dvdcopy` VALUES (1,1,'Dune: Part Two',0),(2,1,'Dune: Part Two',1),(3,2,'The Holiday',0),(4,2,'The Holiday',1),(5,3,'The Ritual',1),(6,4,'Modig',0),(7,4,'Modig',1),(8,5,'Hammarskjöld',1),(9,5,'Hammarskjöld',1),(10,1,'Dune: Part Two',0),(11,1,'Dune: Part Two',1),(12,2,'The Holiday',0),(13,2,'The Holiday',1),(14,3,'The Ritual',1),(15,4,'Modig',0),(16,4,'Modig',1),(17,5,'Hammarskjöld',0),(18,5,'Hammarskjöld',1),(19,1,'Dune: Part Two',0),(20,2,'The Holiday',1);
/*!40000 ALTER TABLE `dvdcopy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemloan`
--

DROP TABLE IF EXISTS `itemloan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemloan` (
  `itemLoanNo` int NOT NULL AUTO_INCREMENT,
  `loanID` int NOT NULL,
  `bookCopyID` int DEFAULT NULL,
  `dvdCopyID` int DEFAULT NULL,
  `userID` int NOT NULL,
  `returnDate` date NOT NULL,
  PRIMARY KEY (`itemLoanNo`),
  KEY `loanID` (`loanID`),
  KEY `bookCopyID` (`bookCopyID`),
  KEY `dvdCopyID` (`dvdCopyID`),
  CONSTRAINT `itemloan_ibfk_1` FOREIGN KEY (`loanID`) REFERENCES `loan` (`loanID`),
  CONSTRAINT `itemloan_ibfk_2` FOREIGN KEY (`bookCopyID`) REFERENCES `bookcopy` (`bookCopyID`),
  CONSTRAINT `itemloan_ibfk_3` FOREIGN KEY (`dvdCopyID`) REFERENCES `dvdcopy` (`dvdCopyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemloan`
--

LOCK TABLES `itemloan` WRITE;
/*!40000 ALTER TABLE `itemloan` DISABLE KEYS */;
INSERT INTO `itemloan` VALUES (1,1,5,NULL,100002,'2025-06-24'),(2,2,NULL,8,100004,'2025-05-08');
/*!40000 ALTER TABLE `itemloan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loanID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `loanDate` date NOT NULL,
  PRIMARY KEY (`loanID`),
  KEY `userID` (`userID`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,100002,'2025-04-24'),(2,100004,'2025-04-24');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationNo` int NOT NULL AUTO_INCREMENT,
  `reservationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int NOT NULL,
  `ISBN` bigint DEFAULT NULL,
  `dvdNo` int DEFAULT NULL,
  PRIMARY KEY (`reservationNo`),
  KEY `FK_reservingUser` (`userID`),
  KEY `FK_reservedISBN` (`ISBN`),
  KEY `FK_reserveDVD` (`dvdNo`),
  CONSTRAINT `FK_reservedISBN` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `FK_reserveDVD` FOREIGN KEY (`dvdNo`) REFERENCES `dvd` (`dvdNo`),
  CONSTRAINT `FK_reservingUser` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userCategory` int NOT NULL,
  `email` char(40) NOT NULL,
  `firstName` char(30) NOT NULL,
  `lastName` char(30) NOT NULL,
  `streetName` char(30) NOT NULL,
  `city` char(30) NOT NULL,
  `postCode` char(5) NOT NULL,
  `activeLoans` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=100005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (100000,1,'jorgen.nilsson@ltu.se','Jörgen','Nilsson','Laboratorievägen 14','Luleå','97187',0),(100001,3,'kalka-4@ltu.student.se','Kalle','Karlsson','Sommarstigen 35','Borås','50330',0),(100002,1,'sara.silvertand@ltu.se','Sara','Silvertand','Hermelinsgatan 10','Luleå','97234',1),(100003,2,'solvig.tandberg@ltu.se','Solvig','Tandberg','Laboratorievägen 14','Luleå','97187',0),(100004,3,'noora-2@ltu.student.se','Noora','Randig','Arkeologgatan 7','Västerås','72353',1);
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

-- Dump completed on 2025-05-03 17:52:16
