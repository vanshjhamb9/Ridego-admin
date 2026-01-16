-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ridego_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` longtext COLLATE utf8mb4_general_ci,
  `role` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
INSERT INTO `tbl_admin` VALUES (1,'Super Admin','admin@admin.com','+91','9999999999','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1'),(2,'Manager','test@gmail.com','+91','1111111111','$2b$10$famWghruCJxXSSqABs/ppuFeMRRT9d6CxyEQiNybRUc0rn2M0uHK2','2'),(3,'Support Staff','support@ridego.com','+91','7777777777','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','2'),(4,'Super Admin','admin@ridego.com','+91','9999999999','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1');
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cart_vehicle`
--

DROP TABLE IF EXISTS `tbl_cart_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cart_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_id` longtext COLLATE utf8mb4_general_ci,
  `d_id` longtext COLLATE utf8mb4_general_ci,
  `vehicleid` longtext COLLATE utf8mb4_general_ci,
  `bidding_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidd_auto_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `m_role` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `final_price` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `km_charge` double DEFAULT NULL,
  `additional_time` longtext COLLATE utf8mb4_general_ci,
  `addi_time_price` double DEFAULT NULL,
  `platform_fee` double DEFAULT NULL,
  `weather_price` double DEFAULT NULL,
  `wallet_price` double DEFAULT NULL,
  `extra_charge` double DEFAULT NULL,
  `extra_person_charge` double DEFAULT NULL,
  `day_charge` double DEFAULT NULL,
  `rent_hour` double DEFAULT NULL,
  `rental_addi_ride_time` double DEFAULT NULL,
  `rental_addi_ride_charge` double DEFAULT NULL,
  `rental_hour_charge` double DEFAULT NULL,
  `rental_per_hour_discount` double DEFAULT NULL,
  `rental_extra_km` double DEFAULT NULL,
  `rental_extra_km_charge` double DEFAULT NULL,
  `tot_kg` double DEFAULT NULL,
  `kg_charge` double DEFAULT NULL,
  `coupon_id` longtext COLLATE utf8mb4_general_ci,
  `coupon_amount` double DEFAULT NULL,
  `payment_id` longtext COLLATE utf8mb4_general_ci,
  `tot_km` longtext COLLATE utf8mb4_general_ci,
  `tot_hour` double DEFAULT NULL,
  `tot_minute` double DEFAULT NULL,
  `zone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `package_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `start_time` longtext COLLATE utf8mb4_general_ci,
  `otp` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ride_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `drop_tot` longtext COLLATE utf8mb4_general_ci,
  `drop_complete` longtext COLLATE utf8mb4_general_ci,
  `current_run_time` longtext COLLATE utf8mb4_general_ci,
  `status_time` longtext COLLATE utf8mb4_general_ci,
  `status_time_location` longtext COLLATE utf8mb4_general_ci,
  `status_calculation` longtext COLLATE utf8mb4_general_ci,
  `pic_lat_long` longtext COLLATE utf8mb4_general_ci,
  `drop_lat_long` longtext COLLATE utf8mb4_general_ci,
  `pic_address` longtext COLLATE utf8mb4_general_ci,
  `drop_address` longtext COLLATE utf8mb4_general_ci,
  `driver_id_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `outs_category_id` longtext COLLATE utf8mb4_general_ci,
  `mod_cate_id` longtext COLLATE utf8mb4_general_ci,
  `num_passenger` double DEFAULT NULL,
  `book_date` longtext COLLATE utf8mb4_general_ci,
  `book_time` longtext COLLATE utf8mb4_general_ci,
  `req_id` longtext COLLATE utf8mb4_general_ci,
  `bid_addjust_amount` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_cart_vehicle_chk_1` CHECK (json_valid(`zone`)),
  CONSTRAINT `tbl_cart_vehicle_chk_2` CHECK (json_valid(`package_details`)),
  CONSTRAINT `tbl_cart_vehicle_chk_3` CHECK (json_valid(`driver_id_list`))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cart_vehicle`
--

