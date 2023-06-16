-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add comment',7,'add_comment'),(26,'Can change comment',7,'change_comment'),(27,'Can delete comment',7,'delete_comment'),(28,'Can view comment',7,'view_comment'),(29,'Can add kindergarten',8,'add_kindergarten'),(30,'Can change kindergarten',8,'change_kindergarten'),(31,'Can delete kindergarten',8,'delete_kindergarten'),(32,'Can view kindergarten',8,'view_kindergarten'),(33,'Can add parent',9,'add_parent'),(34,'Can change parent',9,'change_parent'),(35,'Can delete parent',9,'delete_parent'),(36,'Can view parent',9,'view_parent'),(37,'Can add kindergartenadditionalinfo',10,'add_kindergartenadditionalinfo'),(38,'Can change kindergartenadditionalinfo',10,'change_kindergartenadditionalinfo'),(39,'Can delete kindergartenadditionalinfo',10,'delete_kindergartenadditionalinfo'),(40,'Can view kindergartenadditionalinfo',10,'view_kindergartenadditionalinfo'),(41,'Can add users',11,'add_users'),(42,'Can change users',11,'change_users'),(43,'Can delete users',11,'delete_users'),(44,'Can view users',11,'view_users'),(45,'Can add connections',12,'add_connections'),(46,'Can change connections',12,'change_connections'),(47,'Can delete connections',12,'delete_connections'),(48,'Can view connections',12,'view_connections'),(49,'Can add kindergarten_temp',13,'add_kindergarten_temp'),(50,'Can change kindergarten_temp',13,'change_kindergarten_temp'),(51,'Can delete kindergarten_temp',13,'delete_kindergarten_temp'),(52,'Can view kindergarten_temp',13,'view_kindergarten_temp');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `kindergarten_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `comment` varchar(1500) NOT NULL,
  `grade` tinyint unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_parent_id_idx` (`parent_id`),
  KEY `FK_comment_kindergarten_id_idx` (`kindergarten_id`),
  CONSTRAINT `FK_comment_kindergarten_id` FOREIGN KEY (`kindergarten_id`) REFERENCES `kindergarten` (`kindergarten_id`),
  CONSTRAINT `FK_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `users` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'A warm and loving family daycare with dedicated caregivers, and most importantly, the child arrives and leaves with a smile from the kindergarten!',5,'2018-06-23'),(2,1,2,'My daughter has been there since she was 4 months old and will stay until at least the age of 3! \nIt\'s a perfect, clean, and organized kindergarten with an amazing team that is gentle and attentive to the needs of the toddlers.',5,'2022-05-14'),(3,1,3,'We were fortunate to meet a warm, loving, and accepting team, with a lot of patience and personal attention. There is no doubt that we made the right choice!',5,'2021-08-03'),(4,2,4,'Omer, our child, has been in the kindergarten for over a year now, and we are extremely satisfied! From the moment we entered to the kindergarten, we felt like a family.',5,'2020-07-05'),(5,2,5,'How wonderful it is to send our daughter to the kindergarten and be greeted by a cheerful and pleasant team who clearly love their work. During times like these, it is very reassuring to receive a sense of security and warmth. We are extremely satisfied with our choice and highly recommend it.',5,'2022-12-02'),(6,3,6,'After a \"journey of search\" for the right kindergarten, I know and feel that it was the best choice for us and for Eli. When Eli meets the teacher and the team in the morning, she is filled with happiness and can\'t stop smiling, and it\'s the same when we come to pick her up. Eli is under professional and constant supervision throughout the day. The kindergarten provides her with a full range of developmental activities, and the team always has a smile on their faces. There is constant communication with the kindergarten throughout the day. The kindergarten is well-secured. Highly recommended.',5,'2022-11-03'),(7,3,7,'A very pleasant and colorful kindergarten, with an amazing, dedicated, and professional team that provides warm care and does everything to ensure the well-being of the children. They keep us updated on every little detail and send us lots of pictures and updates about what\'s happening in the kindergarten. The team is lovely, caring, and loving. Highly recommended.',5,'2022-09-11'),(8,5,8,'A stunningly beautiful, clean, and well-organized kindergarten with a wide variety of engaging games, healthy food, and a professional, caring, and sensitive team. This is our first year in the kindergarten, and despite the adjustment and the pressure of being a new mom, I am very satisfied with the kindergarten.',5,'2021-10-08'),(9,5,9,'My twins were in this kindergarten, and now their younger sibling is attending. This kindergarten has high level of care, treatment, and amazing warmth. The children go in with a smile and come back with a smile. There is a dedication to activities tailored to each age group, delicious food cooked daily, and daily pictures to experience everything together with the children.',5,'2022-11-05'),(10,5,10,'The kindergarten has a warm and loving attitude towards every child. There is a wide range of activities that are fully invested in the children, and this investment is evident in their development (we often find ourselves pleasantly surprised by something new our child has learned, without it coming from us). The kindergarten is always clean and the children are engaged. The food is of high quality, and there are well-planned events.',5,'2023-02-24'),(11,2,11,'I am extremely satisfied with the kindergarten. The care for the children is excellent, and the kindergarten fosters independence in the children. The activities are very diverse, the food is tasty and nutritious. All the events in the kindergarten are well-planned. Each child receives personal attention. The kindergarten places a strong emphasis on cleanliness. I will continue to send my child to this kindergarten next year as well.',5,'2023-01-21'),(12,2,12,'We entered Aviv into the kindergarten with concerns, as he is our first child, and we were very worried. After a few days, we quickly realized that our child was in excellent hands. The team is dedicated, loving, and warm, and we couldn\'t be happier that he is there.',4,'2022-03-29'),(13,2,13,'The kindergarten is clean, everything is colorful, the team is number one, fresh food every day, happy children, a variety of enriching activities for the children, and warmth and love are always present. The well-being of the children is their top priority. Simply stunning kindergarten. I highly recommend it to everyone.',5,'2023-01-18'),(14,7,14,'My child entered the kindergarten at 11 months old, and it was quite challenging for him at first. However, with time, he adjusted to the kindergarten and the amazing team that enveloped him with warmth and love. Every day, my child returns clean and happy, and I am extremely satisfied with the team\'s care and treatment of my child. I highly recommend it!',4,'2022-07-21'),(15,8,15,'You know that you made the right choice with the daycare when you see your child smiling and happy as you drop them off in the morning, and when you pick them up at the end of the day and they are still full of smiles, having had a wonderful day. However, the structure of the daycare is old, and if you\'re looking for an ultra-clean place where your child can lick the floors, it may not be the right fit for you.',3,'2022-08-06'),(16,9,16,'A kindergarten with an amazing and warm staff. They invest in the children, caring for them, nurturing them, and showing genuine concern. They are pleasant and always have a smile. Our little one loves going there every morning. I can go to work with peace of mind knowing that my child is in the best hands possible. I highly recommend it to every parent :)',5,'2022-09-16'),(17,10,17,'The kindergarten is filled with love, and the staff invests in learning. The child is excited to come to kindergarten every time, even after holidays and long vacations. He simply walks in joyfully.',5,'2021-07-13'),(18,11,18,'This kindergarten is simply like a family. As a \"worried\" mother, I feel so calm when my child enters through the kindergarten door.',5,'2022-04-23'),(19,12,19,'Excellent kindergarten! My daughter arrives at the kindergarten every morning with a smile and jumps with joy at the staff! The staff is caring and warm. There are plenty of educational activities and investment in the children. Fresh and nutritious food. A place that feels like home! Highly recommended!',5,'2023-02-27'),(20,12,20,'The interaction with parents is conducted with transparency and through collaboration, and as parents, we enjoy a relationship of trust and confidence with the kindergarten staff. They work with the children in groups, deliver educational content, and strive to promote each child\'s development according to their needs and age. The children return happy, with an expanded vocabulary!',5,'2022-03-12'),(21,13,21,'The kindergarten is wonderful, and the staff is warm and loving. I highly recommend it with great love.',5,'2023-01-09'),(22,14,22,'I am extremely satisfied with the kindergarten. The carefully chosen staff is dedicated and amazing, warm and loving. The food is well-prepared, fresh, and diverse every day. There is a plethora of enjoyable activities, and a spacious yard equipped with shade. The kindergarten feels like one big happy family, and this is evident in the children. I highly recommend it from personal experience, with much love.',5,'2021-06-27'),(23,14,23,'A perfect kindergarten!! The experienced and caring staff is exceptional. There is a variety of enriching educational activities, both provided by the kindergarten team and through external providers. The food is healthy, fresh, diverse, and delicious!!!',5,'2021-06-23'),(24,14,24,'The best kindergarten in Herzliya without a shadow of a doubt. The team is warm and loving, providing the children with a second home, warm, embracing, and respectful attitude. They keep the parents updated and provide assistance beyond their role. It is evident that the team loves the children and the work they do.',5,'2019-09-04'),(25,15,25,'The team is wonderful, and the children enter the kindergarten with excitement. I feel calm knowing that my child is in the kindergarten for 9-10 hours and I can trust them. It\'s just a shame that the food is not of high quality and nutritious.',4,'2020-06-16'),(26,16,26,'An amazing and loving team, with precise and organized management led by a assertive and caring kindergarten teacher who invests in the kindergarten and each child in an exceptional way. Highly recommended!',5,'2020-08-29'),(27,17,27,'An amazing and loving team, with precise and organized management by a assertive and caring teacher who invests in the kindergarten and each child in an exceptional way. Highly recommended!',5,'2021-09-28'),(28,18,28,'A kindergarten that feels like home! Perfect in every aspect! The warm and loving team, the dedication and love for the children, the investment and consideration for every detail.',5,'2020-10-06'),(29,20,29,'As a working mother, I was searching for the best place to leave my children. I knew I couldn\'t be 100% calm, but I wanted to be as relaxed as possible. The team showed me that there is such a thing as a perfect kindergarten, a place where you can go to work with peace of mind, knowing that your children are receiving the best care possible. It\'s a kindergarten full of love that prioritizes the safety of the children, from choosing only authorized toys to providing high-quality and home-cooked food every day.',5,'2019-02-27'),(30,22,30,'\nWe chose not to continue with the kindergarten due to the management style of the kindergarten director. Initially, she seemed pleasant, but upon enrollment, it became clear that she was somewhat aggressive, unpleasant, and unwilling to listen to criticism or hear parents\' concerns.',2,'2022-05-30'),(31,24,31,'A dedicated, responsible and consistent staff, fresh food, and attention to each child. Spacious and safe facility with a sunny terrace equipped with play structures, animal activities, songs, and other activities.',5,'2022-08-11'),(32,25,32,'The kindergarten is always clean and well-maintained, and the staff is professional and envelops the children with warmth and love. There are diverse activities such as animal workshops and music, and the children greatly enjoyed them. We had an amazing year, and our daughter was happy to go to kindergarten and developed both motor and sensory skills, which is the true test in my eyes! 100% trust, warmth, love, and professionalism!',5,'2021-08-12'),(33,28,33,'Our daughter is already in her second year at the kindergarten, and there is no doubt that we were fortunate! A warm and loving staff, a spacious and clean facility, and, most importantly, constant warmth and love! Highly recommended with warmth and love.',5,'2021-07-22'),(34,30,34,'From the moment our daughter entered the kindergarten, we felt the warmth and love for the children. The atmosphere is always joyful and pleasant, and it\'s fun to see our daughter come with a smile every morning. Highly recommended!',5,'2022-06-19'),(35,31,35,'A warm and homely atmosphere, warm and loving relationship. Our Emma bonded with the staff from the first moment. Highly recommended!',5,'2022-07-07'),(36,32,36,'To go to work with a peaceful mind and be confident that the child will receive everything they need!!! Enjoyable learning, diverse activities, extracurricular classes, incredibly delicious food. Highly recommended!',5,'2020-08-09'),(37,33,37,'A lovely kindergarten with personal and sensitive attitude towards every child. Our son returns calm and happy, giving us a lot of peace of mind knowing that he is in a place that treats his needs with respect and love.',5,'2023-01-27'),(38,35,38,'An intimate family-oriented kindergarten that gets to know every little detail about the child. A unique and exceptional educational approach that allows the child to develop at their own pace.',5,'2022-01-25'),(39,37,39,'In a family atmosphere, with lots of patience, love, thoughtfulness, and sensitivity, the teachers spend their time with the children - in the park or within the kindergarten. With great attention to the children\'s needs, their interests, and a lot of sensitivity to their souls - the days in the kindergarten are a labor of love for this special period - childhood. As a mother, I am truly and genuinely so calm and happy that my child is experiencing all this goodness.',5,'2022-12-13'),(40,39,40,'A wonderful kindergarten, several levels above other alternatives in the area, and even those outside the area... 1. Great staff. Reliable, transparent, and loving. 2. High-quality food. 3. Attentive and supportive approach to the children.',5,'2021-09-15'),(41,41,41,'This is the best choice I could make for my son. The kindergarten has a family atmosphere, with dedicated care, attentive listening, tenderness, and lots of love. My son is happy to go to kindergarten and is exposed to music, dancing, crafting, daily trips, and healthy food. I highly recommend the kindergarten and the teachers, who are nothing short of amazing!',5,'2022-04-24'),(42,50,42,'Every morning, my daughter goes to kindergarten with joy and excitement. On Saturdays, she talks about wanting to go to kindergarten. We feel that the kindergarten and home are connected in perfect synergy. I have complete confidence that my daughter receives all the attention and love she needs in the kindergarten. Thanks to the dedicated staff, she is developing, growing, and shaping herself as an individual. With a whole heart, I can say that we could not find a better framework for her than this. I have never encountered a framework with such dedication, love, professionalism, attentiveness, and goodwill as in this kindergarten. I wholeheartedly recommend it.',5,'2021-05-15'),(43,50,43,'An amazing team, loving, caring, and embracing! But I think it would have been nice if the activities were more diverse.',4,'2022-02-26'),(44,50,44,'A delightful kindergarten, a warm and very loving staff who invest in each child, invest in enrichment, learning, and the child\'s experience. The only thing that, in my opinion, needs improvement is the food. If you\'re looking for healthy and nourishing food, this is not the place for your child.',3,'2022-07-08'),(45,52,45,'Before enrolling our son Yair, we checked and received many recommendations about the kindergarten and the staff. I can\'t say we\'re not satisfied, but we\'re slightly disappointed with the communication with the parents and the activities in the kindergarten. Our Yair is an intelligent child, but during his time in the kindergarten, he did not develop and learn as much.',2,'2021-05-17'),(46,53,46,'There is a tremendous sense of family that cannot be found elsewhere. The care for each boy and girl is the most personal, caring, and family-oriented! However, it should be noted that the building is old and not well-maintained.',4,'2023-03-03'),(47,53,47,'The girl returns happy and excited every morning to the kindergarten! We are very satisfied, calm, and happy with the choice of the kindergarten. Just be aware that there is no parking at all in the area, and there is a lot of traffic in the morning, so we find ourselves struggling every morning to get to work after dropping off at the kindergarten.',4,'2023-03-16'),(48,55,48,'The kindergarten staff is warm and loving, spreading lots of love and warmth on the children. The teacher is a wonderful woman with a broad and loving heart. It\'s always clean and tidy, but the structure of the kindergarten is a bit problematic because there is only one restroom for all the children. The yard is small and narrow. The activities in the kindergarten could be more diverse.',4,'2023-01-22'),(49,57,49,'The kindergarten is the first place you enter and feel normalcy. It\'s not too clean or too dirty. The level of education is excellent. Each member of the kindergarten staff loves children.',4,'2021-03-17'),(50,60,50,'The teachers are very intolerant; they fired a teacher who worked there for 17 years over a small issue, and the new teacher shouts at the children. In terms of development, the teachers are hardly ever with the children; the children play alone in the yard all the time. There are only 1-2 extracurricular activities per week. All legs are bitten by mosquitoes or fleas. There are no beds or mattresses for the children, only strange sofas. Not recommended.',1,'2022-09-17'),(51,61,51,'The kindergarten is old and quite neglected. Both in terms of the yard, furniture, and the building itself, as well as in terms of toys and games. The management of the kindergarten is lacking - they inform about everything at the last minute, usually in the evening before, and do not respond to questions. The children are outside all the time and barely have any activities. The teachers mainly focus on cooking, and the children are left with the assistants only.',1,'2021-06-27'),(52,63,52,'The staff is excellent. Caring, attentive, and heartfelt. The games are a bit outdated, but the children don\'t mind. The kindergarten director is a bit disconnected...',3,'2022-01-15'),(53,65,53,'The best kindergarten there is. Both of my children attended it. The staff is the most dedicated, both in terms of education and nutrition, inclusiveness, warmth, and love. I highly recommend it!!!',5,'2021-04-13'),(54,67,54,'All three of my children grew up in this kindergarten, and it\'s like a family. There\'s no other way to describe it. The kindergarten manager, is warm, loving, and experienced. She carefully selects her team, provides a homemade meal, and organizes events. The staff is warm, considerate, always greets the children with a smile, sensitive to every issue, and available. All the children always went in with a smile and came back with a smile. Cleanliness is very important in the kindergarten. If you\'re looking for a family, this is the place.',5,'2022-08-25'),(55,68,55,'I highly recommend it! The staff is wonderful, loving, and caring. The child learned a lot in the kindergarten, thanks to the amazing teachers.',4,'2021-09-21'),(56,68,56,'The kindergarten is truly a home away from home. The staff is wonderful, very warm, patient, and affectionate. It\'s evident that they were carefully chosen. There\'s a lot of enrichment - both in extracurricular activities and throughout the day. My child has developed in an amazing way.',4,'2022-08-18'),(57,4,57,'Excellent staff, the children have a great time and don\'t want to go home at the end of the day. Warm atmosphere, lots of activities. All my friends\' children have either been or are in the kindergarten. Highly recommended.',4,'2022-12-15'),(58,4,58,'A cozy and warm kindergarten, with an amazing staff. Lots of activities and events. I am very satisfied with this kindergarten.',4,'2021-11-30'),(59,4,59,'My daughter is happy to go to the kindergarten every day. The staff is excellent and provides a lot of warmth and love. The kindergarten is always open to parents, everything is transparent. It\'s truly enjoyable to be part of this family-like kindergarten.',5,'2022-08-13'),(60,7,60,'The kindergarten staff leads the kindergarten with expertise. They genuinely care for the children, enrich them with educational content, and are there for any problem or question. I highly recommend it!',4,'2021-08-15'),(61,7,61,'Experienced and above-average kindergarten teacher. The assistant staff is patient and caring. Although my son enjoys the kindergarten very much, I would be happier if they put more emphasis on music and artwork',3,'2022-04-07'),(62,8,62,'A large kindergarten with a huge and well-maintained yard, excellent staff, rich educational content, and a perfect kindergarten teacher. Attention to the smallest details, diverse and home-cooked meals, simply no worries and peace of mind. Do yourselves a favor and go see it; you will understand on your own.',4,'2023-02-15'),(63,8,63,'My daughter comes back home happy. Judging by her calmness and joy, I\'m confident she\'s in good hands. The staff is warm and loving, and the kindergarten is clean and organized. However, the food is catered and not fresh and healthy.',3,'2022-08-17'),(64,8,64,'An amazing kindergarten, a seasoned teacher with care, dedication, love, concern, and attentiveness to the children, and a lovely and caring kindergarten staff. A clean and organized kindergarten with home-cooked meals and numerous activities for the children. It\'s evident that there is a lot of investment and thought put into tailoring the activities to each child\'s age.',4,'2022-08-18'),(65,9,65,'An incredible kindergarten! The most professional, caring, and amazing kindergarten teacher there is! Excellent staff! Home-cooked meals! Clean and organized kindergarten! The best choice for children and parents! Highly recommended with warmth and love!',5,'2023-02-26'),(66,15,66,'The food is nutritious, and we have a menu that shows us what they eat each day. My child comes to kindergarten with a smile, there are activities, and she returns clean and tidy.',4,'2022-01-23'),(67,15,67,'First and foremost, and in my opinion, the most important thing is the warmth and love the children receive in the kindergarten, which is worth everything! Then comes the cleanliness, the excellent and delicious food, and the amazing staff that you can trust completely, knowing that the child is in the best hands possible! All that\'s left is to congratulate them on their success.',4,'2023-02-14'),(68,15,68,'An excellent kindergarten, high level, an amazing kindergarten teacher with a perfect, loving, caring, and accommodating staff. The children simply run to the kindergarten.',4,'2020-08-10'),(69,13,69,'Dear parents, if you are hesitating whether to enroll your child in this wonderful kindergarten... do not hesitate. The amazing kindergarten teacher, not by chance but by merit, provides warmth and love to the children, teaches values with softness and joy. Every morning, the aroma of her amazing cooking fills the air as you enter the kindergarten.',5,'2020-07-23'),(70,11,70,'A professional, loyal, loving, embracing, and true educator team. The activities are rich and diverse, the content is tailored to the age and time of year, the daily routine is excellent and meticulous, the food is home-cooked and nutritious, and most importantly - the team! Genuine, unconditional love for the children.',5,'2020-06-27'),(71,10,71,'The kindergarten staff is lovely, providing warmth and love. The child doesn\'t even say goodbye in the morning; she wants to stay with the staff, and every weekend she waits to go back to the kindergarten. There is no doubt that the second child will also attend this kindergarten, even though we moved to a different city.',5,'2022-10-21'),(72,9,72,'An amazing, professional, warm, and loving staff. Good and high-quality management. An incredible and highly recommended kindergarten! My son comes back happy from the kindergarten, and he arrives every morning with a smile. There is no doubt that all the little ones there are in good hands.',5,'2021-07-02'),(73,13,73,'A wonderful, fun, super-professional, meticulous kindergarten with lots of experience and expertise. Attentive to detail, a pleasure for both children and parents. The COVID-19 period did not diminish the great experience, the level of education and care! I highly recommend and hold a warm place in my heart for this lovely kindergarten and its winning staff.',5,'2022-07-01'),(74,19,1,'We are not satisfied with the education our child receives in the kindergarten.',2,'2022-07-01'),(75,19,2,'I am disappointed with the lack of communication from the kindergarten teachers and assistants. We have asked several times for feedback on our child\'s progress, but we haven\'t received the response we expected.',1,'2022-07-01');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `connector` int unsigned NOT NULL,
  `connectee` int unsigned NOT NULL,
  PRIMARY KEY (`connector`,`connectee`),
  KEY `idx_connector` (`connector`),
  KEY `idx_connectee` (`connectee`),
  CONSTRAINT `FK_connectee` FOREIGN KEY (`connectee`) REFERENCES `users` (`parent_id`),
  CONSTRAINT `FK_connector` FOREIGN KEY (`connector`) REFERENCES `users` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (75,74);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','comment'),(12,'app','connections'),(8,'app','kindergarten'),(13,'app','kindergarten_temp'),(10,'app','kindergartenadditionalinfo'),(9,'app','parent'),(11,'app','users'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-11 14:31:56.720914'),(2,'auth','0001_initial','2023-04-11 14:31:57.196336'),(3,'admin','0001_initial','2023-04-11 14:31:57.301103'),(4,'admin','0002_logentry_remove_auto_add','2023-04-11 14:31:57.309100'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-11 14:31:57.316610'),(6,'app','0001_initial','2023-04-11 14:31:57.323039'),(7,'contenttypes','0002_remove_content_type_name','2023-04-11 14:31:57.392498'),(8,'auth','0002_alter_permission_name_max_length','2023-04-11 14:31:57.447561'),(9,'auth','0003_alter_user_email_max_length','2023-04-11 14:31:57.471919'),(10,'auth','0004_alter_user_username_opts','2023-04-11 14:31:57.483384'),(11,'auth','0005_alter_user_last_login_null','2023-04-11 14:31:57.529188'),(12,'auth','0006_require_contenttypes_0002','2023-04-11 14:31:57.534121'),(13,'auth','0007_alter_validators_add_error_messages','2023-04-11 14:31:57.543118'),(14,'auth','0008_alter_user_username_max_length','2023-04-11 14:31:57.587089'),(15,'auth','0009_alter_user_last_name_max_length','2023-04-11 14:31:57.663544'),(16,'auth','0010_alter_group_name_max_length','2023-04-11 14:31:57.694866'),(17,'auth','0011_update_proxy_permissions','2023-04-11 14:31:57.711262'),(18,'auth','0012_alter_user_first_name_max_length','2023-04-11 14:31:57.766650'),(19,'sessions','0001_initial','2023-04-11 14:31:57.793649');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0to16tozp2sevmk98xj1glunumu60l1b','.eJxVjDsOwjAQBe_iGlneOP5ASZ8zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljawuKjh1-h0z0kOmnfAdp9usaZ7WZcx6V_RBmx5mluf1cP8OKrb6rW0xntH5WDJYgJjPHER6FvYdoIkhEJDpydpQUIDFmuIcZCAuhqBT7w8XQDiB:1q4fBg:RjpK-rSZXUv9Uda4HIhPkqZ3Y03rLzgvoGIpqZY915A','2023-06-15 10:05:44.608234'),('1zjyvzfezp10jo9rwnpf9am2kvjxl5bd','.eJxVjMsOwiAQRf-FtSHDG1y69xvIAINUDU1KuzL-uzbpQrf3nHNfLOK2trgNWuJU2JkJdvrdEuYH9R2UO_bbzPPc12VKfFf4QQe_zoWel8P9O2g42rd2ykrpRUBJRSNIAospGCjglSKoqVblAnjrtTaGZMkYsGaRwAkfcmDvD8gmN3I:1pqGkC:TpELjMQMHA6inwED1DNTGI3K_74R-1NeuCvhLSl_DS0','2023-05-06 17:09:52.564567'),('3k4gkrb9h6nzla6rofulnkfdy5truwv9','.eJxVjDsOwjAQBe_iGln2rr-U9JzBWv9wADlSnFSIu0OkFNC-mXkvFmhbW9hGWcKU2ZkBGHb6XSOlR-k7ynfqt5mnua_LFPmu8IMOfp1zeV4O9--g0WjfOoGT2uropPDR-2KgKkRCEs4pD1WTyFiVlRUNSkPoBGQg73zJaFGx9wcAEDb1:1pnfZ1:9k6OYIpHKSwGAEs4udbeUiFDuJ-5Iq0z8sm2PZqB9bc','2023-04-29 13:03:35.278626'),('3kt71x6bckihrbdewnekkfl2uwizi8ar','.eJxVjEEOgjAQRe_StWno2KHUpXvO0ExnBosaSCisjHdXEha6_e-9_zKJtrWkreqSRjEXE9CcfsdM_NBpJ3Kn6TZbnqd1GbPdFXvQavtZ9Hk93L-DQrV8a5_VeQAIgujYdYDICA06PbdMIC5QiD6TArB0gQFQRduYGx0yDdG8P-47OCs:1q7DUN:8gFKEGFPrefDeTQm1Jw75ZZrmgmhquLHayZqpLvIjGk','2023-06-22 11:07:35.433335'),('584fksqumn5msubi9p9cyc0k82t8349z','.eJxVjMsOgjAQRf-la9MMTB_UpXu_gUxnBosaSCisjP-uJCx0e88592V62tbSb1WXfhRzNtGb0--YiR867UTuNN1my_O0LmO2u2IPWu11Fn1eDvfvoFAt3xozUu5YhFpI0DUD-uCIlVuFpOgBYxAVYUoyOHYJvITYEGZoAAnM-wMm0Th6:1pvarc:x-Pg5Sl7Gt4EOcHr8VOVD4xRvPmnzrnYak6hk4BHisQ','2023-05-21 09:39:32.613678'),('6xx06t4y9ha0i4vfwftkqnawgc51re9v','.eJxVjMsOwiAUBf-FtSEWuAVcuvcbCPeBrRqalHZl_HfbpAvdnpk5b5XyugxpbTKnkdVF-ahOvyNmekrdCT9yvU-aprrMI-pd0Qdt-jaxvK6H-3cw5DZstcNQ2JviemuKEHNHvRjbCRH4M9rMFgNAiWbTiAUdAkQHxoYCpbfq8wU2Jzje:1qAAK5:6JKwhVjhGKeHlcTr26x9gsia_3vG0_MnkdScXvRMibU','2023-06-30 14:21:09.964681'),('dooubq2omuzmhxrt6omde2h5qspn1918','.eJxVzMEOwiAQBNB_4WxIQWC3Hr37DWQpi1QNJKU9Gf9dmvSg15k38xaetjX7rfHi5yguAkCcfsNA05PL3sQHlXuVUy3rMge5E3m0Td5q5Nf1sH8HmVru64EsOzaIhlUaRuVSsAzaBsARmSk6sNpA0kZ1khTYEDGdsVPbNYjPFwCeN0o:1q7DDS:vGE72iqKzK7uEOBBoXzD4oy9GdM4FFotQ6Cv34wLrps','2023-06-22 10:50:06.751796'),('elaqttcfogxv8ldafcovslnwod8nli36','.eJxVjMsOgjAQRf-la9MMTB_UpXu_gUxnBosaSCisjP-uJCx0e88592V62tbSb1WXfhRzNtGb0--YiR867UTuNN1my_O0LmO2u2IPWu11Fn1eDvfvoFAt3xozUu5YhFpI0DUD-uCIlVuFpOgBYxAVYUoyOHYJvITYEGZoAAnM-wMm0Th6:1pxAsU:5qs1IIsqJG67OBPN2U9lg1G-XDLp510JLaAcj7L_eyc','2023-05-25 18:18:58.063294'),('meyv3z8bsd9eq9bo43phpe78yeza72sh','.eJxVjMEOwiAQRP-FsyFlSxfw6L3fQFjYStVAUtqT8d9tkx40mdO8N_MWPmxr9lvjxc9JXAWoTlx-WwrxyeVA6RHKvcpYy7rMJA9FnrTJsSZ-3U737yCHlvd1bzlOGsAa7QakpBgHIkDoDRqAZIGN4R6sVW5iUHu0IwqERIwdiM8XDLA3rQ:1pmuQE:fpud8FLCYgbJVsNpS0m3uwvc951beue_FMEDKGqF1Eo','2023-04-27 10:43:22.021352'),('qm4v3ye1dsst1qu6k7j36yurxqu1l5de','.eJxVjDsOwjAQBe_iGlneOP5ASZ8zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljawuKjh1-h0z0kOmnfAdp9usaZ7WZcx6V_RBmx5mluf1cP8OKrb6rW0xntH5WDJYgJjPHER6FvYdoIkhEJDpydpQUIDFmuIcZCAuhqBT7w8XQDiB:1q53FC:mIlkuPYVoHyJ-7OZ5GdqLNwJNSnDrIHcfgUqscLmYsI','2023-06-16 11:46:58.185277');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kindergarten`
--

DROP TABLE IF EXISTS `kindergarten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kindergarten` (
  `kindergarten_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `region` varchar(100) NOT NULL,
  `min_age` smallint unsigned NOT NULL,
  `max_age` smallint unsigned NOT NULL,
  `capacity` smallint unsigned NOT NULL,
  `kids_count` smallint unsigned DEFAULT NULL,
  `num_of_teachers` smallint unsigned NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `has_parking` tinyint unsigned DEFAULT NULL,
  `geolocation` point DEFAULT NULL,
  `teacher_id` int unsigned NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`kindergarten_id`),
  UNIQUE KEY `kindergarten_id_UNIQUE` (`kindergarten_id`),
  KEY `FK_teacher_id` (`teacher_id`),
  FULLTEXT KEY `idx_kindergarten_name` (`name`),
  CONSTRAINT `FK_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindergarten`
