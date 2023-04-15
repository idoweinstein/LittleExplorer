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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add comment',7,'add_comment'),(26,'Can change comment',7,'change_comment'),(27,'Can delete comment',7,'delete_comment'),(28,'Can view comment',7,'view_comment'),(29,'Can add kindergarten',8,'add_kindergarten'),(30,'Can change kindergarten',8,'change_kindergarten'),(31,'Can delete kindergarten',8,'delete_kindergarten'),(32,'Can view kindergarten',8,'view_kindergarten'),(33,'Can add parent',9,'add_parent'),(34,'Can change parent',9,'change_parent'),(35,'Can delete parent',9,'delete_parent'),(36,'Can view parent',9,'view_parent'),(37,'Can add kindergartenadditionalinfo',10,'add_kindergartenadditionalinfo'),(38,'Can change kindergartenadditionalinfo',10,'change_kindergartenadditionalinfo'),(39,'Can delete kindergartenadditionalinfo',10,'delete_kindergartenadditionalinfo'),(40,'Can view kindergartenadditionalinfo',10,'view_kindergartenadditionalinfo');
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
  `grade` tinyint unsigned DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_kindergarten_id_idx` (`kindergarten_id`),
  KEY `FK_parent_id_idx` (`parent_id`),
  CONSTRAINT `FK_comment_kindergarten_id` FOREIGN KEY (`kindergarten_id`) REFERENCES `kindergarten` (`kindergarten_id`),
  CONSTRAINT `FK_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'פעוטון משפחתי עם צוות חם ואוהב, מטפלות מסורות והכי חשוב הילד מגיע ויוצא עם חיוך מהגן!',5,'0000-00-00'),(2,1,2,'הבת שלי שם מגיל 4 חודשים ותהיה עד גיל 3 לפחות! גן מושלם, נקי ומסודר, צוות מדהים, רך וקשוב לצרכי הפעוטות',5,'0000-00-00'),(3,1,3,'זכינו להכיר צוות חם אוהב ומקבל, עם המון סבלנות ומתן יחס אישי וקרוב. אין ספק שעשינו את הבחירה הנכונה!',5,'0000-00-00'),(4,2,4,'עומר שלנו נמצא בגן כבר יותר משנה ואנחנו מאוד מאוד מרוצים! מהרגע הראשון שנכנסנו לגן הרגשנו כמו משפחה.',5,'0000-00-00'),(5,2,5,'איזה כיף זה לשלוח את הבת שלנו לגן כשאת פניה מקבל צוות חייכן ונעים שרואים שאוהב את העבודה שלו בזמנים כאלה זה מאוד מרגיע לקבל תחושה של ביטחון וחום אנחנו מרוצים מאוד מהבחירה שלנו וממליצים',5,'0000-00-00'),(6,3,6,'אחרי ״מסע חיפושים״ אחר הגן הנכון , אני יודע ומרגיש שזו הייתה הבחירה הנכונה ביותר עבורנו ועבור אלי. כשאלי פוגשת בבוקר את הגננת והצוות היא מתמלאת באושר ולא מפסיקה לחייך וכך גם כשאנחנו באים לקחת אותה. אלי נמצאת בפיקוח מקצועי ובהשגחה מתמדת לאורך כל היום, הגן מספק עבורה פעילות מלאה בגירוי התפתחותי, הצוות תמיד מחייך. יש תקשורת עם הגן לאורך כל היום. הגן מחוסן. מומלץ בחום.',5,'0000-00-00'),(7,3,7,'גן נעים מאוד וצבעוני, עם צוות מדהים, מסור ומקצועי שנותן יחס חם ועושה הכל כדי שלילדים יהיה טוב. מעדכנים אותנו בכל פרט קטן ומקבלים המון תמונות ועדכונים על הנעשה בגן. הצוות מקסים, אכפתי, ואוהב. מומלץ מאוד',5,'0000-00-00'),(8,5,8,'גן מהמם ביופי, נקי ומסודר עם המון משחקים מושקעים, אוכל בריא, צוות מקצועי אכפתי ורגיש. אנחנו שנה ראשונה בגן ולמרות ההסתגלות והלחץ של אמא טרייה מאד מרוצה מהגן.',5,'0000-00-00'),(9,5,9,'התאומים שלי היו בו וכעת נמצא אחיהם הקטן. בגן הזה יש רמה של איכפתיות, טיפול, חום מדהימה. הילדים הולכים עם חיוך וחוזרים עם חיוך. יש השקעה בהפעלות בהתאם לקבוצות הגיל, מזון טעים שמבושל מדי יום, ותמונות יומיות כדי לחוות ביחד עם הילדים את הכל ביחד.',5,'0000-00-00'),(10,5,10,'לגן יש יחס חם ואוהב לכל ילד. יש מגוון רחב של פעילויות מלאות בהשקעה בילדים וההשקעה ניכרת בהתפתחות הילדים (אנחנו מוצאים את עצמנו מופתעים המון ממשהו חדש שהילדה למדה ולא מאיתנו). הגן תמיד נקי והילדים מתוקתקים, האוכל ברמה גבוהה ויש אירועים מושקעים',5,'0000-00-00'),(11,6,11,'אני מאוד מרוצה מהגן. היחס לילדים מעולה, הגן מפתח עצמאות אצל הילדים. הפעילויות מאוד מאוד מגוונות, האוכל טעים ומזין. כל האירועים בגן מושקעים מאוד. כל ילד מקבל יחס אישי. מאוד מקפידים בגן על ניקיון. אני אמשיך לשלוח את בני לגן הזה גם בשנה הבאה.',5,'0000-00-00'),(12,6,12,'הכנסנו את אביב לגן בחששות, בכל זאת ילד ראשון ומאוד דאגנו. לאחר כמה ימים כבר נוכחנו לדעת שהילד בידיים מעולות, הצוות משקיע, אוהב וחם ואין מאושרים מאיתנו שהוא שם.',4,'0000-00-00'),(13,6,13,' הגן נקי, הכל צבעוני, צוות מספר 1, אוכל טרי כל יום, ילדים מאושרים , מגוון פעילויות מעשירות לילדים, חום ואהבה אף פעם היה חסר. דאגה לילדים במקום הראשון. פשוט גן מהמם . ממליצה בחום לכולם',5,'0000-00-00'),(14,7,14,'הילד שלי נכנס לגן בגיל 11 חודשים והיה לו ממש קשה בהתחלה אבל עם הזמן הוא התרגל לגן ולצוות המדהים שעטפו אותו בחום ובאהבה. הילד חוזר כל יום נקי ושמח ואני מאוד מרוצה מהצוות על הדאגה והטיפול בילד שלי, ממליצה בחום!',4,'0000-00-00'),(15,8,15,'אתה יודע שעשית את הבחירה הנכונה של הגן, כשאתה שם את הילד שלך בבוקר בגן, והוא לא מפסיק לחייך לצוות ושמח להגיע. וכמובן כשאתה מגיע לאסוף אותו בסוף היום והוא כולו מלא חיוכים, ואתה רואה שהיה לו יום מקסים. עם זאת, המבנה של הגן הוא ישן,  אם את/ה מחפש מקום סופר נקי שהילד יכול ללקק את הרצפות, זה פחות בשבילך.',3,'0000-00-00'),(16,9,16,'גן עם צוות מדהים וחם. משקיעות בילדים. דואגות, מטפחות , אכפתיות ומחבקות. נעימות ותמיד עם חיוך. הקטנה שלנו אהבה להגיע כל בוקר. הלכתי שקטה לעבודה בידיעה שהילדה שלי נמצאת בידיים הכי טובות שיש. ממליצה בחום לכל הורה :)',5,'0000-00-00'),(17,10,17,'וות מלא באהבה , צוות שמשקיע בלימוד תכנים ,הילד ככ שמח להגיע לגן כל פעם מחדש גם אחרי חגים גם אחרי חופש גדול פשוט הלך בשמחה ',5,'0000-00-00'),(18,11,18,'הגן הזה הוא פשוט משפחה. כאמא \"לחוצה\" אני ככ רגועה כשהילדה נכנסת בדלת הגן',5,'0000-00-00'),(19,12,19,'גן מעולה! הילדה שלי מגיעה כל בוקר לגן בחיוך וקופצת בשמחה על הצוות! צוות מכיל מחבק וחם.. המון תכנים לימודיים והשקעה בילדים. אוכל טרי ומזין. מקום שהוא בית! מומלץ בחום!',5,'0000-00-00'),(20,12,20,'ההתנהלות מול ההורים הינה בשקיפות ומתוך שיתוף פעולה וכהורים אנו נהנים ממערכת יחסים של אמון ובטחון בצוות הגן. הן עובדות עם הילדים בקבוצות, מעבירות תכנים ומקפידות לקדם כל ילד וילד לפי צרכיו וגילו. הילדים חוזרים מאושרים, עם אוצר מילים רחב, שירים וריקודים.',5,'0000-00-00'),(21,13,21,'הגן נהדר והצוות חם ואוהב, ממליצה באהבה גדולה',5,'0000-00-00'),(22,14,22,'אין לי מילים לתאר כמה אני מרוצה מהגן. הצוות שנבחר בקפידה והוא קבוע. צוות מסור ומדהים חם ואוהב האוכל מושקע, טרי ומגוון כל יום שפע של פעילויות מהנות יש חצר גדולה מאובזרת ומוצלת גן שהוא משפחה אחת גדולה ומאושרת וזה מורגש על הילדים. מומלץ מנסיון ובהרבה אהבה',5,'0000-00-00'),(23,14,23,'גן מושלם!! צוות אוהב מנוסה ומכיל. מגוון פעילויות חינוכיות מעשירות, חוויתיות של צוות הגן ומפעילים חיצוניים. אוכל בריא, טרי מגוון וטעים!!!',5,'0000-00-00'),(24,14,24,'הגן הטוב ביותר בהרצליה ללא צל של ספק. צוות חם ואוהב שמעניק לילדים בית שני, יחס חם, מחבק ומכבד, מעדכן את ההורים ומסייע הרבה מעבר לתפקיד, ניכר שהצוות אוהב את הילדים ואת העבודה',5,'0000-00-00'),(25,15,25,'הצוות מקסים הילדים נכנסים בריצה לגן.אני רגועה שב9-10 שעות שהילד שלי נמצא בגן יש לי על מי לסמוך! רק חבל שהאוכל אינו איכותי ומזין ',4,'0000-00-00'),(26,16,26,'צוות חם,מחבק ואוהב. אוכל טרי מושקע וטעים,גן נקי. תכנים חינוכיים מושקעים מלמדים ומפתחים. הילד פורח,שמח ומתפתח - רק מילים טובות',5,'0000-00-00'),(27,17,27,'צוות מדהים ואוהב, ניהול מתוקתק ומסודר ע\"י גננת אסרטיבית ואוהבת אשר משקיעה בגן ובכל ילד בצורה יוצאת דופן. מומלץ בחום',5,'0000-00-00'),(28,18,28,'גן שהוא בית! מושלם מכל הבחינות! הצוות החם והאוהב, הנתינה והאהבה לילדים, השקעה וחשיבה על הפרט האחרון',5,'0000-00-00'),(29,20,29,'בתור אמא שעובדת משרה מלאה חיפשתי את המקום הכי טוב ששם אוכל להשאיר את הילדים שלי. ידעתי שאני לא אוכל להיות רגועה ב 100% אבל רציתי להיות הכי רגועה שאפשר. הצוות הראו לי שיש דבר כזה גן מושלם, יש דבר כזה ללכת לעבודה בעיניים עצומות ולדעת שהילדים שלך מקבלים את הכי טוב שיש. גן מלא אהבה ששם את בטיחות הילדים במקום הראשון תוך כדי קניית משחקים מורשים בלבד ועד אוכל איכותי ובייתי שמוכן יום יום',5,'0000-00-00'),(30,22,30,'בחרנו לא להמשיך בגן בגלל ההנהלות של מנהלת הגן. אישה שבהיכרות ראשונית מקסימה אותך וכשנרשמים לגן, מתברר שהיא קצת אגרסיבית, לא נעימה ולא מוכנה לשמוע ביקורת או לשמוע הורים שיש על ליבם משהו',2,'0000-00-00'),(31,24,31,'צוות קבוע, מסור ואחראי, אוכל טרי ותשומת לב לכל ילד. מבנה מרווח ובטיחותי + מרפסת שמש עם מתקנים, חוג חיות, שירים ופעילויות',5,'0000-00-00'),(32,25,32,'הגן נקי ומתוקתק (תמיד) והצוות מקצועי ועוטף את הילדים בהרבה חום ואהבה. יש פעילויות מגוונות כמו חוג חיות ומוסיקה והילדים נהנו מהם מאוד. היתה לנו שנה מדהימה, הבת שלי שמחה ללכת לגן והתפתחה מוטורית ורגישית וזה המבחן האמיתי בעיני! 100% אמון, חום, אהבה ומקצועיות!',5,'0000-00-00'),(33,28,33,'הבת שלי כבר שנה שנייה בגן ואין ספק שזכינו!! צוות חם ואוהב, גן רחב ידיים ונקי והכי חשוב חום ואהבה ללא הפסקה! מומלץ בחום ובאהבה',5,'0000-00-00'),(34,30,34,'הרגע הראשון שהבת שלנו נכנסה לגן הרגשנו את החום והאהבה לילדים. האווירה תמיד שמחה ונעימה וכיף לראות שהילדה באה עם חיוך כל בוקר. מומלץ!!',5,'0000-00-00'),(35,31,35,'אווירה חמה וביתית, יחס חם ואוהב . אמה שלנו מאוד נקשרה לשולי ולצוןת מהרגע הראשון. ממליץ בחום',5,'0000-00-00'),(36,32,36,'לצאת לעבודה עם ראש שקט ולהיות בטוח שהילד יקבל את כל מה שצריך!!! למידה כיפית, פעילויות מגוונות, יציאה לחוגים, אוכל מאודדדדד טעים , ממליצה מאוד !',5,'0000-00-00'),(37,33,37,'גן מקסים, עם יחס אישי ורגיש לכל ילד וילדה. הבן שלנו חוזר רגוע ושמח, נותן לנו הרבה שקט נפשי לדעת שהוא במקום שמתייחס בצורה מכבדת ואוהבת לצרכים שלו',5,'0000-00-00'),(38,35,38,'גן משפחתי אינטמי שלומד להכיר כל פרט הכי קטן על הילד. גישה חינוכית יחודית ויוצאת דופן המאפשרת לילד(ה) להתפתח בקצב שלו',5,'0000-00-00'),(39,37,39,' באווירה משפחתית ועם המון סבלנות, אהבה, מחשבה ורגישות- גולי ואייל מעבירים את זמנם עם הילדים- ברחבי הפארק או בתוך הגן. עם המון הקשבה לצורך של הילדים, לתחומי העניין שלהם, עם המון רגישות לנפשם- הימים בגן הם מלאכת מחשבת של אהבה לתקופה המיוחדת הזו- הילדות. כאמא, אני באמת ובתמים שקטה כל כך ושמחה כל כך שביתי זוכה לכל הטוב הזה',5,'0000-00-00'),(40,39,40,'גן נפלא, בכמה רמות מעל שאר האלטרנטיבות בסביבה, וגם אלה שלא בסביבה... 1. צוות נהדר. אמין, שקוף ואוהב. 2. אוכל ברמה גבוהה. 3. גישה לילדים - מחבקת ותומכת',5,'0000-00-00'),(41,41,41,' זו הבחירה הכי טובה שיכולתי לעשות עבור הבן שלי.הגן באוירה של משפחה, עם טיפול מסור, הקשבה מרובה, השקעה רוך והרבה אהבה. הבן שלי שמח ללכת לגן ונחשף לנגינה, ריקודים, יצירה, טיולים יומיים ואוכל בריא. אני ממליצה בחום על הגן ועל גולי ואייל שהם לא פחות ממדהימים!!',5,'0000-00-00'),(42,50,42,'בכל בוקר ביתי הולכת לגן בשמחה והתרגשות. בשבתות היא מדברת על כך שרוצה ללכת לגן. מרגיש לנו שהגן והבית מחוברים בסינרגיה מושלמת. יש לי ביטחון מלא שביתי מקבלת בגן את כל התשומת לב והאהבה להם זקוקה. בזכות הצוות המסור היא מתפתחת, גדלה ומתעצבת כאינדיוידואל. בלב שלם אוכל להגיד שלא יכולנו למצוא עבורה מסגרת יותר טובה מאשר גן פלא. לא נתקלתי בשום מסגרת ברמת מסירות, אהבה, מקצועיות,קשב ורצון טוב כמו בגן פלא. ממליצה בחום ובלב שלם.',5,'0000-00-00'),(43,50,43,'צוות מדהים, אוהב, אכפתי ומחבק! אך אני חושבת שהיה נחמד אם הפעילויות היו יותר מגוונת',4,'0000-00-00'),(44,50,44,'גן מקסים, צוות חם, אוהב מאוד משקיעים בכל ילד, משקיעים בהעשרה, למידה וחווית הילד. הדבר היחיד שלדעתי צריך להשתפר הוא המזון. אם את מחפשת מזון בריא ומזין זה פחות המקום בשביל הילד שלך',3,'0000-00-00'),(45,52,45,'לפני שרשמנו את יאיר שלנו, בדקנו וקיבלנו הרבה המלצות על הגן והצוות. לא יכולה להגיד שאנחנו לא מרוצים אך מעט מאוכזבים מהתקשרות עם ההורים ומהפעילויות שיש בגן. יאיר שלנו ילד פיקח אך בתקופה שלו בגן אינו התפתח ולמד ',2,'0000-00-00'),(46,53,46,'יש הרגשת משפחתיות עצומה שאין אותה במקומות אחרים. היחס לכל ילד וילדה הוא הכי אישי, הכי דואג , הכי משפחתי! אם זאת יש לשים לב כי המבנה ישן והתחזוקה אינה טובה',4,'0000-00-00'),(47,53,47,'הילדה  חוזרת שמחה , ושמחה לחזור כל בוקר לגן בהתלהבות! אנחנו מאוד מרוצים רגועים ושמחים עם הבחירה בגן. רק צריך לשים לב כי אין חניה כלל באיזור ויש המון פקקים בבוקר כך שאנחנו מוצאים את עצמנו נאבקים בכל בוקר כדי להגיע לעבודה אחרי ההורדה בגן',4,'0000-00-00'),(48,55,48,' צוות הגן חם ואוהב ומפזר המון אהבה וחום על הילדים, הגננת אישה מופלאה עם לב רחב ואוהב. תמיד נקי ומסודר,מבנה הגן בעייתי מעט כי ישנו רק תא שירותים אחד לכל הילדים הגמולים והחצר קטנה וצרה. הפעילויות בגן יכולות להיות יותר מגוונות',4,'0000-00-00'),(49,57,49,'הגן הוא הגן הראשון שתיכנסי אליו תרגישי נורמליות לא נקי מידי לא מלוכלך מידי רמת חינוך מצויינת רכישת מיומנויות חברתיות אין דברים כאלה דאגה והכלה של הילדים . כל אחת מצוות הגן באמצעות אוהבת ילדים בקיצור אם תרצו עוד מידע אתם/ן מוזמנות לפנות אלי',4,'0000-00-00'),(50,60,50,'הגננות מאוד לא סובלניות, מפטרים גננת שעבדה שם כבר 17 שנים בגלל משהו קטן, גננת חדשה צועקת על ילדים. מבחינת התפתחות, הגננות כמעט לא נמצאות עם ילדים, הילדים משחקים לבד כל הזמן בחצר. יש רק 1-2 חוגים כל שבוע. כל הרגליים ננשכות על ידי יתושים או פרעושים. אין מיטה או מזרונים לילדים, יש רק ספות מוזרות. לא מומלץ.',1,'0000-00-00'),(51,61,51,'גן ישן ודי מוזנח. הן מבחינת החצר, הריהוט, המבנה עצמו והן מבחינת הצעצועים והמשחקים. ניהול הגן לקוי- מודיעים הכל ברגע האחרון, ממש בערב לפני, לא נותנים מענה לשאלות. הילדים כל הזמן בחוץ ובקושי יש להם פעילויות. גננות מתעסקות בעיקר בבישול והילדים נמצאים עם הסעיות בלבד..',1,'0000-00-00'),(52,63,52,'הצוות מצוין. דואג, אכפתי, לבבי. המשחקים מעט ישנים אבל לילדים לא אכפת. מנהל הגן טיפה מנותק...',3,'0000-00-00'),(53,65,53,'הגן הכי טוב שיש. שני הילדים שלי היו בו. הצוות הכי משקיע שיש הן בפן הפדגוגי והן בתזונה, הכלה, חום ואהבה. ממליצה בחום!!!',5,'0000-00-00'),(54,67,54,'שלושת ילדי גדלו בגן הזה, הגן הזה משפחה. אין צורה אחרת לתאר את זה, גלינה מנהלת הגן חמה אוהבת, עם ניסיון של שנים. בוחרת את הצוות שלה בפינצטה, יש העשרה, אוכל ביתי, אירועים. הצוות חם ומתחשב, מקבל תמיד בחיוך את הילדים רגישים לכל נושא וזמינים כל הילדים תמיד הלכו בחיוך וחזרו עם חיוך ניקיון מאוד חשוב בגן. אם אתם מחפשים משפחה זה המקום .',5,'0000-00-00'),(55,68,55,'ממליצה בחום! הצוות נהדר, אוהב ואכפתי. הילד למד הרבה בגן וזה בזכות הגננות המדהימות',4,'0000-00-00'),(56,68,56,'הגן הוא ממש בית רחוק מהבית. הצוות נפלא, מאוד חם, סבלני ומחבק, מורגש שנבחר בקפידה . הרבה העשרה - גם בחוגים וגם בפעילות במהלך היום, הילדה התפתחה בצורה מדהימה',4,'0000-00-00'),(57,90,57,'צוות מעולה, ילדים הולכים בכייף ולא רוצים ללכת הביתה בסוף היום. אוירה חמה, הרבה פעילויות. כל הילדים של חברים גם היו או נמצאים בגן. ממליצה מאד.',4,'0000-00-00'),(58,90,58,'גן ביתי וחם, צוות מדהים. הרבה פעילויות והפעלות. מאוד מרוצה מהגן.',4,'0000-00-00'),(59,91,59,'הילדה שלי מאושרת ללכת לגן מדיי יום. הצוות מעולה ומעניק הרבה חום ואהבה. הגן תמיד פתוח להורים. הכל שקוף. כיף אמיתי להיות חלק מהגן המשפחתי הזה',5,'0000-00-00'),(60,93,60,'צוות הגן מובילות את הגן ביד רמה, הן דואגות לילדים מכל הלב, מעשירה אותם בתוכן חינוכי ונמצאת שם לכל בעיה ושאלה. אני ממליצה בחום!',4,'0000-00-00'),(61,93,61,'גננת משכמה ומעלה . צוות הסייעות סבלני ואכפתי. אמנם הבן שלי מאוד נהנה בגן אך הייתי שמחה שיחס הצוות-ילדים יהיה קטן יותר',3,'0000-00-00'),(62,101,62,'גן גדול וחצר ענקית ומושקעת, צוות מעולה תוכן לימודי עשיר, וגננת מושלמת שאין עליה. הדאגה לפרטים הכי קטנים, ארוחות מגוונות וביתיות פשוט אין דאגות וראש שקט.תעשו לעצמכם טובה ולכו תראו אתם כבר תבינו לבד .',4,'0000-00-00'),(63,102,63,'הילדה שלי חוזרת מאושרת הביתה.לפי הרוגע והשמחה שלה אני בטוחה שהיא בידיים טובות. הצוות חם ואוהב, והגן נקי ומסודר, אבל האוכל מגיע בקייטרינג ואינו טרי ובריא',3,'0000-00-00'),(64,106,64,'גן מדהים , גננת בעלת ותק עם אכפתיות , נתינה , אהבה, דאגה והקשבה לילדים וכן צוות הגן מקסים ואכפתי. גן נקי ומסודר עם אוכל ביתי וחוגים רבים לילדים .ניכר המון השקעה ומחשבה בהתאמה בין גיל הילד לפעיליות',4,'0000-00-00'),(65,109,65,'גן מדהים! הגננת הכי מקצועית, איכפתית ומדהימה שיש! צוות מעולה! אוכל ביתיי ! גן נקי ומסודר! הבחירה הכי טובה לילדים ולהורים! מומלץ בחום ואהבה!',5,'0000-00-00'),(66,110,66,'האוכל מזין ויש לנו תפריט שאנו רואים מה אוכלים כל יום. הילדה באה לגן עם חיוך יש חוגים הילדה חוזרת נקיה ומסודרת',4,'0000-00-00'),(67,112,67,'קודם כל ובעיניי הכי חשוב החום ואהבה שהילדים מקבלים בגן שווה את הכל! אחר כך הניקיון, האוכל המעולה והטעים והצוות המהמם שאפשר לסמוך בעיניים עצומות שהילד בידיים הכי טובות שיש! נותר רק לפרגן שיצליחו',4,'0000-00-00'),(68,114,68,'גן מעולה רמה גננת מדהימה עם צוות מושלם אוהב דואג ומכיל.הילדים פשוט רצים לגן.',4,'0000-00-00'),(69,115,69,'הורים יקרים, אם הינכם מתלבטים האם לרשום את ילדכם למשפחתון של כייף.. אל תתלבטו.  הגננת מהממת בזכות ולא בחסד, נותנת לילדים חום ואהבה, מלמדת ערכים ברכות ובשמחה. כל בוקר בכניסה לגן ריח הבישולים המדהימים שלה עולה באויר',5,'0000-00-00'),(70,117,70,' צוות מקצועי, נאמן, אוהב, מחבק ומחנך אמיתי. הפעילויות עשירות ומגוונות, התכנים מותאמים לגיל ולתקופה בשנה, סדר היום מצוין ומוקפד, אוכל ביתי ומזין והכי חשוב- הצוות!! האהבה אמיתית ללא תנאים לילדים.',5,'0000-00-00'),(71,121,71,'צוות הגן מקסים ,מעניק חום ואהבה . הילדה אפילו לא נפרדת בבוקר ,רצה לצוות וכל סופש מחכה לחזור כבר לגן . אין ספק שהילד השני גם יהיה בגן הזה למרות שעברנו לעיר אחרת .',5,'0000-00-00'),(72,126,72,'צוות מדהים, מקצועי, חם ואוהב. ניהול טוב ואיכותי. גן מדהים ומומלץ מאוד! הבן שלי חוזר מאושר מהגן ומגיע כל בוקר עם חיוך. אין ספק שכל הקטנטנים שם בידיים טובות.',5,'0000-00-00'),(73,129,73,'גן נהדר כייפי סופר-מקצועי מתוקתק , המון ותק ונסיון ,אוזן קשבת, תענוג גם לילדים וגם להורים. תקופת הקורונה לא הצליחה להפחית מהחוויה הטובה ,רמת החינוך והטיפול ואפילו להיפך, ממליצה בחום ושומרת פינה חמה בלב לגן המקסים ולצוות המנצח',5,'0000-00-00'),(74,130,74,'אנחנו לא מרוצים מהחינוך שהילד שלנו מקבל בגן.',2,'0000-00-00'),(75,130,75,'אני מאוכזבים מחוסר התקשורת של הגננות והסייעות בגן. דרשנו מספר פעמים שיקוף של מצב הילד שלנו ולא זכינו למענה שלא ציפינו',1,'0000-00-00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','comment'),(8,'app','kindergarten'),(10,'app','kindergartenadditionalinfo'),(9,'app','parent'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
INSERT INTO `django_session` VALUES ('3k4gkrb9h6nzla6rofulnkfdy5truwv9','.eJxVjDsOwjAQBe_iGln2rr-U9JzBWv9wADlSnFSIu0OkFNC-mXkvFmhbW9hGWcKU2ZkBGHb6XSOlR-k7ynfqt5mnua_LFPmu8IMOfp1zeV4O9--g0WjfOoGT2uropPDR-2KgKkRCEs4pD1WTyFiVlRUNSkPoBGQg73zJaFGx9wcAEDb1:1pnfZ1:9k6OYIpHKSwGAEs4udbeUiFDuJ-5Iq0z8sm2PZqB9bc','2023-04-29 13:03:35.278626'),('meyv3z8bsd9eq9bo43phpe78yeza72sh','.eJxVjMEOwiAQRP-FsyFlSxfw6L3fQFjYStVAUtqT8d9tkx40mdO8N_MWPmxr9lvjxc9JXAWoTlx-WwrxyeVA6RHKvcpYy7rMJA9FnrTJsSZ-3U737yCHlvd1bzlOGsAa7QakpBgHIkDoDRqAZIGN4R6sVW5iUHu0IwqERIwdiM8XDLA3rQ:1pmuQE:fpud8FLCYgbJVsNpS0m3uwvc951beue_FMEDKGqF1Eo','2023-04-27 10:43:22.021352');
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
  PRIMARY KEY (`kindergarten_id`),
  UNIQUE KEY `kindergarten_id_UNIQUE` (`kindergarten_id`),
  FULLTEXT KEY `idx_kindergarten_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindergarten`
--

LOCK TABLES `kindergarten` WRITE;
/*!40000 ALTER TABLE `kindergarten` DISABLE KEYS */;
INSERT INTO `kindergarten` VALUES (1,'גן הבית של מירב','וייצמן 32','גבעתיים',0,4,3,1,7,'17:00:00','00:00:52',NULL),(2,'גן גורים','הצנחנים 27','גבעתיים',0,2,6,2,7,'16:30:00','00:00:52',NULL),(3,'גן גנדנה','ביאליק 4','גבעתיים',1,3,8,2,7,'16:30:00','00:00:54',NULL),(4,'גן נמשים','גולומב 10','גבעתיים',3,6,20,3,7,'16:30:00','00:00:54',NULL),(5,'גן אחר','ריינס 38','גבעתיים',1,3,35,8,7,'16:30:00','00:00:54',NULL),(6,'הגן האקולוגי','שביל האספרגוס 34','גבעתיים',1,3,20,4,7,'17:00:00','00:00:00',NULL),(7,'הגן של אביה','שנקין 19','גבעתיים',0,3,18,4,7,'16:30:00','00:00:52',NULL),(8,'הגן של אלכס','משמר הירדן 22','גבעתיים',1,3,20,5,7,'16:30:00','00:00:00',NULL),(9,'משפחתון החברים של אילנה','שדרות הצנחנים 6 רמת גן','רמת גן',0,3,6,2,7,'18:00:00','00:00:00',NULL),(10,'גן ויצו גבעתיים','שדה בוקר 14','גבעתיים',0,3,25,5,7,'16:00:00','00:00:00',NULL),(11,'גן בגן','הרא\"ה 11','רמת גן',1,3,17,4,7,'16:30:00','00:00:54',NULL),(12,'גן דרור','המעין 1','גבעתיים',4,5,29,3,8,'15:30:00','00:00:03',NULL),(13,'גן חצב','אהרון שר 3','גבעתיים',4,5,32,4,8,'15:30:00','00:00:03',NULL),(14,'גן סתיוונית ','ריינס 2','גבעתיים',3,4,30,5,8,'15:30:00','00:00:03',NULL),(15,'גן סנונית','רותם 4','גבעתיים',4,5,28,4,8,'15:30:00','00:00:03',NULL),(16,'הגן של דפנה','ז\'בוטינסקי 22','גבעתיים',0,3,20,6,7,'17:00:00','00:00:00',NULL),(17,'גן הבית של אדל','הצנחנים 11','גבעתיים',0,3,15,4,7,'16:00:00','00:00:00',NULL),(18,'גן סיגל אומנויות','שדה בוקר 8','גבעתיים',0,5,35,7,7,'17:00:00','00:00:03',NULL),(19,'הגן של מיכל','הל\"ה 58','גבעתיים',2,4,14,3,7,'16:30:00','00:00:00',NULL),(20,'הפעוטון שלנו','אילת 8','גבעתיים',0,3,30,7,7,'17:00:00','00:00:00',NULL),(21,'המשפחתון של יפעת','ישראל טרייבר 59','גבעתיים',0,3,24,5,7,'16:30:00','00:00:54',NULL),(22,'גן שקד','צהל 28','גבעתיים',0,3,39,9,7,'16:45:00','00:00:00',NULL),(23,'גן הבית הקסום','דויד אלעזר 6','כפר סבא',1,3,60,6,7,'17:00:00','00:00:00',NULL),(24,'גן הבית של ורוניקה','סוקולוב 15','כפר סבא',1,4,30,4,7,'17:00:00','00:00:52',NULL),(25,'גן שוש','הדר 1','כפר סבא',0,3,20,3,7,'16:00:00','00:00:52',NULL),(26,'גן אנדנדינו','גולומב 5','כפר סבא',0,3,20,2,7,'17:00:00','00:00:54',NULL),(27,'משפחתון קרינה','סירני 2','כפר סבא',0,3,15,3,7,'17:00:00','00:00:54',NULL),(28,'המשפחתון של קלאודיה','משעול הקלע','כפר סבא',0,3,8,1,7,'17:00:00','00:00:00',NULL),(29,'גן דרור','רחוב ל\"ה 16','כפר סבא',0,3,30,4,7,'17:00:00','00:00:52',NULL),(30,'גן חיבוקאלה','אוסטשינסקי 23','כפר סבא',0,3,20,3,7,'17:00:00','00:00:00',NULL),(31,'גן שניניגן','השחר 6','כפר סבא',0,3,50,6,7,'17:00:00','00:00:54',NULL),(32,'גן דקלה','רחל המשוררת','כפר סבא',1,3,32,4,7,'16:45:00','00:00:54',NULL),(33,'גן קטקטים','גאולה 31','כפר סבא',1,3,20,3,7,'16:45:00','00:00:09',NULL),(34,'גן הארץ הקטנה','הגליל 56','כפר סבא',1,3,20,2,7,'17:00:00','00:00:54',NULL),(35,'מעון חב\"ד','רופין 30','כפר סבא',0,1,15,2,7,'16:00:00','00:00:09',NULL),(36,'גן הילדים בירוקה','רפפורט 3','כפר סבא',0,4,40,3,7,'16:45:00','00:00:54',NULL),(37,'גן דוריס','התאנה 3','כפר סבא',0,4,40,4,7,'17:00:00','00:00:09',NULL),(38,'גן החלומות','שאול המלך 5','כפר סבא',0,3,40,5,7,'17:00:00','00:00:00',NULL),(39,'גן פצפוני אורנים','יגאל ידין 2','כפר סבא',0,3,45,4,7,'17:00:00','00:00:00',NULL),(40,'גן דינה','המעפילים 18','כפר סבא',1,4,30,4,7,'17:00:00','00:00:09',NULL),(41,'גן אגדת ילדים','ניצנים 11','כפר סבא',0,4,40,4,7,'16:45:00','00:00:09',NULL),(42,'גן לב הזהב בקאנטרי כפר סבא','בן יהודה 23','כפר סבא',0,4,30,3,7,'17:00:00','00:00:54',NULL),(43,'גן ליבנה','העמק 28','כפר סבא',5,6,34,4,7,'17:00:00','00:00:09',NULL),(44,'גן מתנות קטנות','האילנות 20','כפר סבא',1,3,35,4,7,'17:00:00','00:00:54',NULL),(45,'גן בא-לי גן','יאנוש קורצ\'ק 10','כפר סבא',0,3,20,3,7,'17:00:00','00:00:50',NULL),(46,'הגן של שני ואלינור','ישראל ישעיהו 5','כפר סבא',1,4,30,4,7,'17:00:00','00:00:54',NULL),(47,'גן יעל','חבצלת השרון 13','כפר סבא',0,3,24,3,7,'16:30:00','00:00:00',NULL),(48,'גן הדס','אהרונוביץ\' 15','כפר סבא',4,5,20,3,7,'13:00:00','00:00:09',NULL),(49,'הגן של לימורי','טשרניחובסקי 4','כפר סבא',1,4,35,4,7,'16:30:00','00:00:54',NULL),(50,'גן חרצית','אביבים 10','כפר סבא',4,5,27,3,7,'14:00:00','00:00:09',NULL),(51,'אלמוגן','פשוש 6','כפר סבא',4,6,30,2,7,'14:00:00','00:00:09',NULL),(52,'גן תלתן','רש\"י 9','כפר סבא',4,6,30,4,7,'14:00:00','00:00:09',NULL),(53,'משפחתון גן כוכב','שדרות צנחנים 18','רמת גן',1,2,24,3,7,'16:45:00','00:00:00',NULL),(54,'גן מדינת הילדים','שדרות צנחנים 11','רמת גן',0,3,20,2,7,'16:30:00','00:00:00',NULL),(55,'גן בייבי קונסרבטוריון','שמעוני 10','רמת גן',0,3,25,3,7,'17:00:00','00:00:00',NULL),(56,'גן עינב (הגן הקסום)','תל חי 36','רמת גן',0,3,20,3,7,'16:00:00','00:00:00',NULL),(57,'גן אמנויות נילי','תל חי 68','רמת גן',0,3,36,5,7,'17:00:00','00:00:00',NULL),(58,'גן פעוטון דרקונצ\'יק','תל חי 47','רמת גן',0,3,30,6,7,'17:00:00','00:00:00',NULL),(59,'גן קן קטנטנים','משה דיין 13','רמת גן',0,3,40,5,7,'17:00:00','00:00:00',NULL),(60,'משפחתון חיפושית','התפוצות 40','רמת גן',0,3,15,3,7,'17:00:00','00:00:00',NULL),(61,'גן גפן','אחד העם 34','רמת גן',1,3,15,2,7,'17:00:00','00:00:00',NULL),(62,'גן כוכב','גרנדוס 35','רמת גן',0,3,20,3,7,'16:30:00','00:00:00',NULL),(63,'גן ורדית','עוזיאל 103','רמת גן',0,3,25,3,7,'16:00:00','00:00:00',NULL),(64,'גן חוחית','עוזיאל 103','רמת גן',0,3,25,4,7,'16:00:00','00:00:00',NULL),(65,'גן טבלן','בת שוע 9','רמת גן',0,3,25,5,7,'16:30:00','00:00:00',NULL),(66,'הגן של רמי','החי\"ל 38','רמת גן',0,3,20,2,7,'16:30:00','00:00:00',NULL),(67,'גן ניצנים','שדרות צנחנים 20','רמת גן',1,3,18,2,7,'16:30:00','00:00:00',NULL),(68,'גן מורן','המלאכה 14','רמת גן',1,3,22,3,7,'16:45:00','00:00:00',NULL),(69,'הגן של אילנית','אמיר 4','רמת גן',1,3,24,4,7,'17:00:00','00:00:00',NULL),(70,'גן תילתן','סמדר 19','רמת גן',0,3,18,3,7,'17:00:00','00:00:00',NULL),(71,'גן חוש חשים','השר משה 45','רמת גן',0,3,32,4,7,'16:30:00','00:00:00',NULL),(72,'גן הילדים של אורטלי','טרומן 29','רמת גן',0,3,40,6,7,'17:00:00','00:00:00',NULL),(73,'גן טינטן','בר יוחאי 11','רמת גן',1,2,26,4,7,'17:00:00','00:00:00',NULL),(74,'גן סנונית','הבעל שם טוב 15','רמת גן',1,3,16,2,7,'16:45:00','00:00:00',NULL),(75,'גן עפרוני','גבע 6','גבעתיים',0,3,20,3,7,'16:30:00','00:00:00',NULL),(76,'גן ברקן','בר יוחאי 15','רמת גן',0,2,25,3,7,'17:00:00','00:00:00',NULL),(77,'גן ניסנית','בר יוחאי 15','רמת גן',0,2,25,3,7,'17:00:00','00:00:00',NULL),(78,'גן ערבה','משמר הירדן 9','גבעתיים',0,3,30,6,7,'16:45:00','00:00:00',NULL),(79,'גן רמון','משמר הירדן 9','גבעתיים',0,3,30,6,7,'16:45:00','00:00:00',NULL),(80,'גן נטלי','חד נס 38','רמת גן',0,3,28,5,7,'17:00:00','00:00:00',NULL),(81,'המשפחתון של אסנת','חבר 9','רמת גן',0,3,12,2,7,'16:30:00','00:00:00',NULL),(82,'בייבי גן קרן','ארלוזרוב 75','תל אביב',0,3,20,4,7,'16:30:00','00:00:00',NULL),(83,'little steps','בן יהודה 190','תל אביב',0,3,26,4,7,'16:00:00','00:00:00',NULL),(84,'הגן של חגית','קלישר 4','הרצליה',1,4,70,4,7,'17:00:00','00:00:00',NULL),(85,'גן אמנון','טשרניחובסקי 38','הרצליה',1,3,36,4,7,'17:00:00','00:00:00',NULL),(86,'גן כמו בבית','החלוץ 22','רמת השרון',1,3,30,4,7,'16:30:00','00:00:00',NULL),(87,'גן דנה','ההגנה 69','הרצליה',1,3,20,3,7,'17:00:00','00:00:00',NULL),(88,'גן הדס','בר אילן 14','הרצליה',1,3,26,4,7,'17:00:00','00:00:00',NULL),(89,'גן בת-חן','הכורזי 6','הרצליה',1,3,24,4,7,'17:00:00','00:00:00',NULL),(90,'מעון נעמ\"ת הכוזרי','הכורזי 8','הרצליה',0,3,30,2,7,'16:30:00','00:00:00',NULL),(91,'גן עולם הילד','חנה סנש 10','הרצליה',1,3,30,3,7,'17:00:00','00:00:00',NULL),(92,'הגן שלנו','בן יהודה 55','הרצליה',1,2,20,4,7,'17:00:00','00:00:00',NULL),(93,'הגן של נאוה','בן גוריון 47','הרצליה',1,2,32,6,7,'17:00:00','00:00:00',NULL),(94,'גן פינוקים','רחוב א.ד גורדון 23','הרצליה',1,2,20,2,7,'17:00:00','00:00:00',NULL),(95,'הגן של ז\'אן','הבנים 21','הרצליה',1,3,15,3,7,'17:00:00','00:00:00',NULL),(96,'גן חני','משה 45','הרצליה',1,2,10,1,7,'17:00:00','00:00:00',NULL),(97,'גן הבית של יעלי','אחד העם 41','הרצליה',1,3,45,8,7,'17:00:00','00:00:00',NULL),(98,'גן במבינוס הרצליה','הבנים 50','הרצליה',0,4,20,3,7,'17:00:00','00:00:00',NULL),(99,'פעוטון סיגלי','מוהליבר 16','הרצליה',0,3,10,2,8,'16:00:00','00:00:52',NULL),(100,'גן טל','הינצנים 3','הרצליה',1,3,25,3,7,'17:00:00','00:00:00',NULL),(101,'גן תומר','בר כוכבא 48','הרצליה',1,3,22,2,7,'17:00:00','00:00:00',NULL),(102,'גן חיטים','המקובלים 38','הרצליה',1,3,28,3,7,'17:00:00','00:00:00',NULL),(103,'רש\"י שקד','שקד 33','תל אביב',1,3,3,1,7,'16:00:00','00:00:03',NULL),(104,'מעון יום','חריף אייזיק 21','תל אביב',1,3,6,2,7,'19:00:00','00:00:03',NULL),(105,'מעון יום','הרטוב 8','תל אביב',1,3,8,2,7,'16:00:00','00:00:03',NULL),(106,'מעון יום','עירית 15','תל אביב',1,3,20,3,7,'16:00:00','00:00:03',NULL),(107,'אמילי','כפר יונה 15','תל אביב',1,3,35,8,7,'16:00:00','00:00:03',NULL),(108,'אמילי','גבירטיג מרדכי 5','תל אביב',1,3,20,4,7,'16:00:00','00:00:03',NULL),(109,'מעון יום צהלה','המצביאים 28','תל אביב',1,3,18,4,7,'16:00:00','00:00:03',NULL),(110,'הדר יוסף','קהילת בריסק 10','תל אביב',1,3,20,5,7,'16:00:00','00:00:03',NULL),(111,'אביב TLV','החשמונאים 96','תל אביב',1,3,6,2,7,'16:00:00','00:00:03',NULL),(112,'פשר','זינגר בשביס יצחק 7','תל אביב',1,3,25,5,7,'16:00:00','00:00:03',NULL),(113,'בוגרשוב','בר כוכבא 26','תל אביב',0,0,17,4,7,'16:00:00','00:00:03',NULL),(114,'בירנית','בירנית 4','תל אביב',1,3,29,3,7,'16:00:00','00:00:03',NULL),(115,'בית מורצקי','חירותנו 1','תל אביב',0,0,32,4,7,'19:00:00','00:00:03',NULL),(116,'בית פורג\'','התקוה 70','תל אביב',1,3,30,5,7,'16:00:00','00:00:03',NULL),(117,'בית פרו','פעמונית 7','תל אביב',0,0,28,4,7,'19:00:00','00:00:03',NULL),(118,'המלך ג\'ורג\'','המלך ג\'ורג\' 35','תל אביב',0,0,20,6,7,'16:00:00','00:00:03',NULL),(119,'המשתלה','קיפניס לוין 6','תל אביב',1,3,15,4,7,'16:00:00','00:00:03',NULL),(120,'ויצמן','ויצמן 7','תל אביב',1,3,35,7,7,'16:00:00','00:00:03',NULL),(121,'יד אליהו','נגבה 33','תל אביב',1,3,14,3,7,'16:00:00','00:00:03',NULL),(122,'מגן אברהם','מגן אברהם 25','תל אביב',0,0,30,7,7,'19:00:00','00:00:03',NULL),(123,'נווה חן','סלע יעקב 22','תל אביב',1,3,8,3,7,'16:00:00','00:00:03',NULL),(124,'נווה צה\"ל','דרך ההגנה 118','תל אביב',1,3,6,2,7,'16:00:00','00:00:03',NULL),(125,'עקיבא ברון','ברון עקיבא 8','תל אביב',1,3,8,2,7,'16:00:00','00:00:03',NULL),(126,'פיינשטיין','פיינשטיין מאיר 20','תל אביב',1,3,20,3,7,'16:00:00','00:00:03',NULL),(127,'קריית שלום','ליוויק 7','תל אביב',0,0,35,8,7,'19:00:00','00:00:03',NULL),(128,'רמז ארלוזרוב','ארלוזורוב 95','תל אביב',1,3,20,4,7,'16:00:00','00:00:03',NULL),(129,'רמת ישראל','דם המכבים 21','תל אביב',1,3,18,4,7,'16:00:00','00:00:03',NULL),(130,'תכנית ל\'','בורלא יהודה 2','תל אביב',1,3,20,5,7,'16:00:00','00:00:03',NULL),(131,'שפירא','ישראל מסלנט 22','תל אביב',0,0,6,2,7,'19:00:00','00:00:03',NULL),(132,'האוניברסיטה, קמפוס ברושים','וייז ג\'ורג\' ד\"ר 1','תל אביב',0,0,25,5,7,'16:00:00','00:00:03',NULL),(133,'כוכב הצפון','קובנר אבא 16','תל אביב',1,3,17,4,7,'16:00:00','00:00:03',NULL),(134,'קטנטנים ובריאים','דפנה 7','תל אביב',0,0,29,3,7,'16:00:00','00:00:00',NULL),(135,'פלורנטין','פרנקל ידידיה 17','תל אביב',1,3,32,4,7,'16:00:00','00:00:03',NULL),(136,'ויצו','שלומציון המלכה 38','תל אביב',1,3,30,5,7,'16:00:00','00:00:03',NULL),(137,'ויצו','סלע יעקב 22','תל אביב',1,3,28,4,7,'16:00:00','00:00:03',NULL),(138,'רשבי - מוסדות ע\"ש התנא הקדוש','הרטוב 25','תל אביב',1,3,20,6,7,'16:00:00','00:00:03',NULL),(139,'בבלי','ירושלמי 16','תל אביב',1,3,15,4,7,'16:00:00','00:00:03',NULL),(140,'השלום','אריסטו 18','תל אביב',1,3,35,7,7,'16:00:00','00:00:03',NULL),(141,'מעגלים','חוני המעגל 5','תל אביב',1,3,14,3,7,'16:00:00','00:00:03',NULL),(142,'חיננית','חיננית 5','תל אביב',1,3,30,7,7,'16:00:00','00:00:03',NULL),(143,'נאות אפקה','לאה גולדברג 6','תל אביב',1,3,32,4,7,'16:00:00','00:00:03',NULL),(144,'נווה חן','סנפיר 9','תל אביב',1,3,30,5,7,'16:00:00','00:00:03',NULL),(145,'עצמאות','ארבר מנחם 26','תל אביב',0,0,28,4,7,'16:00:00','00:00:03',NULL),(146,'קרית שלום','שדרות גורי ישראל 23','תל אביב',1,3,20,6,7,'16:00:00','00:00:03',NULL),(147,'ניצנים','פן אלכסנדר 1','תל אביב',1,3,15,4,7,'16:00:00','00:00:03',NULL),(148,'נווה שרת','פילדלפיה 3','תל אביב',1,3,35,7,7,'16:00:00','00:00:03',NULL),(149,'דיזנגוף','דיזנגוף 221','תל אביב',1,3,14,3,7,'16:00:00','00:00:03',NULL),(150,'מאור עינים','מאור עינים 4','תל אביב',1,3,30,7,7,'16:00:00','00:00:03',NULL),(151,'גולדה','ברלין אליהו 4','תל אביב',1,3,6,2,7,'16:00:00','00:00:03',NULL),(152,'נעמת','בן סירא 4','תל אביב',1,3,25,5,7,'16:00:00','00:00:03',NULL),(153,'הברושים','לובטקין צביה 15','תל אביב',1,3,17,4,7,'16:00:00','00:00:03',NULL),(154,'גן אגוז ','זרובבל 3','רמת השרון',3,4,21,3,7,'15:30:00','00:00:03',NULL),(155,'גן תמר','זרובבל 3','רמת השרון',5,6,26,3,7,'15:30:00','00:00:03',NULL),(156,'גן זית','זרובבל 3','רמת השרון',4,5,18,2,7,'15:30:00','00:00:03',NULL),(157,'גן אמנון ותמר','הרב קוק 43','רמת השרון',4,6,35,4,7,'16:30:00','00:00:03',NULL),(158,'גן הרדוך','הנוטע 4','רמת השרון',3,4,35,7,7,'16:30:00','00:00:00',NULL),(159,'גן דובדבן','הפרחים 4','רמת השרון',4,6,33,6,7,'16:30:00','00:00:03',NULL),(160,'גן חרצית','השופטים 56','רמת השרון',3,5,23,5,7,'16:30:00','00:00:03',NULL),(161,'גן כרכום','אברבוך 14','רמת השרון',4,6,24,4,7,'16:30:00','00:00:03',NULL),(162,'גן ניצן','הירדן 25','רמת השרון',4,6,32,6,7,'16:30:00','00:00:03',NULL),(163,'גן נרקיס','מוהליבר 1','רמת השרון',5,6,28,4,7,'14:00:00','00:00:03',NULL),(164,'גן ענבר','הראשונים 14','רמת השרון',4,5,30,5,7,'16:30:00','00:00:00',NULL),(165,'גן ספיר','המלאכה 16','רמת השרון',3,4,17,3,7,'16:30:00','00:00:03',NULL),(166,'גן פשוש','הפלמ\"ח 8','רמת השרון',5,6,20,3,7,'16:30:00','00:00:03',NULL),(167,'גן צבעוני','אברבוך 14','רמת השרון',4,6,23,4,7,'14:00:00','00:00:03',NULL),(168,'גן צבר','רות 6','רמת השרון',5,6,26,4,7,'14:00:00','00:00:03',NULL),(169,'גן רותם','לילך 3','רמת השרון',4,6,23,3,7,'14:00:00','00:00:03',NULL),(170,'גן תות','הפרחים 4','רמת השרון',4,6,32,5,7,'16:30:00','00:00:03',NULL),(171,'גן איריס','הסייפן 37','רמת השרון',3,4,24,3,7,'14:00:00','00:00:03',NULL),(172,'גן אשל','אברהם 1','רמת השרון',3,4,21,3,7,'14:00:00','00:00:03',NULL),(173,'גן דפנה','עזרא 52','רמת השרון',3,4,34,4,7,'14:00:00','00:00:03',NULL),(174,'גן דקלים','יצחק שדה 54','רמת השרון',4,6,26,3,7,'14:00:00','00:00:03',NULL),(175,'גן חרצית','השופטים 56','רמת השרון',3,5,30,4,7,'15:30:00','00:00:03',NULL),(176,'גן חצב','הנוטע 3','רמת השרון',4,6,30,5,7,'16:30:00','00:00:03',NULL),(177,'גן דרור','הפלמ\"ח 8','רמת השרון',3,4,28,3,7,'14:00:00','00:00:03',NULL);
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
  CONSTRAINT `FK_kindergarten_id` FOREIGN KEY (`kindergarten_id`) REFERENCES `kindergarten` (`kindergarten_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindergartenadditionalinfo`
--

LOCK TABLES `kindergartenadditionalinfo` WRITE;
/*!40000 ALTER TABLE `kindergartenadditionalinfo` DISABLE KEYS */;
INSERT INTO `kindergartenadditionalinfo` VALUES (1,'052-7534788','','\r'),(2,'052-2739819','','\r'),(3,'054-5942332','','\r'),(4,'054-3052121','','\r'),(5,'054-9291997','','\r'),(6,'050-754-2437','','\r'),(7,'052-6426744','','\r'),(8,'','','\r'),(9,'050-221-2541','','\r'),(10,'37322490','','\r'),(11,'054-5489878','','\r'),(12,'03-5719759','','\r'),(13,'03-6725169','','\r'),(14,'03-5094497','','\r'),(15,'03-5719758','','\r'),(16,'03-571-9756','','\r'),(17,'','','\r'),(18,'03-5716601','','\r'),(19,'','','\r'),(20,'','','\r'),(21,'054-9718988','','\r'),(22,'054-669-8939','','\r'),(23,'','','\r'),(24,'052-5723388','','\r'),(25,'052-6693445','','\r'),(26,'054-2436690','','\r'),(27,'054-9475406','','\r'),(28,'','','\r'),(29,'052-3582935','','\r'),(30,'','','\r'),(31,'054-6470575','','\r'),(32,'054-4421245','','\r'),(33,'09-7428144','','\r'),(34,'054-6498352','','\r'),(35,'09-7673568','','\r'),(36,'054-8070898','','\r'),(37,'09-7652012','','\r'),(38,'052-569-7788','','\r'),(39,'09-768-7267','','\r'),(40,'09-7414546','','\r'),(41,'09-7480307','','\r'),(42,'054-4225044','','\r'),(43,'09-7658716','','\r'),(44,'054-3322848','','\r'),(45,'050-7926059','','\r'),(46,'054-3452926','','\r'),(47,'','','\r'),(48,'09-7655205','','\r'),(49,'054-5803992','','\r'),(50,'09-7674248','','\r'),(51,'09-7679186','','\r'),(52,'09-7891957','','\r'),(53,'053-242-2295','','\r'),(54,'','','\r'),(55,'054-630-7689','','\r'),(56,'','','\r'),(57,'077-702-7788','','\r'),(58,'','','\r'),(59,'','','\r'),(60,'050-719-2245','','\r'),(61,'03-717-2472','','\r'),(62,'03-676-1508','','\r'),(63,'03-574-6093','','\r'),(64,'03-574-6093','','\r'),(65,'03-574-6067','','\r'),(66,'050-452-5230','','\r'),(67,'','','\r'),(68,'','','\r'),(69,'','','\r'),(70,'','','\r'),(71,'','','\r'),(72,'','','\r'),(73,'03-505-4934','','\r'),(74,'03-574-6053','','\r'),(75,'03-571-9753','','\r'),(76,'03-574-6068','','\r'),(77,'03-574-6068','','\r'),(78,'03-540-6172','','\r'),(79,'03-573-0674','','\r'),(80,'','','\r'),(81,'','','\r'),(82,'054-815-1511','','\r'),(83,'054-789-7321','','\r'),(84,'09-950-3570','','\r'),(85,'09-950-3278','','\r'),(86,'054-439-4918','','\r'),(87,'','','\r'),(88,'','','\r'),(89,'09-956-4504','','\r'),(90,'09-954-1277','','\r'),(91,'073-758-9012','','\r'),(92,'','','\r'),(93,'','','\r'),(94,'','','\r'),(95,'09-954-4302','','\r'),(96,'09-954-4037','','\r'),(97,'073-702-7891','','\r'),(98,'09-951-3896','','\r'),(99,'052-6004913','','\r'),(100,'052-274-0863','','\r'),(101,'052-440-1316','','\r'),(102,'09-950-0101','','\r'),(103,'03-5185730','','\r'),(104,'03-6587804','','\r'),(105,'03-7300845','','\r'),(106,'03-6589236','','\r'),(107,'03-9715656','','\r'),(108,'03-6394870','','\r'),(109,'03-9669904','','\r'),(110,'03-6968603','','\r'),(111,'03-9491131','','\r'),(112,'03-5527127','','\r'),(113,'03-6290462','','\r'),(114,'03-7305861','','\r'),(115,'03-6870555','','\r'),(116,'03-6870239','','\r'),(117,'03-5061559','','\r'),(118,'03-5284230','','\r'),(119,'03-6443891','','\r'),(120,'03-6964832','','\r'),(121,'03-7392690','','\r'),(122,'03-6817650','','\r'),(123,'03-7393514','','\r'),(124,'03-7394005','','\r'),(125,'03-6414825','','\r'),(126,'03-6423660','','\r'),(127,'03-6839648','','\r'),(128,'03-6960437','','\r'),(129,'03-5711974','','\r'),(130,'03-6991990','','\r'),(131,'03-6876692','','\r'),(132,'03-7267274','','\r'),(133,'03-5754046','','\r'),(134,'076-8009023','','\r'),(135,'03-7394005','','\r'),(136,'03-6236499','','\r'),(137,'03-7393514','','\r'),(138,'03-7394668','','\r'),(139,'03-5467348','','\r'),(140,'03-5062525','','\r'),(141,'03-6041789','','\r'),(142,'03-6582555','','\r'),(143,'03-6487799','','\r'),(144,'03-7391079','','\r'),(145,'03-6821060','','\r'),(146,'03-6815288','','\r'),(147,'03-6484598','','\r'),(148,'03-6492329','','\r'),(149,'03-5441965','','\r'),(150,'03-9014794','','\r'),(151,'03-6826616','','\r'),(152,'03-6162976','','\r'),(153,'03-7394846','','\r'),(154,'03-7602145','','\r'),(155,'03-7602145','','\r'),(156,'03-7602145','','\r'),(157,'03-5406211','','\r'),(158,'','','\r'),(159,'03-6419364','','\r'),(160,'03-5258230','','\r'),(161,'03-5490215','','\r'),(162,'03-5405316','','\r'),(163,'03-5186888','','\r'),(164,'','','\r'),(165,'03-5497463','','\r'),(166,'03-5175932','','\r'),(167,'03-5474890','','\r'),(168,'03-5408152','','\r'),(169,'03-5497234','','\r'),(170,'03-6496028','','\r'),(171,'03-5497450','','\r'),(172,'03-5406221','','\r'),(173,'03-6885419','','\r'),(174,'03-5477180','','\r'),(175,'03-5258230','','\r'),(176,'03-5408113','','\r'),(177,'03-5175952','','\r');
/*!40000 ALTER TABLE `kindergartenadditionalinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent` (
  `parent_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(126) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
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
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (1,'nudo-gemubu14@hotmail.com','dXg+9/Y!','לירון מועלם','ורמייזה 9','תל אביב','אחד העם 41','הרצליה',NULL,0,'','','',0,0,NULL),(2,'robe_rehisi41@hotmail.com','U5{5_s]h','מזל מנשה','ג’ורג’ וייז 20','תל אביב','הבנים 50','הרצליה',NULL,0,'','','',0,0,NULL),(3,'pilefo-yazo85@outlook.com','6APk)w/)','נועה ימיני','הופיין 10','תל אביב','מוהליבר 16','הרצליה',NULL,0,'','','',0,0,NULL),(4,'yiva-wususo30@hotmail.com','X5xxGp?D','רועי כהן','קיציס 20','תל אביב','הינצנים 3','הרצליה',NULL,0,'','','',0,0,NULL),(5,'bogidu_lotu44@hotmail.com','9@{fEvG]','קארין אלטמן','ישעיהו אברך 5','תל אביב','בר כוכבא 48','הרצליה',NULL,0,'','','',0,0,NULL),(6,'yuran-ojusu56@mail.com','sZ@PSFb7','עידו לוי','וייצמן 30','גבעתיים','המקובלים 38','הרצליה',NULL,0,'','','',0,0,NULL),(7,'nisul-agijo92@yahoo.com','2L@zhGs/','טל שמש','הצנחנים 4','גבעתיים','שקד 33','תל אביב',NULL,0,'','','',0,0,NULL),(8,'sebur-ahoka24@outlook.com','qq4Fct6=','מיכל שוורץ','ביאליק 10','גבעתיים','חריף אייזיק 21','תל אביב',NULL,0,'','','',0,0,NULL),(9,'fizu_namadi2@outlook.com','q]Jh>Y6M','הדס גרינברג','גולומב 8','גבעתיים','הרטוב 8','תל אביב',NULL,0,'','','',0,0,NULL),(10,'vatapa-pawo16@gmail.com','Grx!.!3P','מור כהן','ריינס 36','גבעתיים','עירית 15','תל אביב',NULL,0,'','','',0,0,NULL),(11,'wivub_amore52@outlook.com','m*bVZg9!','יובל צרויה','שביל האספרגוס 30','גבעתיים','כפר יונה 15','תל אביב',NULL,0,'','','',0,0,NULL),(12,'hoser-isenu57@mail.com','jw^3&r4G','דניאל יפה','שנקין 15','גבעתיים','גבירטיג מרדכי 5','תל אביב',NULL,0,'','','',0,0,NULL),(13,'neves-obegi6@gmail.com','5d]vdeJz','עינבר בלומנטל','משמר הירדן 18','גבעתיים','המצביאים 28','תל אביב',NULL,0,'','','',0,0,NULL),(14,'nebim_ahoyu21@hotmail.com','Pm9$%E=]','אביטל אלטמן','שדרות הצנחנים 2','רמת גן','קהילת בריסק 10','תל אביב',NULL,0,'','','',0,0,NULL),(15,'pak_agameda87@mail.com','Vq)$ncM9','עידו ווינשטיין','שדה בוקר 8','גבעתיים','החשמונאים 96','תל אביב',NULL,0,'','','',0,0,NULL),(16,'yugigo-donu83@gmail.com','>J(gbx4&','יסמין שיף','הרא\"ה 5','רמת גן','זינגר בשביס יצחק 7','תל אביב',NULL,0,'','','',0,0,NULL),(17,'jufuv-orifi98@mail.com','S6(@uqgU','אדל בן חמו','המעין 1','גבעתיים','בר כוכבא 26','תל אביב',NULL,0,'','','',0,0,NULL),(18,'dumu_xesunu26@aol.com','j?_)f6K{','דנה סילברשטיין','אהרון שר 5','גבעתיים','בירנית 4','תל אביב',NULL,0,'','','',0,0,NULL),(19,'veb_eboxete56@mail.com','HLQDG)2x','שקד לוין','ריינס 4','גבעתיים','חירותנו 1','תל אביב',NULL,0,'','','',0,0,NULL),(20,'radej_eguhi57@gmail.com','^>}!Yc88','מירב בנימין','רותם 4','גבעתיים','התקוה 70','תל אביב',NULL,0,'','','',0,0,NULL),(21,'votoyoj_uhi12@gmail.com','kzJv2z/h','שירה בוכבוכט','ז\'בוטינסקי 22','גבעתיים','פעמונית 7','תל אביב',NULL,0,'','','',0,0,NULL),(22,'tarida_sobi13@mail.com','4S+AV(td','תום גסר','הצנחנים 11','גבעתיים','המלך ג\'ורג\' 35','תל אביב',NULL,0,'','','',0,0,NULL),(23,'susug_acadu77@gmail.com','6y8$p>eR','מיכל לולו','שדה בוקר 8','גבעתיים','קיפניס לוין 6','תל אביב',NULL,0,'','','',0,0,NULL),(24,'ledoli_bave43@yahoo.com','b5Xu>ZUq','ענת קופמן','הל\"ה 58','גבעתיים','ויצמן 7','תל אביב',NULL,0,'','','',0,0,NULL),(25,'curiyi_cavo61@gmail.com','FM(=8bBe','ליטל מזרחי','אילת 8','גבעתיים','נגבה 33','תל אביב',NULL,0,'','','',0,0,NULL),(26,'hahazu_zula31@hotmail.com','[/4qg+ZM','הילה גולדברג','ישראל טרייבר 59','גבעתיים','מגן אברהם 25','תל אביב',NULL,0,'','','',0,0,NULL),(27,'sodu-tofubo51@outlook.com','GrmgR(64','תמר סבן','צהל 28','גבעתיים','סלע יעקב 22','תל אביב',NULL,0,'','','',0,0,NULL),(28,'piwon-acadi36@outlook.com','[G9T@5y^','לינוי קורן','דויד אלעזר 6','כפר סבא','דרך ההגנה 118','תל אביב',NULL,0,'','','',0,0,NULL),(29,'min_upivode38@outlook.com','vC[L_N7b','לימור חזן','סוקולוב 15','כפר סבא','ברון עקיבא 8','תל אביב',NULL,0,'','','',0,0,NULL),(30,'sugiya_fawi51@aol.com','[4s4&X4C','זיו טלמור','הדר 1','כפר סבא','פיינשטיין מאיר 20','תל אביב',NULL,0,'','','',0,0,NULL),(31,'laviw_okute94@outlook.com','Ubg%C=4f','נוגה קדארי','גולומב 5','כפר סבא','ליוויק 7','תל אביב',NULL,0,'','','',0,0,NULL),(32,'bawob_imitu70@hotmail.com','f&8daCNB','עדי וייס','סירני 2','כפר סבא','ארלוזורוב 95','תל אביב',NULL,0,'','','',0,0,NULL),(33,'bigilu_hulu32@hotmail.com','ahU2(/+6','דור שרון','משעול הקלע 8','כפר סבא','דם המכבים 21','תל אביב',NULL,0,'','','',0,0,NULL),(34,'cagu-gegodo71@outlook.com','^_Neru7(','צור לוי','רחוב ל\"ה 16','כפר סבא','בורלא יהודה 2','תל אביב',NULL,0,'','','',0,0,NULL),(35,'guge-pobazi61@aol.com','Y8]KJk@*','אבי דגני','אוסטשינסקי 23','כפר סבא','ישראל מסלנט 22','תל אביב',NULL,0,'','','',0,0,NULL),(36,'sulozo_fico2@gmail.com','kq2ga@Z%','שרה לנדסמן','השחר 6','כפר סבא','וייז ג\'ורג\' ד\"ר 1','תל אביב',NULL,0,'','','',0,0,NULL),(37,'zuf_oxipubi55@aol.com','t&d3eP5P','דבורה גיל','רחל המשוררת 6','כפר סבא','קובנר אבא 16','תל אביב',NULL,0,'','','',0,0,NULL),(38,'gepew-ayini21@aol.com','}Z_L4Rjz','אריאל מנדנבליט','גאולה 31','כפר סבא','דפנה 7','תל אביב',NULL,0,'','','',0,0,NULL),(39,'yerijaj_ogo30@yahoo.com','RHj>3Y9!','תמר פיירמן','הגליל 56','כפר סבא','פרנקל ידידיה 17','תל אביב',NULL,0,'','','',0,0,NULL),(40,'gisetuj-esu26@aol.com','j7Y6zh*d','רן נסינג','רופין 30','כפר סבא','שלומציון המלכה 38','תל אביב',NULL,0,'','','',0,0,NULL),(41,'yamo-joseza63@yahoo.com','gKHDY9f]','קרן שחר','רפפורט 3','כפר סבא','סלע יעקב 22','תל אביב',NULL,0,'','','',0,0,NULL),(42,'rac_akemipo4@hotmail.com','%>Qx-C5P','ליהי רז','התאנה 3','כפר סבא','הרטוב 25','תל אביב',NULL,0,'','','',0,0,NULL),(43,'zuti-cesetu91@gmail.com','YD69x/mU','סיוון לוי','שאול המלך 5','כפר סבא','ירושלמי 16','תל אביב',NULL,0,'','','',0,0,NULL),(44,'berun_azaje98@aol.com','Pt9-5?e}','דנה בר','יגאל ידין 2','כפר סבא','אריסטו 18','תל אביב',NULL,0,'','','',0,0,NULL),(45,'sekorof-ude24@yahoo.com','_rU_4N_n','יעל בק','המעפילים 18','כפר סבא','חוני המעגל 5','תל אביב',NULL,0,'','','',0,0,NULL),(46,'sesuvoy_abu93@outlook.com','38?Qp5U&','זיו הרוש','ניצנים 11','כפר סבא','חיננית 5','תל אביב',NULL,0,'','','',0,0,NULL),(47,'yuco_xokupi28@hotmail.com','Sc4+jW5h','אורי מנחם','בן יהודה 23','כפר סבא','לאה גולדברג 6','תל אביב',NULL,0,'','','',0,0,NULL),(48,'hukexo-mota36@outlook.com','nU2)*zhV','מיטל הורביץ','העמק 28','כפר סבא','סנפיר 9','תל אביב',NULL,0,'','','',0,0,NULL),(49,'miputoz_aho15@hotmail.com','5j5Nt@n5','נעומי זוהר','האילנות 20','כפר סבא','ארבר מנחם 26','תל אביב',NULL,0,'','','',0,0,NULL),(50,'jiza-rubahu71@mail.com','ncb)d5EY','אור שמש','יאנוש קורצ\'ק 10','כפר סבא','שדרות גורי ישראל 23','תל אביב',NULL,0,'','','',0,0,NULL),(51,'nizivof-ere13@yahoo.com','!dwn&C]4','עדי מזרחי','ישראל ישעיהו 5','כפר סבא','פן אלכסנדר 1','תל אביב',NULL,0,'','','',0,0,NULL),(52,'rewi_sageja67@hotmail.com','9h+)ykrU','אנה דויד','חבצלת השרון 13','כפר סבא','פילדלפיה 3','תל אביב',NULL,0,'','','',0,0,NULL),(53,'humu-milegi1@gmail.com','}9v-8Dfa','ליה שלום','אהרונוביץ\' 15','כפר סבא','דיזנגוף 221','תל אביב',NULL,0,'','','',0,0,NULL),(54,'lasuc_owucu55@yahoo.com','YHd>)2r5','יעל מירון','טשרניחובסקי 4','כפר סבא','מאור עינים 4','תל אביב',NULL,0,'','','',0,0,NULL),(55,'kum-oweteha75@outlook.com','^yuC5B=g','קטי יעקב','אביבים 10','כפר סבא','ברלין אליהו 4','תל אביב',NULL,0,'','','',0,0,NULL),(56,'buji-monuka54@hotmail.com','AhvWV&8M','ענת סגל','פשוש 6','כפר סבא','בן סירא 4','תל אביב',NULL,0,'','','',0,0,NULL),(57,'wor_imulove50@aol.com','PeX[^8UK','עדי קפלן','רש\"י 9','כפר סבא','לובטקין צביה 15','תל אביב',NULL,0,'','','',0,0,NULL),(58,'hiday-uvufe93@yahoo.com','Zks^Ztu2','שמעון לבייב','שדרות צנחנים 18','רמת גן','זרובבל 3','רמת השרון',NULL,0,'','','',0,0,NULL),(59,'vov_anohomo25@yahoo.com','s]7)=gH]','קארין מזור','שדרות צנחנים 11','רמת גן','זרובבל 3','רמת השרון',NULL,0,'','','',0,0,NULL),(60,'zuhuh-owoza91@mail.com','FedMHV]9','טליה נגבי','שמעוני 10','רמת גן','זרובבל 3','רמת השרון',NULL,0,'','','',0,0,NULL),(61,'hedu-cuhetu30@mail.com','VWC^]+s2','רעות עמית','תל חי 36','רמת גן','הרב קוק 43','רמת השרון',NULL,0,'','','',0,0,NULL),(62,'mekoci_yiho46@gmail.com','4PH6a_ef','נופר לביא','תל חי 68','רמת גן','הנוטע 4','רמת השרון',NULL,0,'','','',0,0,NULL),(63,'wexevep_ana64@hotmail.com','*hJEgg3}','קרין לוי','תל חי 47','רמת גן','הפרחים 4','רמת השרון',NULL,0,'','','',0,0,NULL),(64,'doho_kepake58@mail.com','g8gz!KrF','ורד אטיאס','משה דיין 13','רמת גן','השופטים 56','רמת השרון',NULL,0,'','','',0,0,NULL),(65,'darulul_ize43@gmail.com','5X7gSLv@','לירן יחזקאל','התפוצות 40','רמת גן','אברבוך 14','רמת השרון',NULL,0,'','','',0,0,NULL),(66,'sasawej_ijo50@yahoo.com','P^V5HQu@','חן זגורי','אחד העם 34','רמת גן','הירדן 25','רמת השרון',NULL,0,'','','',0,0,NULL),(67,'pabaheh_idi57@aol.com','$Cctky2*','איילה אגם','גרנדוס 35','רמת גן','מוהליבר 1','רמת השרון',NULL,0,'','','',0,0,NULL),(68,'gegub-ecuji67@aol.com','BN?&4hXD','הדס אליאס','עוזיאל 103','רמת גן','הראשונים 14','רמת השרון',NULL,0,'','','',0,0,NULL),(69,'rup_eloniwu55@aol.com','+d2>5Jwy','נועם כץ','עוזיאל 103','רמת גן','המלאכה 16','רמת השרון',NULL,0,'','','',0,0,NULL),(70,'bapa_xaxexa61@aol.com','Mn&w28n2','תום גולדמן','בת שוע 9','רמת גן','הפלמ\"ח 8','רמת השרון',NULL,0,'','','',0,0,NULL),(71,'fobim-evohi80@yahoo.com','V$%hQx_7','מריה ויטקין','החי\"ל 38','רמת גן','אברבוך 14','רמת השרון',NULL,0,'','','',0,0,NULL),(72,'pali-kopewi95@gmail.com','A6YVbYJ>','מעיין הרצוג','שדרות צנחנים 20','רמת גן','רות 6','רמת השרון',NULL,0,'','','',0,0,NULL),(73,'celided-eyu48@outlook.com','W*r(]A8*','יובל כהן','המלאכה 14','רמת גן','לילך 3','רמת השרון',NULL,0,'','','',0,0,NULL),(201,'t','t','','t','t','t','t',NULL,0,'','','',0,1,'2023-04-13 09:46:41.409339'),(202,'ttt','t','','t','t','t','t',NULL,0,'','','',0,1,'2023-04-13 09:46:51.058747'),(203,'aaa','aaa','','aaa','aaa','aaa','aaa',NULL,0,'','','',0,1,'2023-04-13 09:52:58.987556'),(204,'a','aaa','','aaa','aaa','aaa','a',NULL,0,'','','',0,1,'2023-04-13 09:55:15.085687'),(205,'bbb','b','','b','b','b','b',NULL,0,'','','',0,1,'2023-04-13 09:57:29.464954'),(206,'gwsquyg','v','','uyv','vu','v','uv',NULL,0,'','','',0,1,'2023-04-13 09:57:55.542281'),(207,'gwsquyga','v','','uyv','vu','v','uv','2023-04-13 09:58:52.295526',0,'','','',0,1,'2023-04-13 09:58:52.247347'),(208,'aaaa','a','','a','a','a','a','2023-04-13 10:04:36.957104',0,'','','',0,1,'2023-04-13 10:04:36.913780'),(209,'dfbda','n','','ijkn','bi','b','ui','2023-04-13 10:06:30.768449',0,'','','',0,1,'2023-04-13 10:06:30.717388'),(210,'JefferyDahamer','a','','a','a','a','a','2023-04-13 10:43:21.992632',0,'','','',0,1,'2023-04-13 10:43:21.948838'),(211,'aaaa','pbkdf2_sha256$260000$dZv4SZxbkTdrYLqyT1eKa7$Myq9FvalpXNYx+4pvgRnw2rTjRYkXq/tAKgQtNONMrw=','',NULL,NULL,NULL,NULL,NULL,0,'','','',0,1,'2023-04-14 13:53:09.891630'),(212,'aaaa','pbkdf2_sha256$260000$v0OSR1v41MlNyOlsIsA2f5$ovuFgkJGGi0DyTZptp7agbWr6qfWcqm+pR7IkGo4xrE=','',NULL,NULL,NULL,NULL,NULL,0,'','','',0,1,'2023-04-14 13:54:26.832166'),(213,'Dani','pbkdf2_sha256$260000$1qrfwlbIk2c7lKcVQA45du$M6ltbiajEACN7vogNiMzIvqzLYYDJqRH2J/IOnDwtgA=','',NULL,NULL,NULL,NULL,'2023-04-14 14:04:39.649987',0,'','','',0,1,'2023-04-14 14:00:03.275061'),(214,'alon','pbkdf2_sha256$260000$8GAvkXpfRI67qm4HzHsj3M$qSJQ7nGtm8W9+b1YcoM+SauMRHpN8ZqYxsBVrKYFtxY=','',NULL,NULL,NULL,NULL,'2023-04-14 14:28:10.643533',0,'','','',0,1,'2023-04-14 14:06:16.035881'),(215,'asd','pbkdf2_sha256$260000$FgfdSaXsPBTXbjqS5mAIVK$7OQbsmTerkd4yh78ucGVcdqyJBTd/YsiFsk46NVIdcI=','','asd',NULL,NULL,NULL,NULL,0,'','','',0,1,'2023-04-15 05:18:13.395569'),(216,'123456','pbkdf2_sha256$260000$hgCzqSGGwY3llbHceOVwm3$3yMgOepEypaN/kin+TNsqvfYesm0W0n02trcV8PaSWU=','','adda',NULL,NULL,NULL,NULL,0,'','','',0,1,'2023-04-15 07:53:23.194820'),(217,'123456','pbkdf2_sha256$260000$Iaeyyy9SjAAARg0rPnHd7e$NcwNMG/bRMU445gdZ3tivJwP88c5n8yIEtcEYuNxu6o=','','gffgn',NULL,NULL,NULL,NULL,0,'','','',0,1,'2023-04-15 07:54:16.445137'),(218,'dvnsdovnsd','pbkdf2_sha256$260000$FAyeBftilFFDlANulDVOkF$8CVteVw5seiz14swQN0Y+9S5lL0qzePp/3iHF4sgTPE=','','djbsdjvb','fbfdv','bjfbfdi','bfdbdfi','2023-04-15 08:00:13.766155',0,'','','',0,1,'2023-04-15 07:59:13.228309'),(219,'','pbkdf2_sha256$260000$JKEti6ajTADAwzuCgDgPPl$VqDl6BBRc2UNAZzpr5GxqD1fBv1scZPJg2TrpJkOG9w=','','dsvsd','fbdf d','gfnfn','gfnbg','2023-04-15 08:18:27.767557',0,'','','adj@aaa.com',0,1,'2023-04-15 08:17:01.105716'),(220,'','pbkdf2_sha256$260000$tSQYZPNvZfNfdp1xPaPGxS$vIAA29DinB6CnmHP8oGHJ0W1xChpnJNKAj0GhZ8jfis=','','guy','gfbf','guy','g','2023-04-15 08:20:30.568705',0,'','','abc@aaa.com',0,1,'2023-04-15 08:20:30.411712'),(221,'','pbkdf2_sha256$260000$O8FCvEvToDVYHXfJtqOVV4$d68q5UoGo4i5D1ocCO8YrmbAGPE2ENPOE8+W7o/X2fo=','','fkvmfk','mkifmbodf','mogifm','moifv','2023-04-15 08:28:11.386553',0,'','','abd@aaa.com',0,1,'2023-04-15 08:28:11.226327'),(222,'','pbkdf2_sha256$260000$XchhQdvEo6feUOxQqvQK4Q$I8PQUNvEeyL2+dIRfk5CX2RnFNn26Fe0EeaCwV9lDng=','','fnmjk;vn','npoiun','npoun','npoin','2023-04-15 08:29:04.784304',0,'','','abb@aaa.com',0,1,'2023-04-15 08:29:04.636909'),(223,'','pbkdf2_sha256$260000$LdHPdp3im16IOyqxXDBts4$U7RikI5/kmf8Eoxj6gTALSU4ayymwmIm5jKGYwQeyBU=','','','dvmskolm','mop','imn','2023-04-15 08:33:24.133325',0,'','','a@a.com',0,1,'2023-04-15 08:33:23.974457'),(224,'','pbkdf2_sha256$260000$AtMFtIwgUf3qMZmEAeZfj0$5+em02YrvFv3LF1rQp9m5C4eTyK+7nMP8LBs2gpkNEU=','','','','','','2023-04-15 08:35:21.940252',0,'','','ab@aa.com',0,1,'2023-04-15 08:34:50.181502'),(225,'','pbkdf2_sha256$260000$QufQnubtspm2zAve9OfwQr$Q1/awJNchNvtcwHm9rReD/PaWe6R5HsK7oXAwh45+Ts=','','','','','','2023-04-15 08:46:48.754202',0,'','','a@b.com',0,1,'2023-04-15 08:46:30.613909'),(226,'','pbkdf2_sha256$260000$VTXUKhvwZLpueLzFackCmN$gQ9uoNFeV0mL/o/Q+kQ9xNWFx6ia6NPTlyR9AqdSLnk=','','','','','','2023-04-15 13:03:35.265690',0,'','','aaaaa@a.com',0,1,'2023-04-15 13:03:14.822833');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 16:03:52
