/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.3.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Qbox_A1B5B5
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `bank_accounts_new`
--

DROP TABLE IF EXISTS `bank_accounts_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  `auth` longtext DEFAULT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts_new`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `bank_accounts_new` WRITE;
/*!40000 ALTER TABLE `bank_accounts_new` DISABLE KEYS */;
INSERT INTO `bank_accounts_new` VALUES
('ambulance',6000,'[]','[]',0,NULL),
('ballas',0,'[]','[]',0,NULL),
('bcso',0,'[]','[]',0,NULL),
('bus',0,'[]','[]',0,NULL),
('cardealer',0,'[]','[]',0,NULL),
('cartel',0,'[]','[]',0,NULL),
('families',0,'[]','[]',0,NULL),
('garbage',0,'[]','[]',0,NULL),
('hotdog',0,'[]','[]',0,NULL),
('judge',0,'[]','[]',0,NULL),
('lawyer',0,'[]','[]',0,NULL),
('lostmc',0,'[]','[]',0,NULL),
('mechanic',0,'[]','[]',0,NULL),
('none',0,'[]','[]',0,NULL),
('police',0,'[]','[]',0,NULL),
('realestate',0,'[]','[]',0,NULL),
('reporter',0,'[]','[]',0,NULL),
('sasp',0,'[]','[]',0,NULL),
('taxi',0,'[]','[]',0,NULL),
('thief',0,'[]','[]',0,NULL),
('tow',0,'[]','[]',0,NULL),
('triads',0,'[]','[]',0,NULL),
('trucker',0,'[]','[]',0,NULL),
('unemployed',0,'[]','[]',0,NULL),
('vagos',0,'[]','[]',0,NULL),
('vineyard',0,'[]','[]',0,NULL);
/*!40000 ALTER TABLE `bank_accounts_new` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bans`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `dealers`
--

DROP TABLE IF EXISTS `dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lapraces`
--

DROP TABLE IF EXISTS `lapraces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lapraces`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lapraces` WRITE;
/*!40000 ALTER TABLE `lapraces` DISABLE KEYS */;
/*!40000 ALTER TABLE `lapraces` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `management_outfits`
--

DROP TABLE IF EXISTS `management_outfits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_outfits`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `management_outfits` WRITE;
/*!40000 ALTER TABLE `management_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_outfits` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_calls`
--

DROP TABLE IF EXISTS `npwd_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `isAnonymous` tinyint(4) NOT NULL DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_calls`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_calls` WRITE;
/*!40000 ALTER TABLE `npwd_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_calls` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_darkchat_channel_members`
--

DROP TABLE IF EXISTS `npwd_darkchat_channel_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_darkchat_channel_members`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_darkchat_channel_members` WRITE;
/*!40000 ALTER TABLE `npwd_darkchat_channel_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_darkchat_channel_members` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_darkchat_channels`
--

DROP TABLE IF EXISTS `npwd_darkchat_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(191) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_darkchat_channels`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_darkchat_channels` WRITE;
/*!40000 ALTER TABLE `npwd_darkchat_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_darkchat_channels` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_darkchat_messages`
--

DROP TABLE IF EXISTS `npwd_darkchat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_darkchat_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_darkchat_messages` WRITE;
/*!40000 ALTER TABLE `npwd_darkchat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_darkchat_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_marketplace_listings`
--

DROP TABLE IF EXISTS `npwd_marketplace_listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_marketplace_listings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_marketplace_listings` WRITE;
/*!40000 ALTER TABLE `npwd_marketplace_listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_marketplace_listings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_match_profiles`
--

DROP TABLE IF EXISTS `npwd_match_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_match_profiles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_match_profiles` WRITE;
/*!40000 ALTER TABLE `npwd_match_profiles` DISABLE KEYS */;
INSERT INTO `npwd_match_profiles` VALUES
(1,'C46M9XF9','Aj Fabela','https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg','','','','',NULL,'2026-09-09 19:58:52','2026-09-09 19:58:52');
/*!40000 ALTER TABLE `npwd_match_profiles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_match_views`
--

DROP TABLE IF EXISTS `npwd_match_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_match_views`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_match_views` WRITE;
/*!40000 ALTER TABLE `npwd_match_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_match_views` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_messages`
--

DROP TABLE IF EXISTS `npwd_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_messages` WRITE;
/*!40000 ALTER TABLE `npwd_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_messages_conversations`
--

DROP TABLE IF EXISTS `npwd_messages_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_messages_conversations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_messages_conversations` WRITE;
/*!40000 ALTER TABLE `npwd_messages_conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_messages_conversations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_messages_participants`
--

DROP TABLE IF EXISTS `npwd_messages_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_messages_participants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_messages_participants` WRITE;
/*!40000 ALTER TABLE `npwd_messages_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_messages_participants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_notes`
--

DROP TABLE IF EXISTS `npwd_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_notes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_notes` WRITE;
/*!40000 ALTER TABLE `npwd_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_notes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_phone_contacts`
--

DROP TABLE IF EXISTS `npwd_phone_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_phone_contacts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_phone_contacts` WRITE;
/*!40000 ALTER TABLE `npwd_phone_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_phone_contacts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_phone_gallery`
--

DROP TABLE IF EXISTS `npwd_phone_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_phone_gallery`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_phone_gallery` WRITE;
/*!40000 ALTER TABLE `npwd_phone_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_phone_gallery` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_twitter_likes`
--

DROP TABLE IF EXISTS `npwd_twitter_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_twitter_likes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_twitter_likes` WRITE;
/*!40000 ALTER TABLE `npwd_twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_twitter_likes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_twitter_profiles`
--

DROP TABLE IF EXISTS `npwd_twitter_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_twitter_profiles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_twitter_profiles` WRITE;
/*!40000 ALTER TABLE `npwd_twitter_profiles` DISABLE KEYS */;
INSERT INTO `npwd_twitter_profiles` VALUES
(1,'Aj_Fabela','C46M9XF9','https://i.fivemanage.com/images/3ClWwmpwkFhL.png','2026-09-09 19:58:52','2026-09-09 19:58:52');
/*!40000 ALTER TABLE `npwd_twitter_profiles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_twitter_reports`
--

DROP TABLE IF EXISTS `npwd_twitter_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_twitter_reports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_twitter_reports` WRITE;
/*!40000 ALTER TABLE `npwd_twitter_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_twitter_reports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `npwd_twitter_tweets`
--

DROP TABLE IF EXISTS `npwd_twitter_tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npwd_twitter_tweets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `npwd_twitter_tweets` WRITE;
/*!40000 ALTER TABLE `npwd_twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `npwd_twitter_tweets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `occasion_vehicles`
--

DROP TABLE IF EXISTS `occasion_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occasion_vehicles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `occasion_vehicles` WRITE;
/*!40000 ALTER TABLE `occasion_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `occasion_vehicles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ox_doorlock`
--

DROP TABLE IF EXISTS `ox_doorlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ox_doorlock`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ox_doorlock` WRITE;
/*!40000 ALTER TABLE `ox_doorlock` DISABLE KEYS */;
INSERT INTO `ox_doorlock` VALUES
(1,'vangelico_jewellery','{\"maxDistance\":2,\"groups\":{\"police\":0},\"doors\":[{\"model\":1425919976,\"coords\":{\"x\":-631.9553833007813,\"y\":-236.33326721191407,\"z\":38.2065315246582},\"heading\":306},{\"model\":9467943,\"coords\":{\"x\":-630.426513671875,\"y\":-238.4375457763672,\"z\":38.2065315246582},\"heading\":306}],\"state\":1,\"coords\":{\"x\":-631.19091796875,\"y\":-237.38540649414063,\"z\":38.2065315246582},\"hideUi\":true}'),
(2,'BigBankThermite1','{\"heading\":160,\"doors\":false,\"maxDistance\":2,\"hideUi\":true,\"groups\":{\"police\":0},\"coords\":{\"x\":251.85757446289063,\"y\":221.0654754638672,\"z\":101.83240509033203},\"model\":-1508355822,\"state\":1,\"autolock\":1800}'),
(3,'BigBankThermite2','{\"coords\":{\"x\":261.3004150390625,\"y\":214.50514221191407,\"z\":101.83240509033203},\"autolock\":1800,\"maxDistance\":2,\"groups\":{\"police\":0},\"model\":-1508355822,\"doors\":false,\"hideUi\":true,\"heading\":250,\"state\":1}'),
(4,'BigBankLPDoor','{\"coords\":{\"x\":256.3115539550781,\"y\":220.65785217285157,\"z\":106.42955780029297},\"autolock\":1800,\"maxDistance\":2,\"model\":-222270721,\"doors\":false,\"lockpick\":true,\"hideUi\":true,\"heading\":340,\"state\":1,\"lockpickDifficulty\":[\"hard\"]}'),
(5,'PaletoThermiteDoor','{\"coords\":{\"x\":-106.47130584716797,\"y\":6476.15771484375,\"z\":31.95479965209961},\"autolock\":1800,\"maxDistance\":2,\"groups\":{\"police\":0},\"model\":1309269072,\"doors\":false,\"hideUi\":true,\"heading\":315,\"state\":1}'),
(6,'BigBankRedCardDoor','{\"coords\":{\"x\":262.1980895996094,\"y\":222.518798828125,\"z\":106.42955780029297},\"autolock\":1800,\"maxDistance\":2,\"groups\":{\"police\":0},\"model\":746855201,\"doors\":false,\"hideUi\":true,\"heading\":250,\"state\":1}');
/*!40000 ALTER TABLE `ox_doorlock` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ox_inventory`
--

DROP TABLE IF EXISTS `ox_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ox_inventory`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ox_inventory` WRITE;
/*!40000 ALTER TABLE `ox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ox_inventory` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_groups`
--

DROP TABLE IF EXISTS `player_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`,`type`,`group`),
  CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_groups` WRITE;
/*!40000 ALTER TABLE `player_groups` DISABLE KEYS */;
INSERT INTO `player_groups` VALUES
('C46M9XF9','thief','job',0);
/*!40000 ALTER TABLE `player_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_jobs_activity`
--

DROP TABLE IF EXISTS `player_jobs_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_jobs_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) NOT NULL,
  `last_checkin` int(11) NOT NULL,
  `last_checkout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id` DESC) USING BTREE,
  KEY `last_checkout` (`last_checkout`) USING BTREE,
  KEY `citizenid_job` (`citizenid`,`job`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_jobs_activity`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_jobs_activity` WRITE;
/*!40000 ALTER TABLE `player_jobs_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_jobs_activity` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_mails`
--

DROP TABLE IF EXISTS `player_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_mails`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_mails` WRITE;
/*!40000 ALTER TABLE `player_mails` DISABLE KEYS */;
INSERT INTO `player_mails` VALUES
(1,'C46M9XF9','Pillbox Hospital','Hospital Costs','Dear Mr. Fabela, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!',0,944060,'2026-09-10 05:05:42',NULL),
(2,'C46M9XF9','Pillbox Hospital','Hospital Costs','Dear Mr. Fabela, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!',0,128455,'2026-09-10 06:57:28',NULL),
(3,'C46M9XF9','Turner\'s Auto Wrecking','Vehicle List','You can only scrap a limited number of vehicles..<br />You can keep everything you scrap for yourself as long as you don\'t bother me.<br /><br /><strong>Vehicle List:</strong><br />Imponte Ruiner<br />Vapid Chino<br />Benefactor Feltzer<br />Enus Huntley S<br />Nagasaki Carbon RS<br />Benefactor Serrano<br />Dinka Jester<br />Karin Sultan<br />Ocelot Jackal<br />Obey 9F Cabrio<br />Grotti Grotti Turismo R<br />Declasse Asea<br />Lampadati Pigalle<br />Fathom FQ2<br />Pegassi Bati 801<br />Vapid Stanier<br />Gallivanter Baller<br />Dinka Blista Compact<br />Bravado Rat-Truck<br />Bollokan Prairie<br />Pfister Comet<br />Vapid Slam Van<br />Übermacht Oracle XS<br />Albany Alpha<br />Bravado Bison<br />Obey 9F<br />Vapid Blade<br />Declasse Sabre Turbo<br />Benefactor Panto<br />Übermacht Zion Cabrio<br />Schyster Fusilade<br />Enus Cognoscenti<br />Übermacht Zion<br />Albany Washington<br />Dinka Akuma<br />Ocelot F620<br />Albany Cavalcade<br />Vapid Bullet<br />Pegassi Zentorno<br />Albany Virgo<br />',0,829656,'2026-09-10 07:30:51',NULL),
(4,'C46M9XF9','Pillbox Hospital','Hospital Costs','Dear Mr. Fabela, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!',0,355835,'2026-09-10 09:30:30',NULL);
/*!40000 ALTER TABLE `player_mails` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_outfit_codes`
--

DROP TABLE IF EXISTS `player_outfit_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_outfit_codes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_outfit_codes` WRITE;
/*!40000 ALTER TABLE `player_outfit_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_outfit_codes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_outfits`
--

DROP TABLE IF EXISTS `player_outfits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` text DEFAULT NULL,
  `components` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_outfits`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_outfits` WRITE;
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_transactions`
--

DROP TABLE IF EXISTS `player_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_transactions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_transactions` WRITE;
/*!40000 ALTER TABLE `player_transactions` DISABLE KEYS */;
INSERT INTO `player_transactions` VALUES
('C46M9XF9',0,'[{\"message\":\"Test\",\"trans_id\":\"6d193acf-669f-478b-86e6-d7648cbf71ca\",\"issuer\":\"Aj Fabela\",\"time\":1788984233,\"receiver\":\"Aj Fabela\",\"trans_type\":\"withdraw\",\"amount\":50,\"title\":\"Personal Account / C46M9XF9\"}]');
/*!40000 ALTER TABLE `player_transactions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `player_vehicles`
--

DROP TABLE IF EXISTS `player_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  CONSTRAINT `1` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_vehicles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `player_vehicles` WRITE;
/*!40000 ALTER TABLE `player_vehicles` DISABLE KEYS */;
INSERT INTO `player_vehicles` VALUES
(1,'license2:8fe336d675af6b473ba73d70a353f21da020cc5d','C46M9XF9','bati','-114291515','{\"model\":-114291515,\"fuelLevel\":100,\"engineHealth\":1000,\"bodyHealth\":1000,\"plate\":\"Y3MM4VD2\"}','Y3MM4VD2',NULL,NULL,100,1000,1000,1,517,43870,'{\"brakes\":100,\"tire\":100,\"engine\":746.6829223632813,\"fuel\":100,\"axle\":100,\"clutch\":100,\"radiator\":100,\"body\":805.1088256835938}',NULL,NULL,NULL),
(2,'license2:8fe336d675af6b473ba73d70a353f21da020cc5d','C46M9XF9','greenwood','40817712','{\"model\":40817712,\"fuelLevel\":100,\"engineHealth\":1000,\"bodyHealth\":1000,\"plate\":\"35V92ASC\"}','35V92ASC',NULL,NULL,100,1000,1000,1,1578,36129,'{\"brakes\":100,\"tire\":100,\"fuel\":100,\"clutch\":100,\"axle\":100,\"engine\":0.0,\"body\":851.4561767578125,\"radiator\":100}',NULL,NULL,NULL),
(3,'license2:8fe336d675af6b473ba73d70a353f21da020cc5d','C46M9XF9','stinger','1545842587','{\"modAerials\":-1,\"paintType1\":7,\"extras\":[0,1],\"modNitrous\":-1,\"modRoof\":-1,\"modLightbar\":-1,\"modEngine\":3,\"dirtLevel\":7,\"modSpeakers\":-1,\"doors\":[],\"modHood\":-1,\"wheelWidth\":0.42527309060096,\"modTurbo\":true,\"livery\":-1,\"dashboardColor\":0,\"modVanityPlate\":-1,\"modHorns\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modTrimB\":-1,\"modDoorSpeaker\":-1,\"modCustomTiresF\":false,\"modSubwoofer\":-1,\"color2\":0,\"modDoorR\":-1,\"lockState\":1,\"modWindows\":-1,\"modFender\":-1,\"engineHealth\":1000,\"wheels\":5,\"paintType2\":7,\"modHydraulics\":false,\"modBrakes\":2,\"modSideSkirt\":-1,\"modTank\":-1,\"modArmor\":-1,\"color1\":222,\"modDial\":-1,\"modExhaust\":-1,\"modTransmission\":2,\"pearlescentColor\":4,\"modSeats\":-1,\"tyres\":[],\"modCustomTiresR\":false,\"bulletProofTyres\":true,\"neonColor\":[2,21,255],\"modRearBumper\":-1,\"modEngineBlock\":-1,\"wheelColor\":156,\"modSpoilers\":-1,\"modRoofLivery\":-1,\"neonEnabled\":[false,false,false,false],\"tankHealth\":1000,\"xenonColor\":255,\"wheelSize\":0.66399997472763,\"windowTint\":-1,\"modDashboard\":-1,\"modXenon\":false,\"tyreSmokeColor\":[254,254,254],\"modTrimA\":-1,\"modFrontBumper\":-1,\"model\":1545842587,\"modLivery\":-1,\"interiorColor\":67,\"modFrame\":-1,\"modArchCover\":-1,\"driftTyres\":false,\"oilLevel\":5,\"modSteeringWheel\":-1,\"fuelLevel\":65,\"modTrunk\":-1,\"modRightFender\":-1,\"modSmokeEnabled\":true,\"modShifterLeavers\":-1,\"modStruts\":-1,\"modPlateHolder\":-1,\"bodyHealth\":1000,\"plateIndex\":1,\"modGrille\":-1,\"modSuspension\":3,\"windows\":[0,1,2,3,4,5,7],\"modHydrolic\":-1,\"modAPlate\":-1,\"modBackWheels\":-1,\"modFrontWheels\":4,\"plate\":\"2255G41D\"}','2255G41D',NULL,NULL,100,1000,1000,1,1494,33294,'{\"clutch\":100,\"body\":904.8910522460938,\"radiator\":100,\"brakes\":100,\"axle\":100,\"tire\":100,\"fuel\":100,\"engine\":62.38559341430664}',NULL,NULL,NULL),
(4,'license2:8fe336d675af6b473ba73d70a353f21da020cc5d','C46M9XF9','e46','1840495621','{\"modRearBumper\":0,\"livery\":0,\"modTrimA\":-1,\"wheelWidth\":1.0,\"modTurbo\":true,\"modSideSkirt\":-1,\"modAerials\":-1,\"modFender\":-1,\"modFrontBumper\":1,\"modDashboard\":-1,\"modSpeakers\":-1,\"engineHealth\":0,\"dashboardColor\":0,\"modDoorR\":-1,\"windowTint\":1,\"model\":1840495621,\"neonEnabled\":[false,false,false,false],\"modDoorSpeaker\":-1,\"modRoof\":-1,\"modExhaust\":0,\"windows\":[2,4,5,6,7],\"xenonColor\":11,\"modPlateHolder\":-1,\"modAPlate\":-1,\"extras\":[],\"lockState\":1,\"modHorns\":9,\"dirtLevel\":5,\"plate\":\"982HTLU0\",\"modArmor\":-1,\"wheels\":0,\"modNitrous\":-1,\"fuelLevel\":96,\"tyreSmokeColor\":[254,254,254],\"modSpoilers\":2,\"modHydrolic\":-1,\"modWindows\":-1,\"modTrimB\":-1,\"bodyHealth\":830,\"modSeats\":-1,\"modRoofLivery\":-1,\"modSuspension\":3,\"modCustomTiresF\":false,\"bulletProofTyres\":true,\"modSteeringWheel\":-1,\"modTank\":-1,\"modEngine\":3,\"modFrame\":-1,\"modGrille\":-1,\"plateIndex\":5,\"modSmokeEnabled\":true,\"modShifterLeavers\":-1,\"color1\":163,\"modRightFender\":-1,\"paintType1\":7,\"modXenon\":true,\"modLightbar\":-1,\"modTransmission\":3,\"modHood\":2,\"modBackWheels\":-1,\"pearlescentColor\":42,\"wheelColor\":156,\"modBrakes\":3,\"interiorColor\":0,\"modAirFilter\":-1,\"modEngineBlock\":-1,\"modStruts\":-1,\"modLivery\":-1,\"color2\":2,\"modTrunk\":-1,\"modVanityPlate\":-1,\"modSubwoofer\":-1,\"oilLevel\":0,\"modArchCover\":-1,\"tankHealth\":979,\"wheelSize\":1.0,\"tyres\":[3],\"driftTyres\":false,\"modDial\":-1,\"modFrontWheels\":-1,\"modOrnaments\":-1,\"doors\":[4],\"paintType2\":7,\"modCustomTiresR\":false,\"modHydraulics\":false,\"neonColor\":[255,0,255]}','982HTLU0',NULL,NULL,100,1000,1000,1,4320,8146,'{\"axle\":100,\"tire\":100,\"brakes\":100,\"body\":958.8331909179688,\"engine\":709.8016357421875,\"radiator\":100,\"fuel\":100,\"clutch\":100}',NULL,NULL,NULL);
/*!40000 ALTER TABLE `player_vehicles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned DEFAULT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_logged_out` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES
(1,1,'C46M9XF9',1,'license2:8fe336d675af6b473ba73d70a353f21da020cc5d','FieryFusionFX','{\"cash\":9523656,\"crypto\":0,\"bank\":-340}','{\"nationality\":\"American\",\"phone\":\"8158341444\",\"firstname\":\"Aj\",\"birthdate\":\"2005-09-21\",\"gender\":0,\"cid\":1,\"account\":\"US01QBX2040991587\",\"backstory\":\"placeholder backstory\",\"lastname\":\"Fabela\"}','{\"name\":\"thief\",\"grade\":{\"name\":\"Thief\",\"level\":0},\"payment\":25,\"label\":\"Thief\",\"bankAuth\":false,\"isboss\":false,\"onduty\":true}','{\"name\":\"none\",\"grade\":{\"name\":\"Unaffiliated\",\"level\":0},\"label\":\"No Gang\",\"bankAuth\":false,\"isboss\":false}','{\"x\":-382.6549377441406,\"y\":-192.6988983154297,\"z\":36.778076171875,\"w\":291.968505859375}','{\"optin\":true,\"thirst\":100,\"stress\":0,\"dealerrep\":0,\"health\":150,\"jobrep\":{\"trucker\":0,\"tow\":0,\"taxi\":0,\"hotdog\":0},\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":67417502},\"armor\":0,\"walletid\":\"QB-47470460\",\"callsign\":\"NO CALLSIGN\",\"injail\":0,\"craftingrep\":0,\"jailitems\":[],\"ishandcuffed\":false,\"bloodtype\":\"A+\",\"phone\":[],\"licences\":{\"weapon\":true,\"driver\":true,\"id\":true},\"attachmentcraftingrep\":0,\"inside\":{\"apartment\":[]},\"criminalrecord\":{\"hasRecord\":false},\"tracker\":false,\"hunger\":100,\"isdead\":false,\"fingerprint\":\"6C44FL89D17005A\",\"inlaststand\":true,\"status\":[]}','[{\"metadata\":{\"components\":[],\"registered\":\"Aj Fabela\",\"serial\":\"197441AFH396619\",\"ammo\":4,\"durability\":98.00000000000009},\"name\":\"WEAPON_REVOLVER_MK2\",\"count\":1,\"slot\":1},{\"name\":\"ammo-44\",\"count\":76,\"slot\":2},{\"metadata\":{\"components\":[],\"registered\":\"Aj Fabela\",\"serial\":\"207870QLW250274\",\"ammo\":0,\"durability\":99.5},\"name\":\"WEAPON_MUSKET\",\"count\":1,\"slot\":3},{\"metadata\":{\"components\":[],\"registered\":\"Aj Fabela\",\"serial\":\"143782LTL179235\",\"ammo\":1,\"durability\":97.0},\"name\":\"WEAPON_RAILGUNXM3\",\"count\":1,\"slot\":4},{\"name\":\"phone\",\"count\":1,\"slot\":5},{\"name\":\"money\",\"count\":9523656,\"slot\":21},{\"metadata\":{\"citizenid\":\"C46M9XF9\",\"sex\":\"M\",\"badge\":\"none\",\"lastname\":\"Fabela\",\"firstname\":\"Aj\",\"nationality\":\"American\",\"birthdate\":\"2005-09-21\",\"cardtype\":\"driver_license\"},\"name\":\"driver_license\",\"count\":1,\"slot\":23},{\"metadata\":{\"components\":[],\"registered\":\"Aj Fabela\",\"serial\":\"182921UYB111132\",\"ammo\":0,\"durability\":100},\"name\":\"WEAPON_SPECIALCARBINE\",\"count\":1,\"slot\":16},{\"metadata\":{\"components\":[],\"registered\":\"Aj Fabela\",\"serial\":\"687829PWM137428\",\"ammo\":0,\"durability\":96.99999999999992},\"name\":\"WEAPON_SPECIALCARBINE_MK2\",\"count\":1,\"slot\":17},{\"metadata\":{\"citizenid\":\"C46M9XF9\",\"sex\":\"M\",\"badge\":\"none\",\"lastname\":\"Fabela\",\"firstname\":\"Aj\",\"nationality\":\"American\",\"birthdate\":\"2005-09-21\",\"cardtype\":\"weaponlicense\"},\"name\":\"weaponlicense\",\"count\":1,\"slot\":25},{\"name\":\"ammo-railgun\",\"count\":293,\"slot\":19},{\"name\":\"ammo-musket\",\"count\":1,\"slot\":20},{\"metadata\":{\"citizenid\":\"C46M9XF9\",\"sex\":\"M\",\"badge\":\"none\",\"lastname\":\"Fabela\",\"firstname\":\"Aj\",\"nationality\":\"American\",\"birthdate\":\"2005-09-21\",\"cardtype\":\"id_card\"},\"name\":\"id_card\",\"count\":1,\"slot\":24}]','8158341444','2026-09-10 09:37:05','2026-09-10 09:37:05');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `playerskins`
--

DROP TABLE IF EXISTS `playerskins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerskins`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `playerskins` WRITE;
/*!40000 ALTER TABLE `playerskins` DISABLE KEYS */;
INSERT INTO `playerskins` VALUES
(1,'C46M9XF9','mp_m_freemode_01','{\"tattoos\":[],\"components\":[{\"component_id\":0,\"drawable\":0,\"texture\":0},{\"component_id\":1,\"drawable\":0,\"texture\":0},{\"component_id\":2,\"drawable\":0,\"texture\":0},{\"component_id\":3,\"drawable\":0,\"texture\":0},{\"component_id\":4,\"drawable\":0,\"texture\":0},{\"component_id\":5,\"drawable\":0,\"texture\":0},{\"component_id\":6,\"drawable\":0,\"texture\":0},{\"component_id\":7,\"drawable\":-1,\"texture\":0},{\"component_id\":8,\"drawable\":0,\"texture\":0},{\"component_id\":9,\"drawable\":0,\"texture\":0},{\"component_id\":10,\"drawable\":0,\"texture\":0},{\"component_id\":11,\"drawable\":0,\"texture\":0}],\"faceFeatures\":{\"nosePeakSize\":0,\"eyeBrownHigh\":0,\"eyesOpening\":0,\"eyeBrownForward\":0,\"chinBoneLowering\":0,\"neckThickness\":0,\"chinHole\":0,\"noseWidth\":0,\"cheeksWidth\":0,\"chinBoneLenght\":0,\"nosePeakLowering\":0,\"lipsThickness\":0,\"noseBoneHigh\":0,\"chinBoneSize\":0,\"cheeksBoneHigh\":0,\"jawBoneWidth\":0,\"nosePeakHigh\":0,\"noseBoneTwist\":0,\"jawBoneBackSize\":0,\"cheeksBoneWidth\":0},\"props\":[{\"texture\":-1,\"drawable\":-1,\"prop_id\":0},{\"texture\":-1,\"drawable\":-1,\"prop_id\":1},{\"texture\":-1,\"drawable\":-1,\"prop_id\":2},{\"texture\":-1,\"drawable\":-1,\"prop_id\":6},{\"texture\":-1,\"drawable\":-1,\"prop_id\":7}],\"headOverlays\":{\"sunDamage\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"moleAndFreckles\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"complexion\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"blush\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"eyebrows\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"beard\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"blemishes\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"makeUp\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"ageing\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"chestHair\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"bodyBlemishes\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0},\"lipstick\":{\"secondColor\":0,\"opacity\":0,\"style\":0,\"color\":0}},\"headBlend\":{\"shapeMix\":0,\"skinThird\":0,\"shapeFirst\":4,\"thirdMix\":0,\"skinFirst\":0,\"shapeThird\":0,\"skinMix\":0,\"shapeSecond\":1,\"skinSecond\":0},\"model\":\"mp_m_freemode_01\",\"hair\":{\"texture\":0,\"style\":0,\"highlight\":0,\"color\":0},\"eyeColor\":0}',1);
/*!40000 ALTER TABLE `playerskins` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `price` int(11) NOT NULL DEFAULT 0,
  `owner` varchar(50) DEFAULT NULL,
  `interior` varchar(255) NOT NULL,
  `keyholders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`keyholders`)),
  `rent_interval` int(11) DEFAULT NULL,
  `interact_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`interact_options`)),
  `stash_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`stash_options`)),
  `garage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage`)),
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `1` FOREIGN KEY (`owner`) REFERENCES `players` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES
(1,'Tinsel Towers Apt 1','{\"x\":-614.5800170898438,\"y\":46.52000045776367,\"z\":43.59000015258789}',0,'C46M9XF9','TinselTowersApt42','{}',NULL,'[{\"type\":\"logout\",\"coords\":{\"x\":-593.7100219726563,\"y\":50.18000030517578,\"z\":97.0}},{\"type\":\"clothing\",\"coords\":{\"x\":-594.6300048828125,\"y\":56.1500015258789,\"z\":97.0}},{\"type\":\"exit\",\"coords\":{\"x\":-604.0599975585938,\"y\":58.9900016784668,\"z\":98.19999694824219,\"w\":91.44999694824219}}]','[{\"maxWeight\":150000,\"slots\":50,\"coords\":{\"x\":-622.3599853515625,\"y\":55.09000015258789,\"z\":97.5999984741211}}]',NULL);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `properties_decorations`
--

DROP TABLE IF EXISTS `properties_decorations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties_decorations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `rotation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`rotation`)),
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_decorations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `properties_decorations` WRITE;
/*!40000 ALTER TABLE `properties_decorations` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_decorations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `license2` varchar(50) DEFAULT NULL,
  `fivem` varchar(20) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `idx_users_fivem` (`fivem`),
  KEY `idx_users_discord` (`discord`),
  KEY `idx_users_license` (`license`),
  KEY `idx_users_license2` (`license2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'FieryFusionFX','license:2d8dd61cee1f9c0d1b820cea296e1c0f93ad2bfa','license2:8fe336d675af6b473ba73d70a353f21da020cc5d','fivem:4707155',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `vehicle_financing`
--

DROP TABLE IF EXISTS `vehicle_financing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_financing` (
  `vehicleId` int(11) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `paymentamount` int(11) DEFAULT NULL,
  `paymentsleft` int(11) DEFAULT NULL,
  `financetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`),
  CONSTRAINT `vehicleId` FOREIGN KEY (`vehicleId`) REFERENCES `player_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_financing`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `vehicle_financing` WRITE;
/*!40000 ALTER TABLE `vehicle_financing` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_financing` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `weed_plants`
--

DROP TABLE IF EXISTS `weed_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `weed_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(30) DEFAULT NULL,
  `stage` tinyint(4) NOT NULL DEFAULT 1,
  `sort` varchar(30) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `food` tinyint(4) NOT NULL DEFAULT 100,
  `health` tinyint(4) NOT NULL DEFAULT 100,
  `healthyGrow` tinyint(1) NOT NULL DEFAULT 0,
  `stageProgress` tinyint(4) NOT NULL DEFAULT 0,
  `coords` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weed_plants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `weed_plants` WRITE;
/*!40000 ALTER TABLE `weed_plants` DISABLE KEYS */;
INSERT INTO `weed_plants` VALUES
(1,NULL,7,'og_kush','female',39,90,0,0,'{\"x\":806.571533203125,\"y\":5702.66259765625,\"z\":698.0430297851563}'),
(3,NULL,7,'og_kush','female',41,92,0,0,'{\"x\":2760.4482421875,\"y\":3471.181396484375,\"z\":55.65656661987305}'),
(4,NULL,7,'white_widow','male',41,92,0,0,'{\"x\":2794.079345703125,\"y\":3473.15966796875,\"z\":55.35631561279297}');
/*!40000 ALTER TABLE `weed_plants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `xt_prison`
--

DROP TABLE IF EXISTS `xt_prison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xt_prison` (
  `identifier` varchar(100) NOT NULL,
  `jailtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xt_prison`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `xt_prison` WRITE;
/*!40000 ALTER TABLE `xt_prison` DISABLE KEYS */;
INSERT INTO `xt_prison` VALUES
('C46M9XF9',0);
/*!40000 ALTER TABLE `xt_prison` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `xt_prison_items`
--

DROP TABLE IF EXISTS `xt_prison_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xt_prison_items` (
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  UNIQUE KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xt_prison_items`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `xt_prison_items` WRITE;
/*!40000 ALTER TABLE `xt_prison_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `xt_prison_items` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'Qbox_A1B5B5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-10 11:13:11
