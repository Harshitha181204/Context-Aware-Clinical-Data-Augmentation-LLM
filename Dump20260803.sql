-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: adv_llm_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add augmented feature',7,'add_augmentedfeature'),(26,'Can change augmented feature',7,'change_augmentedfeature'),(27,'Can delete augmented feature',7,'delete_augmentedfeature'),(28,'Can view augmented feature',7,'view_augmentedfeature'),(29,'Can add patient',8,'add_patient'),(30,'Can change patient',8,'change_patient'),(31,'Can delete patient',8,'delete_patient'),(32,'Can view patient',8,'view_patient'),(33,'Can add prediction result',9,'add_predictionresult'),(34,'Can change prediction result',9,'change_predictionresult'),(35,'Can delete prediction result',9,'delete_predictionresult'),(36,'Can view prediction result',9,'view_predictionresult'),(37,'Can add user profile',10,'add_userprofile'),(38,'Can change user profile',10,'change_userprofile'),(39,'Can delete user profile',10,'delete_userprofile'),(40,'Can view user profile',10,'view_userprofile'),(41,'Can add medical record',11,'add_medicalrecord'),(42,'Can change medical record',11,'change_medicalrecord'),(43,'Can delete medical record',11,'delete_medicalrecord'),(44,'Can view medical record',11,'view_medicalrecord'),(45,'Can add llm augmentation run',12,'add_llmaugmentationrun'),(46,'Can change llm augmentation run',12,'change_llmaugmentationrun'),(47,'Can delete llm augmentation run',12,'delete_llmaugmentationrun'),(48,'Can view llm augmentation run',12,'view_llmaugmentationrun');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$9EupzTcl5gs6GCkpULclj0$QA+kPWxqltcN4bThgZ8pIYySdC1pX2/wXbEo20DbmDY=','2026-02-27 04:22:23.115351',1,'Heman','','','hemanrahul.varry@gmaill.com',1,1,'2026-02-25 15:42:41.028291'),(2,'pbkdf2_sha256$1000000$q2omSK7h1Ir7hHVkkPIbXG$CGvnVPduRnlUJUqbCsy7y7C8chYeuyW7zhsRBih2P1o=','2026-08-03 15:00:55.103443',0,'Rahul','','','hemanrahul.varry@gmail.com',0,1,'2026-02-26 07:02:13.606425'),(3,'pbkdf2_sha256$1000000$Okj2oN0YrXFu3gnGkjKdV6$KHECWcYyPSU5VI75U2zlu7dDYi6PQcSMpkvipCGNBfI=','2026-03-28 05:08:00.071098',0,'cmsvarma','','','cmsvarma@yahoo.com',0,1,'2026-03-28 05:07:58.522040'),(5,'pbkdf2_sha256$1000000$xgTKp6sDkDHhyYBuXtbe0G$UC3CRUhof2u6iAf2QQDbNwedoHF9fzQ3JMD2ReyjQZQ=','2026-03-28 05:08:23.923365',0,'cmsvarma1','','','cmsvarma@yahoo.com',0,1,'2026-03-28 05:08:22.486090');
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
-- Table structure for table `clinical_app_augmentedfeature`
--

DROP TABLE IF EXISTS `clinical_app_augmentedfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_app_augmentedfeature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `generated_features` json NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_id` (`patient_id`),
  CONSTRAINT `clinical_app_augment_patient_id_cca3de0e_fk_clinical_` FOREIGN KEY (`patient_id`) REFERENCES `clinical_app_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_app_augmentedfeature`
--

