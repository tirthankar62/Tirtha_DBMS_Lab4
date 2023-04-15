-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: lab4_ecommerce
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'BOOKS'),(2,'GAMES'),(3,'GROCERIES'),(4,'ELECTRONICS'),(5,'CLOTHES');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cus_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(20) NOT NULL DEFAULT '',
  `cus_phone` varchar(10) NOT NULL DEFAULT '',
  `cus_city` varchar(30) NOT NULL DEFAULT '',
  `cus_gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'AAKASH','9999999999','DELHI','M'),(2,'AMAN','9785463215','NOIDA','M'),(3,'NEHA','9999999999','MUMBAI','F'),(4,'MEGHA','9994562399','KOLKATA','F'),(5,'PULKIT','7895999999','LUCKNOW','M');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ord_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ord_amount` int(11) NOT NULL,
  `ord_date` date NOT NULL,
  `cus_id` int(11) unsigned NOT NULL,
  `pricing_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cus_id_fk` (`cus_id`),
  KEY `pricing_id_fk` (`pricing_id`),
  CONSTRAINT `cus_id_fk` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricing_id_fk` FOREIGN KEY (`pricing_id`) REFERENCES `supplier_pricing` (`pricing_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (101,1500,'2021-10-06',2,1),(102,1000,'2021-10-12',3,5),(103,30000,'2021-09-16',5,2),(104,1500,'2021-10-05',1,1),(105,3000,'2021-08-16',4,3),(109,3000,'2021-00-10',5,3),(110,2500,'2021-09-10',2,4),(111,1000,'2021-09-15',4,5),(114,1000,'2021-09-16',3,5),(115,3000,'2021-09-16',5,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pro_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(20) DEFAULT '"Dummy"',
  `pro_desc` varchar(60) DEFAULT NULL,
  `cat_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id_fk` (`cat_id`),
  CONSTRAINT `cat_id_fk` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),(4,'OATS','Highly Nutritious from Nestle',3),(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),(6,'MILK','1L Toned MIlk',3),(7,'Boat Earphones','1.5Meter long Dolby Atmos',4),(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),(9,'Project IGI','compatible with windows 7 and above',2),(10,'Hoodie','Black GUCCI for 13 yrs and above',5),(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1),(12,'Train Your Brain','By Shireen Stephen',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ord_id` int(10) unsigned NOT NULL,
  `rat_ratstars` int(11) DEFAULT NULL,
  PRIMARY KEY (`rat_id`),
  KEY `ord_id_fk` (`ord_id`),
  CONSTRAINT `ord_id_fk` FOREIGN KEY (`ord_id`) REFERENCES `orders` (`ord_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,101,4),(2,102,3),(3,103,1),(4,104,2),(5,105,4),(9,109,3),(10,110,5),(11,111,3),(14,114,1),(15,115,1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(50) NOT NULL DEFAULT '',
  `supp_city` varchar(50) NOT NULL DEFAULT '',
  `supp_phone` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Rajesh Retails','Delhi','1234567890'),(2,'Appario Ltd.','Mumbai','2589631470'),(3,'Knome products','Banglore','9785462315'),(4,'Bansal Retails','Kochi','8975463285'),(5,'Mittal Ltd.','Lucknow','7898456532');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_pricing`
--

DROP TABLE IF EXISTS `supplier_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_pricing` (
  `pricing_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) unsigned NOT NULL,
  `supp_id` int(10) unsigned NOT NULL,
  `supp_price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pricing_id`),
  KEY `pro_id_fk` (`pro_id`),
  KEY `supp_id_fk` (`supp_id`),
  CONSTRAINT `pro_id_fk` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supp_id_fk` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`supp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_pricing`
--

LOCK TABLES `supplier_pricing` WRITE;
/*!40000 ALTER TABLE `supplier_pricing` DISABLE KEYS */;
INSERT INTO `supplier_pricing` VALUES (1,1,2,1500),(2,3,5,30000),(3,5,1,3000),(4,2,3,2500),(5,4,1,1000);
/*!40000 ALTER TABLE `supplier_pricing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 14:32:41