LOCK TABLES `tbl_cart_vehicle` WRITE;
/*!40000 ALTER TABLE `tbl_cart_vehicle` DISABLE KEYS */;
INSERT INTO `tbl_cart_vehicle` VALUES (41,'687','321','1','0','0','2','1',114.2,0,0,NULL,'0',0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,'9','2.77',0,1,NULL,NULL,'2026-01-16T22:11:27.787Z','1482','0','1','','2026-01-16T22:12:12.160Z&0&1','1&0&6&!!2&0&1','0&2026-01-16T22:11:16.076Z&$0&$0&!!1&2026-01-16T22:11:27.787Z&28.5946646&77.0958488&!!2&2026-01-16T22:12:12.160Z&28.5946646&77.0958488','','28.5928922&!77.0946587','28.610227641629667&!77.11505882441998','Shop No, New Delhi, India&!','Delhi Cantt, New Delhi, India&!Delhi Cantt, New Delhi, India','[]',NULL,NULL,NULL,NULL,NULL,'79',NULL);
/*!40000 ALTER TABLE `tbl_cart_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cash_adjust`
--

DROP TABLE IF EXISTS `tbl_cash_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cash_adjust` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prof_image` longtext COLLATE utf8mb4_general_ci,
  `amount` double DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  `payment_type` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cash_adjust`
--

LOCK TABLES `tbl_cash_adjust` WRITE;
/*!40000 ALTER TABLE `tbl_cash_adjust` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cash_adjust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_chat`
--

DROP TABLE IF EXISTS `tbl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resiver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  `message` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_chat`
--

LOCK TABLES `tbl_chat` WRITE;
/*!40000 ALTER TABLE `tbl_chat` DISABLE KEYS */;
INSERT INTO `tbl_chat` VALUES (4124,'321','687','2026-01-16T22:11:27.861Z','? Your Trip Has Started!'),(4125,'321','687','2026-01-16T22:11:27.941Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(4126,'321','687','2026-01-16T22:12:12.192Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.');
/*!40000 ALTER TABLE `tbl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_chat_new`
--

DROP TABLE IF EXISTS `tbl_chat_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_chat_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receiver` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ccheck` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dcheck` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_chat_new`
--

LOCK TABLES `tbl_chat_new` WRITE;
/*!40000 ALTER TABLE `tbl_chat_new` DISABLE KEYS */;
INSERT INTO `tbl_chat_new` VALUES (185,'321','687','0','1');
/*!40000 ALTER TABLE `tbl_chat_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_chat_save`
--

DROP TABLE IF EXISTS `tbl_chat_save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_chat_save` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resiver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  `message` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_chat_save`
--

LOCK TABLES `tbl_chat_save` WRITE;
/*!40000 ALTER TABLE `tbl_chat_save` DISABLE KEYS */;
INSERT INTO `tbl_chat_save` VALUES (3437,'321','687','2026-01-16T09:51:22.872Z','? Your Trip Has Started!'),(3438,'321','687','2026-01-16T09:51:22.929Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(3439,'321','687','2026-01-16T09:56:56.500Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.'),(3440,'321','687','2026-01-16T09:57:17.554Z','? Your trip has officially started!'),(3441,'321','687','2026-01-16T09:57:29.341Z','⭐ Your final destination has been reached.'),(3442,'321','687','2026-01-16T12:28:28.712Z','? Your Trip Has Started!'),(3443,'321','687','2026-01-16T12:28:28.720Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(3444,'321','687','2026-01-16T12:30:42.359Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.'),(3445,'321','687','2026-01-16T12:31:38.821Z','? Your trip has officially started!'),(3446,'321','687','2026-01-16T12:31:49.291Z','⭐ Your final destination has been reached.'),(3447,'321','687','2026-01-16T14:19:01.892Z','? Your Trip Has Started!'),(3448,'321','687','2026-01-16T14:19:01.950Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(3449,'321','687','2026-01-16T14:21:46.351Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.'),(3450,'321','687','2026-01-16T14:22:21.083Z','? Your trip has officially started!'),(3451,'321','687','2026-01-16T14:22:27.641Z','⭐ Your final destination has been reached.'),(3452,'321','687','2026-01-16T20:35:07.104Z','? Your Trip Has Started!'),(3453,'321','687','2026-01-16T20:35:07.149Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(3454,'321','687','2026-01-16T20:36:55.212Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.'),(3455,'321','687','2026-01-16T20:38:37.328Z','❌ Your Offer has been rejected.'),(3456,'321','687','2026-01-16T20:39:57.702Z','? Your Trip Has Started!'),(3457,'321','687','2026-01-16T20:39:57.714Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(3458,'321','687','2026-01-16T20:40:15.797Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.'),(3459,'321','687','2026-01-16T20:40:25.099Z','❌ Your Offer has been rejected.'),(3460,'321','687','2026-01-16T20:41:30.315Z','? Your Trip Has Started!'),(3461,'321','687','2026-01-16T20:41:30.322Z','? Your Captain is on the way!\nCaptain Vansh  Jhamb will arrive shortly.'),(3462,'321','687','2026-01-16T20:41:37.206Z','?‍♂️ Captain Vansh  Jhamb is about to arrive.Get ready to meet your Captain.'),(3463,'321','687','2026-01-16T20:41:53.855Z','? Your trip has officially started!'),(3464,'321','687','2026-01-16T20:42:09.814Z','⭐ Your final destination has been reached.');
/*!40000 ALTER TABLE `tbl_chat_save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_coupon`
--

DROP TABLE IF EXISTS `tbl_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_general_ci,
  `sub_title` longtext COLLATE utf8mb4_general_ci,
  `code` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_amount` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discount_amount` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_coupon`
--

LOCK TABLES `tbl_coupon` WRITE;
/*!40000 ALTER TABLE `tbl_coupon` DISABLE KEYS */;
INSERT INTO `tbl_coupon` VALUES (1,'Welcome Offer','Get 10% off on your first ride','WELCOME100','2025-01-01','2025-12-31','500','10'),(2,'Flat Discount','Flat ₹50 off on rides above ₹200','FLAT50','2025-01-01','2025-12-31','200','50'),(3,'New User','20% discount for new users','NEWUSER20','2025-01-01','2025-12-31','1000','20');
/*!40000 ALTER TABLE `tbl_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `email` longtext COLLATE utf8mb4_general_ci,
  `country_code` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `referral_code` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wallet` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=688 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (1,'/uploads/customer/customer1.jpg','Rahul Verma','rahul@example.com','+91','9123456789','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'2000.00','2025-01-15'),(2,'/uploads/customer/customer2.jpg','Anjali Mehta','anjali@example.com','+91','9123456790','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'1500.00','2025-01-14'),(3,'/uploads/customer/customer3.jpg','Karan Malhotra','karan@example.com','+91','9123456791','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'3000.00','2025-01-13'),(4,'/uploads/customer/customer4.jpg','Meera Joshi','meera@example.com','+91','9123456792','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'1000.00','2025-01-12'),(5,'/uploads/customer/customer5.jpg','Arjun Nair','arjun@example.com','+91','9123456793','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'5000.00','2025-01-11'),(684,'/uploads/customer/default.jpg','Test User','test@example.com','+91','9876543210','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'5000.00','2026-01-15'),(685,NULL,'Test Customer',NULL,'+91','9876543210','$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC','1',NULL,'5000.00','2026-01-15'),(686,'','Vansh Jhamb','vanshjhamb9@gmail.com','+91','8769626027','$2b$10$2pRSpupjEVueZeymLucxluRlWfLLBrWpIC98fuQ.5YAfa7OwfJl3a','1','848485','0','2026-01-15,11:49:32.338Z'),(687,'','Vansh Jhamb','vanshjhamb95@gmail.com','+91','6283075131','$2b$10$mWIQwBhHCqtWtzdbNLIIu.d7tKGCPX2BxZM0jZqpzkXatqCk32bY.','1','555829','0','2026-01-15,11:51:04.699Z');
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_default_notification`
--

DROP TABLE IF EXISTS `tbl_default_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_default_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_default_notification`
--

LOCK TABLES `tbl_default_notification` WRITE;
/*!40000 ALTER TABLE `tbl_default_notification` DISABLE KEYS */;
INSERT INTO `tbl_default_notification` VALUES (2,'I\'m on my way! ? See you soon at your location.'),(3,'Heading your way now ? – be there shortly!'),(4,'Just a few minutes away from reaching your location ⏱️.'),(5,'On route to your location! ? Looking forward to meeting you soon'),(6,'Almost there! ? Please be ready as I approach your location'),(7,'I’ll be arriving at your location shortly. ? See you soon!'),(8,'Your ride is on the way! ? I’ll be there in just a few.'),(9,'En route! ? I\'ll be at your location in a few minutes.'),(11,'Pickup and Drop-off Request Updated'),(12,'Approaching your pickup point ? – I\'ll be there soon!'),(13,'On my way to your location. ?️ Get ready to ride!');
/*!40000 ALTER TABLE `tbl_default_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_document_setting`
--

DROP TABLE IF EXISTS `tbl_document_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_document_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_general_ci,
  `require_image_side` longtext COLLATE utf8mb4_general_ci,
  `input_require` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `req_field_name` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_document_setting`
--

LOCK TABLES `tbl_document_setting` WRITE;
/*!40000 ALTER TABLE `tbl_document_setting` DISABLE KEYS */;
INSERT INTO `tbl_document_setting` VALUES (1,'Aadhar Card','3','1','1','Aadhar Card Number'),(5,'Driving Licence','2','0','1','');
/*!40000 ALTER TABLE `tbl_document_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_driver`
--

DROP TABLE IF EXISTS `tbl_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_driver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_image` longtext COLLATE utf8mb4_general_ci,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_ccode` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_phoneNo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secound_ccode` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secound_phoneNo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` longtext COLLATE utf8mb4_general_ci,
  `nationality` longtext COLLATE utf8mb4_general_ci,
  `date_of_birth` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `com_address` longtext COLLATE utf8mb4_general_ci,
  `zone` longtext COLLATE utf8mb4_general_ci,
  `language` longtext COLLATE utf8mb4_general_ci,
  `vehicle_image` longtext COLLATE utf8mb4_general_ci,
  `vehicle` longtext COLLATE utf8mb4_general_ci,
  `vehicle_number` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `car_color` longtext COLLATE utf8mb4_general_ci,
  `passenger_capacity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle_prefrence` longtext COLLATE utf8mb4_general_ci,
  `iban_number` longtext COLLATE utf8mb4_general_ci,
  `bank_name` longtext COLLATE utf8mb4_general_ci,
  `account_hol_name` longtext COLLATE utf8mb4_general_ci,
  `vat_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approval_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT '1',
  `wallet` double DEFAULT NULL,
  `tot_payout` double DEFAULT NULL,
  `payout_wallet` double DEFAULT NULL,
  `tot_cash` double DEFAULT NULL,
  `latitude` longtext COLLATE utf8mb4_general_ci,
  `longitude` longtext COLLATE utf8mb4_general_ci,
  `fstatus` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rid_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `check_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  `outstation_status` tinyint(1) NOT NULL DEFAULT '0',
  `rental_status` tinyint(1) NOT NULL DEFAULT '0',
  `package_status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `subscription_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `subscription_start_date` datetime DEFAULT NULL,
  `subscription_end_date` datetime DEFAULT NULL,
  `current_subscription_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_driver`
--

LOCK TABLES `tbl_driver` WRITE;
/*!40000 ALTER TABLE `tbl_driver` DISABLE KEYS */;
INSERT INTO `tbl_driver` VALUES (1,'/uploads/driver/driver1.jpg','Rajesh','Kumar','rajesh@example.com','+91','9876543210',NULL,NULL,'$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1',2050,NULL,NULL,NULL,'28.6139','77.2090','1','0',NULL,NULL,1,1,'1','expired','2025-01-15 00:00:00','2025-01-20 23:59:59',1),(2,'/uploads/driver/driver2.jpg','Amit','Sharma','amit@example.com','+91','9876543211',NULL,NULL,'$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1',2000,NULL,NULL,NULL,'28.7041','77.1025','1','0',NULL,NULL,1,1,'1','expired','2025-01-10 00:00:00','2025-01-20 23:59:59',2),(3,'/uploads/driver/driver3.jpg','Priya','Singh','priya@example.com','+91','9876543212',NULL,NULL,'$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1',0,NULL,NULL,NULL,'28.5355','77.3910','0','0',NULL,NULL,1,1,'1','expired','2025-12-25 18:31:37','2026-01-03 18:31:37',2),(4,'/uploads/driver/driver4.jpg','Vikram','Patel','vikram@example.com','+91','9876543213',NULL,NULL,'$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1',0,NULL,NULL,NULL,'28.4089','77.0378','1','0',NULL,NULL,1,1,'1','none',NULL,NULL,NULL),(5,'/uploads/driver/driver5.jpg','Sneha','Reddy','sneha@example.com','+91','9876543214',NULL,NULL,'$2b$10$jKHWTwFv4YMI/PvEvTsUvON9zMZCrLRyo8KsJGpgZwlQcLQ8/sWdC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1',10000,NULL,NULL,NULL,'28.6139','77.2090','1','0',NULL,NULL,1,1,'1','expired','2025-01-01 00:00:00','2025-01-31 23:59:59',3),(321,'uploads/driver/17676925558441000412651.jpg','Vansh ','Jhamb','vanshjhamb9@gmail.com','+91','8769626027','+91','6283075131','$2b$10$z4HPdSbNtcZlYRUW64Be5e6F1vpJyU0d2pqBBk0eTkaxQTmShmM2O','IN','1910-03-23','Delhi ','3,5','Hindi,English','uploads/driver/17676926208731000374806.png','2','DL54CS0001','white','5','1,2,3,4','451334654376547','SBI ','Vansh ','dummy','1','1',4484.75,0,184.75,31.13,'28.5946685','77.0958522','1','1','1','2026-01-06',0,0,'0','active','2026-01-08 14:57:35','2026-02-05 23:59:59',1);
/*!40000 ALTER TABLE `tbl_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_driver_cart`
--

DROP TABLE IF EXISTS `tbl_driver_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_driver_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_image` longtext COLLATE utf8mb4_general_ci,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_ccode` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_phoneNo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secound_ccode` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secound_phoneNo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` longtext COLLATE utf8mb4_general_ci,
  `nationality` longtext COLLATE utf8mb4_general_ci,
  `date_of_birth` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `com_address` longtext COLLATE utf8mb4_general_ci,
  `zone` longtext COLLATE utf8mb4_general_ci,
  `language` longtext COLLATE utf8mb4_general_ci,
  `vehicle_image` longtext COLLATE utf8mb4_general_ci,
  `vehicle` longtext COLLATE utf8mb4_general_ci,
  `vehicle_number` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `car_color` longtext COLLATE utf8mb4_general_ci,
  `passenger_capacity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle_prefrence` longtext COLLATE utf8mb4_general_ci,
  `iban_number` longtext COLLATE utf8mb4_general_ci,
  `bank_name` longtext COLLATE utf8mb4_general_ci,
  `account_hol_name` longtext COLLATE utf8mb4_general_ci,
  `vat_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approval_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_driver_cart`
--

LOCK TABLES `tbl_driver_cart` WRITE;
/*!40000 ALTER TABLE `tbl_driver_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_driver_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_driver_document`
--

DROP TABLE IF EXISTS `tbl_driver_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_driver_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_general_ci,
  `document_number` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_driver_document`
--

LOCK TABLES `tbl_driver_document` WRITE;
/*!40000 ALTER TABLE `tbl_driver_document` DISABLE KEYS */;
INSERT INTO `tbl_driver_document` VALUES (535,'321','1','uploads/driver_document/17676936642591000412652.jpg&!uploads/driver_document/17676936642831000412653.jpg','526625522826252','1'),(536,'321','5','uploads/driver_document/17676936717251000412628.jpg','','1');
/*!40000 ALTER TABLE `tbl_driver_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_general_settings`
--

DROP TABLE IF EXISTS `tbl_general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_general_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dark_image` longtext COLLATE utf8mb4_general_ci,
  `light_image` longtext COLLATE utf8mb4_general_ci,
  `alert_tone` longtext COLLATE utf8mb4_general_ci,
  `title` longtext COLLATE utf8mb4_general_ci,
  `site_currency` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency_placement` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thousands_separator` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `google_map_key` longtext COLLATE utf8mb4_general_ci,
  `commission_rate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `commisiion_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `weather_price` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `weather_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signup_credit` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refer_credit` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `s_min_withdraw` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `one_app_id` longtext COLLATE utf8mb4_general_ci,
  `one_api_key` longtext COLLATE utf8mb4_general_ci,
  `dformat` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sms_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `msg_key` longtext COLLATE utf8mb4_general_ci,
  `msg_token` longtext COLLATE utf8mb4_general_ci,
  `twilio_sid` longtext COLLATE utf8mb4_general_ci,
  `twilio_token` longtext COLLATE utf8mb4_general_ci,
  `twilio_phoneno` longtext COLLATE utf8mb4_general_ci,
  `outstation` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rental` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `package` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `default_payment` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ride_radius` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle_radius` double DEFAULT NULL,
  `def_driver` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `driver_wait_time` double DEFAULT NULL,
  `driver_wait_price` double DEFAULT NULL,
  `dri_offer_increment` double DEFAULT NULL,
  `offer_time` double DEFAULT NULL,
  `offer_expire_time` double DEFAULT NULL,
  `out_no_min_free_wait` double DEFAULT NULL,
  `out_after_min_wait_price` double DEFAULT NULL,
  `out_tot_offer_increment` double DEFAULT NULL,
  `out_offer_exprie_time_cus` double DEFAULT NULL,
  `out_offer_exprie_time_dri` double DEFAULT NULL,
  `ren_no_min_free_wait` double DEFAULT NULL,
  `ren_after_min_wait_price` double DEFAULT NULL,
  `ren_tot_offer_increment` double DEFAULT NULL,
  `ren_offer_exprie_time_cus` double DEFAULT NULL,
  `ren_offer_exprie_time_dri` double DEFAULT NULL,
  `pack_no_min_free_wait` double DEFAULT NULL,
  `pack_after_min_wait_price` double DEFAULT NULL,
  `pack_tot_offer_increment` double DEFAULT NULL,
  `pack_offer_exprie_time_cus` double DEFAULT NULL,
  `pack_offer_exprie_time_dri` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_general_settings`
--

LOCK TABLES `tbl_general_settings` WRITE;
/*!40000 ALTER TABLE `tbl_general_settings` DISABLE KEYS */;
INSERT INTO `tbl_general_settings` VALUES (1,'****','****','uploads/settings/1727699748459apple_pay.mp3','Ridego','₹','0','1','****','10','%','30','%','10','15','100',NULL,NULL,'undefined','1','****','****','****','****','****','1','1','1','9','10000',50,'1',1,10,10,120,140,1,10,10,60,350,1,10,10,100,60,2,15,10,60,80);
/*!40000 ALTER TABLE `tbl_general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_list_faq`
--

DROP TABLE IF EXISTS `tbl_list_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_list_faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_list_faq`
--

LOCK TABLES `tbl_list_faq` WRITE;
/*!40000 ALTER TABLE `tbl_list_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_list_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_list_pages`
--

DROP TABLE IF EXISTS `tbl_list_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_list_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_list_pages`
--

LOCK TABLES `tbl_list_pages` WRITE;
/*!40000 ALTER TABLE `tbl_list_pages` DISABLE KEYS */;
INSERT INTO `tbl_list_pages` VALUES (1,'Privacy Policy','Privacy Policy\r\n\r\nCSCODETECH built the ZippyGo app as a Free app. This SERVICE is provided by CSCODETECH at no cost and is intended for use as is.\r\n\r\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\r\n\r\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\r\n\r\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at ZippyGo unless otherwise defined in this Privacy Policy.\r\n\r\nInformation Collection and Use\r\n\r\nFor a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.\r\n\r\nThe app does use third-party services that may collect information used to identify you.\r\n\r\nLink to the privacy policy of third-party service providers used by the app\r\n\r\nLog Data\r\n\r\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\r\n\r\nCookies\r\n\r\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device\'s internal memory.\r\n\r\nThis Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\r\n\r\nService Providers\r\n\r\nWe may employ third-party companies and individuals due to the following reasons:\r\n\r\nTo facilitate our Service;\r\nTo provide the Service on our behalf;\r\nTo perform Service-related services; or\r\nTo assist us in analyzing how our Service is used.\r\nWe want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\r\n\r\nSecurity\r\n\r\nWe value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\r\n\r\nLinks to Other Sites\r\n\r\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\r\n\r\nChildren’s Privacy\r\n\r\nThese Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.\r\n\r\nChanges to This Privacy Policy\r\n\r\nWe may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\r\n\r\nThis policy is effective as of 2023-11-05\r\n\r\nContact Us\r\n\r\nIf you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at support@cscodetech.com.','1'),(2,'Terms & Conditions','Terms & Conditions\r\n\r\nBy downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to CSCODETECH.\r\n\r\nCSCODETECH is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\r\n\r\nThe Zigzagbus app stores and processes personal data that you have provided to us, to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Zigzagbus app won’t work properly or at all.\r\n\r\nThe app does use third-party services that declare their Terms and Conditions.\r\n\r\nLink to Terms and Conditions of third-party service providers used by the app\r\n\r\nYou should be aware that there are certain things that CSCODETECH will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but CSCODETECH cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.\r\n\r\nIf you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.\r\n\r\nAlong the same lines, CSCODETECH cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, CSCODETECH cannot accept responsibility.\r\n\r\nWith respect to CSCODETECH’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. CSCODETECH accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.\r\n\r\nAt some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. CSCODETECH does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.\r\n\r\nChanges to This Terms and Conditions\r\n\r\nWe may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.\r\n\r\nThese terms and conditions are effective as of 2023-11-05\r\n\r\nContact Us\r\n\r\nIf you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at support@cscodetech.com.','1'),(3,'Contact Us','We’ll start with some questions and get you to the right place.\r\n\r\nlet’s get you some help. We’re going to ask you some questions and then connect you with a member of our support team.\r\n\r\nCan you describe your issue in a few sentences? This will help our team understand what’s going on.\r\n\r\nSkype: CSCODETECH\r\n\r\nFacebook: CSCODETECH\r\n\r\nWhatsApp: +91 7276465975','1'),(4,'Cancellation  Policy','Terms & Conditions\r\n\r\nBy downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to CSCODETECH.COM.\r\n\r\nCSCODETECH.COM is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\r\n\r\nThe ZippyGo Bus Booking App app stores and processes personal data that you have provided to us, to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the ZippyGo Bus Booking App app won’t work properly or at all.\r\n\r\nThe app does use third-party services that declare their Terms and Conditions.\r\n\r\nLink to Terms and Conditions of third-party service providers used by the app\r\n\r\nYou should be aware that there are certain things that CSCODETECH.COM will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but CSCODETECH.COM cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.\r\n\r\nIf you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.\r\n\r\nAlong the same lines, CSCODETECH.COM cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, CSCODETECH.COM cannot accept responsibility.\r\n\r\nWith respect to CSCODETECH.COM’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. CSCODETECH.COM accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.\r\n\r\nAt some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. CSCODETECH.COM does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.\r\n\r\nChanges to This Terms and Conditions\r\n\r\nWe may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.\r\n\r\nThese terms and conditions are effective as of 2023-10-16\r\n\r\nContact Us\r\n\r\nIf you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at support@cscodetech.com.','1');
/*!40000 ALTER TABLE `tbl_list_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_module_setting`
--

DROP TABLE IF EXISTS `tbl_module_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_module_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_module_setting`
--

LOCK TABLES `tbl_module_setting` WRITE;
/*!40000 ALTER TABLE `tbl_module_setting` DISABLE KEYS */;
INSERT INTO `tbl_module_setting` VALUES (1,'uploads/module_setting/1724500203390download (8) 1.png','Outstation','Travel beyond city limits with ease. Book reliable rides for out-of-town trips with flexible return options.'),(2,'uploads/module_setting/1724500232696download (24) 1.png','Hourly Rental','Need a ride for a few hours? Get a car and driver at your service—perfect for meetings, shopping, or city tours.'),(3,'uploads/module_setting/1724500268590download (16) 1.png','Package','Choose from pre-set ride packages tailored for popular routes or durations. Simple, cost-effective, and hassle-free.');
/*!40000 ALTER TABLE `tbl_module_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order_vehicle`
--

DROP TABLE IF EXISTS `tbl_order_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `d_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicleid` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidding_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidd_auto_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paid_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `final_price` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `coupon_amount` double DEFAULT NULL,
  `addi_time_price` double DEFAULT NULL,
  `platform_fee` double DEFAULT NULL,
  `weather_price` double DEFAULT NULL,
  `wallet_price` double DEFAULT NULL,
  `tot_km` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tot_hour` double DEFAULT NULL,
  `tot_minute` double DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `m_role` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coupon_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `additional_time` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ride_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `drop_tot` longtext COLLATE utf8mb4_general_ci,
  `drop_complete` longtext COLLATE utf8mb4_general_ci,
  `current_run_time` longtext COLLATE utf8mb4_general_ci,
  `status_time` longtext COLLATE utf8mb4_general_ci,
  `status_time_location` longtext COLLATE utf8mb4_general_ci,
  `status_calculation` longtext COLLATE utf8mb4_general_ci,
  `pic_lat_long` longtext COLLATE utf8mb4_general_ci,
  `drop_lat_long` longtext COLLATE utf8mb4_general_ci,
  `pic_address` longtext COLLATE utf8mb4_general_ci,
  `drop_address` longtext COLLATE utf8mb4_general_ci,
  `payment_img` longtext COLLATE utf8mb4_general_ci,
  `cancel_reason` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `req_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `km_charge` double DEFAULT NULL,
  `extra_charge` double DEFAULT NULL,
  `extra_person_charge` double DEFAULT NULL,
  `day_charge` double DEFAULT NULL,
  `rent_hour` double DEFAULT NULL,
  `rental_addi_ride_time` double DEFAULT NULL,
  `rental_addi_ride_charge` double DEFAULT NULL,
  `rental_hour_charge` double DEFAULT NULL,
  `rental_per_hour_discount` double DEFAULT NULL,
  `rental_extra_km` double DEFAULT NULL,
  `rental_extra_km_charge` double DEFAULT NULL,
  `tot_kg` double DEFAULT NULL,
  `kg_charge` double DEFAULT NULL,
  `zone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `package_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `outs_category_id` longtext COLLATE utf8mb4_general_ci,
  `mod_cate_id` longtext COLLATE utf8mb4_general_ci,
  `num_passenger` double DEFAULT NULL,
  `book_date` longtext COLLATE utf8mb4_general_ci,
  `book_time` longtext COLLATE utf8mb4_general_ci,
  `bid_addjust_amount` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_order_vehicle_chk_1` CHECK (json_valid(`zone`)),
  CONSTRAINT `tbl_order_vehicle_chk_2` CHECK (json_valid(`package_details`))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_vehicle`
--

LOCK TABLES `tbl_order_vehicle` WRITE;
/*!40000 ALTER TABLE `tbl_order_vehicle` DISABLE KEYS */;
INSERT INTO `tbl_order_vehicle` VALUES (33,'687','321','2','0','0','1','184.75',197.07,197.07,0,0,12.316666666666666,0,0,'0.06',0,0,'8','','1','','0','7','2026-01-16T09:51:18.045Z','2026-01-16T09:57:29.329Z','1','0','','1&0&7&!!2&0&1&!!3&0&0&!!7&undefined&undefined','0&2026-01-16T09:51:18.045Z&$0&$0&!!1&2026-01-16T09:51:22.739Z&28.6047631&77.0544493&!!2&2026-01-16T09:56:56.473Z&28.605256&77.0541354&!!3&2026-01-16T09:57:15.372Z&28.6052528&77.054294&!!5&2026-01-16T09:57:17.430Z&28.6052528&77.054294&!!7&2026-01-16T09:57:29.329Z&28.6052528&77.054294&!!8&2026-01-16T09:59:24.478Z&0&0','Order Accepted&&3:21 PM&0.06&0&!!महान क्रान्तिकारी राम प्रसाद बिस्मिल वाटिका, Delhi, India&&3:27 PM&0&0&!!D10, Dev Kunj, Dada dev mandir road, Delhi, India&D10, Dev Kunj, Dada dev mandir road, Delhi, India&0&0&0','28.6046555&!77.0544789','28.57820290045431&!77.07653559744358','महान क्रान्तिकारी राम प्रसाद बिस्मिल वाटिका, Delhi, India&!','D10, Dev Kunj, Dada dev mandir road, Delhi, India&!D10, Dev Kunj, Dada dev mandir road, Delhi, India','','','35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'687','321','2','0','0','1','167.5',178.67,178.67,0,0,11.166666666666666,0,0,'0.01',0,0,'8','9','1','','0','7','2026-01-16T12:28:24.053Z','2026-01-16T12:31:49.284Z','1','0','','1&0&5&!!2&0&1&!!3&0&0&!!7&undefined&undefined','0&2026-01-16T12:28:24.053Z&$0&$0&!!1&2026-01-16T12:28:28.685Z&28.60516&77.0543367&!!2&2026-01-16T12:30:42.351Z&28.605225&77.0542933&!!3&2026-01-16T12:31:30.600Z&28.605225&77.0542933&!!5&2026-01-16T12:31:38.702Z&28.605225&77.0542933&!!7&2026-01-16T12:31:49.284Z&28.605225&77.0542933&!!8&2026-01-16T12:47:03.452Z&0&0','Order Accepted&&5:58 PM&0.01&0&!!224 Dada Dev Tower 2nd Floor Behind Akash Hospital, main road, rajapuri chowk, opp sector 4 dwarka, New Delhi, India&&6:01 PM&0&0&!!Dwarika Sec-14, Delhi, India&Dwarika Sec-14, Delhi, India&0&0&0','28.6050841&!77.0543251','28.599011584833587&!77.02974244952202','224 Dada Dev Tower 2nd Floor Behind Akash Hospital, main road, rajapuri chowk, opp sector 4 dwarka, New Delhi, India&!','Dwarika Sec-14, Delhi, India&!Dwarika Sec-14, Delhi, India','','','36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'687','321','2','0','0','1','179.35',191.31,191.31,0,0,11.956666666666669,0,0,'0.01',0,0,'8','9','1','','0','7','2026-01-16T14:18:57.136Z','2026-01-16T14:22:27.632Z','1','0','','1&0&7&!!2&0&1&!!3&0&0&!!7&undefined&undefined','0&2026-01-16T14:18:57.136Z&$0&$0&!!1&2026-01-16T14:19:01.864Z&28.60513&77.0543117&!!2&2026-01-16T14:21:46.335Z&28.6050667&77.0543583&!!3&2026-01-16T14:22:17.461Z&28.6051367&77.0543083&!!5&2026-01-16T14:22:20.794Z&28.6051367&77.0543083&!!7&2026-01-16T14:22:27.632Z&28.6051367&77.0543083&!!8&2026-01-16T20:30:10.225Z&0&0','Order Accepted&&7:49 PM&0.01&0&!!Thakur Bhawan, Delhi, India&&7:52 PM&0&0&!!D-410, Delhi, India&D-410, Delhi, India&0&0&0','28.6053427&!77.0545686','28.57977042220554&!77.07147259265184','Thakur Bhawan, Delhi, India&!','D-410, Delhi, India&!D-410, Delhi, India','','','37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'687','321','2','0','0','0','120',0,0,0,0,0,0,0,'1.5',0,1,'4','','1','','0','0','2026-01-16T20:35:02.169Z','2026-01-16T20:38:37.328Z','1','','2026-01-16T20:36:55.204Z&0&1','1&0&3&!!2&0&1','0&2026-01-16T20:35:02.169Z&$0&$0&!!1&2026-01-16T20:35:07.001Z&28.5946733&77.0958041&!!2&2026-01-16T20:36:55.204Z&28.5947178&77.0957708&!!4&2026-01-16T20:38:37.328Z&28.5947178&77.0957708','','28.5946752&!77.0957834','28.58119659938446&!77.09618546068668','Jbm Public School Nasirpur Road Rz-663, Kh. No 610, New Delhi, India&!','Palam Colony Flyover, New Delhi, India&!Palam Colony Flyover, New Delhi, India','','4','76',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'687','321','2','0','0','0','134.4',0,0,0,0,0,0,0,'1.68',0,1,'4','','1','','0','0','2026-01-16T20:39:43.194Z','2026-01-16T20:40:25.099Z','1','','2026-01-16T20:40:15.791Z&0&1','1&0&3&!!2&0&1','0&2026-01-16T20:39:43.194Z&$0&$0&!!1&2026-01-16T20:39:57.684Z&28.5946721&77.0958338&!!2&2026-01-16T20:40:15.791Z&28.5947178&77.0957708&!!4&2026-01-16T20:40:25.099Z&28.5947178&77.0957708','','28.5960876&!77.093312','28.58119659938446&!77.09618546068668','Jbm Public School Nasirpur Road Rz-663, Kh. No 610, New Delhi, India&!','Palam Colony Flyover, New Delhi, India&!Palam Colony Flyover, New Delhi, India','','8','77',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'687','321','2','0','0','1','120',128,128,0,0,8,0,0,'0.01',0,0,'8','9','1','','0','7','2026-01-16T20:41:28.430Z','2026-01-16T20:42:09.806Z','1','0','','1&0&3&!!2&0&1&!!3&0&0&!!7&undefined&undefined','0&2026-01-16T20:41:28.430Z&$0&$0&!!1&2026-01-16T20:41:30.304Z&28.5946754&77.0958297&!!2&2026-01-16T20:41:37.198Z&28.5947178&77.0957708&!!3&2026-01-16T20:41:49.351Z&28.5947178&77.0957708&!!5&2026-01-16T20:41:53.633Z&28.5947178&77.0957708&!!7&2026-01-16T20:42:09.806Z&28.5947178&77.0957708&!!8&2026-01-16T22:10:45.371Z&0&0','Order Accepted&&2:11 AM&0.01&0&!!Jbm Public School Nasirpur Road Rz-663, Kh. No 610, New Delhi, India&&2:11 AM&0&0&!!Palam Colony Flyover, New Delhi, India&Palam Colony Flyover, New Delhi, India&0&0&0','28.5946776&!77.0957909','28.58119659938446&!77.09618546068668','Jbm Public School Nasirpur Road Rz-663, Kh. No 610, New Delhi, India&!','Palam Colony Flyover, New Delhi, India&!Palam Colony Flyover, New Delhi, India','','','40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_order_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_outstation`
--

DROP TABLE IF EXISTS `tbl_outstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_outstation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `min_km_distance` double DEFAULT NULL,
  `min_km_price` double DEFAULT NULL,
  `after_km_price` double DEFAULT NULL,
  `comission_rate` double DEFAULT NULL,
  `comission_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `extra_charge` double DEFAULT NULL,
  `whether_charge` double DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_general_ci,
  `tot_passenger` double DEFAULT NULL,
  `per_person_price` double DEFAULT NULL,
  `today_price` double DEFAULT NULL,
  `tomorrow_price` double DEFAULT NULL,
  `day_after_price` double DEFAULT NULL,
  `outstation_category` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidding` double DEFAULT NULL,
  `minimum_fare` double DEFAULT NULL,
  `maximum_fare` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_outstation`
--

LOCK TABLES `tbl_outstation` WRITE;
/*!40000 ALTER TABLE `tbl_outstation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_outstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_outstation_category`
--

DROP TABLE IF EXISTS `tbl_outstation_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_outstation_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `title` longtext COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_outstation_category`
--

LOCK TABLES `tbl_outstation_category` WRITE;
/*!40000 ALTER TABLE `tbl_outstation_category` DISABLE KEYS */;
INSERT INTO `tbl_outstation_category` VALUES (1,'/uploads/outstation/oneway.png','One Way','One way outstation trips'),(2,'/uploads/outstation/roundtrip.png','Round Trip','Round trip outstation journeys'),(3,'/uploads/outstation/multicity.png','Multi City','Multi-city outstation packages');
/*!40000 ALTER TABLE `tbl_outstation_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_package`
--

DROP TABLE IF EXISTS `tbl_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_package` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `sub_title` longtext COLLATE utf8mb4_general_ci,
  `vehicle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `up_to_km` double DEFAULT NULL,
  `up_to_fee` double DEFAULT NULL,
  `addi_km_rate` double DEFAULT NULL,
  `per_kg_price` double DEFAULT NULL,
  `num_of_kg` double DEFAULT NULL,
  `radius_km` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `comission_rate` double DEFAULT NULL,
  `comission_type` longtext COLLATE utf8mb4_general_ci,
  `extra_charge` double DEFAULT NULL,
  `bidding` double DEFAULT NULL,
  `minimum_fare` double DEFAULT NULL,
  `maximum_fare` double DEFAULT NULL,
  `whether_charge` double DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_package_chk_1` CHECK (json_valid(`vehicle`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_package`
--

LOCK TABLES `tbl_package` WRITE;
/*!40000 ALTER TABLE `tbl_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_package_category`
--

DROP TABLE IF EXISTS `tbl_package_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_package_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_package_category`
--

LOCK TABLES `tbl_package_category` WRITE;
/*!40000 ALTER TABLE `tbl_package_category` DISABLE KEYS */;
INSERT INTO `tbl_package_category` VALUES (1,'/uploads/package/hourly.png','Hourly Package','1'),(2,'/uploads/package/daily.png','Daily Package','1'),(3,'/uploads/package/weekly.png','Weekly Package','1');
/*!40000 ALTER TABLE `tbl_package_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_detail`
--

DROP TABLE IF EXISTS `tbl_payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `sub_title` longtext COLLATE utf8mb4_general_ci,
  `attribute` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wallet_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_detail`
--

LOCK TABLES `tbl_payment_detail` WRITE;
/*!40000 ALTER TABLE `tbl_payment_detail` DISABLE KEYS */;
INSERT INTO `tbl_payment_detail` VALUES (1,'uploads/payment_list/17098022671711672813725.png','Cash','Card, UPI, Net banking, Wallet(Phone Pe, Amazon Pay, Freecharge)','rzp_key','1','1'),(2,'uploads/payment_list/17097954028291672813747.png','Card','Credit/Debit card with Easier way to pay – online and on your mobile.','id,key,sandbox','1','1'),(3,'uploads/payment_list/17097955139101672813758.png','UPI','Accept all major debit and credit cards from customers in every country','pk_key,sk_key','1','1'),(4,'uploads/payment_list/17097955700771672813772.png','Wallet','Credit/Debit card with Easier way to pay – online and on your mobile.','pk_key,sk_key','1','1'),(5,'uploads/payment_list/17097956305001672813786.png','FlutterWave','Card,pay with USSD,pay with bank,pay with barter','FLWSECK_key','1','1'),(6,'uploads/payment_list/17097957151031672813807.png','SenangPay','Accept all major debit and credit cards all Related Banks','id,key','1','1'),(7,'uploads/payment_list/17097958346971702644748.png','Payfast','Card, pay with USSD, pay with bank, pay with barter','id,key,0','1','1'),(8,'uploads/payment_list/17097958666741702644757.png','Midtrans','Card, pay with USSD, pay with bank, pay with barter','SB-Mid-client-key,SB-Mid-server-key,0','1','1'),(9,'uploads/payment_list/1726051224285download.png','Cash','Cash pay','','1','1'),(10,'uploads/payment_list/1726051286230QR CODE Images@2x.png','Pay with QR Code','Pay with QR Code pay','uploads/payment_list/1726217805756download (1).png','1','1'),(11,'uploads/payment_list/1726051410558a.jpg','Bank Account','Card, pay with USSD, pay with bank, pay with barter','abc,test,23423543565436456,DSFDSF123,FSDS454','1','1');
/*!40000 ALTER TABLE `tbl_payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rental`
--

DROP TABLE IF EXISTS `tbl_rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rental` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `per_hour_charge` double DEFAULT NULL,
  `per_hour_discount` double DEFAULT NULL,
  `num_of_hour` double DEFAULT NULL,
  `min_far_limit_km` double DEFAULT NULL,
  `after_min_charge` double DEFAULT NULL,
  `after_km_charge` double DEFAULT NULL,
  `comission_rate` double DEFAULT NULL,
  `comission_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `extra_charge` double DEFAULT NULL,
  `vehicle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `bidding` double DEFAULT NULL,
  `minimum_fare` double DEFAULT NULL,
  `maximum_fare` double DEFAULT NULL,
  `whether_charge` double DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_rental_chk_1` CHECK (json_valid(`vehicle`))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rental`
--

LOCK TABLES `tbl_rental` WRITE;
/*!40000 ALTER TABLE `tbl_rental` DISABLE KEYS */;
INSERT INTO `tbl_rental` VALUES (1,'/uploads/rental/economy.png','Economy Rental',500,50,1,5,10,8,15,'%',20,NULL,0,NULL,NULL,0,'1'),(2,'/uploads/rental/standard.png','Standard Rental',800,80,1,5,15,12,15,'%',30,NULL,0,NULL,NULL,0,'1'),(3,'/uploads/rental/premium.png','Premium Rental',1200,120,1,5,20,18,15,'%',50,NULL,1,1000,5000,1,'1');
/*!40000 ALTER TABLE `tbl_rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_request_vehicle`
--

DROP TABLE IF EXISTS `tbl_request_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_request_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_id` longtext COLLATE utf8mb4_general_ci,
  `d_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `vehicleid` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidding_d_price` longtext COLLATE utf8mb4_general_ci,
  `bidding_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidd_auto_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `m_role` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `km_charge` double DEFAULT NULL,
  `extra_charge` double DEFAULT NULL,
  `weather_charge` double DEFAULT NULL,
  `platform_fee` double DEFAULT NULL,
  `extra_person_charge` double DEFAULT NULL,
  `day_charge` double DEFAULT NULL,
  `rent_hour` double DEFAULT NULL,
  `rental_hour_charge` double DEFAULT NULL,
  `rental_per_hour_discount` double DEFAULT NULL,
  `rental_extra_km` double DEFAULT NULL,
  `rental_extra_km_charge` double DEFAULT NULL,
  `tot_kg` double DEFAULT NULL,
  `kg_charge` double DEFAULT NULL,
  `coupon_id` longtext COLLATE utf8mb4_general_ci,
  `coupon_price` double DEFAULT NULL,
  `payment_id` longtext COLLATE utf8mb4_general_ci,
  `tot_km` longtext COLLATE utf8mb4_general_ci,
  `tot_hour` double DEFAULT NULL,
  `tot_minute` double DEFAULT NULL,
  `zone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `package_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status_time_location` longtext COLLATE utf8mb4_general_ci,
  `start_time` longtext COLLATE utf8mb4_general_ci,
  `pic_lat_long` longtext COLLATE utf8mb4_general_ci,
  `drop_lat_long` longtext COLLATE utf8mb4_general_ci,
  `pic_address` longtext COLLATE utf8mb4_general_ci,
  `drop_address` longtext COLLATE utf8mb4_general_ci,
  `outs_category_id` longtext COLLATE utf8mb4_general_ci,
  `mod_cate_id` longtext COLLATE utf8mb4_general_ci,
  `num_passenger` double DEFAULT NULL,
  `book_date` longtext COLLATE utf8mb4_general_ci,
  `book_time` longtext COLLATE utf8mb4_general_ci,
  `bid_addjust_amount` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_request_vehicle_chk_1` CHECK (json_valid(`d_id`)),
  CONSTRAINT `tbl_request_vehicle_chk_2` CHECK (json_valid(`zone`)),
  CONSTRAINT `tbl_request_vehicle_chk_3` CHECK (json_valid(`package_details`))
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_request_vehicle`
--

LOCK TABLES `tbl_request_vehicle` WRITE;
/*!40000 ALTER TABLE `tbl_request_vehicle` DISABLE KEYS */;
INSERT INTO `tbl_request_vehicle` VALUES (64,'1','[1]','1','','0','0','0','normal',250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'1','6.2',0,25,NULL,NULL,'','2026-01-09T14:39:15.625Z','28.6304&!77.2177','28.6129&!77.2295','Connaught Place&!New Delhi, Delhi 110001','India Gate&!Rajpath, New Delhi, Delhi 110003',NULL,NULL,NULL,NULL,NULL,NULL),(65,'1','[1]','1','','0','0','0','normal',250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'1','6.2',0,25,NULL,NULL,'','2026-01-09T14:39:52.901Z','28.6304&!77.2177','28.6129&!77.2295','Connaught Place&!New Delhi, Delhi 110001','India Gate&!Rajpath, New Delhi, Delhi 110003',NULL,NULL,NULL,NULL,NULL,NULL),(67,'686','[]','2','','0','0','0','1',194.05,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'9','4.27',0,9,NULL,NULL,'','2026-01-15T12:41:45.025Z','28.6050026&!77.0543272','28.567025239757307&!77.06060763448477','G-252A, Vishwas park, Delhi, India&!','Sun Set Park Dwarka, New Delhi, India&!Sun Set Park Dwarka, New Delhi, India',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_request_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review_customer`
--

DROP TABLE IF EXISTS `tbl_review_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_review_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `driver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `def_review` longtext COLLATE utf8mb4_general_ci,
  `review` longtext COLLATE utf8mb4_general_ci,
  `tot_star` double DEFAULT NULL,
  `date` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_customer`
--

LOCK TABLES `tbl_review_customer` WRITE;
/*!40000 ALTER TABLE `tbl_review_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_review_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review_driver`
--

DROP TABLE IF EXISTS `tbl_review_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_review_driver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `def_review` longtext COLLATE utf8mb4_general_ci,
  `review` longtext COLLATE utf8mb4_general_ci,
  `tot_star` double DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_driver`
--

LOCK TABLES `tbl_review_driver` WRITE;
/*!40000 ALTER TABLE `tbl_review_driver` DISABLE KEYS */;
INSERT INTO `tbl_review_driver` VALUES (335,'321','687','34','2','',5,'2026-01-16T12:47:07.638Z'),(336,'321','687','35','3','',5,'2026-01-16T20:30:14.219Z'),(337,'321','687','38','2','',1,'2026-01-16T22:10:48.954Z');
/*!40000 ALTER TABLE `tbl_review_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ride_cancel_reason`
--

DROP TABLE IF EXISTS `tbl_ride_cancel_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ride_cancel_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ride_cancel_reason`
--

LOCK TABLES `tbl_ride_cancel_reason` WRITE;
/*!40000 ALTER TABLE `tbl_ride_cancel_reason` DISABLE KEYS */;
INSERT INTO `tbl_ride_cancel_reason` VALUES (2,'Financing fell through','1'),(3,'Inspection issues','1'),(4,'Change in financial situation','1'),(5,'Title issues','1'),(6,'Seller changes their mind','1'),(7,'Competing offer','1'),(8,'Personal reason','1');
/*!40000 ALTER TABLE `tbl_ride_cancel_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ride_review_reason`
--

DROP TABLE IF EXISTS `tbl_ride_review_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ride_review_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ride_review_reason`
--

LOCK TABLES `tbl_ride_review_reason` WRITE;
/*!40000 ALTER TABLE `tbl_ride_review_reason` DISABLE KEYS */;
INSERT INTO `tbl_ride_review_reason` VALUES (2,'Comfortable ride','1'),(3,'Professional ride','1'),(4,'Affordable','1'),(5,'Clean Helmet','1');
/*!40000 ALTER TABLE `tbl_ride_review_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role_permission`
--

DROP TABLE IF EXISTS `tbl_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_general_ci,
  `email` longtext COLLATE utf8mb4_general_ci,
  `country_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `driver` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle_pre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc_setting` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `def_notification` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `out_category` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `out_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `out_setting` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rental_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rental_setting` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pack_category` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pack_setting` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ride_cancel_reason` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ride_review_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle_report` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `outstation_report` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rental_report` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `package_report` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coupon` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payout_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `faq_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_notification` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `page_list` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `setting` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role_permission`
--

LOCK TABLES `tbl_role_permission` WRITE;
/*!40000 ALTER TABLE `tbl_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_send_notification`
--

DROP TABLE IF EXISTS `tbl_send_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_send_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `title` longtext COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  `customer` longtext COLLATE utf8mb4_general_ci,
  `driver` longtext COLLATE utf8mb4_general_ci,
  `count` double DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_send_notification`
--

LOCK TABLES `tbl_send_notification` WRITE;
/*!40000 ALTER TABLE `tbl_send_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_send_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subscription_history`
--

DROP TABLE IF EXISTS `tbl_subscription_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subscription_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver_id` int NOT NULL,
  `subscription_plan_id` int NOT NULL,
  `wallet_transaction_id` int DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity_days` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `driver_id` (`driver_id`),
  KEY `subscription_plan_id` (`subscription_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subscription_history`
--

LOCK TABLES `tbl_subscription_history` WRITE;
/*!40000 ALTER TABLE `tbl_subscription_history` DISABLE KEYS */;
INSERT INTO `tbl_subscription_history` VALUES (1,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 11:51:59'),(2,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 11:51:59'),(3,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 11:51:59'),(4,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 11:51:59'),(5,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 11:53:01'),(6,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 11:53:01'),(7,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 11:53:01'),(8,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 11:53:01'),(9,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 11:53:07'),(10,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 11:53:07'),(11,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 11:53:07'),(12,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 11:53:07'),(13,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 11:54:13'),(14,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 11:54:13'),(15,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 11:54:13'),(16,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 11:54:13'),(17,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 11:54:16'),(18,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 11:54:16'),(19,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 11:54:16'),(20,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 11:54:16'),(21,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 11:55:29'),(22,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 11:55:29'),(23,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 11:55:29'),(24,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 11:55:29'),(25,1,1,NULL,'2025-01-15 00:00:00','2025-01-20 23:59:59',500.00,5,'expired','2026-01-04 12:42:02'),(26,2,2,NULL,'2025-01-10 00:00:00','2025-01-20 23:59:59',1000.00,10,'expired','2026-01-04 12:42:02'),(27,3,2,NULL,'2025-12-25 18:31:37','2026-01-03 18:31:37',1000.00,10,'expired','2026-01-04 12:42:02'),(28,5,3,NULL,'2025-01-01 00:00:00','2025-01-31 23:59:59',2500.00,30,'expired','2026-01-04 12:42:02'),(29,321,5,1,'2026-01-06 12:54:48','2026-01-21 23:59:59',1500.00,15,'active','2026-01-06 12:54:48'),(30,321,5,2,'2026-01-06 12:54:57','2026-01-21 23:59:59',1500.00,15,'active','2026-01-06 12:54:57'),(31,321,5,3,'2026-01-06 12:57:49','2026-01-21 23:59:59',1500.00,15,'active','2026-01-06 12:57:49'),(32,321,2,4,'2026-01-06 13:09:14','2026-01-16 23:59:59',1000.00,10,'active','2026-01-06 13:09:14'),(33,321,5,5,'2026-01-06 13:09:39','2026-01-21 23:59:59',1500.00,15,'active','2026-01-06 13:09:39'),(34,321,2,6,'2026-01-06 13:35:22','2026-01-16 23:59:59',1000.00,10,'active','2026-01-06 13:35:22'),(35,321,2,7,'2026-01-06 13:35:27','2026-01-16 23:59:59',1000.00,10,'active','2026-01-06 13:35:27'),(36,321,2,8,'2026-01-06 13:35:31','2026-01-16 23:59:59',1000.00,10,'active','2026-01-06 13:35:31'),(37,321,2,10,'2026-01-06 13:52:30','2026-01-16 23:59:59',1000.00,10,'active','2026-01-06 13:52:30'),(38,321,5,11,'2026-01-07 14:29:41','2026-01-22 23:59:59',1500.00,15,'active','2026-01-07 14:29:41'),(39,321,4,12,'2026-01-08 11:10:00','2026-01-15 23:59:59',700.00,7,'active','2026-01-08 11:10:00'),(40,321,2,13,'2026-01-08 11:10:47','2026-01-18 23:59:59',1000.00,10,'active','2026-01-08 11:10:47'),(41,321,1,14,'2026-01-08 11:37:41','2026-01-24 23:59:59',500.00,5,'active','2026-01-08 11:37:41'),(42,321,1,15,'2026-01-08 14:56:13','2026-01-30 23:59:59',500.00,5,'active','2026-01-08 14:56:14'),(43,321,1,16,'2026-01-08 14:57:35','2026-02-05 23:59:59',500.00,5,'active','2026-01-08 14:57:35');
/*!40000 ALTER TABLE `tbl_subscription_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subscription_plans`
--

DROP TABLE IF EXISTS `tbl_subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subscription_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity_days` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subscription_plans`
--

LOCK TABLES `tbl_subscription_plans` WRITE;
/*!40000 ALTER TABLE `tbl_subscription_plans` DISABLE KEYS */;
INSERT INTO `tbl_subscription_plans` VALUES (1,'5 Day Plan',500.00,5,1,'2026-01-04 11:51:59','2026-01-04 11:51:59'),(2,'10 Day Plan',1000.00,10,1,'2026-01-04 11:51:59','2026-01-04 11:51:59'),(3,'30 Day Plan',2500.00,30,1,'2026-01-04 11:51:59','2026-01-04 11:51:59'),(4,'7 Day Plan',700.00,7,1,'2026-01-04 11:51:59','2026-01-04 11:51:59'),(5,'15 Day Plan',1500.00,15,1,'2026-01-04 11:51:59','2026-01-04 11:51:59');
/*!40000 ALTER TABLE `tbl_subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction_customer`
--

DROP TABLE IF EXISTS `tbl_transaction_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaction_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction_customer`
--

LOCK TABLES `tbl_transaction_customer` WRITE;
/*!40000 ALTER TABLE `tbl_transaction_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_transaction_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction_driver`
--

DROP TABLE IF EXISTS `tbl_transaction_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaction_driver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `d_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction_driver`
--

LOCK TABLES `tbl_transaction_driver` WRITE;
/*!40000 ALTER TABLE `tbl_transaction_driver` DISABLE KEYS */;
INSERT INTO `tbl_transaction_driver` VALUES (489,'1','0','500.00','2026-01-04 18:31:37','1','subscription_recharge'),(490,'2','0','1000.00','2026-01-04 18:31:37','1','subscription_recharge'),(491,'5','0','2500.00','2026-01-04 18:31:37','1','subscription_recharge'),(492,'1','0','500.00','2025-12-30 18:31:37','1',''),(493,'1','0','750.00','2026-01-01 18:31:37','1',''),(494,'1','0','300.00','2026-01-03 18:31:37','1',''),(495,'2','0','400.00','2025-12-31 18:31:37','1',''),(496,'2','0','600.00','2026-01-02 18:31:37','1',''),(497,'5','0','2000.00','2025-12-25 18:31:37','1',''),(498,'5','0','1500.00','2025-12-28 18:31:37','1',''),(499,'5','0','2500.00','2025-12-30 18:31:37','1',''),(500,'5','0','1500.00','2026-01-02 18:31:37','1',''),(501,'321','33','184.75','2026-01-16T09:59:24.478Z','1',''),(502,'321','34','167.5','2026-01-16T12:47:03.452Z','1',''),(503,'321','35','179.35','2026-01-16T20:30:10.225Z','1',''),(504,'321','38','120','2026-01-16T22:10:45.371Z','1','');
/*!40000 ALTER TABLE `tbl_transaction_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vehicle`
--

DROP TABLE IF EXISTS `tbl_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `map_img` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  `min_km_distance` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `min_km_price` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_km_price` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comission_rate` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comission_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `extra_charge` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passenger_capacity` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bidding` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `whether_charge` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `minimum_fare` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `maximum_fare` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_visible_status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vehicle`
--

LOCK TABLES `tbl_vehicle` WRITE;
/*!40000 ALTER TABLE `tbl_vehicle` DISABLE KEYS */;
INSERT INTO `tbl_vehicle` VALUES (1,'/uploads/vehicle/sedan.png',NULL,'Sedan','Comfortable sedan for city rides','2','50','10','15','%','20','4','0','0','1','','','1'),(2,'/uploads/vehicle/suv.png',NULL,'SUV','Spacious SUV for family trips','2','80','15','15','%','30','6','0','0','1','','','1'),(3,'/uploads/vehicle/hatchback.png',NULL,'Hatchback','Economical hatchback','2','40','8','15','%','15','4','0','0','1','','','1'),(4,'/uploads/vehicle/premium.png',NULL,'Premium Sedan','Premium sedan with luxury features','2','100','20','15','%','50','4','1','1','1','500','2000','1'),(5,'/uploads/vehicle/luxury.png',NULL,'Luxury','Luxury vehicle with premium amenities','2','150','30','15','%','100','4','1','1','1','1000','5000','1');
/*!40000 ALTER TABLE `tbl_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vehicle_preference`
--

DROP TABLE IF EXISTS `tbl_vehicle_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vehicle_preference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `name` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vehicle_preference`
--

LOCK TABLES `tbl_vehicle_preference` WRITE;
/*!40000 ALTER TABLE `tbl_vehicle_preference` DISABLE KEYS */;
INSERT INTO `tbl_vehicle_preference` VALUES (1,'/uploads/preference/ac.png','AC','1'),(2,'/uploads/preference/music.png','Music','1'),(3,'/uploads/preference/wifi.png','WiFi','1'),(4,'/uploads/preference/charging.png','Charging Port','1'),(5,'/uploads/preference/childseat.png','Child Seat','1');
/*!40000 ALTER TABLE `tbl_vehicle_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet_transactions`
--

DROP TABLE IF EXISTS `tbl_wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('wallet_topup','subscription_purchase') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Payment gateway transaction/order ID',
  `subscription_plan_id` int DEFAULT NULL COMMENT 'Only for subscription_purchase type',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_driver_id` (`driver_id`),
  KEY `idx_transaction_type` (`transaction_type`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `tbl_wallet_transactions_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `tbl_driver` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_transactions`
--

LOCK TABLES `tbl_wallet_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_transactions` DISABLE KEYS */;
INSERT INTO `tbl_wallet_transactions` VALUES (1,321,1500.00,'subscription_purchase',NULL,5,'2026-01-06 12:54:48'),(2,321,1500.00,'subscription_purchase',NULL,5,'2026-01-06 12:54:57'),(3,321,1500.00,'subscription_purchase',NULL,5,'2026-01-06 12:57:49'),(4,321,1000.00,'subscription_purchase',NULL,2,'2026-01-06 13:09:14'),(5,321,1500.00,'subscription_purchase',NULL,5,'2026-01-06 13:09:39'),(6,321,1000.00,'subscription_purchase',NULL,2,'2026-01-06 13:35:22'),(7,321,1000.00,'subscription_purchase',NULL,2,'2026-01-06 13:35:27'),(8,321,1000.00,'subscription_purchase',NULL,2,'2026-01-06 13:35:31'),(9,321,10000.00,'wallet_topup','manual_recharge_2026-01-06 19:21:06',NULL,'2026-01-06 13:51:06'),(10,321,1000.00,'subscription_purchase',NULL,2,'2026-01-06 13:52:30'),(11,321,1500.00,'subscription_purchase',NULL,5,'2026-01-07 14:29:41'),(12,321,700.00,'subscription_purchase',NULL,4,'2026-01-08 11:10:00'),(13,321,1000.00,'subscription_purchase',NULL,2,'2026-01-08 11:10:47'),(14,321,500.00,'subscription_purchase',NULL,1,'2026-01-08 11:37:41'),(15,321,500.00,'subscription_purchase',NULL,1,'2026-01-08 14:56:14'),(16,321,500.00,'subscription_purchase',NULL,1,'2026-01-08 14:57:35');
/*!40000 ALTER TABLE `tbl_wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wallet_withdraw`
--

DROP TABLE IF EXISTS `tbl_wallet_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wallet_withdraw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_general_ci,
  `driver_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` longtext COLLATE utf8mb4_general_ci,
  `amount` int DEFAULT NULL,
  `p_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `upi_id` longtext COLLATE utf8mb4_general_ci,
  `paypal_id` longtext COLLATE utf8mb4_general_ci,
  `bank_no` longtext COLLATE utf8mb4_general_ci,
  `bank_ifsc` longtext COLLATE utf8mb4_general_ci,
  `bank_type` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wallet_withdraw`
--

LOCK TABLES `tbl_wallet_withdraw` WRITE;
/*!40000 ALTER TABLE `tbl_wallet_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wallet_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_zippygo_validate`
--

DROP TABLE IF EXISTS `tbl_zippygo_validate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_zippygo_validate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_zippygo_validate`
--

LOCK TABLES `tbl_zippygo_validate` WRITE;
/*!40000 ALTER TABLE `tbl_zippygo_validate` DISABLE KEYS */;
INSERT INTO `tbl_zippygo_validate` VALUES (1,'');
/*!40000 ALTER TABLE `tbl_zippygo_validate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_zone`
--

DROP TABLE IF EXISTS `tbl_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lat_lon` longtext COLLATE utf8mb4_general_ci,
  `lat_lon_polygon` polygon DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_zone`
--

LOCK TABLES `tbl_zone` WRITE;
/*!40000 ALTER TABLE `tbl_zone` DISABLE KEYS */;
INSERT INTO `tbl_zone` VALUES (1,'Central Delhi','1','28.6139,77.2090',NULL),(2,'North Delhi','1','28.7041,77.1025',NULL),(3,'South Delhi','1','28.5355,77.3910',NULL),(4,'East Delhi','1','28.6139,77.2090',NULL),(5,'West Delhi','1','28.4089,77.0378',NULL);
/*!40000 ALTER TABLE `tbl_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-17  4:26:06
