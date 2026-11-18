-- Job Application Tracker Sample Data
USE job_tracker;

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

-- Applications sample data

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'2025-01-16','Offer','v2.1',1,NULL,NULL,NULL,'2026-09-21 17:43:20',NULL),(2,3,'2025-01-13','Interview','v2.1',1,NULL,NULL,NULL,'2026-09-21 17:43:20',NULL),(3,4,'2025-01-09','Interview','v2.0',0,NULL,NULL,NULL,'2026-09-21 17:43:20',NULL),(4,5,'2025-01-15','Applied','v2.1',1,NULL,NULL,NULL,'2026-09-21 17:43:20',NULL),(5,7,'2025-01-12','Screening','v2.1',1,NULL,NULL,NULL,'2026-09-21 17:43:20',NULL),(6,6,'2026-10-05','Applied','v3.0',1,NULL,NULL,NULL,'2026-10-05 16:26:17',NULL),(8,21,'2026-11-16','Applied','v1.0',1,NULL,NULL,NULL,'2026-11-16 21:28:36','{\"notes\": \"Initial phone screening scheduled\", \"round\": 1}');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

-- Companies sample data

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Tech Solutions Inc','Technology','www.techsolutions.com','Miami','Florida',NULL,'2026-09-21 17:43:20'),(2,'Data Analytics Corp','Data Science','www.dataanalytics.com','Austin','Texas',NULL,'2026-09-21 17:43:20'),(3,'Cloud Systems LLC','Cloud Computing','www.cloudsystems.com','Seattle','Washington',NULL,'2026-09-21 17:43:20'),(4,'Digital Innovations','Software','www.digitalinnovations.com','San Francisco','California','Applied to Senior Developer position on 2026-10-05','2026-09-21 17:43:20'),(5,'Smart Tech Group','AI/ML','www.smarttech.com','Boston','Massachusetts',NULL,'2026-09-21 17:43:20'),(7,'New Tech Corp','Technology',NULL,'Denver','Colorado',NULL,'2026-10-05 16:21:51'),(10,'BrightPath Technologies','Software Development','https://example.com','Orlando','Florida','A technology company specializing in web applications and cloud-based software solutions.','2026-11-16 21:25:48');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

-- Contacts sample data

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,1,'sjohnson@techsolutions.com',NULL,'HR Manager',NULL,NULL,'2026-09-21 17:43:20','Sarah Johnson'),(2,2,'mchen@dataanalytics.com',NULL,'Technical Recruiter',NULL,NULL,'2026-09-21 17:43:20','Michael Chen'),(3,3,'ewilliams@cloudsystems.com',NULL,'Hiring Manager',NULL,NULL,'2026-09-21 17:43:20','Emily Williams'),(4,4,NULL,NULL,'Senior Developer',NULL,NULL,'2026-09-21 17:43:20','David Brown'),(5,5,'lgarcia@smarttech.com',NULL,'Talent Acquisition',NULL,NULL,'2026-09-21 17:43:20','Lisa Garcia'),(7,4,'rkim@digitalinnovations.com',NULL,'Engineering Manager',NULL,NULL,'2026-10-05 16:28:28','Robert Kim'),(9,10,'jessica.morgan@example.com','407-555-0142','Technical Recruiter','https://www.linkedin.com','Met at a networking event. Discussed potential junior software developer opportunities.','2026-11-16 21:31:01','Jessica Morgan');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

-- Jobs sample data

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,1,'Software Developer',NULL,70000,90000,'Full-time',NULL,'2025-01-15',1,'2026-09-21 17:43:20','[\"Python\", \"SQL\", \"Flask\", \"Git\"]'),(2,1,'Database Administrator',NULL,75000,95000,'Full-time',NULL,'2025-01-10',1,'2026-09-21 17:43:20',NULL),(3,2,'Data Analyst',NULL,65000,85000,'Full-time',NULL,'2025-01-12',1,'2026-09-21 17:43:20',NULL),(4,3,'Cloud Engineer',NULL,80000,100000,'Full-time',NULL,'2025-01-08',1,'2026-09-21 17:43:20',NULL),(5,4,'Junior Developer',NULL,55000,70000,'Full-time',NULL,'2025-01-14',1,'2026-09-21 17:43:20',NULL),(6,4,'Senior Developer',NULL,95000,120000,'Full-time',NULL,'2025-01-14',1,'2026-09-21 17:43:20',NULL),(7,5,'ML Engineer',NULL,90000,115000,'Full-time',NULL,'2025-01-11',1,'2026-09-21 17:43:20',NULL),(8,1,'QA Engineer',NULL,60000,80000,'Full-time',NULL,'2025-01-05',1,'2026-09-28 16:30:18',NULL),(9,2,'Business Analyst',NULL,65000,85000,'Full-time',NULL,'2025-01-06',1,'2026-09-28 16:30:18',NULL),(10,2,'Data Scientist',NULL,85000,110000,'Full-time',NULL,'2025-01-07',1,'2026-09-28 16:30:18',NULL),(11,3,'DevOps Engineer',NULL,80000,105000,'Full-time',NULL,'2025-01-08',1,'2026-09-28 16:30:18',NULL),(12,3,'Security Analyst',NULL,75000,95000,'Full-time',NULL,'2025-01-09',1,'2026-09-28 16:30:18',NULL),(13,4,'UI/UX Designer',NULL,60000,80000,'Full-time',NULL,'2025-01-10',1,'2026-09-28 16:30:18',NULL),(14,5,'Product Manager',NULL,90000,120000,'Full-time',NULL,'2025-01-11',1,'2026-09-28 16:30:18',NULL),(15,1,'Technical Writer',NULL,55000,75000,'Contract',NULL,'2025-01-12',1,'2026-09-28 16:30:18',NULL),(16,2,'Intern - Data',NULL,30000,40000,'Internship',NULL,'2025-01-13',1,'2026-09-28 16:30:18',NULL),(17,4,'Intern - Development',NULL,32000,42000,'Internship',NULL,'2025-01-14',1,'2026-09-28 16:30:18',NULL),(18,7,'Software Architect',NULL,120000,150000,'Full-time',NULL,NULL,1,'2026-10-05 16:22:14',NULL),(21,1,'Junior Python Developer','Entry-level developer position working with Python, SQL, and Flask.',60000,80000,'Full-time','https://example.com/jobs/junior-python-developer','2026-11-16',1,'2026-11-16 21:19:17','[\"Python\", \"SQL\", \"Flask\"]');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