LOCK TABLES `clinical_app_augmentedfeature` WRITE;
/*!40000 ALTER TABLE `clinical_app_augmentedfeature` DISABLE KEYS */;
INSERT INTO `clinical_app_augmentedfeature` VALUES (1,'{\"total_score\": 0, \"cardiac_score\": 0, \"severity_level\": \"Low\", \"infection_score\": 0, \"clinical_summary\": \"\\nPatient shows Low risk level.\\nRespiratory Score: 0\\nCardiac Score: 0\\nInfection Score: 0\\nOverall Risk Category: Low\\n\", \"respiratory_score\": 0, \"lung_opacity_score\": 0.3, \"chest_pain_severity\": 1, \"suspected_condition\": \"Mild Clinical Presentation\", \"breathing_difficulty\": false, \"jugular_venous_pressure\": 0}','2026-02-26 10:31:55.233935',1),(2,'{\"total_score\": 5, \"cardiac_score\": 0, \"severity_level\": \"Moderate\", \"infection_score\": 2, \"respiratory_score\": 3, \"lung_opacity_score\": 0.81, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.46}','2026-02-26 16:24:08.868628',2),(3,'{\"total_score\": 3, \"cardiac_score\": 0, \"severity_level\": \"Moderate\", \"infection_score\": 2, \"respiratory_score\": 1, \"lung_opacity_score\": 0.36, \"breathing_difficulty\": false, \"cardiac_stress_index\": 0.27}','2026-03-28 05:10:19.670353',4),(4,'{\"total_score\": 5, \"cardiac_score\": 0, \"severity_level\": \"Moderate\", \"infection_score\": 2, \"respiratory_score\": 3, \"lung_opacity_score\": 0.84, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.47}','2026-03-30 03:56:21.979467',5),(5,'{\"total_score\": 5, \"cardiac_score\": 0, \"severity_level\": \"Moderate\", \"infection_score\": 2, \"respiratory_score\": 3, \"lung_opacity_score\": 0.8, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.26}','2026-03-30 04:23:49.338454',6),(6,'{\"total_score\": 2, \"cardiac_score\": 0, \"severity_level\": \"Low\", \"infection_score\": 0, \"respiratory_score\": 2, \"lung_opacity_score\": 0.88, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.49}','2026-04-24 05:51:34.003826',7),(7,'{\"total_score\": 2, \"cardiac_score\": 0, \"severity_level\": \"Low\", \"infection_score\": 0, \"respiratory_score\": 2, \"lung_opacity_score\": 0.76, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.49}','2026-04-24 16:00:03.695571',3),(8,'{\"total_score\": 5, \"cardiac_score\": 0, \"severity_level\": \"Moderate\", \"infection_score\": 2, \"respiratory_score\": 3, \"lung_opacity_score\": 0.76, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.41}','2026-04-25 04:22:33.434730',8),(9,'{\"total_score\": 7, \"cardiac_score\": 2, \"severity_level\": \"High\", \"infection_score\": 2, \"respiratory_score\": 3, \"lung_opacity_score\": 0.81, \"breathing_difficulty\": true, \"cardiac_stress_index\": 0.78}','2026-04-25 04:32:42.040640',9),(10,'{\"total_score\": 3, \"cardiac_score\": 0, \"severity_level\": \"Moderate\", \"infection_score\": 2, \"respiratory_score\": 1, \"lung_opacity_score\": 0.32, \"breathing_difficulty\": false, \"cardiac_stress_index\": 0.48}','2026-04-25 09:49:06.861235',10);
/*!40000 ALTER TABLE `clinical_app_augmentedfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_app_llmaugmentationrun`
--

DROP TABLE IF EXISTS `clinical_app_llmaugmentationrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_app_llmaugmentationrun` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wikimedia_data` json DEFAULT NULL,
  `radiopaedia_data` json DEFAULT NULL,
  `combined_context` json DEFAULT NULL,
  `generated_features` json DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinical_app_llmaugm_patient_id_49040a51_fk_clinical_` (`patient_id`),
  CONSTRAINT `clinical_app_llmaugm_patient_id_49040a51_fk_clinical_` FOREIGN KEY (`patient_id`) REFERENCES `clinical_app_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_app_llmaugmentationrun`
--

LOCK TABLES `clinical_app_llmaugmentationrun` WRITE;
/*!40000 ALTER TABLE `clinical_app_llmaugmentationrun` DISABLE KEYS */;
INSERT INTO `clinical_app_llmaugmentationrun` VALUES (8,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 90.0, \"heart_rate\": 108.0, \"temperature\": 40.0}, \"patient\": {\"age\": 19, \"gender\": \"Male\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 19\\nTemperature: 40.0\\nOxygen: 90.0\\n\\nRisk Level: High\\n\", \"chest_pain_severity\": \"High\", \"breathing_difficulty\": false, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-03-29 06:29:50.079246',2),(9,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 85.0, \"heart_rate\": 110.0, \"temperature\": 40.0}, \"patient\": {\"age\": 26, \"gender\": \"Male\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 26\\nTemperature: 40.0\\nOxygen: 85.0\\n\\nRisk Level: High\\n\", \"chest_pain_severity\": \"High\", \"breathing_difficulty\": true, \"jugular_venous_pressure\": \"Elevated\"}','COMPLETED','2026-03-29 11:08:10.413685',1),(10,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 70.0, \"heart_rate\": 80.0, \"temperature\": 101.0}, \"patient\": {\"age\": 21, \"gender\": \"Male\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 21\\nTemperature: 101.0\\nOxygen: 70.0\\n\\nRisk Level: High\\n\", \"chest_pain_severity\": \"High\", \"breathing_difficulty\": true, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-03-30 03:56:51.992324',5),(11,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 30.0, \"heart_rate\": 98.0, \"temperature\": 100.0}, \"patient\": {\"age\": 22, \"gender\": \"Female\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 22\\nTemperature: 100.0\\nOxygen: 30.0\\n\\nRisk Level: High\\n\", \"chest_pain_severity\": \"High\", \"breathing_difficulty\": true, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-03-30 04:25:31.242695',6),(12,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 75.0, \"heart_rate\": 100.0, \"temperature\": 38.0}, \"patient\": {\"age\": 21, \"gender\": \"Male\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"Low\", \"clinical_summary\": \"\\nPatient Age: 21\\nTemperature: 38.0\\nOxygen: 75.0\\n\\nRisk Level: Moderate\\n\", \"chest_pain_severity\": \"Moderate\", \"breathing_difficulty\": true, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-04-24 05:52:11.815284',7),(13,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 75.0, \"heart_rate\": 90.0, \"temperature\": 104.0}, \"patient\": {\"age\": 30, \"gender\": \"Male\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 30\\nTemperature: 104.0\\nOxygen: 75.0\\n\\nRisk Level: High\\n\", \"chest_pain_severity\": \"High\", \"breathing_difficulty\": true, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-04-25 04:23:23.297756',8),(14,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 60.0, \"heart_rate\": 140.0, \"temperature\": 39.0}, \"patient\": {\"age\": 40, \"gender\": \"Female\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 40\\nTemperature: 39.0\\nOxygen: 60.0\\n\\nRisk Level: Moderate\\n\", \"chest_pain_severity\": \"Moderate\", \"breathing_difficulty\": true, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-04-25 04:33:26.145428',9),(15,'{\"causes\": [\"Infection\", \"Heart disease\", \"Lung disorder\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}','{\"risk_factors\": [\"Smoking\", \"High BP\", \"Age factor\"], \"clinical_signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"]}','{\"medical\": {\"oxygen\": 98.0, \"heart_rate\": 72.0, \"temperature\": 39.0}, \"patient\": {\"age\": 23, \"gender\": \"Male\"}, \"knowledge\": {\"signs\": [\"Decreased breath sounds\", \"Fluid accumulation\"], \"symptoms\": [\"Shortness of breath\", \"Chest pain\", \"Fatigue\"]}}','{\"infection_risk\": \"High\", \"clinical_summary\": \"\\nPatient Age: 23\\nTemperature: 39.0\\nOxygen: 98.0\\n\\nRisk Level: Moderate\\n\", \"chest_pain_severity\": \"Moderate\", \"breathing_difficulty\": false, \"jugular_venous_pressure\": \"Normal\"}','COMPLETED','2026-04-25 09:49:18.861675',10);
/*!40000 ALTER TABLE `clinical_app_llmaugmentationrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_app_medicalrecord`
--

DROP TABLE IF EXISTS `clinical_app_medicalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_app_medicalrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `temperature` double NOT NULL,
  `heart_rate` double NOT NULL,
  `respiratory_rate` double NOT NULL,
  `oxygen_saturation` double NOT NULL,
  `systolic_bp` double NOT NULL,
  `diastolic_bp` double NOT NULL,
  `visit_date` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinical_app_medical_patient_id_8aca99ad_fk_clinical_` (`patient_id`),
  CONSTRAINT `clinical_app_medical_patient_id_8aca99ad_fk_clinical_` FOREIGN KEY (`patient_id`) REFERENCES `clinical_app_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_app_medicalrecord`
--

LOCK TABLES `clinical_app_medicalrecord` WRITE;
/*!40000 ALTER TABLE `clinical_app_medicalrecord` DISABLE KEYS */;
INSERT INTO `clinical_app_medicalrecord` VALUES (1,38,90,11,95,130,50,'2026-02-26 10:29:13.046792',1),(2,40,110,9,85,140,50,'2026-02-26 10:37:31.788885',1),(3,40,108,12,90,120,80,'2026-02-26 16:18:44.631973',2),(4,38,80,10,90,120,80,'2026-03-01 11:54:18.885373',3),(5,102,70,12,98,120,80,'2026-03-28 05:10:09.804400',4),(6,101,80,6,70,120,80,'2026-03-30 03:56:17.592270',5),(7,100,98,15,30,120,60,'2026-03-30 04:23:40.036609',6),(8,38,100,7,75,120,80,'2026-04-24 05:51:24.961473',7),(9,104,90,10,75,125,80,'2026-04-25 04:22:15.424271',8),(10,39,110,6,60,100,70,'2026-04-25 04:31:27.226144',8),(11,39,140,6,60,100,70,'2026-04-25 04:32:39.112952',9),(12,39,72,10,98,120,80,'2026-04-25 09:49:00.700653',10);
/*!40000 ALTER TABLE `clinical_app_medicalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_app_patient`
--

DROP TABLE IF EXISTS `clinical_app_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_app_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_code` varchar(20) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_code` (`patient_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_app_patient`
--

LOCK TABLES `clinical_app_patient` WRITE;
/*!40000 ALTER TABLE `clinical_app_patient` DISABLE KEYS */;
INSERT INTO `clinical_app_patient` VALUES (1,'P1','Nithin',26,'Male','89765463210','2026-02-26 10:04:17.484345'),(2,'P2','Mahith',19,'Male','9273378816','2026-02-26 10:39:57.914398'),(3,'P3','Rahul',21,'Male','8172345678','2026-03-01 11:53:48.317725'),(4,'P5','saket',35,'Male','910000001','2026-03-28 05:09:13.954576'),(5,'p4','Suhas',21,'Male','9876543210','2026-03-30 03:54:56.845560'),(6,'p10','abc',22,'Female','7215893214','2026-03-30 04:22:59.067604'),(7,'p7','Ravi',21,'Male','9876543210','2026-04-24 05:50:21.826210'),(8,'p0','Rohith',30,'Male','8309637337','2026-04-25 04:20:50.152969'),(9,'p9','Harshitha',40,'Female','7654321789','2026-04-25 04:32:18.846462'),(10,'p11','rahul',23,'Male','123445','2026-04-25 09:48:00.670916');
/*!40000 ALTER TABLE `clinical_app_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_app_predictionresult`
--

DROP TABLE IF EXISTS `clinical_app_predictionresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_app_predictionresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `predicted_disease` varchar(100) NOT NULL,
  `probability` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_id` (`patient_id`),
  CONSTRAINT `clinical_app_predict_patient_id_c1a30177_fk_clinical_` FOREIGN KEY (`patient_id`) REFERENCES `clinical_app_patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_app_predictionresult`
--

LOCK TABLES `clinical_app_predictionresult` WRITE;
/*!40000 ALTER TABLE `clinical_app_predictionresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinical_app_predictionresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_app_userprofile`
--

DROP TABLE IF EXISTS `clinical_app_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_app_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `hospital_name` varchar(200) NOT NULL,
  `specialization` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `clinical_app_userprofile_user_id_1bf859b7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_app_userprofile`
--

LOCK TABLES `clinical_app_userprofile` WRITE;
/*!40000 ALTER TABLE `clinical_app_userprofile` DISABLE KEYS */;
INSERT INTO `clinical_app_userprofile` VALUES (1,'Doctor','Not Provided','',1),(2,'Doctor','Not Provided','',2),(3,'Doctor','KrishnaRaji','Heart',3),(4,'Doctor','KrishnaRaji','Heart',5);
/*!40000 ALTER TABLE `clinical_app_userprofile` ENABLE KEYS */;
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'clinical_app','augmentedfeature'),(12,'clinical_app','llmaugmentationrun'),(11,'clinical_app','medicalrecord'),(8,'clinical_app','patient'),(9,'clinical_app','predictionresult'),(10,'clinical_app','userprofile'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-25 15:33:02.143599'),(2,'auth','0001_initial','2026-02-25 15:33:02.845371'),(3,'admin','0001_initial','2026-02-25 15:33:03.090208'),(4,'admin','0002_logentry_remove_auto_add','2026-02-25 15:33:03.101036'),(5,'admin','0003_logentry_add_action_flag_choices','2026-02-25 15:33:03.111047'),(6,'contenttypes','0002_remove_content_type_name','2026-02-25 15:33:03.255100'),(7,'auth','0002_alter_permission_name_max_length','2026-02-25 15:33:03.332178'),(8,'auth','0003_alter_user_email_max_length','2026-02-25 15:33:03.353056'),(9,'auth','0004_alter_user_username_opts','2026-02-25 15:33:03.359072'),(10,'auth','0005_alter_user_last_login_null','2026-02-25 15:33:03.418682'),(11,'auth','0006_require_contenttypes_0002','2026-02-25 15:33:03.420681'),(12,'auth','0007_alter_validators_add_error_messages','2026-02-25 15:33:03.427689'),(13,'auth','0008_alter_user_username_max_length','2026-02-25 15:33:03.505481'),(14,'auth','0009_alter_user_last_name_max_length','2026-02-25 15:33:03.585176'),(15,'auth','0010_alter_group_name_max_length','2026-02-25 15:33:03.609146'),(16,'auth','0011_update_proxy_permissions','2026-02-25 15:33:03.617142'),(17,'auth','0012_alter_user_first_name_max_length','2026-02-25 15:33:03.695306'),(18,'sessions','0001_initial','2026-02-25 15:33:03.739667'),(21,'clinical_app','0001_initial','2026-02-26 10:03:53.002542'),(22,'clinical_app','0002_llmaugmentationrun','2026-03-29 05:22:31.160296'),(23,'clinical_app','0003_alter_llmaugmentationrun_generated_features','2026-03-29 05:26:12.949865');
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
INSERT INTO `django_session` VALUES ('1fk5zmicqsxg1ennpphpgynqkl3wz103','.eJxVjEsOwjAMBe-SNYrqhubDkj1nqGzHJgXUSP2sEHenlbqA7ZuZ9zY9rkvp11mmfsjmYlpz-t0I-SnjDvIDx3u1XMdlGsjuij3obG81y-t6uH8HBeey1QDqtcU2SCIAphQDhC4ynTWAKHfBJcrgG48sDiUGbmALVJxXzcl8vut_OJ0:1wqu9v:yVsRiyCND1gSm27p8SaKXtpefcXPs0OI_Ln8_BZGtUY','2026-08-17 15:00:55.133971'),('6mo0oxqfvnjbdg5jpivjy6ny159gsiva','.eJxVjEsOwjAMBe-SNYrqhubDkj1nqGzHJgXUSP2sEHenlbqA7ZuZ9zY9rkvp11mmfsjmYlpz-t0I-SnjDvIDx3u1XMdlGsjuij3obG81y-t6uH8HBeey1QDqtcU2SCIAphQDhC4ynTWAKHfBJcrgG48sDiUGbmALVJxXzcl8vut_OJ0:1wB4CE:2mcI0CWO5gIygr91zOpIkQKTy3wePuHAHikgKc7SdL0','2026-04-24 05:14:22.030806'),('oyjbp2plk17alu8s0amrfuexkwek6on0','.eJxVjMsOwiAUBf-FtSFSKA-X7vsNhPtAqgaS0q6M_65NutDtmZnzEjFta4lb5yXOJC5Ci9PvBgkfXHdA91RvTWKr6zKD3BV50C6nRvy8Hu7fQUm9fGsmBUmPHphNDpYUOvSDUXw2Rnkmn8NotIaAWllEO_jsMCPbjAoJnHh_AP21ONM:1w6Ltw:ZyI-zCWniplpE9_11ZbqqrVbF7BgjYPHr9oUx3tiQX4','2026-04-11 05:08:00.085084'),('sfkezvbpbupzulutowmyq9cjm33l9pqv','.eJxVjEsOwjAMBe-SNYrqhubDkj1nqGzHJgXUSP2sEHenlbqA7ZuZ9zY9rkvp11mmfsjmYlpz-t0I-SnjDvIDx3u1XMdlGsjuij3obG81y-t6uH8HBeey1QDqtcU2SCIAphQDhC4ynTWAKHfBJcrgG48sDiUGbmALVJxXzcl8vut_OJ0:1wGU6A:hW3mQYyHk5xAgJ2FPUB6uEjcEqbGVxw9RCAOusmh1TE','2026-05-09 03:54:30.831092'),('xejb00lhan67d94z6l0mh2rl6diws36x','.eJxVjEsOwjAMBe-SNYrqhubDkj1nqGzHJgXUSP2sEHenlbqA7ZuZ9zY9rkvp11mmfsjmYlpz-t0I-SnjDvIDx3u1XMdlGsjuij3obG81y-t6uH8HBeey1QDqtcU2SCIAphQDhC4ynTWAKHfBJcrgG48sDiUGbmALVJxXzcl8vut_OJ0:1w748J:ZxvPlpW15xdUkftEZPNmxH2VKANLKX4iBNGHeEPYxgQ','2026-04-13 04:21:47.181597');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-03 20:36:05