--

LOCK TABLES `kindergarten` WRITE;
/*!40000 ALTER TABLE `kindergarten` DISABLE KEYS */;
INSERT INTO `kindergarten` VALUES (1,'Meirav\'s kindergarten','Weizman St 32','Giv\'atayim',3,41,20,12,1,'07:30:00','17:00:00',1,0x0000000001010000003BE58F715E6B414071645033C5074040,76,'052-7534788','merav_home@gmail.com','Meirav\'s kindergarten is an anthroposophical kindergarten which serves organic food. In our kindergarten you can find a large playground, various activities that broadens the children\'s cognitive abilities.'),(2,'Gurim kindergarten','HaTsanhanim St 27','Giv\'atayim',3,17,6,5,2,'07:30:00','16:30:00',0,0x000000000101000000593673486A674140F8359204E1084040,76,'052-2739819','','Our kindergarten is an anthroposophical kindergarten. We have a warm staff, offer outdoor activities such as playground and we work hard in order to improve your children\'s cognitive abilities.'),(3,'Gandana kindergarten','Bialik St 4','Ramat Gan',12,36,8,6,2,'07:30:00','16:30:00',0,0x000000000101000000226DE34F54684140C85C19541B0A4040,76,'054-5942332','','\r'),(4,'Nemashim kindergarten','Golomb St 10','Giv\'atayim',36,72,20,15,3,'07:30:00','16:30:00',0,0x000000000101000000BA4E232D956741402769FE98D6084040,76,'054-3052121','','Our kindergarten hosts regular performances and exhibitions, providing opportunities for children to showcase their artistic talents and build confidence on stage.'),(5,'Aher kindergarten','Reines St 38','Giv\'atayim',5,36,35,20,8,'07:30:00','16:30:00',0,0x0000000001010000008CD9925511684140C95A43A9BD084040,76,'054-9291997','','\r'),(7,'Avia\'s kindergarten','Sheinkin St 19','Giv\'atayim',3,36,18,14,4,'07:30:00','16:30:00',0,0x0000000001010000003599F1B6D26741403A4030478F094040,76,'052-6426744','','\r'),(8,'Alex\'s kindergarten','Mishmar HaYarden St 22','Giv\'atayim',5,36,20,18,5,'07:30:00','16:30:00',0,0x0000000001010000006A98EB7E5F684140A01B9AB2D3074040,76,'','alex@gmail.com','\r'),(9,'Ilana\'s friends nursery','6 HaZanchanim AV','Ramat Gan',3,36,6,4,2,'07:00:00','18:00:00',0,0x0000000001010000008BFF3BA2426941409FAA4203B1084040,76,'050-221-2541','','\r'),(10,'Gan Witzo Givatayim','Sde Boker St 14','Giv\'atayim',3,36,25,24,5,'07:00:00','16:00:00',0,0x000000000101000000677E350708684140D4997B48F8084040,76,'37322490','','\r'),(11,'Gan Bagan','Haroe St 11','Ramat Gan',12,36,17,17,4,'07:30:00','16:30:00',0,0x000000000101000000C0594A969368414086032159C00A4040,76,'054-5489878','','\r'),(12,'Gan Dror','1 HaMaayan Street','Giv\'atayim',48,60,29,20,3,'08:30:00','15:30:00',0,0x00000000010100000002124DA0886741409A266C3F19094040,76,'03-5719759','','\r'),(13,'Hatzav kindergarten','Aharon Sher St 3','Giv\'atayim',48,60,32,28,4,'08:30:00','15:30:00',0,0x00000000010100000098C989D9BF674140EE43DE72F5084040,76,'03-6725169','','\r'),(14,'Sitvanit kindergarten','Reines St 2','Giv\'atayim',36,48,30,23,5,'08:30:00','15:30:00',0,0x000000000101000000EAE923F0876741403F8BA548BE084040,76,'03-5094497','','\r'),(15,'Sitvanit kindergarten','Rotem St 4','Giv\'atayim',48,60,28,22,4,'08:30:00','15:30:00',0,0x0000000001010000008FAA2688BA674140D0436D1B46094040,76,'03-5719758','','\r'),(16,'Dafna\'s kindergarten','Jabotinski St 22','Giv\'atayim',3,36,20,16,6,'07:30:00','17:00:00',0,0x000000000101000000E9D495CFF266414024473A0323094040,76,'03-571-9756','','\r'),(17,'Adel\'s kindergarten','HaTsanhanim St 11','Giv\'atayim',3,36,15,13,4,'07:30:00','16:00:00',0,0x00000000010100000035B8AD2D3C674140C26856B60F094040,76,'','','\r'),(18,'Sigal\'s kindergarten of arts','Sde Boker St 8','Giv\'atayim',3,60,35,27,7,'07:30:00','17:00:00',0,0x000000000101000000FF06EDD5C7674140AAD216D7F8084040,76,'03-5716601','','\r'),(19,'Michal\'s kindergarten','Ha-Lamed Hei St 58','Giv\'atayim',18,44,14,10,3,'07:15:00','16:30:00',0,0x0000000001010000003694DA8B68674140C0CB0C1B65094040,76,'','','\r'),(20,'Our nursery','Eilat St 8','Giv\'atayim',3,36,30,20,7,'07:30:00','17:00:00',0,0x0000000001010000007AABAE433567414050C8CEDBD8084040,76,'','','\r'),(21,'Yifat\'s nursery','Israel Teiber St 59','Giv\'atayim',1,36,24,19,5,'07:30:00','16:30:00',0,0x00000000010100000064A748537767414009EA29AC33094040,76,'054-9718988','','\r'),(22,'Shaked kindergarten','28 Zahal Street','Giv\'atayim',3,36,39,30,9,'07:15:00','16:45:00',0,0x0000000001010000008AC91B60E6674140B5DD04DF34094040,76,'054-669-8939','','\r'),(23,'Magical House kindergarten','David Elazar St 6','Kfar Saba',12,36,60,45,6,'07:00:00','17:00:00',0,0x000000000101000000B3B5BE4868714140711FB935E9164040,76,'','','\r'),(24,'Veronica\'s kindergarten','Sokolov St 15','Kfar Saba',6,41,30,19,4,'07:00:00','17:00:00',0,0x0000000001010000006C770FD07D734140D2A6EA1ED9144040,76,'052-5723388','','\r'),(25,'Shosh\'s kindergarten','Hadar St 1','Kfar Saba',3,36,20,8,3,'07:00:00','16:00:00',0,0x000000000101000000B5E21B0A9F754140F4A78DEA74164040,76,'052-6693445','','\r'),(26,'Endendino kindergarten','Golomb St 5','Kfar Saba',3,36,20,13,2,'07:00:00','17:00:00',0,0x000000000101000000E1ECD6321970414090D959F44E174040,76,'054-2436690','','\r'),(27,'Karina\'s nursery','Enzo Sereni St 2','Kfar Saba',3,36,15,9,3,'07:00:00','17:00:00',0,0x0000000001010000001363997E897241400F2A711DE3164040,76,'054-9475406','','\r'),(28,'Claudia\'s nursery','Mish\'ol HaKala','Kfar Saba',3,36,8,5,1,'07:00:00','17:00:00',0,0x0000000001010000003B0785F70B724140F151DA76B5134040,76,'','','\r'),(29,'Dror kindergarten','Ha-Lamed Hei St 16','Kfar Saba',3,36,30,24,4,'07:00:00','17:00:00',0,0x00000000010100000098DD9387857641401349F4328A154040,76,'052-3582935','','\r'),(30,'Hibukala kintergarden','Ostashinski St 23','Kfar Saba',3,36,20,20,3,'07:00:00','17:00:00',0,0x000000000101000000811302A02774414098D90840B3164040,76,'','','\r'),(31,'Shenanigan kintergarden','HaShahar St 6','Kfar Saba',3,36,50,38,6,'07:00:00','17:00:00',0,0x00000000010100000065EA645F68724140E14389963C134040,76,'054-6470575','','\r'),(32,'Dikla\'s kindergarten','Rachel HaMeshoreret','Kfar Saba',8,36,32,23,4,'07:20:00','16:45:00',0,0x000000000101000000EFA3648396744140393C2938E1164040,76,'054-4421245','','\r'),(33,'Katkatim kindergarten','Ge\'ula St 31','Kfar Saba',7,32,20,12,3,'07:00:00','16:45:00',0,0x0000000001010000006A85E97B0D9B41400150C58D5BC83F40,76,'09-7428144','','\r'),(34,'Little land kindergarten','Ha-Galil St 56','Kfar Saba',6,36,20,15,2,'07:00:00','17:00:00',0,0x000000000101000000DDD26A48DC07484007B13385CE533D40,76,'054-6498352','','\r'),(35,'Chabad kindergarten','Ruppin St 30','Kfar Saba',3,12,15,10,2,'07:00:00','16:00:00',0,0x000000000101000000706A566C827541405908DDEBC5154040,76,'09-7673568','','\r'),(36,'Kindergarten in Green neighberhood','Rapaport St 3','Kfar Saba',3,42,40,33,3,'07:00:00','16:45:00',0,0x000000000101000000811302A02774414098D90840B3164040,76,'054-8070898','','\r'),(37,'Dorris\'s kindergarten','Ha-Te\'ena St 3','Kfar Saba',3,48,40,32,4,'07:00:00','17:00:00',0,0x0000000001010000007EA026440A8A4140A9DC442DCD154040,76,'09-7652012','','The kindergarten is an exceptional anthroposophical kindergarten that embraces the principles of organic living. Our kindergarten not only serves delicious and nutritious organic food but also prioritizes the well-being and health of the children. With a sprawling and thoughtfully designed playground, children have ample space to explore, play, and connect with nature. Engaging in a wide array of carefully curated activities, our program aims to stimulate and expand children\'s cognitive abilities, fostering their curiosity, critical thinking, and problem-solving skills.'),(38,'The dreams kindergarten','Sha\'ul ha-Melekh St 5','Kfar Saba',3,36,40,29,5,'07:00:00','17:00:00',0,0x000000000101000000B1F9B836547841407D9752978C174040,76,'052-569-7788','','\r'),(39,'Pitsponey Oranim kindergarten','Yigael Yadin St 2','Kfar Saba',4,30,45,40,4,'07:00:00','17:00:00',0,0x0000000001010000006420CF2EDF744140B16EBC3B32144040,76,'09-768-7267','','\r'),(40,'Dina\'s kindergarten','HaMa\'apilim St 18','Kfar Saba',16,48,30,26,4,'07:00:00','17:00:00',0,0x000000000101000000811302A02774414098D90840B3164040,76,'09-7414546','','\r'),(41,'Children\'s fairy tale kindergarten','Nitsanim St 11','Kfar Saba',3,48,40,31,4,'07:45:00','16:45:00',0,0x0000000001010000006C43C5387F73414050FBAD9D28174040,76,'09-7480307','','\r'),(42,'Golden Heart kindergarten','Ben Yehuda St 23','Kfar Saba',3,48,30,26,3,'07:00:00','17:00:00',0,0x0000000001010000008FC0619AD074414090D97A02B8174040,76,'054-4225044','','\r'),(43,'Livne\'s kindergarten','Ha-Emek St 28','Kfar Saba',60,72,34,30,4,'07:00:00','17:00:00',0,0x000000000101000000E4DA5031CE774140BDC804FC1A174040,76,'09-7658716','','\r'),(44,'Small gifts kindergarten','Ha-Ilanot St 20','Kfar Saba',6,36,35,30,4,'07:00:00','17:00:00',0,0x00000000010100000064744012F6734140363B527DE7154040,76,'054-3322848','','\r'),(45,'Ba-li kindergarten','Janus Korczak St 10','Kfar Saba',11,36,20,16,3,'07:00:00','17:00:00',0,0x0000000001010000008F705AF0A2074840F8FC304278543D40,76,'050-7926059','','\r'),(46,'Shani and Eleanor\'s kindergarten','Israel Yisha\'ayahu St 5','Kfar Saba',5,42,30,26,4,'07:00:00','17:00:00',0,0x000000000101000000811302A02774414098D90840B3164040,76,'054-3452926','','\r'),(47,'Yael\'s kindergarten','Khavatselet ha-Sharon St 13','Kfar Saba',4,36,24,20,3,'07:15:00','16:30:00',0,0x0000000001010000007520EBA9D5734140198F52094F164040,76,'','','\r'),(48,'Hadas\'s kindergartren','Aharonovich St 15','Kfar Saba',48,60,20,16,3,'07:00:00','13:00:00',0,0x000000000101000000B08D78B29B734140ECF82F1004164040,76,'09-7655205','','\r'),(49,'Limori\'s kindergarten','Tchernichovsky St 4','Kfar Saba',12,48,35,28,4,'07:00:00','16:30:00',0,0x000000000101000000DF89592F86264240CA897615526E4840,76,'054-5803992','','\r'),(50,'Hartzit kindergarten','Avivim St 10','Kfar Saba',48,60,27,20,3,'07:30:00','14:00:00',0,0x0000000001010000008AE42B8194744140492EFF21FD164040,76,'09-7674248','','\r'),(51,'Almogan','Pashosh St 6','Kfar Saba',48,72,30,26,2,'07:30:00','14:00:00',0,0x0000000001010000007497C4591177414024287E8CB9174040,76,'09-7679186','','\r'),(52,'Tiltan kindergarten','Rashi St 9','Kfar Saba',48,72,30,27,4,'07:30:00','14:00:00',0,0x0000000001010000003944DC9C4A74414060CAC0012D174040,76,'09-7891957','','\r'),(53,'Gan Kohav nursery school','Sderot HaTsanhanim 18','Ramat Gan',9,24,24,15,3,'07:30:00','16:45:00',0,0x0000000001010000002159C0046E69414048FB1F60AD084040,76,'053-242-2295','','\r'),(54,'Children\'s State Kindergarten','Sderot HaTsanhanim 11','Ramat Gan',4,36,20,10,2,'07:30:00','16:30:00',0,0x0000000001010000006B2A8BC22E6A4140AB2006BAF6074040,76,'','','\r'),(55,'Baby Conservatory Kindergarten','Shim\'oni St 10','Ramat Gan',3,36,25,18,3,'07:00:00','17:00:00',0,0x000000000101000000D8463CD9CD68414000E1438996064040,76,'054-630-7689','','\r'),(56,'Einav\'s kindergarten (The magical Kindergarte','Tel Khai St 36','Ramat Gan',4,36,20,14,3,'07:00:00','16:00:00',0,0x000000000101000000664925E1E7694140543BC3D496084040,76,'','','\r'),(57,'Nili\'s Arts kindergarten','Tel Khai St 68','Ramat Gan',3,36,36,28,5,'07:00:00','17:00:00',0,0x0000000001010000002041F163CC69414059DC7F643A084040,76,'077-702-7788','','\r'),(58,'Dragonchik Kindergarten','Tel Khai St 47','Ramat Gan',3,36,30,24,6,'07:00:00','17:00:00',0,0x000000000101000000C6DE8B2FDA694140D47E6B274A084040,76,NULL,'','\r'),(59,'Little nest kindergarten','Moshe Dayan St 13','Ramat Gan',3,36,40,36,5,'07:00:00','17:00:00',0,0x000000000101000000624ED026876941405A626534F2074040,76,NULL,'','\r'),(60,'Beetle nursery','HaTfutsot St 40','Ramat Gan',3,36,15,11,3,'07:00:00','17:00:00',0,0x000000000101000000BA2EFCE07C6841404FCE50DCF1064040,76,'050-719-2245','','\r'),(61,'Gefen\'s kindergarten','Ahad Ha\'Am St 34','Ramat Gan',5,29,15,12,2,'07:00:00','17:00:00',0,0x0000000001010000005B41D3122BC94140DEAAEB504D9B4040,76,'03-717-2472','','\r'),(62,'Star kindergarten','Granados St 35','Ramat Gan',3,36,20,20,3,'07:30:00','16:30:00',0,0x0000000001010000004E7CB5A33869414077DCF0BBE9084040,76,'03-676-1508','','\r'),(63,'Vardit\'s kindergarten','Uzi\'el St 103','Ramat Gan',3,36,25,24,3,'07:00:00','16:00:00',0,0x000000000101000000643C4A25BC6A41408484285FD0054040,76,'03-574-6093','','\r'),(64,'Hohit kindergarten','Uzi\'el St 103','Ramat Gan',3,36,25,22,4,'07:00:00','16:00:00',0,0x000000000101000000643C4A25BC6A41408484285FD0054040,76,'03-574-6093','','\r'),(65,'Tablan kindergarten','Bat Shu\'a St 9','Ramat Gan',3,36,25,23,5,'07:00:00','16:30:00',0,0x000000000101000000EE5A423EE8494140FEF2C98AE1A63F40,76,'03-574-6067','','\r'),(66,'Rami\'s kindergarten','HaHayil St 38','Ramat Gan',4,36,20,16,2,'07:30:00','16:30:00',0,0x00000000010100000042CC2555DB6941407CD45FAFB0084040,76,'050-452-5230','','\r'),(67,'Nitsznim kindergarten','Sderot HaTsanhanim 20','Ramat Gan',9,36,18,18,2,'07:30:00','16:30:00',0,0x000000000101000000890B40A374694140492F6AF7AB084040,76,'','','\r'),(68,'Moran\'s kindergarten','HaMelacha St 14','Ramat Gan',5,29,22,19,3,'07:30:00','16:45:00',0,0x000000000101000000A3AEB5F7A9664140753E3C4B900B4040,76,'','','\r'),(69,'Ilanit\'s kindergarten','Amir St 4','Ramat Gan',9,36,24,22,4,'07:00:00','17:00:00',0,0x0000000001010000006B9A779CA269414048DDCEBEF2084040,76,'','','\r'),(70,'Tiltan kindergarten','Smadar St 19','Ramat Gan',3,36,18,18,3,'07:00:00','17:00:00',0,0x000000000101000000F59979935B684140A5EBB22D3D0C4040,76,'','','\r'),(71,'Kindergarten of senses','Ha-Sar Moshe St 45','Ramat Gan',3,36,32,28,4,'07:30:00','16:30:00',0,0x0000000001010000002EE3A6069A694140054D4BAC8C084040,76,'','','\r'),(72,'Ortali Kindergarten','Truman St 29','Ramat Gan',3,36,40,31,6,'07:30:00','17:00:00',0,0x00000000010100000040D9942BBC69414076340EF5BB084040,76,'','','\r'),(73,'Tintan kindergarten','Bar Yohai St 11','Ramat Gan',6,18,26,23,4,'07:30:00','17:00:00',0,0x0000000001010000007CF31B269A6941404C1AC4833D084040,76,'03-505-4934','','\r'),(74,'Snonit kindergraten','Ba\'al Shem Tov St 15','Ramat Gan',6,29,16,10,2,'07:30:00','16:45:00',0,0x000000000101000000C0EC9E3C2C484140DF4E22C2BFA83F40,76,'03-574-6053','','\r'),(75,'Efoni kindergarten','Geva St 6','Giv\'atayim',3,36,20,15,3,'07:30:00','16:30:00',0,0x0000000001010000007366BB421F684140ACADD85F76094040,76,'03-571-9753','','\r'),(76,'Barkan kindergarten','Bar Yohai St 15','Ramat Gan',3,24,25,23,3,'07:00:00','17:00:00',0,0x00000000010100000058C7F143A5694140C2C2499A3F084040,76,'03-574-6068','','\r'),(77,'Nisanit kindergarten','Bar Yohai St 15','Ramat Gan',3,24,25,22,3,'07:00:00','17:00:00',0,0x00000000010100000058C7F143A5694140C2C2499A3F084040,76,'03-574-6068','','\r'),(78,'Arva\'s kindergarten','Mishmar HaYarden St 9','Giv\'atayim',3,36,30,30,6,'07:30:00','16:45:00',0,0x000000000101000000A19FA9D72D6841404D4C1762F5074040,76,'03-540-6172','','\r'),(79,'Ramon kindergarten','Mishmar HaYarden St 9','Giv\'atayim',3,36,30,20,6,'07:30:00','16:45:00',0,0x000000000101000000A19FA9D72D6841404D4C1762F5074040,76,'03-573-0674','','\r'),(80,'Natali\'s kindergarten','Khad Nes St 38','Ramat Gan',3,36,28,22,5,'07:30:00','17:00:00',0,0x000000000101000000AC8F87BEBB694140312592E865084040,76,'','','\r'),(81,'Osnat\'s nursery','Hever St 9','Ramat Gan',0,36,12,4,2,'07:30:00','16:30:00',0,0x000000000101000000ACA8C1340C694140D8463CD9CD084040,76,'','','\r');
/*!40000 ALTER TABLE `kindergarten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `parent_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(126) DEFAULT NULL,
  `home_address` varchar(1000) DEFAULT NULL,
  `home_region` varchar(100) DEFAULT NULL,
  `work_address` varchar(1000) DEFAULT NULL,
  `work_region` varchar(100) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nudo-gemubu14@hotmail.com','pbkdf2_sha256$260000$oJ2hOlTneFPgLXSzWoDyui$wDWHyc9L9f7DPH3gW+y6lrOQhBLkRpmyp9EC4QWg8aU=',NULL,NULL,NULL,NULL,'2023-04-22 17:09:52.533717',0,'Liron','Mualem','nudo-gemubu14@hotmail.com',0,1,'2023-04-22 17:08:20.975255','parent'),(2,'robe_rehisi41@hotmail.com','pbkdf2_sha256$260000$AQHVX5uGVI1roGZz2PhsZh$JSSmY+LbD8msn5taLidaG18mW3nAV8h/4ISk9oPWr10=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.181685',0,'Mazal','Menashe','robe_rehisi41@hotmail.com',0,1,'2023-04-22 17:08:21.098022','parent'),(3,'pilefo-yazo85@outlook.com','pbkdf2_sha256$260000$h7bNTtA1SmCbqIsnh9NkQN$/X1EJg95R7c9Am2If46VOvORroSAppoqspOWIydE/D8=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.280961',0,'Noa','Yemini','pilefo-yazo85@outlook.com',0,1,'2023-04-22 17:08:21.213155','parent'),(4,'yiva-wususo30@hotmail.com','pbkdf2_sha256$260000$5TjhmNNVACKFhCZDVYEojN$cfh+bruGNwK16469tDIuiURDoLQqOK+8ztpqlqHJY5s=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.363738',0,'Roei','Cohen','yiva-wususo30@hotmail.com',0,1,'2023-04-22 17:08:21.297603','parent'),(5,'bogidu_lotu44@hotmail.com','pbkdf2_sha256$260000$csFsO7dLM068qvPGcB1dRS$OmQytFKqe4YwmU4nxZXeMKY8snoH48Yf9tFLfQ/wOYE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.452898',0,'Karin','Altman','bogidu_lotu44@hotmail.com',0,1,'2023-04-22 17:08:21.380995','parent'),(6,'yuran-ojusu56@mail.com','pbkdf2_sha256$260000$Hzd2A6pc6zN0qCvK0VRRq5$lhObsyNu7EolupqgeEkYTm/ni345F0VbKSgmMLlW5rw=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.543591',0,'Ido','Levi','yuran-ojusu56@mail.com',0,1,'2023-04-22 17:08:21.470254','parent'),(7,'nisul-agijo92@yahoo.com','pbkdf2_sha256$260000$HJr0DuLRMAegtPP7aDdezM$bINf943IyVIx2HxoVDdDXvaadlO5K0HwYgR4jfNf850=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.636919',0,'Tal','Shemesh','nisul-agijo92@yahoo.com',0,1,'2023-04-22 17:08:21.561444','parent'),(8,'sebur-ahoka24@outlook.com','pbkdf2_sha256$260000$fqyQyOpUlF6juVdU5eWl2p$xTMF+j0U/+DdQ4//FgqtSwrXIhosPsoGOKhcfEAqOwA=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.728152',0,'Michal','Shvartz','sebur-ahoka24@outlook.com',0,1,'2023-04-22 17:08:21.661313','parent'),(9,'fizu_namadi2@outlook.com','pbkdf2_sha256$260000$5YLvQVQFjc8SY4hgIhMiq1$jSbsizQDLX7rsU7F8Qf5+tVYj77IzvdhsD6dKQjB98E=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.821369',0,'Hadas','Grinberg','fizu_namadi2@outlook.com',0,1,'2023-04-22 17:08:21.753423','parent'),(10,'vatapa-pawo16@gmail.com','pbkdf2_sha256$260000$XnKfj9E6U9mVTKuFHH0nkJ$5lnMnONUsJTHEEDBKrxkL4b8G5hFem1jcCPaU2XdmGY=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.911813',0,'Mor','Cohen','vatapa-pawo16@gmail.com',0,1,'2023-04-22 17:08:21.843221','parent'),(11,'wivub_amore52@outlook.com','pbkdf2_sha256$260000$7tLLOtLOh6EGSAUKZn3lMV$ZKq21UBhVOmyQG40/K9U8hbDW9oftJ8iM/q4tVZ+PnE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:21.998050',0,'Yuval','Tzruia','wivub_amore52@outlook.com',0,1,'2023-04-22 17:08:21.928555','parent'),(12,'hoser-isenu57@mail.com','pbkdf2_sha256$260000$zUb7JKkIQMfRDL6lDxbvBe$mrig9kLyJQKhSt7OaRPQjHG7zkiTbTur1K7LCNxKotQ=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.083274',0,'Daniel','Jaffe','hoser-isenu57@mail.com',0,1,'2023-04-22 17:08:22.015049','parent'),(13,'neves-obegi6@gmail.com','pbkdf2_sha256$260000$9NxnMLgJ7x3WhKYLFJY44D$58/8vWz77dMKToNMcNfPnwaSpGCQMESbQzEyHI6nGQQ=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.176510',0,'Inbar','Blumental','neves-obegi6@gmail.com',0,1,'2023-04-22 17:08:22.108731','parent'),(14,'nebim_ahoyu21@hotmail.com','pbkdf2_sha256$260000$DzEyUjHMGuckXTG2V4h4fL$GnhscWhO1UBu+8QyhMDyRg9PR3yqziwI44zFqUkivmE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.273660',0,'Avital','Altman','nebim_ahoyu21@hotmail.com',0,1,'2023-04-22 17:08:22.201232','parent'),(15,'pak_agameda87@mail.com','pbkdf2_sha256$260000$Qp0rzMbymoXBvnGJAIfMy5$0Txbsm8Ue4HC9/TcgFR4QfDPbpkbjv4RgbgOLdgqmEM=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.360545',0,'Ido','Weinstein','pak_agameda87@mail.com',0,1,'2023-04-22 17:08:22.290538','parent'),(16,'yugigo-donu83@gmail.com','pbkdf2_sha256$260000$vOsTAToGlsuReKugWR6KGL$IBO5NCLNNg8LxHYg6GE17Ux5xzypR2k/AjJAltC+f6M=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.445580',0,'Yasmin','Shiff','yugigo-donu83@gmail.com',0,1,'2023-04-22 17:08:22.377248','parent'),(17,'jufuv-orifi98@mail.com','pbkdf2_sha256$260000$8GBGieBWTtCTxHRdOR4dDq$kZOBoTNqoBszK2LR9DvSl4W7fryJwslU9wkGvB/Yyso=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.530554',0,'Adel','Ben Hemo','jufuv-orifi98@mail.com',0,1,'2023-04-22 17:08:22.462650','parent'),(18,'dumu_xesunu26@aol.com','pbkdf2_sha256$260000$ofwpTpt7fsZCOKKm4h3GJ9$xMQnfHBM8rCEGVHDNfh8B4oVT3mvvV2ZVTpVPvY1UBo=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.624767',0,'Dana','Silverstein','dumu_xesunu26@aol.com',0,1,'2023-04-22 17:08:22.554030','parent'),(19,'veb_eboxete56@mail.com','pbkdf2_sha256$260000$2XXTqh8RnMbBIUsjDARR53$t9HkOGY9y0qvaKFhTYBqjWeq48wI3i4vUGN3pJA68ic=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.709791',0,'Shaked','Levin','veb_eboxete56@mail.com',0,1,'2023-04-22 17:08:22.641672','parent'),(20,'radej_eguhi57@gmail.com','pbkdf2_sha256$260000$wnqqG6Myi3d98pb5oANIH4$dNzwyoyBsLVMzGJh9fHGnp0beU0kjwL6VTtpp/ftNqI=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.794173',0,'Merav','Benjamin','radej_eguhi57@gmail.com',0,1,'2023-04-22 17:08:22.726422','parent'),(21,'votoyoj_uhi12@gmail.com','pbkdf2_sha256$260000$V5UHzJzcjmiDFTBN7dQk92$e1nMtGQU5kT0HKSMrt8dhtIYBQEHOURCd+UfoLwfpzc=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.880187',0,'Shira','Buhbut','votoyoj_uhi12@gmail.com',0,1,'2023-04-22 17:08:22.811328','parent'),(22,'tarida_sobi13@mail.com','pbkdf2_sha256$260000$7EBV2T463VHSi0WsoF1OiI$9Y9l31cevtOQpu7rMDHtpaLMKMq+sIbYBq75kpxEat0=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:22.965347',0,'Tom','Gesser','tarida_sobi13@mail.com',0,1,'2023-04-22 17:08:22.896673','parent'),(23,'susug_acadu77@gmail.com','pbkdf2_sha256$260000$MqXoNXiAMX4lNaobHcyLLD$2FGkqQ2y/Ifc+cbssL3EIIw/cLl7HtGHnTFvZ48WGFg=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.053620',0,'Michal','Lulu','susug_acadu77@gmail.com',0,1,'2023-04-22 17:08:22.982078','parent'),(24,'ledoli_bave43@yahoo.com','pbkdf2_sha256$260000$zAXwAkHcHhdsnj0kYC7GI8$80AbnKTg28fOZwDs+DbksUL5ox3piDx2fykntChiXO4=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.138440',0,'Anat','Kofman','ledoli_bave43@yahoo.com',0,1,'2023-04-22 17:08:23.070750','parent'),(25,'curiyi_cavo61@gmail.com','pbkdf2_sha256$260000$R1ZHNfnJMCgUujiegL9CeU$/OmqZgNzMIoRuLIDZgDr//qOuqCww05E3Q8x0d/mKmE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.233020',0,'Lital','Mizrachi','curiyi_cavo61@gmail.com',0,1,'2023-04-22 17:08:23.164399','parent'),(26,'hahazu_zula31@hotmail.com','pbkdf2_sha256$260000$YDPmWHqNRKYc8g19cFb5Kc$DUO/opxe3NLGdRo7GjERh2pyFWuFgqv+tGgC8GMcoZ8=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.323504',0,'Hila','Goldberg','hahazu_zula31@hotmail.com',0,1,'2023-04-22 17:08:23.256275','parent'),(27,'sodu-tofubo51@outlook.com','pbkdf2_sha256$260000$5f4sLYXuh0Vt0Dn19YaAkN$wdGrqPKyWledAtxjFBj9pqOU0WCgHqcZrbhZXOxILCI=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.415884',0,'Tamar','Sabban','sodu-tofubo51@outlook.com',0,1,'2023-04-22 17:08:23.349857','parent'),(28,'piwon-acadi36@outlook.com','pbkdf2_sha256$260000$3phusVpFZzGTOOQez1BGVt$6pmMcXkNt71D9IE/dNOLXQKjqXDhXLCni0MHQGkCDEE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.500153',0,'Linoy','Koren','piwon-acadi36@outlook.com',0,1,'2023-04-22 17:08:23.432546','parent'),(29,'min_upivode38@outlook.com','pbkdf2_sha256$260000$fwQOmy6kzmEs5zV4ZLic3T$TTsZl+y1JKTNF08k28Efa+coY/hI9DIThLpArd2cc4k=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.585652',0,'Limor','Hazan','min_upivode38@outlook.com',0,1,'2023-04-22 17:08:23.516936','parent'),(30,'sugiya_fawi51@aol.com','pbkdf2_sha256$260000$xamZ8LvENk80bMpxKiq2Ic$N+bFCv5YYlYlPWYI/xEhGyCaSdfaebYmBu0BO6L5Mes=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.679242',0,'Ziv','Talmor','sugiya_fawi51@aol.com',0,1,'2023-04-22 17:08:23.602506','parent'),(31,'laviw_okute94@outlook.com','pbkdf2_sha256$260000$91SypYsJIcWqLjntxmDjT1$DQ4JmHz31Tguhz2ReL0I6eo6AHeC/PxVoRqmsBJSdF8=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.774865',0,'Noga','Kedar','laviw_okute94@outlook.com',0,1,'2023-04-22 17:08:23.705472','parent'),(32,'bawob_imitu70@hotmail.com','pbkdf2_sha256$260000$QLjEJ5K7ysCQmP78lXnvJE$n8QEpEbtsrNHU+NJqUTZhuwyYl2LzToDzbS4WA1TGxk=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.858139',0,'Adi','Veis','bawob_imitu70@hotmail.com',0,1,'2023-04-22 17:08:23.791786','parent'),(33,'bigilu_hulu32@hotmail.com','pbkdf2_sha256$260000$fFhNnvQGBPovUidTNZJlfk$c3sXafdieIReuYVqb5EebXf7jh11ty83aVDLkRIIOOQ=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:23.953881',0,'Dor','Sharon','bigilu_hulu32@hotmail.com',0,1,'2023-04-22 17:08:23.883808','parent'),(34,'cagu-gegodo71@outlook.com','pbkdf2_sha256$260000$tXmGEM6ge6WDShUPRfePAo$q2reFeL6tBt6ZF9Mc6cy1GbK3hnE26Ti8f5a1zgm+rs=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.047210',0,'Zur','Levi','cagu-gegodo71@outlook.com',0,1,'2023-04-22 17:08:23.979375','parent'),(35,'guge-pobazi61@aol.com','pbkdf2_sha256$260000$bEboIYR4EBujnToqR81s2P$YCwOrfaYOrcz6TvM6NyAd5SoXjvVCs98AV96S8oGXD0=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.145321',0,'Avi','Dgani','guge-pobazi61@aol.com',0,1,'2023-04-22 17:08:24.072620','parent'),(36,'sulozo_fico2@gmail.com','pbkdf2_sha256$260000$B7iDVpa8vjTnFnYeVe4z0G$bIw5R1ayuGqmcbIhyaJPG5U/AgfN+P+prIs+IkI9+sA=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.230654',0,'Sara','Lendsman','sulozo_fico2@gmail.com',0,1,'2023-04-22 17:08:24.162652','parent'),(37,'zuf_oxipubi55@aol.com','pbkdf2_sha256$260000$H78ln2BE6g2EHFCK8M8vOn$OR/MABTw7OA8oD5uS2t7QGrQ2K5/Dr9/BZAdIF7YybU=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.324324',0,'Dvora','Gil','zuf_oxipubi55@aol.com',0,1,'2023-04-22 17:08:24.256099','parent'),(38,'gepew-ayini21@aol.com','pbkdf2_sha256$260000$PLUxBZ6Xwoj9zw9WuMxzFM$5+NMwzAHLXu7nRLRE2NuwptJA84Qv0ZvnBCVRKL/JPg=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.419424',0,'Ariel','Mandelblit','gepew-ayini21@aol.com',0,1,'2023-04-22 17:08:24.349513','parent'),(39,'yerijaj_ogo30@yahoo.com','pbkdf2_sha256$260000$GR6LOqV54bN1VKMxGY0dmg$HgOV5JH0ynmkzeUyMS02Le/LXbimOA54efsYRahOA1I=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.515073',0,'Tamar','Fierman','yerijaj_ogo30@yahoo.com',0,1,'2023-04-22 17:08:24.445169','parent'),(40,'gisetuj-esu26@aol.com','pbkdf2_sha256$260000$rcdeAuT4UtPnsDVbkXfhnj$jwy+1wVjuaac3Yk7RPQlIXh6htxMBwT5CJ6APBsLFoA=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.611572',0,'Ran','Nasig','gisetuj-esu26@aol.com',0,1,'2023-04-22 17:08:24.543683','parent'),(41,'yamo-joseza63@yahoo.com','pbkdf2_sha256$260000$6p14RwitLrPsqect906fkr$d6vGNnAu6rPA4Az14bkJ/+KN7Ah9uOwCUu+0yia6QXE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.697215',0,'Keren','Shahar','yamo-joseza63@yahoo.com',0,1,'2023-04-22 17:08:24.628305','parent'),(42,'rac_akemipo4@hotmail.com','pbkdf2_sha256$260000$olKPtFQzuUiejTlYTbqL5X$YS6l+Xq+Lya1h7B0HbNuYUOUKoiR2lqLn6sqeXSENwQ=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.795957',0,'Lihi','Raz','rac_akemipo4@hotmail.com',0,1,'2023-04-22 17:08:24.722973','parent'),(43,'zuti-cesetu91@gmail.com','pbkdf2_sha256$260000$uBxIhDc6sfiY26IdCureqh$vmS0RAodgAgtqMOKf75AiqLKQBgq3VKrgMXaDGqmImc=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.886986',0,'Sivan','Levi','zuti-cesetu91@gmail.com',0,1,'2023-04-22 17:08:24.813526','parent'),(44,'berun_azaje98@aol.com','pbkdf2_sha256$260000$GuQfjqVfDbfPnPpvyjVL6v$MdZYXJKiXBzgw9RTbETl/Z5hJgazhoihW347ngBdD9A=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:24.979444',0,'Dana','Bar','berun_azaje98@aol.com',0,1,'2023-04-22 17:08:24.904427','parent'),(45,'sekorof-ude24@yahoo.com','pbkdf2_sha256$260000$4hTvRnBuzmrCO8seMMgweB$zWCf3J0FeXq/T9DTpXyXkY9Z/uFeHITZDJ++EsfiP5I=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.064563',0,'Yael','Bek','sekorof-ude24@yahoo.com',0,1,'2023-04-22 17:08:24.996273','parent'),(46,'sesuvoy_abu93@outlook.com','pbkdf2_sha256$260000$emCjQC6hDsF3zOEiLVFbgg$2RM9q967u4lZER8iAPEfC1fyDJ8H1qr/Ip/KuNeNFAQ=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.166695',0,'Ziv','Harush','sesuvoy_abu93@outlook.com',0,1,'2023-04-22 17:08:25.088148','parent'),(47,'yuco_xokupi28@hotmail.com','pbkdf2_sha256$260000$EDnTsVzBKkKPuoFFdmVIb1$ucgZMTfu4EyX+5GD8MRyIaAFITo0YfksCBWJtc06Psw=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.259396',0,'Ori','Menahem','yuco_xokupi28@hotmail.com',0,1,'2023-04-22 17:08:25.190745','parent'),(48,'hukexo-mota36@outlook.com','pbkdf2_sha256$260000$h4dNz63Hnm1Prr7agMc0TH$HP3NAzw72q+fkYF7glrib8PDNewWE2nn9ThpLUz2EyI=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.343746',0,'Meital','Horovitz','hukexo-mota36@outlook.com',0,1,'2023-04-22 17:08:25.276078','parent'),(49,'miputoz_aho15@hotmail.com','pbkdf2_sha256$260000$gFaNEmEeklavPZCMHTVwS2$7GqjVyJHYRHl3JEuWhdj4Ckf8xcR8CU8arQJ0O+UxHo=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.443560',0,'Nemoy','Zohar','miputoz_aho15@hotmail.com',0,1,'2023-04-22 17:08:25.370047','parent'),(50,'jiza-rubahu71@mail.com','pbkdf2_sha256$260000$eJxVf8PtwEhIr2eUrR2BFm$Qbb3kk/Keih9sq/cJKZLmEg0RqOBd/uALQQh68PUj4k=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.527427',0,'Or','Shemesh','jiza-rubahu71@mail.com',0,1,'2023-04-22 17:08:25.460294','parent'),(51,'nizivof-ere13@yahoo.com','pbkdf2_sha256$260000$NCGJTxvIpaAwq2RHnR0w3n$xJnxM1GbN/frRD2vNrXEhcohJyMzheu0cnhxIn783Rs=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.620071',0,'Adi','Mizrachi','nizivof-ere13@yahoo.com',0,1,'2023-04-22 17:08:25.552712','parent'),(52,'rewi_sageja67@hotmail.com','pbkdf2_sha256$260000$FP1lScJRcoTvta7N8P8a9o$kukXjEnOFB63OZbLhyVP629a8VFVH5V0BtSjVk0+veA=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.709791',0,'Ana','David','rewi_sageja67@hotmail.com',0,1,'2023-04-22 17:08:25.642389','parent'),(53,'humu-milegi1@gmail.com','pbkdf2_sha256$260000$IVEMilYykt8uYvd68nagAz$ZgwdZhQ6CUoXNH42aR2qX3iD+jhanEcit6uApFtGjY0=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.801949',0,'Lia','Shalom','humu-milegi1@gmail.com',0,1,'2023-04-22 17:08:25.733078','parent'),(54,'lasuc_owucu55@yahoo.com','pbkdf2_sha256$260000$g325hACqfgKA4XGfoadk1U$w/cG2eZPrADxXsvrnx3aOVeLH3NPXT5p4WDWUoh3BsM=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.887473',0,'Yael','Meron','lasuc_owucu55@yahoo.com',0,1,'2023-04-22 17:08:25.818967','parent'),(55,'kum-oweteha75@outlook.com','pbkdf2_sha256$260000$LVu5yJcXchPkOd4SXRbbHu$cq5AHwUV+CneHcd2oyQsOck85t+1YpMs6gnCTFb/eiE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:25.975622',0,'Kety','Yaakov','kum-oweteha75@outlook.com',0,1,'2023-04-22 17:08:25.904443','parent'),(56,'buji-monuka54@hotmail.com','pbkdf2_sha256$260000$YGde3VGuJLzrNEQUegKMGI$FrOSOiRVTXNIVgPALw627jrMWXxyCUqMkE9wuwkhEhI=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.070563',0,'Anat','Segal','buji-monuka54@hotmail.com',0,1,'2023-04-22 17:08:26.002714','parent'),(57,'wor_imulove50@aol.com','pbkdf2_sha256$260000$FBdZfFxoQeyto2229GW8hZ$LV37lOiRC8aTgNYHmYXHUkOv2PptVKTY966V/V6ZVaE=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.166653',0,'Adi','Kaplan','wor_imulove50@aol.com',0,1,'2023-04-22 17:08:26.087435','parent'),(58,'hiday-uvufe93@yahoo.com','pbkdf2_sha256$260000$JkVxGS1ekgIx1oc8CNT7K0$fPZs74tJVd3oldFHy/27E013tu51A2XP/lA2Lce48Fg=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.283542',0,'Shimon','Levayev','hiday-uvufe93@yahoo.com',0,1,'2023-04-22 17:08:26.192722','parent'),(59,'vov_anohomo25@yahoo.com','pbkdf2_sha256$260000$CFjFMwn3qy67fx9oDtP5i1$IYlUzxrr/GQouCXXGQTzU6OgJAprmWpMrCTMGMCKFB0=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.382099',0,'Karin','Mazor','vov_anohomo25@yahoo.com',0,1,'2023-04-22 17:08:26.314489','parent'),(60,'zuhuh-owoza91@mail.com','pbkdf2_sha256$260000$HCgcxnwmceFw92xqXG1R3g$AY5v9+rWRX3/36iQ0fKF59tOV/cDoha4OZMm60qMfg0=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.465502',0,'Talya','Negbi','zuhuh-owoza91@mail.com',0,1,'2023-04-22 17:08:26.398483','parent'),(61,'hedu-cuhetu30@mail.com','pbkdf2_sha256$260000$XZu9Q6K9sB7GKyUvRjHYFp$Rlj82YZo5wp7qtuanaf+63yB6m9kbf6nsWKpybkxS64=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.562025',0,'Reut','Amit','hedu-cuhetu30@mail.com',0,1,'2023-04-22 17:08:26.490647','parent'),(62,'mekoci_yiho46@gmail.com','pbkdf2_sha256$260000$IWBA6xgY4ZiZZ7xtDIJ1RC$heAEMST5VMg+Wij5FMNmlXN6pV/IGWN9qN5gjZoN1xM=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.659566',0,'Nofar','Levi','mekoci_yiho46@gmail.com',0,1,'2023-04-22 17:08:26.588033','parent'),(63,'wexevep_ana64@hotmail.com','pbkdf2_sha256$260000$yLdhCRX3ZS04FtcHe0Fr9O$YbieNrQgdde8PvV5jW+NCBuBg+rvt2m3N8vKVULD5RU=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.749564',0,'Karin','Lavi','wexevep_ana64@hotmail.com',0,1,'2023-04-22 17:08:26.676318','parent'),(64,'doho_kepake58@mail.com','pbkdf2_sha256$260000$sqX4rNPzTNVXQDHb0nCVOz$B/t35ceeUczZy7LOo6FaTyBTL5h8+cqBrRaAnRS4UzQ=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.848549',0,'Vered','Atias','doho_kepake58@mail.com',0,1,'2023-04-22 17:08:26.775746','parent'),(65,'darulul_ize43@gmail.com','pbkdf2_sha256$260000$aO2cxSfP5BFNT2yhRNkI9b$EOirX0jfimBJVT2ix6WSZhXMAB82RbSTOFEh19KT0ac=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:26.960916',0,'Liran','Yehezkel','darulul_ize43@gmail.com',0,1,'2023-04-22 17:08:26.881212','parent'),(66,'sasawej_ijo50@yahoo.com','pbkdf2_sha256$260000$8svw5fCCd2GdlcTCnfNdRd$3twvlAxrxNBdV9rwqBluSnztSouE7IiDWeh4ANBXd8s=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.059895',0,'Hen','Zgory','sasawej_ijo50@yahoo.com',0,1,'2023-04-22 17:08:26.977827','parent'),(67,'pabaheh_idi57@aol.com','pbkdf2_sha256$260000$R54CBU8V7VjuvIhqjRCWJN$aXzhSEzdUnM60yI2cc2cIOhUxcL34hSFNeCxlMckz/Q=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.144053',0,'Ayala','Agam','pabaheh_idi57@aol.com',0,1,'2023-04-22 17:08:27.076737','parent'),(68,'gegub-ecuji67@aol.com','pbkdf2_sha256$260000$oGD7VynGNnjvfT5vlzY4LK$D4D2csvWmvCPHPqOG4bSQOuU468iJV6Y8m3uj4ycnUI=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.239049',0,'Hadas','Elias','gegub-ecuji67@aol.com',0,1,'2023-04-22 17:08:27.170990','parent'),(69,'rup_eloniwu55@aol.com','pbkdf2_sha256$260000$973M0qxYt7SLJIwr8aFgnv$PY9w2XSC2scCV7m86iIql8V8fo143rZTp2Cg+ifel9I=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.337850',0,'Noam','Katz','rup_eloniwu55@aol.com',0,1,'2023-04-22 17:08:27.262230','parent'),(70,'bapa_xaxexa61@aol.com','pbkdf2_sha256$260000$5QkcrPvazbx9MiqeB5PZSr$gEYWc3ZKJihIq0Op7UHDLrpIASrsA0Rh+AWvRw/AMeo=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.432042',0,'Tom','Goldman','bapa_xaxexa61@aol.com',0,1,'2023-04-22 17:08:27.363156','parent'),(71,'fobim-evohi80@yahoo.com','pbkdf2_sha256$260000$rfQok8arKMIH7TwHTy8KpD$rzKNCP5iUQWS5x9R/HEQ0YwpFmIYlzh9mXSXyIveUkc=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.526916',0,'Maria','Vitkin','fobim-evohi80@yahoo.com',0,1,'2023-04-22 17:08:27.457644','parent'),(72,'pali-kopewi95@gmail.com','pbkdf2_sha256$260000$HqipHca0KEMcI1Q0EBb24p$AN8owEOJ6iFF42/ToLRFbe9sBc8kwgC/81A966gMluU=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.620522',0,'Mayan','Hertzog','pali-kopewi95@gmail.com',0,1,'2023-04-22 17:08:27.551616','parent'),(73,'celided-eyu48@outlook.com','pbkdf2_sha256$260000$2KKJsCpOHtzMto07qk8AlD$itWW9f1KanZj+qAVJlE6VSVdlCq3SYN/7PfvEZMbzlk=',NULL,NULL,NULL,NULL,'2023-04-22 17:08:27.706704',0,'Yuval','Cohen','celided-eyu48@outlook.com',0,1,'2023-04-22 17:08:27.639406','parent'),(74,'almogtry@try.com','pbkdf2_sha256$600000$kgG7yIIrwjZqLL5Oqf4smj$N7n61hr52Wbon+9xZOkWWM7QQI7TQk9IG8HtI5fzvM4=',NULL,NULL,NULL,NULL,'2023-05-06 10:47:04.542564',0,'Almog','Altman','almogtry@try.com',0,1,'2023-05-01 19:35:00.634089','parent'),(75,'a@a.com','pbkdf2_sha256$600000$4rA0stP86uydzVySTWK3hI$+0PtOziBpKJz9YK1rBPIopBbs3/Vccs4BoQtG3VsRVY=',NULL,NULL,NULL,NULL,'2023-06-16 12:32:15.289061',0,'Noa','Kirel','a@a.com',0,1,'2023-05-06 17:34:56.450410','parent'),(76,'danieljaffe@mail.tau.ac.il','pbkdf2_sha256$260000$isP40LRsr8VjJEZxWrfjVY$Uxhg1Jh6hYz2jaZn5bgGOzyEjSbY6MlXLygYTKD0zjM=',NULL,NULL,NULL,NULL,'2023-05-25 09:45:30.116519',0,'daniel','jaffe','danieljaffe@mail.tau.ac.il',0,1,'2023-05-21 07:21:59.201641','teacher'),(77,'ilan@aa.com','pbkdf2_sha256$260000$0EXRypSGnsgEUgg862uI9N$MV/iHkcPlvaszdOWpEQ4MIxxv4zbhOjNpWVejZoFib8=',NULL,NULL,NULL,NULL,'2023-06-08 10:50:25.536113',0,'Ilana','Dayan','ilan@aa.com',0,1,'2023-06-01 09:58:22.003338','teacher'),(79,'nision@mail.com','pbkdf2_sha256$600000$gjVE18QnddzoZ0XTDzmChS$p/0dIjxR+BYaWrfVZcUJjQbJEe3INet5wPrGjg4YRko=','Wiezman St 22','Giv\'atayim','Arlozorov St 20','Giv\'atayim','2023-06-16 14:21:09.960677',0,'nision','demo','nision@mail.com',0,1,'2023-06-16 14:21:09.251686','parent');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-16 17:51:20
