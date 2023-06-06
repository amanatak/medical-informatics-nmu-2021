CREATE DATABASE  IF NOT EXISTS `lab1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lab1`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: lab1
-- ------------------------------------------------------
-- Server version	5.6.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `id` char(10) NOT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `generic_name` varchar(60) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES ('gf23496889','Humolin R','Minocycline','PharmaWorld'),('kr87019382','Mycabutin','Rifabutin','GrecoGen'),('mq95032359','Precoz','Acarbose','PharmaWorld'),('op99823820','Glucabay','Acarbose','HealthRight'),('po50094505','Novalin R','Minocycline','GrecoGen'),('zg93055406','Zagan','Sparfloxacin','HorizonMed');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_practitioner`
--

DROP TABLE IF EXISTS `general_practitioner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_practitioner` (
  `id` char(10) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `current_practice` varchar(60) DEFAULT NULL,
  `years_of_experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_practitioner`
--

LOCK TABLES `general_practitioner` WRITE;
/*!40000 ALTER TABLE `general_practitioner` DISABLE KEYS */;
INSERT INTO `general_practitioner` VALUES ('asw2213032','Kyle Russell','k.russell@example.com','Earth Practice',26),('fcv0949043','Jack McGregor','j.mcgregor@example.com','Talbot Practice',12),('gke8849340','David Taylor','d.taylor@example.com','Rose Clinic',23),('kwr9852345','Hannah Mclean','h.mclean@example.com','Foster Clinic',8),('sdf2939475','Charlotte Aitken','c.aitken@example.com','Meadows Clinic',4),('vnn8458554','Lucy Taylor','l.taylor@example.com','Rose Clinic',35);
/*!40000 ALTER TABLE `general_practitioner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `chi` char(10) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `postcode` char(6) DEFAULT NULL,
  `year_of_birth` year(4) DEFAULT NULL,
  `gp_id` char(10) NOT NULL,
  PRIMARY KEY (`chi`),
  KEY `fk_patient_general_practitioner_idx` (`gp_id`),
  CONSTRAINT `fk_patient_general_practitioner` FOREIGN KEY (`gp_id`) REFERENCES `general_practitioner` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('0103624538','Alastair Brown','a.brown@example.com','EH89FK',1962,'gke8849340'),('0812965634','Julia Clark','j.clark@example.com','SD34TR',1996,'asw2213032'),('1208783406','Amy Murray','a.murray@example.com','AB83KL',1978,'vnn8458554'),('1411845100','Rhona Wilson','r.wilson@example.com','SD98VF',1984,'kwr9852345'),('1909793256','Iain Scott','i.scottt@example.com','EH56FF',1979,'fcv0949043'),('2208663398','Hamish Walker','h.walker@example.com','EH24DX',1966,'sdf2939475'),('3005402592','Fiona Campbell','f.campbell@example.com','LO43PR',1940,'asw2213032'),('3101974980','Andrew Ross','a.ross@example.com','SH51MN',1997,'fcv0949043');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `pr_id` char(10) NOT NULL,
  `p_id` char(10) NOT NULL,
  `gp_id` char(10) NOT NULL,
  `d_id` char(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `fk_general_practitioner_has_drug_drug1_idx` (`d_id`),
  KEY `fk_general_practitioner_has_drug_general_practitioner1_idx` (`gp_id`),
  KEY `fk_prescription_patient1_idx` (`p_id`),
  CONSTRAINT `fk_general_practitioner_has_drug_drug1` FOREIGN KEY (`d_id`) REFERENCES `drug` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_general_practitioner_has_drug_general_practitioner1` FOREIGN KEY (`gp_id`) REFERENCES `general_practitioner` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_prescription_patient1` FOREIGN KEY (`p_id`) REFERENCES `patient` (`chi`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES ('bfhoo06912','0812965634','asw2213032','mq95032359',4,'1999-01-20'),('clarw81294','2208663398','sdf2939475','zg93055406',2,'2015-05-18'),('dfgkj38392','3005402592','asw2213032','gf23496889',1,'2006-01-20'),('merer11760','3101974980','fcv0949043','po50094505',3,'2014-06-10'),('mettr44039','2208663398','sdf2939475','gf23496889',5,'2015-01-08'),('pepro83321','3005402592','asw2213032','gf23496889',1,'2007-11-29'),('plote50975','3005402592','asw2213032','op99823820',1,'2015-01-08');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-04  9:40:00
