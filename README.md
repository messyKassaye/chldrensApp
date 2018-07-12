# children
this project is aimed to solve children management system for NGO's which are working on childrens.
The project is developed using JEE and development tool is NetBeans

Database
-----------
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: childrens
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts`
--

LOCK TABLES `abouts` WRITE;
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boarding_types`
--

DROP TABLE IF EXISTS `boarding_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boarding_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boarding_types`
--

LOCK TABLES `boarding_types` WRITE;
/*!40000 ALTER TABLE `boarding_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `boarding_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `children_addresses`
--

DROP TABLE IF EXISTS `children_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `children_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `children_id` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children_addresses`
--

LOCK TABLES `children_addresses` WRITE;
/*!40000 ALTER TABLE `children_addresses` DISABLE KEYS */;
INSERT INTO `children_addresses` VALUES (1,1,'Ethiopia','Addis Ababa'),(2,0,'Ethiopia','Addis Ababa'),(3,22,'Ethiopia','Addis Ababa'),(4,23,'Ethiopia','Addis Ababa'),(5,24,'Ethiopia','Addis Ababa');
/*!40000 ALTER TABLE `children_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `children_benefits`
--

DROP TABLE IF EXISTS `children_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `children_benefits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children_benefits`
--

LOCK TABLES `children_benefits` WRITE;
/*!40000 ALTER TABLE `children_benefits` DISABLE KEYS */;
/*!40000 ALTER TABLE `children_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `children_profiles`
--

DROP TABLE IF EXISTS `children_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `children_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children_profiles`
--

LOCK TABLES `children_profiles` WRITE;
/*!40000 ALTER TABLE `children_profiles` DISABLE KEYS */;
INSERT INTO `children_profiles` VALUES (1,1,'http://localhost:8080/children/resources/images/featured_child.jpg'),(2,4,'http://localhost:8080/children/resources/images/13321875_126148327805516_7511258035541750314_n.jpg'),(4,6,'http:/localhost:8080/resources/images/13321875_126148327805516_7511258035541750314_n.jpg'),(5,7,'http:/localhost:8080/children/resources/images/13321875_126148327805516_7511258035541750314_n.jpg'),(6,11,'http://localhost:8080/children/resources/images/13321875_126148327805516_7511258035541750314_n.jpg'),(7,12,'http://localhost:8080/children/resources/images/13321875_126148327805516_7511258035541750314_n.jpg'),(8,13,'http://localhost:8080/children/resources/images/Fri Jul 06 21:08:48 EAT 2018messy.jpg'),(9,14,'http://localhost:8080/children/resources/images/Fri Jul 06 21:12:14 EAT 201836639397_1841171012856022_5034481551073607680_n.jpg'),(10,15,'http://localhost:8080/children/resources/images/Fri Jul 06 21:14:06 EAT 2018messy.jpg'),(11,16,'http://localhost:8080/children/resources/images/Fri Jul 06 22:11:02 EAT 201836639397_1841171012856022_5034481551073607680_n.jpg'),(12,17,'http://localhost:8080/children/resources/images/Fri Jul 06 22:13:45 EAT 201836639397_1841171012856022_5034481551073607680_n.jpg'),(13,18,'http://localhost:8080/children/resources/images/Fri Jul 06 22:15:31 EAT 201813321875_126148327805516_7511258035541750314_n.jpg'),(14,19,'http://localhost:8080/children/resources/images/Fri Jul 06 22:19:16 EAT 201813321875_126148327805516_7511258035541750314_n.jpg'),(15,20,'http://localhost:8080/children/resources/images/Fri Jul 06 22:34:00 EAT 2018messy.jpg'),(16,21,'http://localhost:8080/children/resources/images/Sat Jul 07 15:05:51 EAT 2018who-we-are'),(17,22,'http://localhost:8080/children/resources/images/Sat Jul 07 15:27:43 EAT 2018106336178.jpg'),(18,23,'http://localhost:8080/children/resources/images/Sat Jul 07 15:28:42 EAT 2018106386123.jpg'),(19,24,'http://localhost:8080/children/resources/images/Sat Jul 07 15:29:36 EAT 2018106865100.jpg'),(20,25,'http://localhost:8080/children/resources/images/Sat Jul 07 18:43:38 EAT 2018106480434.jpg'),(21,26,'http://localhost:8080/children/resources/images/Sat Jul 07 20:19:18 EAT 2018106889587.jpg'),(22,27,'http://localhost:8080/children/resources/images/Sat Jul 07 20:20:28 EAT 2018106633350.jpg'),(23,28,'http://localhost:8080/children/resources/images/Sat Jul 07 20:37:13 EAT 2018106423067.jpg');
/*!40000 ALTER TABLE `children_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `childrens`
--

DROP TABLE IF EXISTS `childrens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childrens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `live_with` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speaks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_income` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `history` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sponsor_saying` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `childrens`
--

LOCK TABLES `childrens` WRITE;
/*!40000 ALTER TABLE `childrens` DISABLE KEYS */;
INSERT INTO `childrens` VALUES (22,'Maryamwit','Haile','female','10','Family','','','','','',0),(23,'Meseret','Kassaye','male','11','Family','','','','','',0),(24,'Holla','Kejelicha','male','11','Family','','','','','',0),(25,'Ashenafi','Alemu','male','5','Family','','','','','',0),(26,'Mahder','Girma','female','14','Family','Amharic','','','','',0),(27,'Shewa','Kenna','male','14','Family','Amharic','','','','',0),(28,'Lemma','Tuffa','male','14','Family','Amharic','','','','',0);
/*!40000 ALTER TABLE `childrens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `childrens_houses`
--

DROP TABLE IF EXISTS `childrens_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childrens_houses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `children_id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `childrens_houses`
--

LOCK TABLES `childrens_houses` WRITE;
/*!40000 ALTER TABLE `childrens_houses` DISABLE KEYS */;
INSERT INTO `childrens_houses` VALUES (1,1,'walls','Concrete block',NULL,NULL),(2,1,'Roof','Corrugated tile',NULL,NULL),(3,1,'Floor','Tile',NULL,NULL),(4,1,'My bed','Wooden beds',NULL,NULL),(5,1,'Water source','Running water in home',NULL,NULL),(6,1,'Electricity','Regulated use',NULL,NULL);
/*!40000 ALTER TABLE `childrens_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covers`
--

DROP TABLE IF EXISTS `covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `covers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covers`
--

LOCK TABLES `covers` WRITE;
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
INSERT INTO `covers` VALUES (4,1,'http://localhost:8080/children/resources/images/school.jpeg'),(8,4,'http://localhost:8080/children/resources/images/family.jpeg'),(9,3,'http://localhost:8080/children/resources/images/hope.jpeg');
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `children_id` int(11) NOT NULL,
  `education_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_backgrounds`
--

DROP TABLE IF EXISTS `education_backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_backgrounds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_backgrounds`
--

LOCK TABLES `education_backgrounds` WRITE;
/*!40000 ALTER TABLE `education_backgrounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_backgrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_categories`
--

DROP TABLE IF EXISTS `education_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_categories`
--

LOCK TABLES `education_categories` WRITE;
/*!40000 ALTER TABLE `education_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enjoys`
--

DROP TABLE IF EXISTS `enjoys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enjoys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `children_id` int(11) NOT NULL,
  `enjoys` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enjoys`
--

LOCK TABLES `enjoys` WRITE;
/*!40000 ALTER TABLE `enjoys` DISABLE KEYS */;
INSERT INTO `enjoys` VALUES (1,1,'Playing with friends'),(2,1,'Playing with dolls'),(3,1,'Swimming'),(4,22,'Watching movie');
/*!40000 ALTER TABLE `enjoys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_benefits`
--

DROP TABLE IF EXISTS `family_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_benefits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_benefits`
--

LOCK TABLES `family_benefits` WRITE;
/*!40000 ALTER TABLE `family_benefits` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_foods`
--

DROP TABLE IF EXISTS `favorite_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_foods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `food_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_foods`
--

LOCK TABLES `favorite_foods` WRITE;
/*!40000 ALTER TABLE `favorite_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_subjects`
--

DROP TABLE IF EXISTS `favorite_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_subjects`
--

LOCK TABLES `favorite_subjects` WRITE;
/*!40000 ALTER TABLE `favorite_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healths`
--

DROP TABLE IF EXISTS `healths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `health_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `community_health_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healths`
--

LOCK TABLES `healths` WRITE;
/*!40000 ALTER TABLE `healths` DISABLE KEYS */;
/*!40000 ALTER TABLE `healths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hobbies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (1,22,'reading book');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `how_you_helps`
--

DROP TABLE IF EXISTS `how_you_helps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `how_you_helps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `how_you_helps`
--

LOCK TABLES `how_you_helps` WRITE;
/*!40000 ALTER TABLE `how_you_helps` DISABLE KEYS */;
/*!40000 ALTER TABLE `how_you_helps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latrines`
--

DROP TABLE IF EXISTS `latrines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latrines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latrines`
--

LOCK TABLES `latrines` WRITE;
/*!40000 ALTER TABLE `latrines` DISABLE KEYS */;
/*!40000 ALTER TABLE `latrines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lives_withs`
--

DROP TABLE IF EXISTS `lives_withs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lives_withs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lives_withs`
--

LOCK TABLES `lives_withs` WRITE;
/*!40000 ALTER TABLE `lives_withs` DISABLE KEYS */;
/*!40000 ALTER TABLE `lives_withs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (23,'2014_10_12_000000_create_users_table',1),(24,'2014_10_12_100000_create_password_resets_table',1),(25,'2018_06_30_184802_create_wha_we_dos_table',1),(27,'2018_06_30_184845_create_how_you_helps_table',1),(28,'2018_06_30_184856_create_covers_table',1),(29,'2018_06_30_185650_create_roles_table',1),(31,'2018_06_30_190018_create_abouts_table',1),(32,'2018_06_30_190827_create_boarding_types_table',1),(33,'2018_06_30_190853_create_education_table',1),(34,'2018_06_30_190914_create_talents_table',1),(35,'2018_06_30_190953_create_addresses_table',1),(36,'2018_06_30_191723_create_education_categories_table',1),(37,'2018_06_30_191910_create_enjoys_table',1),(38,'2018_07_02_142224_create_childrens_table',2),(39,'2018_07_02_142244_create_siblings_table',2),(40,'2018_07_02_142341_create_addresses_table',3),(42,'2018_07_02_143146_create_lives_withs_table',3),(43,'2018_07_02_145019_create_childrens_table',4),(45,'2018_07_02_160918_create_profiles_table',5),(46,'2018_07_02_183004_create_children_addresses_table',6),(47,'2018_07_02_200513_create_childrens_table',7),(48,'2018_07_02_225044_create_childrens_houses_table',8),(49,'2018_07_03_095701_create_sponsors_table',9),(50,'2018_07_03_100859_create_sponsor_in_needs_table',9),(51,'2018_07_03_150141_create_testimonies_table',10),(61,'2018_07_08_105842_create_families_table',11),(62,'2018_07_08_105905_create_education_backgrounds_table',11),(63,'2018_07_08_105925_create_favorite_subjects_table',11),(64,'2018_07_08_105933_create_favorite_foods_table',11),(65,'2018_07_08_105954_create_healths_table',12),(66,'2018_07_08_110003_create_hobbies_table',13),(67,'2018_07_08_110108_create_children_benefits_table',13),(68,'2018_07_08_110210_create_latrines_table',13),(69,'2018_07_08_110230_create_family_benefits_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siblings`
--

DROP TABLE IF EXISTS `siblings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siblings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siblings`
--

LOCK TABLES `siblings` WRITE;
/*!40000 ALTER TABLE `siblings` DISABLE KEYS */;
INSERT INTO `siblings` VALUES (1,1,'Mekdim','Girma','male','1981-07-03'),(2,1,'Miraf','Girma','female','1978-07-03'),(7,22,'meseret','kassaye','Brother','16-07-2018');
/*!40000 ALTER TABLE `siblings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_in_needs`
--

DROP TABLE IF EXISTS `sponsor_in_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor_in_needs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `children_id` int(11) NOT NULL,
  `needAverage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_in_needs`
--

LOCK TABLES `sponsor_in_needs` WRITE;
/*!40000 ALTER TABLE `sponsor_in_needs` DISABLE KEYS */;
INSERT INTO `sponsor_in_needs` VALUES (1,1,'most',1,NULL,NULL);
/*!40000 ALTER TABLE `sponsor_in_needs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` int(11) NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sponsored_child` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talents`
--

DROP TABLE IF EXISTS `talents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `children_id` int(11) NOT NULL,
  `talents` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talents`
--

LOCK TABLES `talents` WRITE;
/*!40000 ALTER TABLE `talents` DISABLE KEYS */;
INSERT INTO `talents` VALUES (1,1,'Singing'),(2,1,'Painting'),(3,1,'Dancing'),(4,22,'Playing footbal');
/*!40000 ALTER TABLE `talents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonies`
--

DROP TABLE IF EXISTS `testimonies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimony` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonies`
--

LOCK TABLES `testimonies` WRITE;
/*!40000 ALTER TABLE `testimonies` DISABLE KEYS */;
INSERT INTO `testimonies` VALUES (1,'Meseret Kassaye','One person can make all the difference for a child across the globe... Children International is living proof that, although helping just one person can seem like a drop in the ocean, that drop can be a person\'s whole world','http://localhost:8080/children/resources/images/messy.jpg',NULL,NULL);
/*!40000 ALTER TABLE `testimonies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Zobel','Sileshi',1,'zobel@gmail.com','53d346e6fe7231f2e16623529d286b2a',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `what_we_dos`
--

DROP TABLE IF EXISTS `what_we_dos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `what_we_dos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `what_we_dos`
--

LOCK TABLES `what_we_dos` WRITE;
/*!40000 ALTER TABLE `what_we_dos` DISABLE KEYS */;
INSERT INTO `what_we_dos` VALUES (1,'School offering','we offer description here','2018-07-01 22:33:59','2018-07-01 22:33:59'),(3,'Seed Hope','We provide hopes for children','2018-07-02 09:41:06','2018-07-02 09:41:06'),(4,'Famliy Strengthening','We are penetrated to family','2018-07-02 09:41:37','2018-07-02 09:41:37');
/*!40000 ALTER TABLE `what_we_dos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-08 23:23:14
