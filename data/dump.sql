-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: hesk
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
-- Table structure for table `hesk_attachments`
--

DROP TABLE IF EXISTS `hesk_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_attachments` (
  `att_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_attachments`
--

LOCK TABLES `hesk_attachments` WRITE;
/*!40000 ALTER TABLE `hesk_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_auth_tokens`
--

DROP TABLE IF EXISTS `hesk_auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) DEFAULT NULL,
  `token` char(64) DEFAULT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_auth_tokens`
--

LOCK TABLES `hesk_auth_tokens` WRITE;
/*!40000 ALTER TABLE `hesk_auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_banned_emails`
--

DROP TABLE IF EXISTS `hesk_banned_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_banned_emails` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `banned_by` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_banned_emails`
--

LOCK TABLES `hesk_banned_emails` WRITE;
/*!40000 ALTER TABLE `hesk_banned_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_banned_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_banned_ips`
--

DROP TABLE IF EXISTS `hesk_banned_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_banned_ips` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ip_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_to` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_display` varchar(100) NOT NULL,
  `banned_by` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_banned_ips`
--

LOCK TABLES `hesk_banned_ips` WRITE;
/*!40000 ALTER TABLE `hesk_banned_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_banned_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_categories`
--

DROP TABLE IF EXISTS `hesk_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cat_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `autoassign` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `autoassign_config` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `priority` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3',
  `default_due_date_amount` int(11) DEFAULT NULL,
  `default_due_date_unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_categories`
--

LOCK TABLES `hesk_categories` WRITE;
/*!40000 ALTER TABLE `hesk_categories` DISABLE KEYS */;
INSERT INTO `hesk_categories` VALUES (1,'General',10,'1',NULL,'0','3',NULL,NULL);
/*!40000 ALTER TABLE `hesk_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_custom_fields`
--

DROP TABLE IF EXISTS `hesk_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_custom_fields` (
  `id` tinyint(3) unsigned NOT NULL,
  `use` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `place` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `req` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `category` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `value` text COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `useType` (`use`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_custom_fields`
--

LOCK TABLES `hesk_custom_fields` WRITE;
/*!40000 ALTER TABLE `hesk_custom_fields` DISABLE KEYS */;
INSERT INTO `hesk_custom_fields` VALUES (1,'0','0','text','0',NULL,'',NULL,1000),(2,'0','0','text','0',NULL,'',NULL,1000),(3,'0','0','text','0',NULL,'',NULL,1000),(4,'0','0','text','0',NULL,'',NULL,1000),(5,'0','0','text','0',NULL,'',NULL,1000),(6,'0','0','text','0',NULL,'',NULL,1000),(7,'0','0','text','0',NULL,'',NULL,1000),(8,'0','0','text','0',NULL,'',NULL,1000),(9,'0','0','text','0',NULL,'',NULL,1000),(10,'0','0','text','0',NULL,'',NULL,1000),(11,'0','0','text','0',NULL,'',NULL,1000),(12,'0','0','text','0',NULL,'',NULL,1000),(13,'0','0','text','0',NULL,'',NULL,1000),(14,'0','0','text','0',NULL,'',NULL,1000),(15,'0','0','text','0',NULL,'',NULL,1000),(16,'0','0','text','0',NULL,'',NULL,1000),(17,'0','0','text','0',NULL,'',NULL,1000),(18,'0','0','text','0',NULL,'',NULL,1000),(19,'0','0','text','0',NULL,'',NULL,1000),(20,'0','0','text','0',NULL,'',NULL,1000),(21,'0','0','text','0',NULL,'',NULL,1000),(22,'0','0','text','0',NULL,'',NULL,1000),(23,'0','0','text','0',NULL,'',NULL,1000),(24,'0','0','text','0',NULL,'',NULL,1000),(25,'0','0','text','0',NULL,'',NULL,1000),(26,'0','0','text','0',NULL,'',NULL,1000),(27,'0','0','text','0',NULL,'',NULL,1000),(28,'0','0','text','0',NULL,'',NULL,1000),(29,'0','0','text','0',NULL,'',NULL,1000),(30,'0','0','text','0',NULL,'',NULL,1000),(31,'0','0','text','0',NULL,'',NULL,1000),(32,'0','0','text','0',NULL,'',NULL,1000),(33,'0','0','text','0',NULL,'',NULL,1000),(34,'0','0','text','0',NULL,'',NULL,1000),(35,'0','0','text','0',NULL,'',NULL,1000),(36,'0','0','text','0',NULL,'',NULL,1000),(37,'0','0','text','0',NULL,'',NULL,1000),(38,'0','0','text','0',NULL,'',NULL,1000),(39,'0','0','text','0',NULL,'',NULL,1000),(40,'0','0','text','0',NULL,'',NULL,1000),(41,'0','0','text','0',NULL,'',NULL,1000),(42,'0','0','text','0',NULL,'',NULL,1000),(43,'0','0','text','0',NULL,'',NULL,1000),(44,'0','0','text','0',NULL,'',NULL,1000),(45,'0','0','text','0',NULL,'',NULL,1000),(46,'0','0','text','0',NULL,'',NULL,1000),(47,'0','0','text','0',NULL,'',NULL,1000),(48,'0','0','text','0',NULL,'',NULL,1000),(49,'0','0','text','0',NULL,'',NULL,1000),(50,'0','0','text','0',NULL,'',NULL,1000);
/*!40000 ALTER TABLE `hesk_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_custom_statuses`
--

DROP TABLE IF EXISTS `hesk_custom_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_custom_statuses` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `can_customers_change` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `order` smallint(5) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_custom_statuses`
--

LOCK TABLES `hesk_custom_statuses` WRITE;
/*!40000 ALTER TABLE `hesk_custom_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_custom_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_kb_articles`
--

DROP TABLE IF EXISTS `hesk_kb_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_kb_articles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` smallint(5) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `keywords` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `rating` float NOT NULL DEFAULT '0',
  `votes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `html` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sticky` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `art_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `history` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `attachments` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `sticky` (`sticky`),
  KEY `type` (`type`),
  FULLTEXT KEY `subject` (`subject`,`content`,`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_kb_articles`
--

LOCK TABLES `hesk_kb_articles` WRITE;
/*!40000 ALTER TABLE `hesk_kb_articles` DISABLE KEYS */;
INSERT INTO `hesk_kb_articles` VALUES (1,1,'2022-08-15 04:02:34',1,'Escalations','<p id=\"docs-internal-guid-0156ea0b-7fff-27fa-527e-6c86ec80d74b\" dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">Axelos ITIL Foundation V4 defines Escalation as:</span></p>\n<p> </p>\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">“The act of sharing awareness or transferring ownership of an issue or work item.”</span></p>\n<p> </p>\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">Hesk has a dedicated module for escalations in their cloud and paid versions. You can find more information at </span><a style=\"text-decoration:none;\" href=\"http://localhost:8000/admin/module_escalate.php\"><span style=\"font-size:11pt;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap;\">http://localhost:8000/admin/module_escalate.php</span></a></p>\n<p> </p>\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:12pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">This module will help you escalate tickets that are not attended to on time.</span></p>\n<ul style=\"margin-top:0;margin-bottom:0;\">\n<li dir=\"ltr\" style=\"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;\">\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:15pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">Tickets not assigned, replied to, or resolved within a timeframe,</span></p>\n</li>\n<li dir=\"ltr\" style=\"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;\">\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">tickets approaching due date and overdue tickets,</span></p>\n</li>\n<li dir=\"ltr\" style=\"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;\">\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">automatically change ticket priority, re-assign a ticket, send an email notification,</span></p>\n</li>\n<li dir=\"ltr\" style=\"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;\">\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">apply rules based on ticket category, owner, status,</span></p>\n</li>\n<li dir=\"ltr\" style=\"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;\">\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:15pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">and much more…</span></p>\n</li>\n</ul>\n<p dir=\"ltr\" style=\"line-height:1.38;margin-top:15pt;margin-bottom:15pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;\">The escalation process here completely revolves around customer service and ticket hygiene.</span></p>\n<p> </p>','',0,0,0,'0','1','0',10,'<li class=\"smaller\">2022-08-15 04:02:34 | submitted by Your name (admin)</li>',''),(2,1,'2022-08-15 04:03:41',1,'Incident Management','<p>The following is from Axelos ITIL Foundation V4 and not my own words.</p>\n<p><br />Incident = an unplanned interruption to a service or reduction in the quality of a service.</p>\n<p><br />The purpose of the incident management practice is to minimize the negative impact of incidents by restoring normal service operation as quickly as possible.<br />By gathering specific information about incidents organizations can set priorities and improve the service value chain.</p>','',0,0,0,'0','1','0',20,'<li class=\"smaller\">2022-08-15 04:03:41 | submitted by Your name (admin)</li>','');
/*!40000 ALTER TABLE `hesk_kb_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_kb_attachments`
--

DROP TABLE IF EXISTS `hesk_kb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_kb_attachments` (
  `att_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `saved_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_kb_attachments`
--

LOCK TABLES `hesk_kb_attachments` WRITE;
/*!40000 ALTER TABLE `hesk_kb_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_kb_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_kb_categories`
--

DROP TABLE IF EXISTS `hesk_kb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_kb_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` smallint(5) unsigned NOT NULL,
  `articles` smallint(5) unsigned NOT NULL DEFAULT '0',
  `articles_private` smallint(5) unsigned NOT NULL DEFAULT '0',
  `articles_draft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_order` smallint(5) unsigned NOT NULL,
  `type` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_kb_categories`
--

LOCK TABLES `hesk_kb_categories` WRITE;
/*!40000 ALTER TABLE `hesk_kb_categories` DISABLE KEYS */;
INSERT INTO `hesk_kb_categories` VALUES (1,'Knowledgebase',0,2,0,0,10,'0');
/*!40000 ALTER TABLE `hesk_kb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_log_overdue`
--

DROP TABLE IF EXISTS `hesk_log_overdue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_log_overdue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket` mediumint(8) unsigned NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `priority` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `owner` smallint(5) unsigned NOT NULL DEFAULT '0',
  `due_date` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket` (`ticket`),
  KEY `category` (`category`),
  KEY `priority` (`priority`),
  KEY `status` (`status`),
  KEY `owner` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_log_overdue`
--

LOCK TABLES `hesk_log_overdue` WRITE;
/*!40000 ALTER TABLE `hesk_log_overdue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_log_overdue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_logins`
--

DROP TABLE IF EXISTS `hesk_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `last_attempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_logins`
--

LOCK TABLES `hesk_logins` WRITE;
/*!40000 ALTER TABLE `hesk_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_mail`
--

DROP TABLE IF EXISTS `hesk_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` smallint(5) unsigned NOT NULL,
  `to` smallint(5) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `deletedby` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`,`read`,`deletedby`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_mail`
--

LOCK TABLES `hesk_mail` WRITE;
/*!40000 ALTER TABLE `hesk_mail` DISABLE KEYS */;
INSERT INTO `hesk_mail` VALUES (1,9999,1,'Hesk quick start guide','</p><div style=\"text-align:justify; padding-left: 10px; padding-right: 10px;\">\n\n<h2 style=\"padding-left:0px\">Welcome to Hesk, an excellent tool for improving your customer support!</h2>\n\n<h3>Below is a short guide to help you get started.</h3>\n\n&nbsp;\n\n<div class=\"main__content notice-flash \">\n<div class=\"notification orange\">\nAn up-to-date and expanded guide is available at <a href=\"https://www.hesk.com/knowledgebase/?article=109\" target=\"_blank\">Hesk online Quick Start Guide</a>.</div>\n</div>\n\n&nbsp;\n\n<h3>&raquo; Step #1: Set up your profile</h3>\n\n<ol>\n<li>go to <a href=\"profile.php\">Profile</a>,</li>\n<li>set your name and email address.</li>\n</ol>\n\n&nbsp;\n\n<h3>&raquo; Step #2: Configure Hesk</h3>\n\n<ol>\n<li>go to <a href=\"admin_settings_general.php\">Settings</a>,</li>\n<li>for a quick start, modify these settings on the \"General\" tab:<br><br>\n<b>Website title</b> - enter the title of your main website (not your help desk),<br>\n<b>Website URL</b> - enter the URL of your main website,<br>\n<b>Webmaster email</b> - enter an alternative email address people can contact in case your Hesk database is down<br>&nbsp;\n</li>\n<li>you can come back to the settings page later and explore all the options. To view details about a setting, click the [?]</li>\n</ol>\n\n&nbsp;\n\n<h3>&raquo; Step #3: Add support categories</h3>\n\n<p>Go to <a href=\"manage_categories.php\">Categories</a> to add support ticket categories.</p>\n<p>You cannot delete the default category, but you can rename it.</p>\n\n&nbsp;\n\n<h3>&raquo; Step #4: Add your support team members</h3>\n\n<p>Go to <a href=\"manage_users.php\">Team</a> to create new support staff accounts.</p>\n<p>You can use two user types in Hesk:</p>\n<ul>\n<li><b>Administrators</b> who have full access to all Hesk features</li>\n<li><b>Staff</b> who you can restrict access to categories and features</li>\n</ul>\n\n&nbsp;\n\n<h3>&raquo; Step #5: Useful tools</h3>\n\n<p>You can do a lot in the <a href=\"banned_emails.php\">Tools</a> section, for example:</p>\n<ul>\n<li>create custom ticket statuses,</li>\n<li>add custom input fields to the &quot;Submit a ticket&quot; form,</li>\n<li>make public announcements (Service messages),</li>\n<li>modify email templates,</li>\n<li>ban disruptive customers,</li>\n<li>and more.</li>\n</ul>\n\n&nbsp;\n\n<h3>&raquo; Step #6: Create a Knowledgebase</h3>\n\n<p>A Knowledgebase is a collection of articles, guides, and answers to frequently asked questions, usually organized in multiple categories.</p>\n<p>A clear and comprehensive knowledgebase can drastically reduce the number of support tickets you receive, thereby saving you significant time and effort in the long run.</p>\n<p>Go to <a href=\"manage_knowledgebase.php\">Knowledgebase</a> to create categories and write articles for your knowledgebase.</p>\n\n&nbsp;\n\n<h3>&raquo; Step #7: Don\'t repeat yourself</h3>\n\n<p>Sometimes several support tickets address the same issues - allowing you to use pre-written (&quot;canned&quot;) responses.</p>\n<p>To compose canned responses, go to the <a href=\"manage_canned.php\">Templates &gt; Responses</a> page.</p>\n<p>Similarly, you can create <a href=\"manage_ticket_templates.php\">Templates &gt; Tickets</a> if your staff will be submitting support tickets on the client\'s behalf, for example, from telephone conversations.</p>\n\n&nbsp;\n\n<h3>&raquo; Step #8: Secure your help desk</h3>\n\n<p>Make sure your help desk is as secure as possible by going through the <a href=\"https://www.hesk.com/knowledgebase/?article=82\">Hesk security checklist</a>.</p>\n\n&nbsp;\n\n<h3>&raquo; Step #9: Stay updated</h3>\n\n<p>Hesk regularly receives improvements and bug fixes; make sure you know about them!</p>\n<ul>\n<li>for fast notifications, <a href=\"https://twitter.com/HESKdotCOM\">follow us on <b>Twitter</b></a></li>\n<li>for email notifications, subscribe to our low-volume zero-spam <a href=\"https://www.hesk.com/newsletter.php\">newsletter</a></li>\n</ul>\n\n&nbsp;\n\n<h3>&raquo; Step #10: Look professional</h3>\n\n<p>To not only support Hesk development but also look more professional, <a href=\"https://www.hesk.com/get/hesk3-license\">remove &quot;Powered by&quot; links</a> from your help desk.</p>\n\n&nbsp;\n\n<h3>&raquo; Step #11: Too much hassle? Switch to Hesk Cloud for the ultimate experience</h3>\n\n<p>Experience the best of Hesk by moving your help desk into the Hesk Cloud:</p>\n<ul>\n<li>exclusive advanced modules,</li>\n<li>automated updates,</li>\n<li>free migration of your existing Hesk tickets and settings,</li>\n<li>we take care of maintenance, server setup and optimization, backups, and more!</li>\n</ul>\n\n<p>&nbsp;<br><a href=\"https://www.hesk.com/get/hesk3-cloud\" class=\"btn btn--blue-border\" style=\"text-decoration:none\">Click here to learn more about Hesk Cloud</a></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Again, welcome to Hesk, and enjoy using it!</p>\n\n<p>Klemen Stirn<br>\nFounder<br>\n<a href=\"https://www.hesk.com\">https://www.hesk.com</a></p>\n\n<p>&nbsp;</p>\n\n</div><p>','2022-08-15 03:59:52','0',9999);
/*!40000 ALTER TABLE `hesk_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_mfa_backup_codes`
--

DROP TABLE IF EXISTS `hesk_mfa_backup_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_mfa_backup_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` smallint(5) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_mfa_backup_codes`
--

LOCK TABLES `hesk_mfa_backup_codes` WRITE;
/*!40000 ALTER TABLE `hesk_mfa_backup_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_mfa_backup_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_mfa_verification_tokens`
--

DROP TABLE IF EXISTS `hesk_mfa_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_mfa_verification_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `verification_token` (`verification_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_mfa_verification_tokens`
--

LOCK TABLES `hesk_mfa_verification_tokens` WRITE;
/*!40000 ALTER TABLE `hesk_mfa_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_mfa_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_notes`
--

DROP TABLE IF EXISTS `hesk_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_notes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` mediumint(8) unsigned NOT NULL,
  `who` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `attachments` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketid` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_notes`
--

LOCK TABLES `hesk_notes` WRITE;
/*!40000 ALTER TABLE `hesk_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_online`
--

DROP TABLE IF EXISTS `hesk_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tmp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_online`
--

LOCK TABLES `hesk_online` WRITE;
/*!40000 ALTER TABLE `hesk_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_pipe_loops`
--

DROP TABLE IF EXISTS `hesk_pipe_loops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_pipe_loops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hits` smallint(1) unsigned NOT NULL DEFAULT '0',
  `message_hash` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_pipe_loops`
--

LOCK TABLES `hesk_pipe_loops` WRITE;
/*!40000 ALTER TABLE `hesk_pipe_loops` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_pipe_loops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_replies`
--

DROP TABLE IF EXISTS `hesk_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_replies` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `replyto` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8_unicode_ci,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attachments` mediumtext COLLATE utf8_unicode_ci,
  `staffid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rating` enum('1','5') COLLATE utf8_unicode_ci DEFAULT NULL,
  `read` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `replyto` (`replyto`),
  KEY `dt` (`dt`),
  KEY `staffid` (`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_replies`
--

LOCK TABLES `hesk_replies` WRITE;
/*!40000 ALTER TABLE `hesk_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_reply_drafts`
--

DROP TABLE IF EXISTS `hesk_reply_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_reply_drafts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` smallint(5) unsigned NOT NULL,
  `ticket` mediumint(8) unsigned NOT NULL,
  `message` mediumtext CHARACTER SET utf8 NOT NULL,
  `message_html` mediumtext CHARACTER SET utf8,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_reply_drafts`
--

LOCK TABLES `hesk_reply_drafts` WRITE;
/*!40000 ALTER TABLE `hesk_reply_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_reply_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_reset_password`
--

DROP TABLE IF EXISTS `hesk_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_reset_password` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` smallint(5) unsigned NOT NULL,
  `hash` char(40) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_reset_password`
--

LOCK TABLES `hesk_reset_password` WRITE;
/*!40000 ALTER TABLE `hesk_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_service_messages`
--

DROP TABLE IF EXISTS `hesk_service_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_service_messages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` smallint(5) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `type` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_service_messages`
--

LOCK TABLES `hesk_service_messages` WRITE;
/*!40000 ALTER TABLE `hesk_service_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_service_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_std_replies`
--

DROP TABLE IF EXISTS `hesk_std_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_std_replies` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8_unicode_ci,
  `reply_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_std_replies`
--

LOCK TABLES `hesk_std_replies` WRITE;
/*!40000 ALTER TABLE `hesk_std_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_std_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_temp_attachments`
--

DROP TABLE IF EXISTS `hesk_temp_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_temp_attachments` (
  `att_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `saved_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_temp_attachments`
--

LOCK TABLES `hesk_temp_attachments` WRITE;
/*!40000 ALTER TABLE `hesk_temp_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_temp_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_temp_attachments_limits`
--

DROP TABLE IF EXISTS `hesk_temp_attachments_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_temp_attachments_limits` (
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `upload_count` int(10) unsigned NOT NULL DEFAULT '1',
  `last_upload_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_temp_attachments_limits`
--

LOCK TABLES `hesk_temp_attachments_limits` WRITE;
/*!40000 ALTER TABLE `hesk_temp_attachments_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_temp_attachments_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_ticket_templates`
--

DROP TABLE IF EXISTS `hesk_ticket_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_ticket_templates` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8_unicode_ci,
  `tpl_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_ticket_templates`
--

LOCK TABLES `hesk_ticket_templates` WRITE;
/*!40000 ALTER TABLE `hesk_ticket_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_ticket_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_tickets`
--

DROP TABLE IF EXISTS `hesk_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_tickets` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trackid` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` smallint(5) unsigned NOT NULL DEFAULT '1',
  `priority` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `message_html` mediumtext COLLATE utf8_unicode_ci,
  `dt` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `firstreply` timestamp NULL DEFAULT NULL,
  `closedat` timestamp NULL DEFAULT NULL,
  `articles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `openedby` mediumint(8) DEFAULT '0',
  `firstreplyby` smallint(5) unsigned DEFAULT NULL,
  `closedby` mediumint(8) DEFAULT NULL,
  `replies` smallint(5) unsigned NOT NULL DEFAULT '0',
  `staffreplies` smallint(5) unsigned NOT NULL DEFAULT '0',
  `owner` smallint(5) unsigned NOT NULL DEFAULT '0',
  `assignedby` mediumint(8) DEFAULT NULL,
  `time_worked` time NOT NULL DEFAULT '00:00:00',
  `lastreplier` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `replierid` smallint(5) unsigned DEFAULT NULL,
  `archive` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `locked` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `attachments` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `merged` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `history` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom1` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom2` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom3` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom4` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom5` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom6` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom7` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom8` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom9` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom10` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom11` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom12` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom13` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom14` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom15` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom16` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom17` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom18` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom19` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom20` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom21` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom22` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom23` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom24` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom25` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom26` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom27` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom28` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom29` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom30` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom31` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom32` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom33` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom34` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom35` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom36` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom37` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom38` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom39` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom40` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom41` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom42` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom43` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom44` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom45` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom46` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom47` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom48` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom49` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom50` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `overdue_email_sent` tinyint(1) DEFAULT '0',
  `satisfaction_email_sent` tinyint(1) DEFAULT '0',
  `satisfaction_email_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trackid` (`trackid`),
  KEY `archive` (`archive`),
  KEY `categories` (`category`),
  KEY `statuses` (`status`),
  KEY `owner` (`owner`),
  KEY `openedby` (`openedby`,`firstreplyby`,`closedby`),
  KEY `dt` (`dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_tickets`
--

LOCK TABLES `hesk_tickets` WRITE;
/*!40000 ALTER TABLE `hesk_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesk_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hesk_users`
--

DROP TABLE IF EXISTS `hesk_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hesk_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isadmin` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `signature` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `afterreply` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `autostart` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `autoreload` smallint(5) unsigned NOT NULL DEFAULT '0',
  `notify_customer_new` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_customer_reply` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `show_suggested` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_unassigned` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_new_my` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_unassigned` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_reply_my` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_assigned` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_pm` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_note` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_unassigned` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `notify_overdue_my` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `default_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoassign` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `heskprivileges` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ratingneg` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ratingpos` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mfa_enrollment` smallint(5) unsigned NOT NULL DEFAULT '0',
  `mfa_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autoassign` (`autoassign`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hesk_users`
--

LOCK TABLES `hesk_users` WRITE;
/*!40000 ALTER TABLE `hesk_users` DISABLE KEYS */;
INSERT INTO `hesk_users` VALUES (1,'admin','$2y$10$QYkvuCMPfbHkV5/AiwkQUeVDJrpbgIqb7oXuP5MOu0v3To75wd7kC','1','Your name','you@example.com','',NULL,'','0','1',0,'1','1','1','1','1','1','1','1','1','1','1','1','','1','',0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `hesk_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-15  4:03:57
