-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: LittleExplorer
-- ------------------------------------------------------
-- Server version	8.0.30

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add comment',7,'add_comment'),(26,'Can change comment',7,'change_comment'),(27,'Can delete comment',7,'delete_comment'),(28,'Can view comment',7,'view_comment'),(29,'Can add kindergarten',8,'add_kindergarten'),(30,'Can change kindergarten',8,'change_kindergarten'),(31,'Can delete kindergarten',8,'delete_kindergarten'),(32,'Can view kindergarten',8,'view_kindergarten'),(33,'Can add parent',9,'add_parent'),(34,'Can change parent',9,'change_parent'),(35,'Can delete parent',9,'delete_parent'),(36,'Can view parent',9,'view_parent'),(37,'Can add kindergartenadditionalinfo',10,'add_kindergartenadditionalinfo'),(38,'Can change kindergartenadditionalinfo',10,'change_kindergartenadditionalinfo'),(39,'Can delete kindergartenadditionalinfo',10,'delete_kindergartenadditionalinfo'),(40,'Can view kindergartenadditionalinfo',10,'view_kindergartenadditionalinfo'),(41,'Can add users',11,'add_users'),(42,'Can change users',11,'change_users'),(43,'Can delete users',11,'delete_users'),(44,'Can view users',11,'view_users'),(45,'Can add connections',12,'add_connections'),(46,'Can change connections',12,'change_connections'),(47,'Can delete connections',12,'delete_connections'),(48,'Can view connections',12,'view_connections');
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'פעוטון משפחתי עם צוות חם ואוהב, מטפלות מסורות והכי חשוב הילד מגיע ויוצא עם חיוך מהגן!',5,'2018-06-23'),(2,1,2,'הבת שלי שם מגיל 4 חודשים ותהיה עד גיל 3 לפחות! גן מושלם, נקי ומסודר, צוות מדהים, רך וקשוב לצרכי הפעוטות',5,'2022-05-14'),(3,1,3,'זכינו להכיר צוות חם אוהב ומקבל, עם המון סבלנות ומתן יחס אישי וקרוב. אין ספק שעשינו את הבחירה הנכונה!',5,'2021-08-03'),(4,2,4,'עומר שלנו נמצא בגן כבר יותר משנה ואנחנו מאוד מאוד מרוצים! מהרגע הראשון שנכנסנו לגן הרגשנו כמו משפחה.',5,'2020-07-05'),(5,2,5,'איזה כיף זה לשלוח את הבת שלנו לגן כשאת פניה מקבל צוות חייכן ונעים שרואים שאוהב את העבודה שלו בזמנים כאלה זה מאוד מרגיע לקבל תחושה של ביטחון וחום אנחנו מרוצים מאוד מהבחירה שלנו וממליצים',5,'2022-12-02'),(6,3,6,'אחרי ״מסע חיפושים״ אחר הגן הנכון , אני יודע ומרגיש שזו הייתה הבחירה הנכונה ביותר עבורנו ועבור אלי. כשאלי פוגשת בבוקר את הגננת והצוות היא מתמלאת באושר ולא מפסיקה לחייך וכך גם כשאנחנו באים לקחת אותה. אלי נמצאת בפיקוח מקצועי ובהשגחה מתמדת לאורך כל היום, הגן מספק עבורה פעילות מלאה בגירוי התפתחותי, הצוות תמיד מחייך. יש תקשורת עם הגן לאורך כל היום. הגן מחוסן. מומלץ בחום.',5,'2022-11-03'),(7,3,7,'גן נעים מאוד וצבעוני, עם צוות מדהים, מסור ומקצועי שנותן יחס חם ועושה הכל כדי שלילדים יהיה טוב. מעדכנים אותנו בכל פרט קטן ומקבלים המון תמונות ועדכונים על הנעשה בגן. הצוות מקסים, אכפתי, ואוהב. מומלץ מאוד',5,'2022-09-11'),(8,5,8,'גן מהמם ביופי, נקי ומסודר עם המון משחקים מושקעים, אוכל בריא, צוות מקצועי אכפתי ורגיש. אנחנו שנה ראשונה בגן ולמרות ההסתגלות והלחץ של אמא טרייה מאד מרוצה מהגן.',5,'2021-10-08'),(9,5,9,'התאומים שלי היו בו וכעת נמצא אחיהם הקטן. בגן הזה יש רמה של איכפתיות, טיפול, חום מדהימה. הילדים הולכים עם חיוך וחוזרים עם חיוך. יש השקעה בהפעלות בהתאם לקבוצות הגיל, מזון טעים שמבושל מדי יום, ותמונות יומיות כדי לחוות ביחד עם הילדים את הכל ביחד.',5,'2022-11-05'),(10,5,10,'לגן יש יחס חם ואוהב לכל ילד. יש מגוון רחב של פעילויות מלאות בהשקעה בילדים וההשקעה ניכרת בהתפתחות הילדים (אנחנו מוצאים את עצמנו מופתעים המון ממשהו חדש שהילדה למדה ולא מאיתנו). הגן תמיד נקי והילדים מתוקתקים, האוכל ברמה גבוהה ויש אירועים מושקעים',5,'2023-02-24'),(11,6,11,'אני מאוד מרוצה מהגן. היחס לילדים מעולה, הגן מפתח עצמאות אצל הילדים. הפעילויות מאוד מאוד מגוונות, האוכל טעים ומזין. כל האירועים בגן מושקעים מאוד. כל ילד מקבל יחס אישי. מאוד מקפידים בגן על ניקיון. אני אמשיך לשלוח את בני לגן הזה גם בשנה הבאה.',5,'2023-01-21'),(12,6,12,'הכנסנו את אביב לגן בחששות, בכל זאת ילד ראשון ומאוד דאגנו. לאחר כמה ימים כבר נוכחנו לדעת שהילד בידיים מעולות, הצוות משקיע, אוהב וחם ואין מאושרים מאיתנו שהוא שם.',4,'2022-03-29'),(13,6,13,' הגן נקי, הכל צבעוני, צוות מספר 1, אוכל טרי כל יום, ילדים מאושרים , מגוון פעילויות מעשירות לילדים, חום ואהבה אף פעם היה חסר. דאגה לילדים במקום הראשון. פשוט גן מהמם . ממליצה בחום לכולם',5,'2023-01-18'),(14,7,14,'הילד שלי נכנס לגן בגיל 11 חודשים והיה לו ממש קשה בהתחלה אבל עם הזמן הוא התרגל לגן ולצוות המדהים שעטפו אותו בחום ובאהבה. הילד חוזר כל יום נקי ושמח ואני מאוד מרוצה מהצוות על הדאגה והטיפול בילד שלי, ממליצה בחום!',4,'2022-07-21'),(15,8,15,'אתה יודע שעשית את הבחירה הנכונה של הגן, כשאתה שם את הילד שלך בבוקר בגן, והוא לא מפסיק לחייך לצוות ושמח להגיע. וכמובן כשאתה מגיע לאסוף אותו בסוף היום והוא כולו מלא חיוכים, ואתה רואה שהיה לו יום מקסים. עם זאת, המבנה של הגן הוא ישן,  אם את/ה מחפש מקום סופר נקי שהילד יכול ללקק את הרצפות, זה פחות בשבילך.',3,'2022-08-06'),(16,9,16,'גן עם צוות מדהים וחם. משקיעות בילדים. דואגות, מטפחות , אכפתיות ומחבקות. נעימות ותמיד עם חיוך. הקטנה שלנו אהבה להגיע כל בוקר. הלכתי שקטה לעבודה בידיעה שהילדה שלי נמצאת בידיים הכי טובות שיש. ממליצה בחום לכל הורה :)',5,'2022-09-16'),(17,10,17,'וות מלא באהבה , צוות שמשקיע בלימוד תכנים ,הילד ככ שמח להגיע לגן כל פעם מחדש גם אחרי חגים גם אחרי חופש גדול פשוט הלך בשמחה ',5,'2021-07-13'),(18,11,18,'הגן הזה הוא פשוט משפחה. כאמא \"לחוצה\" אני ככ רגועה כשהילדה נכנסת בדלת הגן',5,'2022-04-23'),(19,12,19,'גן מעולה! הילדה שלי מגיעה כל בוקר לגן בחיוך וקופצת בשמחה על הצוות! צוות מכיל מחבק וחם.. המון תכנים לימודיים והשקעה בילדים. אוכל טרי ומזין. מקום שהוא בית! מומלץ בחום!',5,'2023-02-27'),(20,12,20,'ההתנהלות מול ההורים הינה בשקיפות ומתוך שיתוף פעולה וכהורים אנו נהנים ממערכת יחסים של אמון ובטחון בצוות הגן. הן עובדות עם הילדים בקבוצות, מעבירות תכנים ומקפידות לקדם כל ילד וילד לפי צרכיו וגילו. הילדים חוזרים מאושרים, עם אוצר מילים רחב, שירים וריקודים.',5,'2022-03-12'),(21,13,21,'הגן נהדר והצוות חם ואוהב, ממליצה באהבה גדולה',5,'2023-01-09'),(22,14,22,'אין לי מילים לתאר כמה אני מרוצה מהגן. הצוות שנבחר בקפידה והוא קבוע. צוות מסור ומדהים חם ואוהב האוכל מושקע, טרי ומגוון כל יום שפע של פעילויות מהנות יש חצר גדולה מאובזרת ומוצלת גן שהוא משפחה אחת גדולה ומאושרת וזה מורגש על הילדים. מומלץ מנסיון ובהרבה אהבה',5,'2021-06-27'),(23,14,23,'גן מושלם!! צוות אוהב מנוסה ומכיל. מגוון פעילויות חינוכיות מעשירות, חוויתיות של צוות הגן ומפעילים חיצוניים. אוכל בריא, טרי מגוון וטעים!!!',5,'2021-06-23'),(24,14,24,'הגן הטוב ביותר בהרצליה ללא צל של ספק. צוות חם ואוהב שמעניק לילדים בית שני, יחס חם, מחבק ומכבד, מעדכן את ההורים ומסייע הרבה מעבר לתפקיד, ניכר שהצוות אוהב את הילדים ואת העבודה',5,'2019-09-04'),(25,15,25,'הצוות מקסים הילדים נכנסים בריצה לגן.אני רגועה שב9-10 שעות שהילד שלי נמצא בגן יש לי על מי לסמוך! רק חבל שהאוכל אינו איכותי ומזין ',4,'2020-06-16'),(26,16,26,'צוות חם,מחבק ואוהב. אוכל טרי מושקע וטעים,גן נקי. תכנים חינוכיים מושקעים מלמדים ומפתחים. הילד פורח,שמח ומתפתח - רק מילים טובות',5,'2020-08-29'),(27,17,27,'צוות מדהים ואוהב, ניהול מתוקתק ומסודר ע\"י גננת אסרטיבית ואוהבת אשר משקיעה בגן ובכל ילד בצורה יוצאת דופן. מומלץ בחום',5,'2021-09-28'),(28,18,28,'גן שהוא בית! מושלם מכל הבחינות! הצוות החם והאוהב, הנתינה והאהבה לילדים, השקעה וחשיבה על הפרט האחרון',5,'2020-10-06'),(29,20,29,'בתור אמא שעובדת משרה מלאה חיפשתי את המקום הכי טוב ששם אוכל להשאיר את הילדים שלי. ידעתי שאני לא אוכל להיות רגועה ב 100% אבל רציתי להיות הכי רגועה שאפשר. הצוות הראו לי שיש דבר כזה גן מושלם, יש דבר כזה ללכת לעבודה בעיניים עצומות ולדעת שהילדים שלך מקבלים את הכי טוב שיש. גן מלא אהבה ששם את בטיחות הילדים במקום הראשון תוך כדי קניית משחקים מורשים בלבד ועד אוכל איכותי ובייתי שמוכן יום יום',5,'2019-02-27'),(30,22,30,'בחרנו לא להמשיך בגן בגלל ההנהלות של מנהלת הגן. אישה שבהיכרות ראשונית מקסימה אותך וכשנרשמים לגן, מתברר שהיא קצת אגרסיבית, לא נעימה ולא מוכנה לשמוע ביקורת או לשמוע הורים שיש על ליבם משהו',2,'2022-05-30'),(31,24,31,'צוות קבוע, מסור ואחראי, אוכל טרי ותשומת לב לכל ילד. מבנה מרווח ובטיחותי + מרפסת שמש עם מתקנים, חוג חיות, שירים ופעילויות',5,'2022-08-11'),(32,25,32,'הגן נקי ומתוקתק (תמיד) והצוות מקצועי ועוטף את הילדים בהרבה חום ואהבה. יש פעילויות מגוונות כמו חוג חיות ומוסיקה והילדים נהנו מהם מאוד. היתה לנו שנה מדהימה, הבת שלי שמחה ללכת לגן והתפתחה מוטורית ורגישית וזה המבחן האמיתי בעיני! 100% אמון, חום, אהבה ומקצועיות!',5,'2021-08-12'),(33,28,33,'הבת שלי כבר שנה שנייה בגן ואין ספק שזכינו!! צוות חם ואוהב, גן רחב ידיים ונקי והכי חשוב חום ואהבה ללא הפסקה! מומלץ בחום ובאהבה',5,'2021-07-22'),(34,30,34,'הרגע הראשון שהבת שלנו נכנסה לגן הרגשנו את החום והאהבה לילדים. האווירה תמיד שמחה ונעימה וכיף לראות שהילדה באה עם חיוך כל בוקר. מומלץ!!',5,'2022-06-19'),(35,31,35,'אווירה חמה וביתית, יחס חם ואוהב . אמה שלנו מאוד נקשרה לשולי ולצוןת מהרגע הראשון. ממליץ בחום',5,'2022-07-07'),(36,32,36,'לצאת לעבודה עם ראש שקט ולהיות בטוח שהילד יקבל את כל מה שצריך!!! למידה כיפית, פעילויות מגוונות, יציאה לחוגים, אוכל מאודדדדד טעים , ממליצה מאוד !',5,'2020-08-09'),(37,33,37,'גן מקסים, עם יחס אישי ורגיש לכל ילד וילדה. הבן שלנו חוזר רגוע ושמח, נותן לנו הרבה שקט נפשי לדעת שהוא במקום שמתייחס בצורה מכבדת ואוהבת לצרכים שלו',5,'2023-01-27'),(38,35,38,'גן משפחתי אינטמי שלומד להכיר כל פרט הכי קטן על הילד. גישה חינוכית יחודית ויוצאת דופן המאפשרת לילד(ה) להתפתח בקצב שלו',5,'2022-01-25'),(39,37,39,' באווירה משפחתית ועם המון סבלנות, אהבה, מחשבה ורגישות- גולי ואייל מעבירים את זמנם עם הילדים- ברחבי הפארק או בתוך הגן. עם המון הקשבה לצורך של הילדים, לתחומי העניין שלהם, עם המון רגישות לנפשם- הימים בגן הם מלאכת מחשבת של אהבה לתקופה המיוחדת הזו- הילדות. כאמא, אני באמת ובתמים שקטה כל כך ושמחה כל כך שביתי זוכה לכל הטוב הזה',5,'2022-12-13'),(40,39,40,'גן נפלא, בכמה רמות מעל שאר האלטרנטיבות בסביבה, וגם אלה שלא בסביבה... 1. צוות נהדר. אמין, שקוף ואוהב. 2. אוכל ברמה גבוהה. 3. גישה לילדים - מחבקת ותומכת',5,'2021-09-15'),(41,41,41,' זו הבחירה הכי טובה שיכולתי לעשות עבור הבן שלי.הגן באוירה של משפחה, עם טיפול מסור, הקשבה מרובה, השקעה רוך והרבה אהבה. הבן שלי שמח ללכת לגן ונחשף לנגינה, ריקודים, יצירה, טיולים יומיים ואוכל בריא. אני ממליצה בחום על הגן ועל גולי ואייל שהם לא פחות ממדהימים!!',5,'2022-04-24'),(42,50,42,'בכל בוקר ביתי הולכת לגן בשמחה והתרגשות. בשבתות היא מדברת על כך שרוצה ללכת לגן. מרגיש לנו שהגן והבית מחוברים בסינרגיה מושלמת. יש לי ביטחון מלא שביתי מקבלת בגן את כל התשומת לב והאהבה להם זקוקה. בזכות הצוות המסור היא מתפתחת, גדלה ומתעצבת כאינדיוידואל. בלב שלם אוכל להגיד שלא יכולנו למצוא עבורה מסגרת יותר טובה מאשר גן פלא. לא נתקלתי בשום מסגרת ברמת מסירות, אהבה, מקצועיות,קשב ורצון טוב כמו בגן פלא. ממליצה בחום ובלב שלם.',5,'2021-05-15'),(43,50,43,'צוות מדהים, אוהב, אכפתי ומחבק! אך אני חושבת שהיה נחמד אם הפעילויות היו יותר מגוונת',4,'2022-02-26'),(44,50,44,'גן מקסים, צוות חם, אוהב מאוד משקיעים בכל ילד, משקיעים בהעשרה, למידה וחווית הילד. הדבר היחיד שלדעתי צריך להשתפר הוא המזון. אם את מחפשת מזון בריא ומזין זה פחות המקום בשביל הילד שלך',3,'2022-07-08'),(45,52,45,'לפני שרשמנו את יאיר שלנו, בדקנו וקיבלנו הרבה המלצות על הגן והצוות. לא יכולה להגיד שאנחנו לא מרוצים אך מעט מאוכזבים מהתקשרות עם ההורים ומהפעילויות שיש בגן. יאיר שלנו ילד פיקח אך בתקופה שלו בגן אינו התפתח ולמד ',2,'2021-05-17'),(46,53,46,'יש הרגשת משפחתיות עצומה שאין אותה במקומות אחרים. היחס לכל ילד וילדה הוא הכי אישי, הכי דואג , הכי משפחתי! אם זאת יש לשים לב כי המבנה ישן והתחזוקה אינה טובה',4,'2023-03-03'),(47,53,47,'הילדה  חוזרת שמחה , ושמחה לחזור כל בוקר לגן בהתלהבות! אנחנו מאוד מרוצים רגועים ושמחים עם הבחירה בגן. רק צריך לשים לב כי אין חניה כלל באיזור ויש המון פקקים בבוקר כך שאנחנו מוצאים את עצמנו נאבקים בכל בוקר כדי להגיע לעבודה אחרי ההורדה בגן',4,'2023-03-16'),(48,55,48,' צוות הגן חם ואוהב ומפזר המון אהבה וחום על הילדים, הגננת אישה מופלאה עם לב רחב ואוהב. תמיד נקי ומסודר,מבנה הגן בעייתי מעט כי ישנו רק תא שירותים אחד לכל הילדים הגמולים והחצר קטנה וצרה. הפעילויות בגן יכולות להיות יותר מגוונות',4,'2023-01-22'),(49,57,49,'הגן הוא הגן הראשון שתיכנסי אליו תרגישי נורמליות לא נקי מידי לא מלוכלך מידי רמת חינוך מצויינת רכישת מיומנויות חברתיות אין דברים כאלה דאגה והכלה של הילדים . כל אחת מצוות הגן באמצעות אוהבת ילדים בקיצור אם תרצו עוד מידע אתם/ן מוזמנות לפנות אלי',4,'2021-03-17'),(50,60,50,'הגננות מאוד לא סובלניות, מפטרים גננת שעבדה שם כבר 17 שנים בגלל משהו קטן, גננת חדשה צועקת על ילדים. מבחינת התפתחות, הגננות כמעט לא נמצאות עם ילדים, הילדים משחקים לבד כל הזמן בחצר. יש רק 1-2 חוגים כל שבוע. כל הרגליים ננשכות על ידי יתושים או פרעושים. אין מיטה או מזרונים לילדים, יש רק ספות מוזרות. לא מומלץ.',1,'2022-09-17'),(51,61,51,'גן ישן ודי מוזנח. הן מבחינת החצר, הריהוט, המבנה עצמו והן מבחינת הצעצועים והמשחקים. ניהול הגן לקוי- מודיעים הכל ברגע האחרון, ממש בערב לפני, לא נותנים מענה לשאלות. הילדים כל הזמן בחוץ ובקושי יש להם פעילויות. גננות מתעסקות בעיקר בבישול והילדים נמצאים עם הסעיות בלבד..',1,'2021-06-27'),(52,63,52,'הצוות מצוין. דואג, אכפתי, לבבי. המשחקים מעט ישנים אבל לילדים לא אכפת. מנהל הגן טיפה מנותק...',3,'2022-01-15'),(53,65,53,'הגן הכי טוב שיש. שני הילדים שלי היו בו. הצוות הכי משקיע שיש הן בפן הפדגוגי והן בתזונה, הכלה, חום ואהבה. ממליצה בחום!!!',5,'2021-04-13'),(54,67,54,'שלושת ילדי גדלו בגן הזה, הגן הזה משפחה. אין צורה אחרת לתאר את זה, גלינה מנהלת הגן חמה אוהבת, עם ניסיון של שנים. בוחרת את הצוות שלה בפינצטה, יש העשרה, אוכל ביתי, אירועים. הצוות חם ומתחשב, מקבל תמיד בחיוך את הילדים רגישים לכל נושא וזמינים כל הילדים תמיד הלכו בחיוך וחזרו עם חיוך ניקיון מאוד חשוב בגן. אם אתם מחפשים משפחה זה המקום .',5,'2022-08-25'),(55,68,55,'ממליצה בחום! הצוות נהדר, אוהב ואכפתי. הילד למד הרבה בגן וזה בזכות הגננות המדהימות',4,'2021-09-21'),(56,68,56,'הגן הוא ממש בית רחוק מהבית. הצוות נפלא, מאוד חם, סבלני ומחבק, מורגש שנבחר בקפידה . הרבה העשרה - גם בחוגים וגם בפעילות במהלך היום, הילדה התפתחה בצורה מדהימה',4,'2022-08-18'),(57,90,57,'צוות מעולה, ילדים הולכים בכייף ולא רוצים ללכת הביתה בסוף היום. אוירה חמה, הרבה פעילויות. כל הילדים של חברים גם היו או נמצאים בגן. ממליצה מאד.',4,'2022-12-15'),(58,90,58,'גן ביתי וחם, צוות מדהים. הרבה פעילויות והפעלות. מאוד מרוצה מהגן.',4,'2021-11-30'),(59,91,59,'הילדה שלי מאושרת ללכת לגן מדיי יום. הצוות מעולה ומעניק הרבה חום ואהבה. הגן תמיד פתוח להורים. הכל שקוף. כיף אמיתי להיות חלק מהגן המשפחתי הזה',5,'2022-08-13'),(60,93,60,'צוות הגן מובילות את הגן ביד רמה, הן דואגות לילדים מכל הלב, מעשירה אותם בתוכן חינוכי ונמצאת שם לכל בעיה ושאלה. אני ממליצה בחום!',4,'2021-08-15'),(61,93,61,'גננת משכמה ומעלה . צוות הסייעות סבלני ואכפתי. אמנם הבן שלי מאוד נהנה בגן אך הייתי שמחה שיחס הצוות-ילדים יהיה קטן יותר',3,'2022-04-07'),(62,101,62,'גן גדול וחצר ענקית ומושקעת, צוות מעולה תוכן לימודי עשיר, וגננת מושלמת שאין עליה. הדאגה לפרטים הכי קטנים, ארוחות מגוונות וביתיות פשוט אין דאגות וראש שקט.תעשו לעצמכם טובה ולכו תראו אתם כבר תבינו לבד .',4,'2023-02-15'),(63,102,63,'הילדה שלי חוזרת מאושרת הביתה.לפי הרוגע והשמחה שלה אני בטוחה שהיא בידיים טובות. הצוות חם ואוהב, והגן נקי ומסודר, אבל האוכל מגיע בקייטרינג ואינו טרי ובריא',3,'2022-08-17'),(64,106,64,'גן מדהים , גננת בעלת ותק עם אכפתיות , נתינה , אהבה, דאגה והקשבה לילדים וכן צוות הגן מקסים ואכפתי. גן נקי ומסודר עם אוכל ביתי וחוגים רבים לילדים .ניכר המון השקעה ומחשבה בהתאמה בין גיל הילד לפעיליות',4,'2022-08-18'),(65,109,65,'גן מדהים! הגננת הכי מקצועית, איכפתית ומדהימה שיש! צוות מעולה! אוכל ביתיי ! גן נקי ומסודר! הבחירה הכי טובה לילדים ולהורים! מומלץ בחום ואהבה!',5,'2023-02-26'),(66,110,66,'האוכל מזין ויש לנו תפריט שאנו רואים מה אוכלים כל יום. הילדה באה לגן עם חיוך יש חוגים הילדה חוזרת נקיה ומסודרת',4,'2022-01-23'),(67,112,67,'קודם כל ובעיניי הכי חשוב החום ואהבה שהילדים מקבלים בגן שווה את הכל! אחר כך הניקיון, האוכל המעולה והטעים והצוות המהמם שאפשר לסמוך בעיניים עצומות שהילד בידיים הכי טובות שיש! נותר רק לפרגן שיצליחו',4,'2023-02-14'),(68,114,68,'גן מעולה רמה גננת מדהימה עם צוות מושלם אוהב דואג ומכיל.הילדים פשוט רצים לגן.',4,'2020-08-10'),(69,115,69,'הורים יקרים, אם הינכם מתלבטים האם לרשום את ילדכם למשפחתון של כייף.. אל תתלבטו.  הגננת מהממת בזכות ולא בחסד, נותנת לילדים חום ואהבה, מלמדת ערכים ברכות ובשמחה. כל בוקר בכניסה לגן ריח הבישולים המדהימים שלה עולה באויר',5,'2020-07-23'),(70,117,70,' צוות מקצועי, נאמן, אוהב, מחבק ומחנך אמיתי. הפעילויות עשירות ומגוונות, התכנים מותאמים לגיל ולתקופה בשנה, סדר היום מצוין ומוקפד, אוכל ביתי ומזין והכי חשוב- הצוות!! האהבה אמיתית ללא תנאים לילדים.',5,'2020-06-27'),(71,121,71,'צוות הגן מקסים ,מעניק חום ואהבה . הילדה אפילו לא נפרדת בבוקר ,רצה לצוות וכל סופש מחכה לחזור כבר לגן . אין ספק שהילד השני גם יהיה בגן הזה למרות שעברנו לעיר אחרת .',5,'2022-10-21'),(72,126,72,'צוות מדהים, מקצועי, חם ואוהב. ניהול טוב ואיכותי. גן מדהים ומומלץ מאוד! הבן שלי חוזר מאושר מהגן ומגיע כל בוקר עם חיוך. אין ספק שכל הקטנטנים שם בידיים טובות.',5,'2021-07-02'),(73,129,73,'גן נהדר כייפי סופר-מקצועי מתוקתק , המון ותק ונסיון ,אוזן קשבת, תענוג גם לילדים וגם להורים. תקופת הקורונה לא הצליחה להפחית מהחוויה הטובה ,רמת החינוך והטיפול ואפילו להיפך, ממליצה בחום ושומרת פינה חמה בלב לגן המקסים ולצוות המנצח',5,'2022-07-01'),(74,130,1,'אנחנו לא מרוצים מהחינוך שהילד שלנו מקבל בגן.',2,'2022-07-01'),(75,130,2,'אני מאוכזבים מחוסר התקשורת של הגננות והסייעות בגן. דרשנו מספר פעמים שיקוף של מצב הילד שלנו ולא זכינו למענה שלא ציפינו',1,'2022-07-01'),(79,1,75,'הגן הכי טוב!',4,'2023-06-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','comment'),(12,'app','connections'),(8,'app','kindergarten'),(10,'app','kindergartenadditionalinfo'),(9,'app','parent'),(11,'app','users'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
INSERT INTO `django_session` VALUES ('0f101iwo2z2kttctxrpznio2f1s5rj1e','.eJxVjDsOwjAQBe_iGlneOP5ASZ8zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljawuKjh1-h0z0kOmnfAdp9usaZ7WZcx6V_RBmx5mluf1cP8OKrb6rW0xntH5WDJYgJjPHER6FvYdoIkhEJDpydpQUIDFmuIcZCAuhqBT7w8XQDiB:1q51Ms:q7whzHxfKmmfXGYTZ9dkCnxRl8ygZWx-_H5mFaDjiz0','2023-06-16 09:46:46.191084'),('0to16tozp2sevmk98xj1glunumu60l1b','.eJxVjDsOwjAQBe_iGlneOP5ASZ8zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljawuKjh1-h0z0kOmnfAdp9usaZ7WZcx6V_RBmx5mluf1cP8OKrb6rW0xntH5WDJYgJjPHER6FvYdoIkhEJDpydpQUIDFmuIcZCAuhqBT7w8XQDiB:1q4fBg:RjpK-rSZXUv9Uda4HIhPkqZ3Y03rLzgvoGIpqZY915A','2023-06-15 10:05:44.608234'),('1zjyvzfezp10jo9rwnpf9am2kvjxl5bd','.eJxVjMsOwiAQRf-FtSHDG1y69xvIAINUDU1KuzL-uzbpQrf3nHNfLOK2trgNWuJU2JkJdvrdEuYH9R2UO_bbzPPc12VKfFf4QQe_zoWel8P9O2g42rd2ykrpRUBJRSNIAospGCjglSKoqVblAnjrtTaGZMkYsGaRwAkfcmDvD8gmN3I:1pqGkC:TpELjMQMHA6inwED1DNTGI3K_74R-1NeuCvhLSl_DS0','2023-05-06 17:09:52.564567'),('3k4gkrb9h6nzla6rofulnkfdy5truwv9','.eJxVjDsOwjAQBe_iGln2rr-U9JzBWv9wADlSnFSIu0OkFNC-mXkvFmhbW9hGWcKU2ZkBGHb6XSOlR-k7ynfqt5mnua_LFPmu8IMOfp1zeV4O9--g0WjfOoGT2uropPDR-2KgKkRCEs4pD1WTyFiVlRUNSkPoBGQg73zJaFGx9wcAEDb1:1pnfZ1:9k6OYIpHKSwGAEs4udbeUiFDuJ-5Iq0z8sm2PZqB9bc','2023-04-29 13:03:35.278626'),('584fksqumn5msubi9p9cyc0k82t8349z','.eJxVjMsOgjAQRf-la9MMTB_UpXu_gUxnBosaSCisjP-uJCx0e88592V62tbSb1WXfhRzNtGb0--YiR867UTuNN1my_O0LmO2u2IPWu11Fn1eDvfvoFAt3xozUu5YhFpI0DUD-uCIlVuFpOgBYxAVYUoyOHYJvITYEGZoAAnM-wMm0Th6:1pvarc:x-Pg5Sl7Gt4EOcHr8VOVD4xRvPmnzrnYak6hk4BHisQ','2023-05-21 09:39:32.613678'),('elaqttcfogxv8ldafcovslnwod8nli36','.eJxVjMsOgjAQRf-la9MMTB_UpXu_gUxnBosaSCisjP-uJCx0e88592V62tbSb1WXfhRzNtGb0--YiR867UTuNN1my_O0LmO2u2IPWu11Fn1eDvfvoFAt3xozUu5YhFpI0DUD-uCIlVuFpOgBYxAVYUoyOHYJvITYEGZoAAnM-wMm0Th6:1pxAsU:5qs1IIsqJG67OBPN2U9lg1G-XDLp510JLaAcj7L_eyc','2023-05-25 18:18:58.063294'),('meyv3z8bsd9eq9bo43phpe78yeza72sh','.eJxVjMEOwiAQRP-FsyFlSxfw6L3fQFjYStVAUtqT8d9tkx40mdO8N_MWPmxr9lvjxc9JXAWoTlx-WwrxyeVA6RHKvcpYy7rMJA9FnrTJsSZ-3U737yCHlvd1bzlOGsAa7QakpBgHIkDoDRqAZIGN4R6sVW5iUHu0IwqERIwdiM8XDLA3rQ:1pmuQE:fpud8FLCYgbJVsNpS0m3uwvc951beue_FMEDKGqF1Eo','2023-04-27 10:43:22.021352');
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
  PRIMARY KEY (`kindergarten_id`),
  UNIQUE KEY `kindergarten_id_UNIQUE` (`kindergarten_id`),
  KEY `FK_teacher_id` (`teacher_id`),
  FULLTEXT KEY `idx_kindergarten_name` (`name`),
  CONSTRAINT `FK_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindergarten`
--

LOCK TABLES `kindergarten` WRITE;
/*!40000 ALTER TABLE `kindergarten` DISABLE KEYS */;
INSERT INTO `kindergarten` VALUES (1,'גן הבית של מירב','וייצמן 32','גבעתיים',3,41,20,10,1,'07:30:00','17:00:00',1,0x000000000101000000838593347F6841403A5AD5928E0A4040,76),(2,'גן גורים','הצנחנים 27','גבעתיים',3,17,6,5,2,'07:30:00','16:30:00',0,0x000000000101000000593673486A674140F8359204E1084040,76),(3,'גן גנדנה','ביאליק 4','גבעתיים',12,36,8,6,2,'07:30:00','16:30:00',0,0x000000000101000000226DE34F54684140C85C19541B0A4040,76),(4,'גן נמשים','גולומב 10','גבעתיים',36,72,20,15,3,'07:30:00','16:30:00',0,0x000000000101000000BA4E232D956741402769FE98D6084040,76),(5,'גן אחר','ריינס 38','גבעתיים',5,36,35,20,8,'07:30:00','16:30:00',0,0x0000000001010000008CD9925511684140C95A43A9BD084040,76),(6,'הגן האקולוגי','שביל האספרגוס 34','גבעתיים',5,36,20,17,4,'07:30:00','17:00:00',0,0x000000000101000000C0594A9693664140C95A43A9BD084040,76),(7,'הגן של אביה','שנקין 19','גבעתיים',3,36,18,14,4,'07:30:00','16:30:00',0,0x0000000001010000003599F1B6D26741403A4030478F094040,76),(8,'הגן של אלכס','משמר הירדן 22','גבעתיים',5,36,20,18,5,'07:30:00','16:30:00',0,0x0000000001010000006A98EB7E5F684140A01B9AB2D3074040,76),(9,'משפחתון החברים של אילנה','שדרות הצנחנים 6 רמת גן','רמת גן',3,36,6,4,2,'07:00:00','18:00:00',0,0x0000000001010000008BFF3BA2426941409FAA4203B1084040,76),(10,'גן ויצו גבעתיים','שדה בוקר 14','גבעתיים',3,36,25,24,5,'07:00:00','16:00:00',0,0x000000000101000000677E350708684140D4997B48F8084040,76),(11,'גן בגן','הרא\"ה 11','רמת גן',12,36,17,17,4,'07:30:00','16:30:00',0,0x000000000101000000C0594A969368414086032159C00A4040,76),(12,'גן דרור','המעין 1','גבעתיים',48,60,29,20,3,'08:30:00','15:30:00',0,0x00000000010100000002124DA0886741409A266C3F19094040,76),(13,'גן חצב','אהרון שר 3','גבעתיים',48,60,32,28,4,'08:30:00','15:30:00',0,0x00000000010100000098C989D9BF674140EE43DE72F5084040,76),(14,'גן סתיוונית ','ריינס 2','גבעתיים',36,48,30,23,5,'08:30:00','15:30:00',0,0x000000000101000000EAE923F0876741403F8BA548BE084040,76),(15,'גן סנונית','רותם 4','גבעתיים',48,60,28,22,4,'08:30:00','15:30:00',0,0x0000000001010000008FAA2688BA674140D0436D1B46094040,76),(16,'הגן של דפנה','ז\'בוטינסקי 22','גבעתיים',3,36,20,16,6,'07:30:00','17:00:00',0,0x000000000101000000F8510DFB3D67414031074147AB0A4040,76),(17,'גן הבית של אדל','הצנחנים 11','גבעתיים',3,36,15,13,4,'07:30:00','16:00:00',0,0x00000000010100000035B8AD2D3C674140C26856B60F094040,76),(18,'גן סיגל אומנויות','שדה בוקר 8','גבעתיים',3,60,35,27,7,'07:30:00','17:00:00',0,0x000000000101000000FF06EDD5C7674140AAD216D7F8084040,76),(19,'הגן של מיכל','הל\"ה 58','גבעתיים',18,44,14,10,3,'07:15:00','16:30:00',0,0x0000000001010000003694DA8B68674140C0CB0C1B65094040,76),(20,'הפעוטון שלנו','אילת 8','גבעתיים',3,36,30,20,7,'07:30:00','17:00:00',0,0x0000000001010000007AABAE433567414050C8CEDBD8084040,76),(21,'המשפחתון של יפעת','ישראל טרייבר 59','גבעתיים',1,36,24,19,5,'07:30:00','16:30:00',0,0x000000000101000000AC46868776674140E0BE0E9C33094040,76),(22,'גן שקד','צהל 28','גבעתיים',3,36,39,30,9,'07:15:00','16:45:00',0,0x000000000101000000CC6C04A0D9674140B03500C056094040,76),(23,'גן הבית הקסום','דויד אלעזר 6','כפר סבא',12,36,60,45,6,'07:00:00','17:00:00',0,0x000000000101000000A48D23D6E2734140D74BF84AC5164040,76),(24,'גן הבית של ורוניקה','סוקולוב 15','כפר סבא',6,41,30,19,4,'07:00:00','17:00:00',0,0x0000000001010000006B0F7BA1807341404694F6065F164040,76),(25,'גן שוש','הדר 1','כפר סבא',3,36,20,8,3,'07:00:00','16:00:00',0,0x000000000101000000B5E21B0A9F754140F4A78DEA74164040,76),(26,'גן אנדנדינו','גולומב 5','כפר סבא',3,36,20,13,2,'07:00:00','17:00:00',0,0x000000000101000000766EDA8CD37241402DCE18E604174040,76),(27,'משפחתון קרינה','סירני 2','כפר סבא',3,36,15,9,3,'07:00:00','17:00:00',0,0x0000000001010000001363997E897241400F2A711DE3164040,76),(28,'המשפחתון של קלאודיה','משעול הקלע','כפר סבא',3,36,8,5,1,'07:00:00','17:00:00',0,0x0000000001010000000DAB7823F375414004CD429660164040,76),(29,'גן דרור','רחוב ל\"ה 16','כפר סבא',3,36,30,24,4,'07:00:00','17:00:00',0,0x00000000010100000098DD9387857641401349F4328A154040,76),(30,'גן חיבוקאלה','אוסטשינסקי 23','כפר סבא',3,36,20,20,3,'07:00:00','17:00:00',0,0x000000000101000000FA7DFFE6C5734140008BFCFA21164040,76),(31,'גן שניניגן','השחר 6','כפר סבא',3,36,50,38,6,'07:00:00','17:00:00',0,0x000000000101000000E540D50964744140E846DC8CE8164040,76),(32,'גן דקלה','רחל המשוררת','כפר סבא',8,36,32,23,4,'07:20:00','16:45:00',0,0x000000000101000000EFA3648396744140393C2938E1164040,76),(33,'גן קטקטים','גאולה 31','כפר סבא',7,32,20,12,3,'07:00:00','16:45:00',0,0x0000000001010000008940F50F22734140E25AED612F164040,76),(34,'גן הארץ הקטנה','הגליל 56','כפר סבא',6,36,20,15,2,'07:00:00','17:00:00',0,0x000000000101000000B9D1743496754140C51C6747E8164040,76),(35,'מעון חב\"ד','רופין 30','כפר סבא',3,12,15,10,2,'07:00:00','16:00:00',0,0x000000000101000000706A566C827541405908DDEBC5154040,76),(36,'גן הילדים בירוקה','רפפורט 3','כפר סבא',3,42,40,33,3,'07:00:00','16:45:00',0,0x00000000010100000003BEF459127241401278923AA2184040,76),(37,'גן דוריס','התאנה 3','כפר סבא',3,48,40,32,4,'07:00:00','17:00:00',0,0x00000000010100000058C51B99477841407C0DC17119174040,76),(38,'גן החלומות','שאול המלך 5','כפר סבא',3,36,40,29,5,'07:00:00','17:00:00',0,0x000000000101000000B1F9B836547841407D9752978C174040,76),(39,'גן פצפוני אורנים','יגאל ידין 2','כפר סבא',4,30,45,40,4,'07:00:00','17:00:00',0,0x000000000101000000CE55F31C91754140EF71A609DB154040,76),(40,'גן דינה','המעפילים 18','כפר סבא',16,48,30,26,4,'07:00:00','17:00:00',0,0x0000000001010000009ED2C1FA3F7341401327F73B14174040,76),(41,'גן אגדת ילדים','ניצנים 11','כפר סבא',3,48,40,31,4,'07:45:00','16:45:00',0,0x0000000001010000006C43C5387F73414050FBAD9D28174040,76),(42,'גן לב הזהב בקאנטרי כפר סבא','בן יהודה 23','כפר סבא',3,48,30,26,3,'07:00:00','17:00:00',0,0x000000000101000000DD61F28AD07441409040CDDAB7174040,76),(43,'גן ליבנה','העמק 28','כפר סבא',60,72,34,30,4,'07:00:00','17:00:00',0,0x00000000010100000009F6042E34754140CD92DF264C164040,76),(44,'גן מתנות קטנות','האילנות 20','כפר סבא',6,36,35,30,4,'07:00:00','17:00:00',0,0x000000000101000000A83979910978414050AA7D3A1E174040,76),(45,'גן בא-לי גן','יאנוש קורצ\'ק 10','כפר סבא',11,36,20,16,3,'07:00:00','17:00:00',0,0x000000000101000000AC58FCA6B0724140C8EC2C7AA7184040,76),(46,'הגן של שני ואלינור','ישראל ישעיהו 5','כפר סבא',5,42,30,26,4,'07:00:00','17:00:00',0,0x00000000010100000029E9616875724140083A5AD592184040,76),(47,'גן יעל','חבצלת השרון 13','כפר סבא',4,36,24,20,3,'07:15:00','16:30:00',0,0x000000000101000000D47D00529B724140CAA65CE15D164040,76),(48,'גן הדס','אהרונוביץ\' 15','כפר סבא',48,60,20,16,3,'07:00:00','13:00:00',0,0x000000000101000000B08D78B29B734140ECF82F1004164040,76),(49,'הגן של לימורי','טשרניחובסקי 4','כפר סבא',12,48,35,28,4,'07:00:00','16:30:00',0,0x000000000101000000FE54686232724140930CEF2884164040,76),(50,'גן חרצית','אביבים 10','כפר סבא',48,60,27,20,3,'07:30:00','14:00:00',0,0x0000000001010000008AE42B8194744140492EFF21FD164040,76),(51,'אלמוגן','פשוש 6','כפר סבא',48,72,30,26,2,'07:30:00','14:00:00',0,0x0000000001010000007497C4591177414024287E8CB9174040,76),(52,'גן תלתן','רש\"י 9','כפר סבא',48,72,30,27,4,'07:30:00','14:00:00',0,0x0000000001010000003944DC9C4A74414060CAC0012D174040,76),(53,'משפחתון גן כוכב','שדרות צנחנים 18','רמת גן',9,24,24,15,3,'07:30:00','16:45:00',0,0x000000000101000000C6866EF6076A41402B31CF4A5A074040,76),(54,'גן מדינת הילדים','שדרות צנחנים 11','רמת גן',4,36,20,10,2,'07:30:00','16:30:00',0,0x000000000101000000F13326ABBF6A4140F15FE65C06064040,76),(55,'גן בייבי קונסרבטוריון','שמעוני 10','רמת גן',3,36,25,18,3,'07:00:00','17:00:00',0,0x000000000101000000D8463CD9CD68414000E1438996064040,76),(56,'גן עינב (הגן הקסום)','תל חי 36','רמת גן',4,36,20,14,3,'07:00:00','16:00:00',0,0x000000000101000000664925E1E7694140543BC3D496084040,76),(57,'גן אמנויות נילי','תל חי 68','רמת גן',3,36,36,28,5,'07:00:00','17:00:00',0,0x0000000001010000002041F163CC69414059DC7F643A084040,76),(58,'גן פעוטון דרקונצ\'יק','תל חי 47','רמת גן',3,36,30,24,6,'07:00:00','17:00:00',0,0x000000000101000000C6DE8B2FDA694140D47E6B274A084040,76),(59,'גן קן קטנטנים','משה דיין 13','רמת גן',3,36,40,36,5,'07:00:00','17:00:00',0,0x000000000101000000624ED026876941405A626534F2074040,76),(60,'משפחתון חיפושית','התפוצות 40','רמת גן',3,36,15,11,3,'07:00:00','17:00:00',0,0x0000000001010000001A6F2BBD366B414036AE7FD767084040,76),(61,'גן גפן','אחד העם 34','רמת גן',5,29,15,12,2,'07:00:00','17:00:00',0,0x000000000101000000A8195245F1684140768D96033D064040,76),(62,'גן כוכב','גרנדוס 35','רמת גן',3,36,20,20,3,'07:30:00','16:30:00',0,0x0000000001010000004E7CB5A33869414077DCF0BBE9084040,76),(63,'גן ורדית','עוזיאל 103','רמת גן',3,36,25,24,3,'07:00:00','16:00:00',0,0x0000000001010000005EBA490C02694140166EF9484A084040,76),(64,'גן חוחית','עוזיאל 103','רמת גן',3,36,25,22,4,'07:00:00','16:00:00',0,0x0000000001010000005EBA490C02694140166EF9484A084040,76),(65,'גן טבלן','בת שוע 9','רמת גן',3,36,25,23,5,'07:00:00','16:30:00',0,0x00000000010100000024624A24D1694140E6CAA0DAE0084040,76),(66,'הגן של רמי','החי\"ל 38','רמת גן',4,36,20,16,2,'07:30:00','16:30:00',0,0x00000000010100000042CC2555DB6941407CD45FAFB0084040,76),(67,'גן ניצנים','שדרות צנחנים 20','רמת גן',9,36,18,18,2,'07:30:00','16:30:00',0,0x000000000101000000890B40A374694140492F6AF7AB084040,76),(68,'גן מורן','המלאכה 14','רמת גן',5,29,22,19,3,'07:30:00','16:45:00',0,0x000000000101000000A3AEB5F7A9664140753E3C4B900B4040,76),(69,'הגן של אילנית','אמיר 4','רמת גן',9,36,24,22,4,'07:00:00','17:00:00',0,0x0000000001010000006B9A779CA269414048DDCEBEF2084040,76),(70,'גן תילתן','סמדר 19','רמת גן',3,36,18,18,3,'07:00:00','17:00:00',0,0x000000000101000000F59979935B684140A5EBB22D3D0C4040,76),(71,'גן חוש חשים','השר משה 45','רמת גן',3,36,32,28,4,'07:30:00','16:30:00',0,0x0000000001010000002EE3A6069A694140054D4BAC8C084040,76),(72,'גן הילדים של אורטלי','טרומן 29','רמת גן',3,36,40,31,6,'07:30:00','17:00:00',0,0x00000000010100000040D9942BBC69414076340EF5BB084040,76),(73,'גן טינטן','בר יוחאי 11','רמת גן',6,18,26,23,4,'07:30:00','17:00:00',0,0x0000000001010000007FA3DB1AAA6B41406B37B00BF5094040,76),(74,'גן סנונית','הבעל שם טוב 15','רמת גן',6,29,16,10,2,'07:30:00','16:45:00',0,0x000000000101000000295B24ED46694140E5B512BA4B084040,76),(75,'גן עפרוני','גבע 6','גבעתיים',3,36,20,15,3,'07:30:00','16:30:00',0,0x0000000001010000007366BB421F684140ACADD85F76094040,76),(76,'גן ברקן','בר יוחאי 15','רמת גן',3,24,25,23,3,'07:00:00','17:00:00',0,0x00000000010100000058C7F143A5694140C2C2499A3F084040,76),(77,'גן ניסנית','בר יוחאי 15','רמת גן',3,24,25,22,3,'07:00:00','17:00:00',0,0x00000000010100000058C7F143A5694140C2C2499A3F084040,76),(78,'גן ערבה','משמר הירדן 9','גבעתיים',3,36,30,30,6,'07:30:00','16:45:00',0,0x000000000101000000A19FA9D72D6841404D4C1762F5074040,76),(79,'גן רמון','משמר הירדן 9','גבעתיים',3,36,30,20,6,'07:30:00','16:45:00',0,0x000000000101000000A19FA9D72D6841404D4C1762F5074040,76),(80,'גן נטלי','חד נס 38','רמת גן',3,36,28,22,5,'07:30:00','17:00:00',0,0x000000000101000000AC8F87BEBB694140312592E865084040,76),(81,'המשפחתון של אסנת','חבר 9','רמת גן',0,36,12,4,2,'07:30:00','16:30:00',0,0x000000000101000000ACA8C1340C694140D8463CD9CD084040,76),(82,'בייבי גן קרן','ארלוזרוב 75','תל אביב',3,36,20,12,4,'07:30:00','16:30:00',0,0x00000000010100000049A4C8B5FC6341403B51B758F60A4040,76),(83,'little steps','בן יהודה 190','תל אביב',3,36,26,18,4,'07:45:00','16:00:00',0,0x000000000101000000535DC0CB0C634140C7BC8E38640B4040,76),(84,'הגן של חגית','קלישר 4','הרצליה',6,48,70,50,4,'07:00:00','17:00:00',0,0x000000000101000000D53DB2B96A6C4140A724EB7074154040,76),(85,'גן אמנון','טשרניחובסקי 38','הרצליה',6,36,36,32,4,'07:00:00','17:00:00',0,0x0000000001010000000283A44FAB724140C2DD59BBED164040,76),(86,'גן כמו בבית','החלוץ 22','רמת השרון',14,36,30,28,4,'07:30:00','16:30:00',0,0x00000000010100000076C24B70EA6D41409DBCC804FC104040,76),(87,'גן דנה','ההגנה 69','הרצליה',6,36,20,18,3,'07:00:00','17:00:00',0,0x000000000101000000DB166536C86C4140AFD2DD7536164040,76),(88,'גן הדס','בר אילן 14','הרצליה',6,36,26,20,4,'07:00:00','17:00:00',0,0x0000000001010000002D077AA86D6B41404419AA622A154040,76),(89,'גן בת-חן','הכורזי 6','הרצליה',6,36,24,24,4,'07:00:00','17:00:00',0,0x0000000001010000005DC2A1B7786C4140D7868A71FE144040,76),(90,'מעון נעמ\"ת הכוזרי','הכורזי 8','הרצליה',3,36,30,21,2,'07:00:00','16:30:00',0,0x00000000010100000073E1F6BA7B6C4140B4D606DD14154040,76),(91,'גן עולם הילד','חנה סנש 10','הרצליה',6,33,30,19,3,'07:00:00','17:00:00',0,0x0000000001010000007A522635B46B4140DCF4673F52144040,76),(92,'הגן שלנו','בן יהודה 55','הרצליה',9,24,20,15,4,'07:30:00','17:00:00',0,0x000000000101000000A796ADF5456C41408E7406465E144040,76),(93,'הגן של נאוה','בן גוריון 47','הרצליה',9,24,32,30,6,'07:30:00','17:00:00',0,0x00000000010100000095F25A09DD6B414051DA1B7C61144040,76),(94,'גן פינוקים','רחוב א.ד גורדון 23','הרצליה',9,24,20,14,2,'07:30:00','17:00:00',0,0x000000000101000000AD1397E3156C4140AF06280D35144040,76),(95,'הגן של ז\'אן','הבנים 21','הרצליה',12,36,15,10,3,'07:00:00','17:00:00',0,0x000000000101000000B61490F63F6C4140F52B9D0FCF144040,76),(96,'גן חני','משה 45','הרצליה',9,24,10,5,1,'07:00:00','17:00:00',0,0x0000000001010000000FD4298F6E6C41403C11C47938134040,76),(97,'גן הבית של יעלי','אחד העם 41','הרצליה',5,36,45,26,8,'07:00:00','17:00:00',0,0x00000000010100000062C5E3814C6C414089A16A2E16154040,76),(98,'גן במבינוס הרצליה','הבנים 50','הרצליה',3,48,20,13,3,'07:00:00','17:00:00',0,0x000000000101000000D76474DDE76C4140034DF863E2144040,76),(99,'פעוטון סיגלי','מוהליבר 16','הרצליה',3,30,10,8,2,'08:00:00','16:00:00',0,0x000000000101000000035FD1ADD76C41402843FA9232154040,76),(100,'גן טל','הינצנים 3','הרצליה',8,38,25,20,3,'07:00:00','17:00:00',0,0x000000000101000000D68BA19C686B4140C68844A165154040,76),(101,'גן תומר','בר כוכבא 48','הרצליה',8,38,22,20,2,'07:00:00','17:00:00',0,0x00000000010100000003B68311FB6A41402B685A6265144040,76),(102,'גן חיטים','המקובלים 38','הרצליה',12,36,28,20,3,'07:00:00','17:00:00',0,0x0000000001010000000ACB4C27616B4140CBD6FA22A1134040,76),(103,'רש\"י שקד','שקד 33','תל אביב',6,32,3,3,1,'07:00:00','16:00:00',0,0x00000000010100000032AD4D637B6D41401F9F909DB7034040,76),(104,'מעון יום','חריף אייזיק 21','תל אביב',6,32,6,5,2,'07:00:00','19:00:00',0,0x000000000101000000C80C54C6BF5F41401BDA006C40044040,76),(105,'מעון יום','הרטוב 8','תל אביב',6,32,8,4,2,'07:00:00','16:00:00',0,0x000000000101000000CDCEA2772A66414042EE224C51064040,76),(106,'מעון יום','עירית 15','תל אביב',6,32,20,11,3,'07:00:00','16:00:00',0,0x000000000101000000EA059FE6E45F41403D2AFEEF88044040,76),(107,'אמילי','כפר יונה 15','תל אביב',6,32,35,26,8,'07:00:00','16:00:00',0,0x000000000101000000F9F6AE415F66414061C1FD80070E4040,76),(108,'אמילי','גבירטיג מרדכי 5','תל אביב',6,32,20,17,4,'07:00:00','16:00:00',0,0x000000000101000000C94FF40AD5664140AF720DD87A064040,76),(109,'מעון יום צהלה','המצביאים 28','תל אביב',6,32,18,12,4,'07:00:00','16:00:00',0,0x0000000001010000003DD196EF706A4140A68691B98D0F4040,76),(110,'הדר יוסף','קהילת בריסק 10','תל אביב',6,32,20,13,5,'07:00:00','16:00:00',0,0x00000000010100000099107349D5684140B2683A3B190E4040,76),(111,'אביב TLV','החשמונאים 96','תל אביב',6,32,6,4,2,'07:00:00','16:00:00',0,0x000000000101000000E31A9FC9FE634140335184D4ED084040,76),(112,'פשר','זינגר בשביס יצחק 7','תל אביב',6,32,25,21,5,'07:00:00','16:00:00',0,0x00000000010100000060FAA8D08A6441401DAF40F4A40E4040,76),(113,'גן ויצו בוגרשוב','בר כוכבא 26','תל אביב',5,36,17,13,4,'07:00:00','16:00:00',0,0x0000000001010000007B884677106B4140545227A089144040,76),(114,'בירנית','בירנית 4','תל אביב',6,32,29,20,3,'07:00:00','16:00:00',0,0x000000000101000000200835E8F0664140D55C6E30D4054040,76),(115,'גן ויצו בית מורצקי','חירותנו 1','תל אביב',5,36,32,23,4,'07:00:00','19:00:00',0,0x000000000101000000B1A547533D654140377007EA94054040,76),(116,'בית פורג\'','התקוה 70','תל אביב',6,32,30,20,5,'07:00:00','16:00:00',0,0x0000000001010000002C836A83136541408BC1C3B46F064040,76),(117,'גן ויצו בית פרו','פעמונית 7','תל אביב',5,36,28,20,4,'07:00:00','19:00:00',0,0x0000000001010000002E8F352383604140A9DBD9571E044040,76),(118,'גן ויצו המלך ג\'ורג\'','המלך ג\'ורג\' 35','תל אביב',5,36,20,12,6,'07:00:00','16:00:00',0,0x00000000010100000047CCECF31863414031D120054F094040,76),(119,'המשתלה','קיפניס לוין 6','תל אביב',6,32,15,10,4,'07:00:00','16:00:00',0,0x0000000001010000009C1551137D6A41405E9F39EB53104040,76),(120,'ויצמן','ויצמן 7','תל אביב',6,32,35,31,7,'07:00:00','16:00:00',0,0x0000000001010000004B3FE1ECD66A4140EF74E789E7144040,76),(121,'יד אליהו','נגבה 33','תל אביב',6,32,14,10,3,'07:00:00','16:00:00',0,0x000000000101000000514F1F813F6641401268B0A9F3064040,76),(122,'גן ויצו מגן אברהם','מגן אברהם 25','תל אביב',5,36,30,23,7,'07:00:00','19:00:00',0,0x00000000010100000096067E54C360414055698B6B7C064040,76),(123,'נווה חן','סלע יעקב 22','תל אביב',6,32,8,6,3,'07:00:00','16:00:00',0,0x0000000001010000009B5775560B684140D55B035B25064040,76),(124,'נווה צה\"ל','דרך ההגנה 118','תל אביב',6,32,6,4,2,'07:00:00','16:00:00',0,0x0000000001010000006E3480B740664140C70F9546CC064040,76),(125,'עקיבא ברון','ברון עקיבא 8','תל אביב',6,32,8,7,2,'07:00:00','16:00:00',0,0x0000000001010000001557957D576641400FD594641D104040,76),(126,'פיינשטיין','פיינשטיין מאיר 20','תל אביב',6,32,20,19,3,'07:00:00','16:00:00',0,0x000000000101000000F9F5436CB066414061527C7C42104040,76),(127,'גן ויצו קריית שלום','ליוויק 7','תל אביב',5,36,35,31,8,'07:00:00','19:00:00',0,0x000000000101000000B58F70B5296441404029FFFFA4054040,76),(128,'רמז ארלוזרוב','ארלוזורוב 95','תל אביב',6,32,20,19,4,'07:00:00','16:00:00',0,0x0000000001010000002F6CCD565E644140C8B1F50CE10A4040,76),(129,'רמת ישראל','דם המכבים 21','תל אביב',6,32,18,13,4,'07:00:00','16:00:00',0,0x00000000010100000009675CDD566641408109DCBA9B084040,76),(130,'תכנית ל\'','בורלא יהודה 2','תל אביב',6,32,20,17,5,'07:00:00','16:00:00',0,0x0000000001010000003A1C02EC48654140440C8519640D4040,76),(131,'גן ויצו שפירא','ישראל מסלנט 22','תל אביב',5,36,6,5,2,'07:00:00','19:00:00',0,0x000000000101000000855561D8066441403A84E0A760064040,76),(132,'מעון האוניברסיטה','וייז ג\'ורג\' ד\"ר 1','תל אביב',0,29,25,20,5,'07:00:00','16:00:00',0,0x000000000101000000CBB3DCE316674140F42EC5F2BA0D4040,76),(133,'כוכב הצפון','קובנר אבא 16','תל אביב',6,32,17,16,4,'07:00:00','16:00:00',0,0x0000000001010000002D8C3E3091644140BC90B355EE0C4040,76),(134,'קטנטנים ובריאים','דפנה 7','תל אביב',4,30,29,26,3,'07:00:00','16:00:00',0,0x000000000101000000A77BF88D0A65414090D21165140A4040,76),(135,'פלורנטין','פרנקל ידידיה 17','תל אביב',6,32,32,31,4,'07:00:00','16:00:00',0,0x00000000010100000067FD989C7B6241407CDBC84C54074040,76),(136,'ויצו','שלומציון המלכה 38','תל אביב',6,32,30,30,5,'07:00:00','16:00:00',0,0x0000000001010000005962D0CFF564414055AE64852A0C4040,76),(137,'ויצו','סלע יעקב 22','תל אביב',6,32,28,26,4,'07:00:00','16:00:00',0,0x0000000001010000009B5775560B684140D55B035B25064040,76),(138,'רשבי - מוסדות ע\"ש התנא הקדוש','הרטוב 25','תל אביב',6,32,20,20,6,'07:00:00','16:00:00',0,0x0000000001010000007D957CEC2E664140016E162F16064040,76),(139,'בבלי','ירושלמי 16','תל אביב',6,32,15,14,4,'07:00:00','16:00:00',0,0x000000000101000000F5D922E57E6641401C0404104A0C4040,76),(140,'השלום','אריסטו 18','תל אביב',6,32,35,30,7,'07:00:00','16:00:00',0,0x000000000101000000670EC5F46F5F414052BA4FE93B044040,76),(141,'מעגלים','חוני המעגל 5','תל אביב',6,32,14,8,3,'07:00:00','16:00:00',0,0x00000000010100000031ED9BFBAB6D41409468C9E369154040,76),(142,'חיננית','חיננית 5','תל אביב',6,32,30,26,7,'07:00:00','16:00:00',0,0x000000000101000000C4978922A4604140008BFCFA21044040,76),(143,'נאות אפקה','לאה גולדברג 6','תל אביב',6,32,32,27,4,'07:00:00','16:00:00',0,0x000000000101000000250516C09465414039B709F7CA403F40,76),(144,'נווה חן','סנפיר 9','תל אביב',6,32,30,25,5,'07:00:00','16:00:00',0,0x000000000101000000F3936A9F8E674140A6F27684D3064040,76),(145,'מעון יום נעמת עצמאות','ארבר מנחם 26','תל אביב',5,36,28,20,4,'07:00:00','16:00:00',0,0x00000000010100000038F3AB394062414086E2337E86054040,76),(146,'קרית שלום','שדרות גורי ישראל 23','תל אביב',6,32,20,19,6,'07:00:00','16:00:00',0,0x0000000001010000002A43C9A2B86341402EFDAE7C54054040,76),(147,'ניצנים','פן אלכסנדר 1','תל אביב',6,32,15,13,4,'07:00:00','16:00:00',0,0x00000000010100000013EE3AC03868414070DEEE9BB10F4040,76),(148,'נווה שרת','פילדלפיה 3','תל אביב',6,32,35,34,7,'07:00:00','16:00:00',0,0x000000000101000000D7DB662AC4614140ACFE08C380034040,76),(149,'דיזנגוף','דיזנגוף 221','תל אביב',6,32,14,9,3,'07:00:00','16:00:00',0,0x0000000001010000005A47551344634140809BC58B850B4040,76),(150,'מאור עינים','מאור עינים 4','תל אביב',6,32,30,27,7,'07:00:00','16:00:00',0,0x0000000001010000006551D84551604140DD648EC44F054040,76),(151,'גולדה','ברלין אליהו 4','תל אביב',6,32,6,3,2,'07:00:00','16:00:00',0,0x000000000101000000A41739347A65414008EB5AD6D80F4040,76),(152,'נעמת','בן סירא 4','תל אביב',6,32,25,21,5,'07:00:00','16:00:00',0,0x000000000101000000EFF7934ADB65414044CCBAB9570C4040,76),(153,'הברושים','לובטקין צביה 15','תל אביב',6,32,17,14,4,'07:00:00','16:00:00',0,0x00000000010100000035ECF7C43A674140A1DAE044F4054040,76),(154,'גן אגוז ','זרובבל 3','רמת השרון',36,48,21,21,3,'07:30:00','15:30:00',0,0x000000000101000000A69332CAAF6A4140FACFFD493A124040,76),(155,'גן תמר','זרובבל 3','רמת השרון',60,72,26,20,3,'07:30:00','15:30:00',0,0x000000000101000000A69332CAAF6A4140FACFFD493A124040,76),(156,'גן זית','זרובבל 3','רמת השרון',48,60,18,15,2,'07:30:00','15:30:00',0,0x000000000101000000A69332CAAF6A4140FACFFD493A124040,76),(157,'גן אמנון ותמר','הרב קוק 43','רמת השרון',48,72,35,30,4,'07:30:00','16:30:00',0,0x0000000001010000009BAC510FD16C4140F0A7C64B37114040,76),(158,'גן הרדוך','הנוטע 4','רמת השרון',36,48,35,31,7,'07:30:00','16:30:00',0,0x00000000010100000000581D39D26B41400C79043752124040,76),(159,'גן דובדבן','הפרחים 4','רמת השרון',48,72,33,28,6,'07:30:00','16:30:00',0,0x0000000001010000005BDF5549C36841400EA6DDBFE40F4040,76),(160,'גן חרצית','השופטים 56','רמת השרון',36,60,23,20,5,'07:30:00','16:30:00',0,0x000000000101000000C9F94952256C41404413AC9A35124040,76),(161,'גן כרכום','אברבוך 14','רמת השרון',48,72,24,15,4,'07:30:00','16:30:00',0,0x0000000001010000004CDF6B088E6B4140EA20AF0793124040,76),(162,'גן ניצן','הירדן 25','רמת השרון',48,72,32,18,6,'07:30:00','16:30:00',0,0x000000000101000000C27D2E643F6A41400940D464E30D4040,76),(163,'גן נרקיס','מוהליבר 1','רמת השרון',60,72,28,16,4,'07:30:00','14:00:00',0,0x00000000010100000026AAB706B66C41409259BDC3ED104040,76),(164,'גן ענבר','הראשונים 14','רמת השרון',48,60,30,25,5,'07:30:00','16:30:00',0,0x000000000101000000C5F64133DB6641409071DE62720A4040,76),(165,'גן ספיר','המלאכה 16','רמת השרון',36,48,17,16,3,'07:30:00','16:30:00',0,0x0000000001010000004ADF5ADC356B4140386E8CF8A9114040,76),(166,'גן פשוש','הפלמ\"ח 8','רמת השרון',60,72,20,20,3,'07:30:00','16:30:00',0,0x0000000001010000005B96AFCBF06B4140374F75C8CD124040,76),(167,'גן צבעוני','אברבוך 14','רמת השרון',48,72,23,20,4,'07:30:00','14:00:00',0,0x0000000001010000004CDF6B088E6B4140EA20AF0793124040,76),(168,'גן צבר','רות 6','רמת השרון',60,72,26,19,4,'07:30:00','14:00:00',0,0x00000000010100000094BF7B478D6B4140616F62484E124040,76),(169,'גן רותם','לילך 3','רמת השרון',48,72,23,14,3,'07:30:00','14:00:00',0,0x000000000101000000F832F6CA616B4140FA7FD59123114040,76),(170,'גן תות','הפרחים 4','רמת השרון',48,72,32,26,5,'07:30:00','16:30:00',0,0x0000000001010000005BDF5549C36841400EA6DDBFE40F4040,76),(171,'גן איריס','הסייפן 37','רמת השרון',36,48,24,20,3,'07:30:00','14:00:00',0,0x000000000101000000F1A0D9756F6B4140C1A8A44E40114040,76),(172,'גן אשל','אברהם 1','רמת השרון',36,48,21,28,3,'07:30:00','14:00:00',0,0x0000000001010000007FBC57AD4C6A4140E527D53E1D134040,76),(173,'גן דפנה','עזרא 52','רמת השרון',36,48,34,30,4,'07:30:00','14:00:00',0,0x00000000010100000008AD872F136B414081EB8A19E1094040,76),(174,'גן דקלים','יצחק שדה 54','רמת השרון',48,72,26,24,3,'07:30:00','14:00:00',0,0x0000000001010000002028B7ED7B6C4140D9976C3CD8104040,76),(175,'גן חרצית','השופטים 56','רמת השרון',36,60,30,20,4,'07:30:00','15:30:00',0,0x000000000101000000C9F94952256C41404413AC9A35124040,76),(176,'גן חצב','הנוטע 3','רמת השרון',48,72,30,24,5,'07:30:00','16:30:00',0,0x000000000101000000B2BAD573D26B4140FB928D075B124040,76),(177,'גן דרור','הפלמ\"ח 8','רמת השרון',36,48,28,16,3,'07:30:00','14:00:00',0,0x0000000001010000005B96AFCBF06B4140374F75C8CD124040,76);
/*!40000 ALTER TABLE `kindergarten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kindergartenadditionalinfo`
--

DROP TABLE IF EXISTS `kindergartenadditionalinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kindergartenadditionalinfo` (
  `kindergarten_id` int unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`kindergarten_id`),
  CONSTRAINT `FK_kindergarten_id` FOREIGN KEY (`kindergarten_id`) REFERENCES `kindergarten` (`kindergarten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindergartenadditionalinfo`
--

LOCK TABLES `kindergartenadditionalinfo` WRITE;
/*!40000 ALTER TABLE `kindergartenadditionalinfo` DISABLE KEYS */;
INSERT INTO `kindergartenadditionalinfo` VALUES (1,'052-7534788','merav_home@gmail.com','בגן הבית של מרב אנו חורטים על דגלנו לחנך את הילדים מתוך אהבה ולא מתוך פחד!\nאצלנו יש מקום לכל ילד וילדה - לגדול, להתפתח, ולקבל את הכלים שהם יזדקקו להם כבוגרים'),(2,'052-2739819',NULL,NULL),(3,'054-5942332',NULL,NULL),(4,'054-3052121',NULL,NULL),(5,'054-9291997',NULL,NULL),(6,'050-754-2437',NULL,'בגן שלנו כל ילד מקבל יחס חם ואוהב, הצוות תמיד לרשות הילדים וההורים.\nבגן הילדים ישחקו בשלל המשחקים שיש לנו להציע, ובכל יום אנחנו נעשה ביחד יצירה שונה\nהילדים חוזרים כל יום מחדש עם חיוך ונהנים לחזור לגן ביום למחרת!'),(7,'052-6426744',NULL,NULL),(8,NULL,'alex@gmail.com',NULL),(9,'050-221-2541',NULL,NULL),(10,'37322490',NULL,NULL),(11,'054-5489878',NULL,NULL),(12,'03-5719759',NULL,NULL),(13,'03-6725169',NULL,NULL),(14,'03-5094497',NULL,NULL),(15,'03-5719758',NULL,NULL),(16,'03-571-9756',NULL,NULL),(17,NULL,NULL,NULL),(18,'03-5716601',NULL,NULL),(19,NULL,NULL,NULL),(20,NULL,NULL,NULL),(21,'054-9718988',NULL,NULL),(22,'054-669-8939',NULL,NULL),(23,NULL,NULL,NULL),(24,'052-5723388',NULL,NULL),(25,'052-6693445',NULL,NULL),(26,'054-2436690',NULL,NULL),(27,'054-9475406',NULL,NULL),(28,NULL,NULL,NULL),(29,'052-3582935',NULL,NULL),(30,NULL,NULL,NULL),(31,'054-6470575',NULL,NULL),(32,'054-4421245',NULL,NULL),(33,'09-7428144',NULL,NULL),(34,'054-6498352',NULL,NULL),(35,'09-7673568',NULL,NULL),(36,'054-8070898',NULL,NULL),(37,'09-7652012',NULL,NULL),(38,'052-569-7788',NULL,NULL),(39,'09-768-7267',NULL,NULL),(40,'09-7414546',NULL,NULL),(41,'09-7480307',NULL,NULL),(42,'054-4225044',NULL,NULL),(43,'09-7658716',NULL,NULL),(44,'054-3322848',NULL,NULL),(45,'050-7926059',NULL,NULL),(46,'054-3452926',NULL,NULL),(47,NULL,NULL,NULL),(48,'09-7655205',NULL,NULL),(49,'054-5803992',NULL,NULL),(50,'09-7674248',NULL,NULL),(51,'09-7679186',NULL,NULL),(52,'09-7891957',NULL,NULL),(53,'053-242-2295',NULL,NULL),(54,NULL,NULL,NULL),(55,'054-630-7689',NULL,NULL),(56,NULL,NULL,NULL),(57,'077-702-7788',NULL,NULL),(58,NULL,NULL,NULL),(59,NULL,NULL,NULL),(60,'050-719-2245',NULL,NULL),(61,'03-717-2472',NULL,NULL),(62,'03-676-1508',NULL,NULL),(63,'03-574-6093',NULL,NULL),(64,'03-574-6093',NULL,NULL),(65,'03-574-6067',NULL,NULL),(66,'050-452-5230',NULL,NULL),(67,NULL,NULL,NULL),(68,NULL,NULL,NULL),(69,NULL,NULL,NULL),(70,NULL,NULL,NULL),(71,NULL,NULL,NULL),(72,NULL,NULL,NULL),(73,'03-505-4934',NULL,NULL),(74,'03-574-6053',NULL,NULL),(75,'03-571-9753',NULL,NULL),(76,'03-574-6068',NULL,NULL),(77,'03-574-6068',NULL,NULL),(78,'03-540-6172',NULL,NULL),(79,'03-573-0674',NULL,NULL),(80,NULL,NULL,NULL),(81,NULL,NULL,NULL),(82,'054-815-1511',NULL,NULL),(83,'054-789-7321',NULL,NULL),(84,'09-950-3570',NULL,NULL),(85,'09-950-3278',NULL,NULL),(86,'054-439-4918',NULL,NULL),(87,NULL,NULL,NULL),(88,NULL,NULL,NULL),(89,'09-956-4504',NULL,NULL),(90,'09-954-1277',NULL,NULL),(91,'073-758-9012',NULL,NULL),(92,NULL,NULL,NULL),(93,NULL,NULL,NULL),(94,NULL,NULL,NULL),(95,'09-954-4302',NULL,NULL),(96,'09-954-4037',NULL,NULL),(97,'073-702-7891',NULL,NULL),(98,'09-951-3896',NULL,NULL),(99,'052-6004913',NULL,NULL),(100,'052-274-0863',NULL,NULL),(101,'052-440-1316',NULL,NULL),(102,'09-950-0101',NULL,NULL),(103,'03-5185730',NULL,NULL),(104,'03-6587804',NULL,NULL),(105,'03-7300845',NULL,NULL),(106,'03-6589236',NULL,NULL),(107,'03-9715656',NULL,NULL),(108,'03-6394870',NULL,NULL),(109,'03-9669904',NULL,NULL),(110,'03-6968603',NULL,NULL),(111,'03-9491131',NULL,NULL),(112,'03-5527127',NULL,NULL),(113,'03-6290462',NULL,NULL),(114,'03-7305861',NULL,NULL),(115,'03-6870555',NULL,NULL),(116,'03-6870239',NULL,NULL),(117,'03-5061559',NULL,NULL),(118,'03-5284230',NULL,NULL),(119,'03-6443891',NULL,NULL),(120,'03-6964832',NULL,NULL),(121,'03-7392690',NULL,NULL),(122,'03-6817650',NULL,NULL),(123,'03-7393514',NULL,NULL),(124,'03-7394005',NULL,NULL),(125,'03-6414825',NULL,NULL),(126,'03-6423660',NULL,NULL),(127,'03-6839648',NULL,NULL),(128,'03-6960437',NULL,NULL),(129,'03-5711974',NULL,NULL),(130,'03-6991990',NULL,NULL),(131,'03-6876692',NULL,NULL),(132,'03-7267274',NULL,NULL),(133,'03-5754046',NULL,NULL),(134,'076-8009023',NULL,NULL),(135,'03-7394005',NULL,NULL),(136,'03-6236499',NULL,NULL),(137,'03-7393514',NULL,NULL),(138,'03-7394668',NULL,NULL),(139,'03-5467348',NULL,NULL),(140,'03-5062525',NULL,NULL),(141,'03-6041789',NULL,NULL),(142,'03-6582555',NULL,NULL),(143,'03-6487799',NULL,NULL),(144,'03-7391079',NULL,NULL),(145,'03-6821060',NULL,NULL),(146,'03-6815288',NULL,NULL),(147,'03-6484598',NULL,NULL),(148,'03-6492329',NULL,NULL),(149,'03-5441965',NULL,NULL),(150,'03-9014794',NULL,NULL),(151,'03-6826616',NULL,NULL),(152,'03-6162976',NULL,NULL),(153,'03-7394846',NULL,NULL),(154,'03-7602145',NULL,NULL),(155,'03-7602145',NULL,NULL),(156,'03-7602145',NULL,NULL),(157,'03-5406211',NULL,NULL),(158,NULL,NULL,NULL),(159,'03-6419364',NULL,NULL),(160,'03-5258230',NULL,NULL),(161,'03-5490215',NULL,NULL),(162,'03-5405316',NULL,NULL),(163,'03-5186888',NULL,NULL),(164,NULL,NULL,NULL),(165,'03-5497463',NULL,NULL),(166,'03-5175932',NULL,NULL),(167,'03-5474890',NULL,NULL),(168,'03-5408152',NULL,NULL),(169,'03-5497234',NULL,NULL),(170,'03-6496028',NULL,NULL),(171,'03-5497450',NULL,NULL),(172,'03-5406221',NULL,NULL),(173,'03-6885419',NULL,NULL),(174,'03-5477180',NULL,NULL),(175,'03-5258230',NULL,NULL),(176,'03-5408113',NULL,NULL),(177,'03-5175952',NULL,NULL);
/*!40000 ALTER TABLE `kindergartenadditionalinfo` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nudo-gemubu14@hotmail.com','pbkdf2_sha256$260000$oJ2hOlTneFPgLXSzWoDyui$wDWHyc9L9f7DPH3gW+y6lrOQhBLkRpmyp9EC4QWg8aU=','ורמייזה 9','תל אביב','אחד העם 41','הרצליה','2023-04-22 17:09:52.533717',0,'לירון','מועלם','nudo-gemubu14@hotmail.com',0,1,'2023-04-22 17:08:20.975255','parent'),(2,'robe_rehisi41@hotmail.com','pbkdf2_sha256$260000$AQHVX5uGVI1roGZz2PhsZh$JSSmY+LbD8msn5taLidaG18mW3nAV8h/4ISk9oPWr10=','ג’ורג’ וייז 20','תל אביב','הבנים 50','הרצליה','2023-04-22 17:08:21.181685',0,'מזל','מנשה','robe_rehisi41@hotmail.com',0,1,'2023-04-22 17:08:21.098022','parent'),(3,'pilefo-yazo85@outlook.com','pbkdf2_sha256$260000$h7bNTtA1SmCbqIsnh9NkQN$/X1EJg95R7c9Am2If46VOvORroSAppoqspOWIydE/D8=','הופיין 10','תל אביב','מוהליבר 16','הרצליה','2023-04-22 17:08:21.280961',0,'נועה','ימיני','pilefo-yazo85@outlook.com',0,1,'2023-04-22 17:08:21.213155','parent'),(4,'yiva-wususo30@hotmail.com','pbkdf2_sha256$260000$5TjhmNNVACKFhCZDVYEojN$cfh+bruGNwK16469tDIuiURDoLQqOK+8ztpqlqHJY5s=','קיציס 20','תל אביב','הינצנים 3','הרצליה','2023-04-22 17:08:21.363738',0,'רועי','כהן','yiva-wususo30@hotmail.com',0,1,'2023-04-22 17:08:21.297603','parent'),(5,'bogidu_lotu44@hotmail.com','pbkdf2_sha256$260000$csFsO7dLM068qvPGcB1dRS$OmQytFKqe4YwmU4nxZXeMKY8snoH48Yf9tFLfQ/wOYE=','ישעיהו אברך 5','תל אביב','בר כוכבא 48','הרצליה','2023-04-22 17:08:21.452898',0,'קארין','אלטמן','bogidu_lotu44@hotmail.com',0,1,'2023-04-22 17:08:21.380995','parent'),(6,'yuran-ojusu56@mail.com','pbkdf2_sha256$260000$Hzd2A6pc6zN0qCvK0VRRq5$lhObsyNu7EolupqgeEkYTm/ni345F0VbKSgmMLlW5rw=','וייצמן 30','גבעתיים','המקובלים 38','הרצליה','2023-04-22 17:08:21.543591',0,'עידו','לוי','yuran-ojusu56@mail.com',0,1,'2023-04-22 17:08:21.470254','parent'),(7,'nisul-agijo92@yahoo.com','pbkdf2_sha256$260000$HJr0DuLRMAegtPP7aDdezM$bINf943IyVIx2HxoVDdDXvaadlO5K0HwYgR4jfNf850=','הצנחנים 4','גבעתיים','שקד 33','תל אביב','2023-04-22 17:08:21.636919',0,'טל','שמש','nisul-agijo92@yahoo.com',0,1,'2023-04-22 17:08:21.561444','parent'),(8,'sebur-ahoka24@outlook.com','pbkdf2_sha256$260000$fqyQyOpUlF6juVdU5eWl2p$xTMF+j0U/+DdQ4//FgqtSwrXIhosPsoGOKhcfEAqOwA=','ביאליק 10','גבעתיים','חריף אייזיק 21','תל אביב','2023-04-22 17:08:21.728152',0,'מיכל','שוורץ','sebur-ahoka24@outlook.com',0,1,'2023-04-22 17:08:21.661313','parent'),(9,'fizu_namadi2@outlook.com','pbkdf2_sha256$260000$5YLvQVQFjc8SY4hgIhMiq1$jSbsizQDLX7rsU7F8Qf5+tVYj77IzvdhsD6dKQjB98E=','גולומב 8','גבעתיים','הרטוב 8','תל אביב','2023-04-22 17:08:21.821369',0,'הדס','גרינברג','fizu_namadi2@outlook.com',0,1,'2023-04-22 17:08:21.753423','parent'),(10,'vatapa-pawo16@gmail.com','pbkdf2_sha256$260000$XnKfj9E6U9mVTKuFHH0nkJ$5lnMnONUsJTHEEDBKrxkL4b8G5hFem1jcCPaU2XdmGY=','ריינס 36','גבעתיים','עירית 15','תל אביב','2023-04-22 17:08:21.911813',0,'מור','כהן','vatapa-pawo16@gmail.com',0,1,'2023-04-22 17:08:21.843221','parent'),(11,'wivub_amore52@outlook.com','pbkdf2_sha256$260000$7tLLOtLOh6EGSAUKZn3lMV$ZKq21UBhVOmyQG40/K9U8hbDW9oftJ8iM/q4tVZ+PnE=','שביל האספרגוס 30','גבעתיים','כפר יונה 15','תל אביב','2023-04-22 17:08:21.998050',0,'יובל','צרויה','wivub_amore52@outlook.com',0,1,'2023-04-22 17:08:21.928555','parent'),(12,'hoser-isenu57@mail.com','pbkdf2_sha256$260000$zUb7JKkIQMfRDL6lDxbvBe$mrig9kLyJQKhSt7OaRPQjHG7zkiTbTur1K7LCNxKotQ=','שנקין 15','גבעתיים','גבירטיג מרדכי 5','תל אביב','2023-04-22 17:08:22.083274',0,'דניאל','יפה','hoser-isenu57@mail.com',0,1,'2023-04-22 17:08:22.015049','parent'),(13,'neves-obegi6@gmail.com','pbkdf2_sha256$260000$9NxnMLgJ7x3WhKYLFJY44D$58/8vWz77dMKToNMcNfPnwaSpGCQMESbQzEyHI6nGQQ=','משמר הירדן 18','גבעתיים','המצביאים 28','תל אביב','2023-04-22 17:08:22.176510',0,'עינבר','בלומנטל','neves-obegi6@gmail.com',0,1,'2023-04-22 17:08:22.108731','parent'),(14,'nebim_ahoyu21@hotmail.com','pbkdf2_sha256$260000$DzEyUjHMGuckXTG2V4h4fL$GnhscWhO1UBu+8QyhMDyRg9PR3yqziwI44zFqUkivmE=','שדרות הצנחנים 2','רמת גן','קהילת בריסק 10','תל אביב','2023-04-22 17:08:22.273660',0,'אביטל','אלטמן','nebim_ahoyu21@hotmail.com',0,1,'2023-04-22 17:08:22.201232','parent'),(15,'pak_agameda87@mail.com','pbkdf2_sha256$260000$Qp0rzMbymoXBvnGJAIfMy5$0Txbsm8Ue4HC9/TcgFR4QfDPbpkbjv4RgbgOLdgqmEM=','שדה בוקר 8','גבעתיים','החשמונאים 96','תל אביב','2023-04-22 17:08:22.360545',0,'עידו','ווינשטיין','pak_agameda87@mail.com',0,1,'2023-04-22 17:08:22.290538','parent'),(16,'yugigo-donu83@gmail.com','pbkdf2_sha256$260000$vOsTAToGlsuReKugWR6KGL$IBO5NCLNNg8LxHYg6GE17Ux5xzypR2k/AjJAltC+f6M=','הרא\"ה 5','רמת גן','זינגר בשביס יצחק 7','תל אביב','2023-04-22 17:08:22.445580',0,'יסמין','שיף','yugigo-donu83@gmail.com',0,1,'2023-04-22 17:08:22.377248','parent'),(17,'jufuv-orifi98@mail.com','pbkdf2_sha256$260000$8GBGieBWTtCTxHRdOR4dDq$kZOBoTNqoBszK2LR9DvSl4W7fryJwslU9wkGvB/Yyso=','המעין 1','גבעתיים','בר כוכבא 26','תל אביב','2023-04-22 17:08:22.530554',0,'אדל','בן חמו','jufuv-orifi98@mail.com',0,1,'2023-04-22 17:08:22.462650','parent'),(18,'dumu_xesunu26@aol.com','pbkdf2_sha256$260000$ofwpTpt7fsZCOKKm4h3GJ9$xMQnfHBM8rCEGVHDNfh8B4oVT3mvvV2ZVTpVPvY1UBo=','אהרון שר 5','גבעתיים','בירנית 4','תל אביב','2023-04-22 17:08:22.624767',0,'דנה','סילברשטיין','dumu_xesunu26@aol.com',0,1,'2023-04-22 17:08:22.554030','parent'),(19,'veb_eboxete56@mail.com','pbkdf2_sha256$260000$2XXTqh8RnMbBIUsjDARR53$t9HkOGY9y0qvaKFhTYBqjWeq48wI3i4vUGN3pJA68ic=','ריינס 4','גבעתיים','חירותנו 1','תל אביב','2023-04-22 17:08:22.709791',0,'שקד','לוין','veb_eboxete56@mail.com',0,1,'2023-04-22 17:08:22.641672','parent'),(20,'radej_eguhi57@gmail.com','pbkdf2_sha256$260000$wnqqG6Myi3d98pb5oANIH4$dNzwyoyBsLVMzGJh9fHGnp0beU0kjwL6VTtpp/ftNqI=','רותם 4','גבעתיים','התקוה 70','תל אביב','2023-04-22 17:08:22.794173',0,'מירב','בנימין','radej_eguhi57@gmail.com',0,1,'2023-04-22 17:08:22.726422','parent'),(21,'votoyoj_uhi12@gmail.com','pbkdf2_sha256$260000$V5UHzJzcjmiDFTBN7dQk92$e1nMtGQU5kT0HKSMrt8dhtIYBQEHOURCd+UfoLwfpzc=','ז\'בוטינסקי 22','גבעתיים','פעמונית 7','תל אביב','2023-04-22 17:08:22.880187',0,'שירה','בוכבוכט','votoyoj_uhi12@gmail.com',0,1,'2023-04-22 17:08:22.811328','parent'),(22,'tarida_sobi13@mail.com','pbkdf2_sha256$260000$7EBV2T463VHSi0WsoF1OiI$9Y9l31cevtOQpu7rMDHtpaLMKMq+sIbYBq75kpxEat0=','הצנחנים 11','גבעתיים','המלך ג\'ורג\' 35','תל אביב','2023-04-22 17:08:22.965347',0,'תום','גסר','tarida_sobi13@mail.com',0,1,'2023-04-22 17:08:22.896673','parent'),(23,'susug_acadu77@gmail.com','pbkdf2_sha256$260000$MqXoNXiAMX4lNaobHcyLLD$2FGkqQ2y/Ifc+cbssL3EIIw/cLl7HtGHnTFvZ48WGFg=','שדה בוקר 8','גבעתיים','קיפניס לוין 6','תל אביב','2023-04-22 17:08:23.053620',0,'מיכל','לולו','susug_acadu77@gmail.com',0,1,'2023-04-22 17:08:22.982078','parent'),(24,'ledoli_bave43@yahoo.com','pbkdf2_sha256$260000$zAXwAkHcHhdsnj0kYC7GI8$80AbnKTg28fOZwDs+DbksUL5ox3piDx2fykntChiXO4=','הל\"ה 58','גבעתיים','ויצמן 7','תל אביב','2023-04-22 17:08:23.138440',0,'ענת','קופמן','ledoli_bave43@yahoo.com',0,1,'2023-04-22 17:08:23.070750','parent'),(25,'curiyi_cavo61@gmail.com','pbkdf2_sha256$260000$R1ZHNfnJMCgUujiegL9CeU$/OmqZgNzMIoRuLIDZgDr//qOuqCww05E3Q8x0d/mKmE=','אילת 8','גבעתיים','נגבה 33','תל אביב','2023-04-22 17:08:23.233020',0,'ליטל','מזרחי','curiyi_cavo61@gmail.com',0,1,'2023-04-22 17:08:23.164399','parent'),(26,'hahazu_zula31@hotmail.com','pbkdf2_sha256$260000$YDPmWHqNRKYc8g19cFb5Kc$DUO/opxe3NLGdRo7GjERh2pyFWuFgqv+tGgC8GMcoZ8=','ישראל טרייבר 59','גבעתיים','מגן אברהם 25','תל אביב','2023-04-22 17:08:23.323504',0,'הילה','גולדברג','hahazu_zula31@hotmail.com',0,1,'2023-04-22 17:08:23.256275','parent'),(27,'sodu-tofubo51@outlook.com','pbkdf2_sha256$260000$5f4sLYXuh0Vt0Dn19YaAkN$wdGrqPKyWledAtxjFBj9pqOU0WCgHqcZrbhZXOxILCI=','צהל 28','גבעתיים','סלע יעקב 22','תל אביב','2023-04-22 17:08:23.415884',0,'תמר','סבן','sodu-tofubo51@outlook.com',0,1,'2023-04-22 17:08:23.349857','parent'),(28,'piwon-acadi36@outlook.com','pbkdf2_sha256$260000$3phusVpFZzGTOOQez1BGVt$6pmMcXkNt71D9IE/dNOLXQKjqXDhXLCni0MHQGkCDEE=','דויד אלעזר 6','כפר סבא','דרך ההגנה 118','תל אביב','2023-04-22 17:08:23.500153',0,'לינוי','קורן','piwon-acadi36@outlook.com',0,1,'2023-04-22 17:08:23.432546','parent'),(29,'min_upivode38@outlook.com','pbkdf2_sha256$260000$fwQOmy6kzmEs5zV4ZLic3T$TTsZl+y1JKTNF08k28Efa+coY/hI9DIThLpArd2cc4k=','סוקולוב 15','כפר סבא','ברון עקיבא 8','תל אביב','2023-04-22 17:08:23.585652',0,'לימור','חזן','min_upivode38@outlook.com',0,1,'2023-04-22 17:08:23.516936','parent'),(30,'sugiya_fawi51@aol.com','pbkdf2_sha256$260000$xamZ8LvENk80bMpxKiq2Ic$N+bFCv5YYlYlPWYI/xEhGyCaSdfaebYmBu0BO6L5Mes=','הדר 1','כפר סבא','פיינשטיין מאיר 20','תל אביב','2023-04-22 17:08:23.679242',0,'זיו','טלמור','sugiya_fawi51@aol.com',0,1,'2023-04-22 17:08:23.602506','parent'),(31,'laviw_okute94@outlook.com','pbkdf2_sha256$260000$91SypYsJIcWqLjntxmDjT1$DQ4JmHz31Tguhz2ReL0I6eo6AHeC/PxVoRqmsBJSdF8=','גולומב 5','כפר סבא','ליוויק 7','תל אביב','2023-04-22 17:08:23.774865',0,'נוגה','קדארי','laviw_okute94@outlook.com',0,1,'2023-04-22 17:08:23.705472','parent'),(32,'bawob_imitu70@hotmail.com','pbkdf2_sha256$260000$QLjEJ5K7ysCQmP78lXnvJE$n8QEpEbtsrNHU+NJqUTZhuwyYl2LzToDzbS4WA1TGxk=','סירני 2','כפר סבא','ארלוזורוב 95','תל אביב','2023-04-22 17:08:23.858139',0,'עדי','וייס','bawob_imitu70@hotmail.com',0,1,'2023-04-22 17:08:23.791786','parent'),(33,'bigilu_hulu32@hotmail.com','pbkdf2_sha256$260000$fFhNnvQGBPovUidTNZJlfk$c3sXafdieIReuYVqb5EebXf7jh11ty83aVDLkRIIOOQ=','משעול הקלע 8','כפר סבא','דם המכבים 21','תל אביב','2023-04-22 17:08:23.953881',0,'דור','שרון','bigilu_hulu32@hotmail.com',0,1,'2023-04-22 17:08:23.883808','parent'),(34,'cagu-gegodo71@outlook.com','pbkdf2_sha256$260000$tXmGEM6ge6WDShUPRfePAo$q2reFeL6tBt6ZF9Mc6cy1GbK3hnE26Ti8f5a1zgm+rs=','רחוב ל\"ה 16','כפר סבא','בורלא יהודה 2','תל אביב','2023-04-22 17:08:24.047210',0,'צור','לוי','cagu-gegodo71@outlook.com',0,1,'2023-04-22 17:08:23.979375','parent'),(35,'guge-pobazi61@aol.com','pbkdf2_sha256$260000$bEboIYR4EBujnToqR81s2P$YCwOrfaYOrcz6TvM6NyAd5SoXjvVCs98AV96S8oGXD0=','אוסטשינסקי 23','כפר סבא','ישראל מסלנט 22','תל אביב','2023-04-22 17:08:24.145321',0,'אבי','דגני','guge-pobazi61@aol.com',0,1,'2023-04-22 17:08:24.072620','parent'),(36,'sulozo_fico2@gmail.com','pbkdf2_sha256$260000$B7iDVpa8vjTnFnYeVe4z0G$bIw5R1ayuGqmcbIhyaJPG5U/AgfN+P+prIs+IkI9+sA=','השחר 6','כפר סבא','וייז ג\'ורג\' ד\"ר 1','תל אביב','2023-04-22 17:08:24.230654',0,'שרה','לנדסמן','sulozo_fico2@gmail.com',0,1,'2023-04-22 17:08:24.162652','parent'),(37,'zuf_oxipubi55@aol.com','pbkdf2_sha256$260000$H78ln2BE6g2EHFCK8M8vOn$OR/MABTw7OA8oD5uS2t7QGrQ2K5/Dr9/BZAdIF7YybU=','רחל המשוררת 6','כפר סבא','קובנר אבא 16','תל אביב','2023-04-22 17:08:24.324324',0,'דבורה','גיל','zuf_oxipubi55@aol.com',0,1,'2023-04-22 17:08:24.256099','parent'),(38,'gepew-ayini21@aol.com','pbkdf2_sha256$260000$PLUxBZ6Xwoj9zw9WuMxzFM$5+NMwzAHLXu7nRLRE2NuwptJA84Qv0ZvnBCVRKL/JPg=','גאולה 31','כפר סבא','דפנה 7','תל אביב','2023-04-22 17:08:24.419424',0,'אריאל','מנדנבליט','gepew-ayini21@aol.com',0,1,'2023-04-22 17:08:24.349513','parent'),(39,'yerijaj_ogo30@yahoo.com','pbkdf2_sha256$260000$GR6LOqV54bN1VKMxGY0dmg$HgOV5JH0ynmkzeUyMS02Le/LXbimOA54efsYRahOA1I=','הגליל 56','כפר סבא','פרנקל ידידיה 17','תל אביב','2023-04-22 17:08:24.515073',0,'תמר','פיירמן','yerijaj_ogo30@yahoo.com',0,1,'2023-04-22 17:08:24.445169','parent'),(40,'gisetuj-esu26@aol.com','pbkdf2_sha256$260000$rcdeAuT4UtPnsDVbkXfhnj$jwy+1wVjuaac3Yk7RPQlIXh6htxMBwT5CJ6APBsLFoA=','רופין 30','כפר סבא','שלומציון המלכה 38','תל אביב','2023-04-22 17:08:24.611572',0,'רן','נסינג','gisetuj-esu26@aol.com',0,1,'2023-04-22 17:08:24.543683','parent'),(41,'yamo-joseza63@yahoo.com','pbkdf2_sha256$260000$6p14RwitLrPsqect906fkr$d6vGNnAu6rPA4Az14bkJ/+KN7Ah9uOwCUu+0yia6QXE=','רפפורט 3','כפר סבא','סלע יעקב 22','תל אביב','2023-04-22 17:08:24.697215',0,'קרן','שחר','yamo-joseza63@yahoo.com',0,1,'2023-04-22 17:08:24.628305','parent'),(42,'rac_akemipo4@hotmail.com','pbkdf2_sha256$260000$olKPtFQzuUiejTlYTbqL5X$YS6l+Xq+Lya1h7B0HbNuYUOUKoiR2lqLn6sqeXSENwQ=','התאנה 3','כפר סבא','הרטוב 25','תל אביב','2023-04-22 17:08:24.795957',0,'ליהי','רז','rac_akemipo4@hotmail.com',0,1,'2023-04-22 17:08:24.722973','parent'),(43,'zuti-cesetu91@gmail.com','pbkdf2_sha256$260000$uBxIhDc6sfiY26IdCureqh$vmS0RAodgAgtqMOKf75AiqLKQBgq3VKrgMXaDGqmImc=','שאול המלך 5','כפר סבא','ירושלמי 16','תל אביב','2023-04-22 17:08:24.886986',0,'סיוון','לוי','zuti-cesetu91@gmail.com',0,1,'2023-04-22 17:08:24.813526','parent'),(44,'berun_azaje98@aol.com','pbkdf2_sha256$260000$GuQfjqVfDbfPnPpvyjVL6v$MdZYXJKiXBzgw9RTbETl/Z5hJgazhoihW347ngBdD9A=','יגאל ידין 2','כפר סבא','אריסטו 18','תל אביב','2023-04-22 17:08:24.979444',0,'דנה','בר','berun_azaje98@aol.com',0,1,'2023-04-22 17:08:24.904427','parent'),(45,'sekorof-ude24@yahoo.com','pbkdf2_sha256$260000$4hTvRnBuzmrCO8seMMgweB$zWCf3J0FeXq/T9DTpXyXkY9Z/uFeHITZDJ++EsfiP5I=','המעפילים 18','כפר סבא','חוני המעגל 5','תל אביב','2023-04-22 17:08:25.064563',0,'יעל','בק','sekorof-ude24@yahoo.com',0,1,'2023-04-22 17:08:24.996273','parent'),(46,'sesuvoy_abu93@outlook.com','pbkdf2_sha256$260000$emCjQC6hDsF3zOEiLVFbgg$2RM9q967u4lZER8iAPEfC1fyDJ8H1qr/Ip/KuNeNFAQ=','ניצנים 11','כפר סבא','חיננית 5','תל אביב','2023-04-22 17:08:25.166695',0,'זיו','הרוש','sesuvoy_abu93@outlook.com',0,1,'2023-04-22 17:08:25.088148','parent'),(47,'yuco_xokupi28@hotmail.com','pbkdf2_sha256$260000$EDnTsVzBKkKPuoFFdmVIb1$ucgZMTfu4EyX+5GD8MRyIaAFITo0YfksCBWJtc06Psw=','בן יהודה 23','כפר סבא','לאה גולדברג 6','תל אביב','2023-04-22 17:08:25.259396',0,'אורי','מנחם','yuco_xokupi28@hotmail.com',0,1,'2023-04-22 17:08:25.190745','parent'),(48,'hukexo-mota36@outlook.com','pbkdf2_sha256$260000$h4dNz63Hnm1Prr7agMc0TH$HP3NAzw72q+fkYF7glrib8PDNewWE2nn9ThpLUz2EyI=','העמק 28','כפר סבא','סנפיר 9','תל אביב','2023-04-22 17:08:25.343746',0,'מיטל','הורביץ','hukexo-mota36@outlook.com',0,1,'2023-04-22 17:08:25.276078','parent'),(49,'miputoz_aho15@hotmail.com','pbkdf2_sha256$260000$gFaNEmEeklavPZCMHTVwS2$7GqjVyJHYRHl3JEuWhdj4Ckf8xcR8CU8arQJ0O+UxHo=','האילנות 20','כפר סבא','ארבר מנחם 26','תל אביב','2023-04-22 17:08:25.443560',0,'נעומי','זוהר','miputoz_aho15@hotmail.com',0,1,'2023-04-22 17:08:25.370047','parent'),(50,'jiza-rubahu71@mail.com','pbkdf2_sha256$260000$eJxVf8PtwEhIr2eUrR2BFm$Qbb3kk/Keih9sq/cJKZLmEg0RqOBd/uALQQh68PUj4k=','יאנוש קורצ\'ק 10','כפר סבא','שדרות גורי ישראל 23','תל אביב','2023-04-22 17:08:25.527427',0,'אור','שמש','jiza-rubahu71@mail.com',0,1,'2023-04-22 17:08:25.460294','parent'),(51,'nizivof-ere13@yahoo.com','pbkdf2_sha256$260000$NCGJTxvIpaAwq2RHnR0w3n$xJnxM1GbN/frRD2vNrXEhcohJyMzheu0cnhxIn783Rs=','ישראל ישעיהו 5','כפר סבא','פן אלכסנדר 1','תל אביב','2023-04-22 17:08:25.620071',0,'עדי','מזרחי','nizivof-ere13@yahoo.com',0,1,'2023-04-22 17:08:25.552712','parent'),(52,'rewi_sageja67@hotmail.com','pbkdf2_sha256$260000$FP1lScJRcoTvta7N8P8a9o$kukXjEnOFB63OZbLhyVP629a8VFVH5V0BtSjVk0+veA=','חבצלת השרון 13','כפר סבא','פילדלפיה 3','תל אביב','2023-04-22 17:08:25.709791',0,'אנה','דויד','rewi_sageja67@hotmail.com',0,1,'2023-04-22 17:08:25.642389','parent'),(53,'humu-milegi1@gmail.com','pbkdf2_sha256$260000$IVEMilYykt8uYvd68nagAz$ZgwdZhQ6CUoXNH42aR2qX3iD+jhanEcit6uApFtGjY0=','אהרונוביץ\' 15','כפר סבא','דיזנגוף 221','תל אביב','2023-04-22 17:08:25.801949',0,'ליה','שלום','humu-milegi1@gmail.com',0,1,'2023-04-22 17:08:25.733078','parent'),(54,'lasuc_owucu55@yahoo.com','pbkdf2_sha256$260000$g325hACqfgKA4XGfoadk1U$w/cG2eZPrADxXsvrnx3aOVeLH3NPXT5p4WDWUoh3BsM=','טשרניחובסקי 4','כפר סבא','מאור עינים 4','תל אביב','2023-04-22 17:08:25.887473',0,'יעל','מירון','lasuc_owucu55@yahoo.com',0,1,'2023-04-22 17:08:25.818967','parent'),(55,'kum-oweteha75@outlook.com','pbkdf2_sha256$260000$LVu5yJcXchPkOd4SXRbbHu$cq5AHwUV+CneHcd2oyQsOck85t+1YpMs6gnCTFb/eiE=','אביבים 10','כפר סבא','ברלין אליהו 4','תל אביב','2023-04-22 17:08:25.975622',0,'קטי','יעקב','kum-oweteha75@outlook.com',0,1,'2023-04-22 17:08:25.904443','parent'),(56,'buji-monuka54@hotmail.com','pbkdf2_sha256$260000$YGde3VGuJLzrNEQUegKMGI$FrOSOiRVTXNIVgPALw627jrMWXxyCUqMkE9wuwkhEhI=','פשוש 6','כפר סבא','בן סירא 4','תל אביב','2023-04-22 17:08:26.070563',0,'ענת','סגל','buji-monuka54@hotmail.com',0,1,'2023-04-22 17:08:26.002714','parent'),(57,'wor_imulove50@aol.com','pbkdf2_sha256$260000$FBdZfFxoQeyto2229GW8hZ$LV37lOiRC8aTgNYHmYXHUkOv2PptVKTY966V/V6ZVaE=','רש\"י 9','כפר סבא','לובטקין צביה 15','תל אביב','2023-04-22 17:08:26.166653',0,'עדי','קפלן','wor_imulove50@aol.com',0,1,'2023-04-22 17:08:26.087435','parent'),(58,'hiday-uvufe93@yahoo.com','pbkdf2_sha256$260000$JkVxGS1ekgIx1oc8CNT7K0$fPZs74tJVd3oldFHy/27E013tu51A2XP/lA2Lce48Fg=','שדרות צנחנים 18','רמת גן','זרובבל 3','רמת השרון','2023-04-22 17:08:26.283542',0,'שמעון','לבייב','hiday-uvufe93@yahoo.com',0,1,'2023-04-22 17:08:26.192722','parent'),(59,'vov_anohomo25@yahoo.com','pbkdf2_sha256$260000$CFjFMwn3qy67fx9oDtP5i1$IYlUzxrr/GQouCXXGQTzU6OgJAprmWpMrCTMGMCKFB0=','שדרות צנחנים 11','רמת גן','זרובבל 3','רמת השרון','2023-04-22 17:08:26.382099',0,'קארין','מזור','vov_anohomo25@yahoo.com',0,1,'2023-04-22 17:08:26.314489','parent'),(60,'zuhuh-owoza91@mail.com','pbkdf2_sha256$260000$HCgcxnwmceFw92xqXG1R3g$AY5v9+rWRX3/36iQ0fKF59tOV/cDoha4OZMm60qMfg0=','שמעוני 10','רמת גן','זרובבל 3','רמת השרון','2023-04-22 17:08:26.465502',0,'טליה','נגבי','zuhuh-owoza91@mail.com',0,1,'2023-04-22 17:08:26.398483','parent'),(61,'hedu-cuhetu30@mail.com','pbkdf2_sha256$260000$XZu9Q6K9sB7GKyUvRjHYFp$Rlj82YZo5wp7qtuanaf+63yB6m9kbf6nsWKpybkxS64=','תל חי 36','רמת גן','הרב קוק 43','רמת השרון','2023-04-22 17:08:26.562025',0,'רעות','עמית','hedu-cuhetu30@mail.com',0,1,'2023-04-22 17:08:26.490647','parent'),(62,'mekoci_yiho46@gmail.com','pbkdf2_sha256$260000$IWBA6xgY4ZiZZ7xtDIJ1RC$heAEMST5VMg+Wij5FMNmlXN6pV/IGWN9qN5gjZoN1xM=','תל חי 68','רמת גן','הנוטע 4','רמת השרון','2023-04-22 17:08:26.659566',0,'נופר','לביא','mekoci_yiho46@gmail.com',0,1,'2023-04-22 17:08:26.588033','parent'),(63,'wexevep_ana64@hotmail.com','pbkdf2_sha256$260000$yLdhCRX3ZS04FtcHe0Fr9O$YbieNrQgdde8PvV5jW+NCBuBg+rvt2m3N8vKVULD5RU=','תל חי 47','רמת גן','הפרחים 4','רמת השרון','2023-04-22 17:08:26.749564',0,'קרין','לוי','wexevep_ana64@hotmail.com',0,1,'2023-04-22 17:08:26.676318','parent'),(64,'doho_kepake58@mail.com','pbkdf2_sha256$260000$sqX4rNPzTNVXQDHb0nCVOz$B/t35ceeUczZy7LOo6FaTyBTL5h8+cqBrRaAnRS4UzQ=','משה דיין 13','רמת גן','השופטים 56','רמת השרון','2023-04-22 17:08:26.848549',0,'ורד','אטיאס','doho_kepake58@mail.com',0,1,'2023-04-22 17:08:26.775746','parent'),(65,'darulul_ize43@gmail.com','pbkdf2_sha256$260000$aO2cxSfP5BFNT2yhRNkI9b$EOirX0jfimBJVT2ix6WSZhXMAB82RbSTOFEh19KT0ac=','התפוצות 40','רמת גן','אברבוך 14','רמת השרון','2023-04-22 17:08:26.960916',0,'לירן','יחזקאל','darulul_ize43@gmail.com',0,1,'2023-04-22 17:08:26.881212','parent'),(66,'sasawej_ijo50@yahoo.com','pbkdf2_sha256$260000$8svw5fCCd2GdlcTCnfNdRd$3twvlAxrxNBdV9rwqBluSnztSouE7IiDWeh4ANBXd8s=','אחד העם 34','רמת גן','הירדן 25','רמת השרון','2023-04-22 17:08:27.059895',0,'חן','זגורי','sasawej_ijo50@yahoo.com',0,1,'2023-04-22 17:08:26.977827','parent'),(67,'pabaheh_idi57@aol.com','pbkdf2_sha256$260000$R54CBU8V7VjuvIhqjRCWJN$aXzhSEzdUnM60yI2cc2cIOhUxcL34hSFNeCxlMckz/Q=','גרנדוס 35','רמת גן','מוהליבר 1','רמת השרון','2023-04-22 17:08:27.144053',0,'איילה','אגם','pabaheh_idi57@aol.com',0,1,'2023-04-22 17:08:27.076737','parent'),(68,'gegub-ecuji67@aol.com','pbkdf2_sha256$260000$oGD7VynGNnjvfT5vlzY4LK$D4D2csvWmvCPHPqOG4bSQOuU468iJV6Y8m3uj4ycnUI=','עוזיאל 103','רמת גן','הראשונים 14','רמת השרון','2023-04-22 17:08:27.239049',0,'הדס','אליאס','gegub-ecuji67@aol.com',0,1,'2023-04-22 17:08:27.170990','parent'),(69,'rup_eloniwu55@aol.com','pbkdf2_sha256$260000$973M0qxYt7SLJIwr8aFgnv$PY9w2XSC2scCV7m86iIql8V8fo143rZTp2Cg+ifel9I=','עוזיאל 103','רמת גן','המלאכה 16','רמת השרון','2023-04-22 17:08:27.337850',0,'נועם','כץ','rup_eloniwu55@aol.com',0,1,'2023-04-22 17:08:27.262230','parent'),(70,'bapa_xaxexa61@aol.com','pbkdf2_sha256$260000$5QkcrPvazbx9MiqeB5PZSr$gEYWc3ZKJihIq0Op7UHDLrpIASrsA0Rh+AWvRw/AMeo=','בת שוע 9','רמת גן','הפלמ\"ח 8','רמת השרון','2023-04-22 17:08:27.432042',0,'תום','גולדמן','bapa_xaxexa61@aol.com',0,1,'2023-04-22 17:08:27.363156','parent'),(71,'fobim-evohi80@yahoo.com','pbkdf2_sha256$260000$rfQok8arKMIH7TwHTy8KpD$rzKNCP5iUQWS5x9R/HEQ0YwpFmIYlzh9mXSXyIveUkc=','החי\"ל 38','רמת גן','אברבוך 14','רמת השרון','2023-04-22 17:08:27.526916',0,'מריה','ויטקין','fobim-evohi80@yahoo.com',0,1,'2023-04-22 17:08:27.457644','parent'),(72,'pali-kopewi95@gmail.com','pbkdf2_sha256$260000$HqipHca0KEMcI1Q0EBb24p$AN8owEOJ6iFF42/ToLRFbe9sBc8kwgC/81A966gMluU=','שדרות צנחנים 20','רמת גן','רות 6','רמת השרון','2023-04-22 17:08:27.620522',0,'מעיין','הרצוג','pali-kopewi95@gmail.com',0,1,'2023-04-22 17:08:27.551616','parent'),(73,'celided-eyu48@outlook.com','pbkdf2_sha256$260000$2KKJsCpOHtzMto07qk8AlD$itWW9f1KanZj+qAVJlE6VSVdlCq3SYN/7PfvEZMbzlk=','המלאכה 14','רמת גן','לילך 3','רמת השרון','2023-04-22 17:08:27.706704',0,'יובל','כהן','celided-eyu48@outlook.com',0,1,'2023-04-22 17:08:27.639406','parent'),(74,'almogtry@try.com','pbkdf2_sha256$600000$kgG7yIIrwjZqLL5Oqf4smj$N7n61hr52Wbon+9xZOkWWM7QQI7TQk9IG8HtI5fzvM4=','אדיר 8','ראש העין','','','2023-05-06 10:47:04.542564',0,'אלמוג','אלטמן','almogtry@try.com',0,1,'2023-05-01 19:35:00.634089','parent'),(75,'a@a.com','pbkdf2_sha256$260000$KGWeAgCkNZ6X8aRK0kRkvM$VNQAcabN+YiDYo1R5hKO4uuYGhN67mCvhKi0yfAsywQ=','','','','','2023-06-02 09:46:46.171893',0,'נועה','קירל','a@a.com',0,1,'2023-05-06 17:34:56.450410','parent'),(76,'danieljaffe@mail.tau.ac.il','pbkdf2_sha256$260000$isP40LRsr8VjJEZxWrfjVY$Uxhg1Jh6hYz2jaZn5bgGOzyEjSbY6MlXLygYTKD0zjM=',NULL,NULL,NULL,NULL,'2023-05-25 09:45:30.116519',0,'daniel','jaffe','danieljaffe@mail.tau.ac.il',0,1,'2023-05-21 07:21:59.201641','teacher'),(77,'ilan@aa.com','pbkdf2_sha256$260000$0EXRypSGnsgEUgg862uI9N$MV/iHkcPlvaszdOWpEQ4MIxxv4zbhOjNpWVejZoFib8=',NULL,NULL,NULL,NULL,'2023-06-01 09:58:22.198210',0,'אילנה','דיין','ilan@aa.com',0,1,'2023-06-01 09:58:22.003338','teacher');
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

-- Dump completed on 2023-06-02 13:20:30
