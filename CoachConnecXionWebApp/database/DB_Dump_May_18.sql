CREATE DATABASE  IF NOT EXISTS `careercoach` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `careercoach`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: careercoach
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `categorydetails`
--

DROP TABLE IF EXISTS `categorydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorydetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorydetails`
--

LOCK TABLES `categorydetails` WRITE;
/*!40000 ALTER TABLE `categorydetails` DISABLE KEYS */;
INSERT INTO `categorydetails` VALUES (1,'Category1'),(2,'Category2'),(3,'Category3');
/*!40000 ALTER TABLE `categorydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaching_category`
--

DROP TABLE IF EXISTS `coaching_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coaching_category` (
  `coaching_category_id` int(11) NOT NULL,
  `coaching_category_parent_id` int(11) DEFAULT NULL,
  `coaching_category_name` varchar(75) NOT NULL,
  PRIMARY KEY (`coaching_category_id`),
  UNIQUE KEY `coaching_category_id_UNIQUE` (`coaching_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaching_category`
--

LOCK TABLES `coaching_category` WRITE;
/*!40000 ALTER TABLE `coaching_category` DISABLE KEYS */;
INSERT INTO `coaching_category` VALUES (1,0,'All Requests'),(2,0,'Executive'),(3,0,'Business'),(4,0,'Executive1'),(5,2,'Manager'),(6,2,'New Business'),(7,2,'Personal'),(8,3,'Executive'),(9,3,'Manager'),(10,3,'New Business'),(11,4,'Ex1'),(12,4,'Man1'),(13,4,'New'),(14,0,'Test'),(100,0,'test4');
/*!40000 ALTER TABLE `coaching_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaching_request`
--

DROP TABLE IF EXISTS `coaching_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coaching_request` (
  `COACHING_REQUEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `CURRENT_POSITION` varchar(75) DEFAULT NULL,
  `CURRENT_COMPANY` varchar(75) DEFAULT NULL,
  `CAREER_CATEGORY` smallint(6) NOT NULL,
  `COACHING_TYPE` smallint(6) NOT NULL,
  `ROADBLOCKS` smallint(6) NOT NULL,
  `COACHING_STYLE` smallint(6) NOT NULL,
  `HOURS` varchar(75) DEFAULT NULL,
  `GOALS` varchar(1000) DEFAULT NULL,
  `SELECTED_COACHES` varchar(75) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `Request_Name` varchar(75) DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `coaching_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`COACHING_REQUEST_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `coaching_request_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaching_request`
--

LOCK TABLES `coaching_request` WRITE;
/*!40000 ALTER TABLE `coaching_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `coaching_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id_UNIQUE` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'United States'),(2,'Canada'),(3,'Mexico');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreetable`
--

DROP TABLE IF EXISTS `degreetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degreelevel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreetable`
--

LOCK TABLES `degreetable` WRITE;
/*!40000 ALTER TABLE `degreetable` DISABLE KEYS */;
INSERT INTO `degreetable` VALUES (1,'Master Degree'),(2,'Bacher Degree');
/*!40000 ALTER TABLE `degreetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `educationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `educationUserId` bigint(20) NOT NULL,
  `schoolName` varchar(75) DEFAULT NULL,
  `majorOrProgram` varchar(75) DEFAULT NULL,
  `degree` varchar(75) DEFAULT NULL,
  `graduationDate` datetime DEFAULT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`educationId`),
  KEY `educationUserId` (`educationUserId`),
  KEY `education_upi_fk_idx` (`user_profile_id`),
  CONSTRAINT `education_upi_fk` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`educationUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationdetails`
--

DROP TABLE IF EXISTS `educationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `degreelevel` varchar(50) DEFAULT NULL,
  `schoolname` varchar(100) DEFAULT NULL,
  `fromdate` varchar(50) DEFAULT NULL,
  `todate` varchar(50) DEFAULT NULL,
  `graduated` int(11) DEFAULT NULL,
  `concentrations` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `locations` varchar(100) DEFAULT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `educationdetails_up_fk_idx` (`user_profile_id`),
  CONSTRAINT `educationdetails_up_fk` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationdetails`
--

LOCK TABLES `educationdetails` WRITE;
/*!40000 ALTER TABLE `educationdetails` DISABLE KEYS */;
INSERT INTO `educationdetails` VALUES (2,1,'Master\'s Degree','Loyola University','September 2006','August 2008',0,'Business Administration','Chicago','IL',1),(6,1,'Bachelor\'s Degree','Depaul University','September 2006','August 2008',0,'Computer Scient','Chicago','IL',1),(7,1,'Bacher Degree','Nagrhuna Junoir','2012-12-13','2012-12-12',0,'Business Administration','Chicago','Banagalore',1),(8,1,'Master Degree','Nagarjuna Junior College1','2012-12-12','2012-12-12',0,'Business Administration','India','Banagalore',1),(9,NULL,'Bacher Degree','vcxv','12/02/2012','',1,'sdsa','asda','asdsa',1),(10,NULL,'Bacher Degree','xcvcx','12/02/2012','',0,'asda','asd','asd',1),(11,NULL,'Master Degree','TESTING SCHOOL TEST','12/02/2012','12/02/2013',0,'TESTING SCHOOL TEST','TESTING SCHOOL TEST','TESTING SCHOOL TEST',1),(12,NULL,'Master Degree','TESTING SCHOOL TEST','01/02/0001','01/02/0001',0,'TESTING SCHOOL TEST','TESTING SCHOOL TEST','TESTING SCHOOL TEST',1),(13,NULL,'Master Degree','fbvg','11/02/2016','11/02/2016',0,'ssdcs','cdcdc','cadc',1),(14,NULL,'Master Degree','dafasf2_Ma','01/12/2012','01/22/2013',0,'ewwdf','kjhhkpoi;l','test loc',1),(16,NULL,'Master Degree','dafasf2_Ma_2_11111','01/12/2012','01/22/2013',1,'ewwdf_2','Cali_2','test loc',1);
/*!40000 ALTER TABLE `educationdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencedetails`
--

DROP TABLE IF EXISTS `experiencedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `employer` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `label` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `startdate` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `enddate` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_profile_id_ed_fk_idx` (`user_profile_id`),
  CONSTRAINT `user_profile_id_ed_fk` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencedetails`
--

LOCK TABLES `experiencedetails` WRITE;
/*!40000 ALTER TABLE `experiencedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiencedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedbackId` bigint(20) NOT NULL AUTO_INCREMENT,
  `providerUserId` bigint(20) NOT NULL,
  `recepientUserId` bigint(20) NOT NULL,
  `ratings` smallint(6) NOT NULL,
  `providerComment` varchar(1000) NOT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `providerUserId` (`providerUserId`),
  KEY `recepientUserId` (`recepientUserId`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`providerUserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`recepientUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry` (
  `industryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `industryName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`industryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobratingdetails`
--

DROP TABLE IF EXISTS `jobratingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobratingdetails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `averagerating` float DEFAULT NULL,
  `awardeddate` varchar(255) DEFAULT NULL,
  `clientname` varchar(255) DEFAULT NULL,
  `comments` text,
  `customerid` int(11) DEFAULT NULL,
  `experience` float DEFAULT NULL,
  `professionalism` float DEFAULT NULL,
  `quality` float DEFAULT NULL,
  `response` float DEFAULT NULL,
  `projectname` varchar(255) DEFAULT NULL,
  `ratingdone` int(11) DEFAULT '0',
  `ratingdate` varchar(50) DEFAULT NULL,
  `clientresponse` int(11) DEFAULT '0',
  `feedBacks` text,
  `user_profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_profile_id_fk_idx` (`user_profile_id`),
  CONSTRAINT `user_profile_id_fk` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobratingdetails`
--

LOCK TABLES `jobratingdetails` WRITE;
/*!40000 ALTER TABLE `jobratingdetails` DISABLE KEYS */;
INSERT INTO `jobratingdetails` VALUES (1,2,'Feb 12,2013','TestingClient1','Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a companyÃ¢??s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a companyÃ¢??s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a companyÃ¢??s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',1,1.8,1.6,2.45,2.25,'TestingProject1',1,'Mar-07-2013',1,'fdgfdg',1),(2,2.3,'Feb 12,2013','TestingClient2','Testing Testing ccccccccccccccccccccccccccccccccccccccccccc cccc cccccccccc cccccccccccc ccccc cccccccc cccccccc cccccccccccccccccccc ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',1,3.55,3.6,3.5,3.55,'TestingProject2',1,'Mar-07-2013',0,'Testing by chinna',2),(3,3,'Feb 12,2013','TestingClient3',NULL,1,2.5,4.5,1.55,3.45,'TestingProject3',0,'Mar-04-2013',0,'cHINNA tESTING pROJECT3',2),(4,0.3,'Feb 12,2013','TestingClient4',NULL,1,0.35,0.4,0.3,0.3,'TestingProject4',1,'Mar-13-2013',1,'Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.\r\nStarting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',3),(5,2.1,'Feb 12,2013','TestingClient5',NULL,1,1.65,3.6,0.6,2.6,'TestingProject5',1,'Mar-13-2013',1,'Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',3);
/*!40000 ALTER TABLE `jobratingdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `package_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_profile_id` bigint(20) DEFAULT NULL,
  `packageName` varchar(50) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `overview` varchar(255) DEFAULT NULL,
  `packagedetails` varchar(255) DEFAULT NULL,
  `opt_out_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,'11111111111',1,1,111,'11111','1',1),(2,1,'22222222222',2,2,222,'22222','2',2),(3,3,'3333333333',3,3,333,'33333','3',3),(4,1,'4444444444',4,4,2,'44444','4',4);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `package_info`
--

DROP TABLE IF EXISTS `package_info`;
/*!50001 DROP VIEW IF EXISTS `package_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `package_info` (
  `id` int(11),
  `packageName` varchar(50),
  `price` float,
  `optOutDays` varchar(255),
  `profileid` int(11),
  `totalsold` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `packagedetails`
--

DROP TABLE IF EXISTS `packagedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(50) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `overView` text,
  `packageDetail` text,
  `optOutDays` varchar(255) DEFAULT NULL,
  `PROFILEID` int(11) DEFAULT NULL,
  `numberSold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagedetails`
--

LOCK TABLES `packagedetails` WRITE;
/*!40000 ALTER TABLE `packagedetails` DISABLE KEYS */;
INSERT INTO `packagedetails` VALUES (37,'test package ',-1,-1,23.456,'hi thi is just a demo&nbsp;','its good try it&nbsp;','2',NULL,NULL),(42,'Edit Section done',2,4,12,'testing1234','testing1234','2',NULL,NULL),(75,'Test2',3,3,20,'lsajfljasf','alfjdlsfjasjf','2',NULL,NULL),(91,'QA Testing_2',3,6,1,'&nbsp;No Overview','&nbsp;No Package Details','8',NULL,NULL);
/*!40000 ALTER TABLE `packagedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages_sold`
--

DROP TABLE IF EXISTS `packages_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_details_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages_sold`
--

LOCK TABLES `packages_sold` WRITE;
/*!40000 ALTER TABLE `packages_sold` DISABLE KEYS */;
INSERT INTO `packages_sold` VALUES (1,1111111111,111,1),(2,2,2222,1),(3,3,333,2);
/*!40000 ALTER TABLE `packages_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposaldetails`
--

DROP TABLE IF EXISTS `proposaldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proposaldetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `dateposted` varchar(10) DEFAULT NULL,
  `desiredrate` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `desiredstartdate` varchar(10) DEFAULT NULL,
  `requestdetails` text,
  `proposaldescription` text,
  `proposedhourlyrate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposaldetails`
--

LOCK TABLES `proposaldetails` WRITE;
/*!40000 ALTER TABLE `proposaldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposaldetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestdetails`
--

DROP TABLE IF EXISTS `requestdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `requestname` varchar(50) DEFAULT NULL,
  `dateposted` varchar(50) DEFAULT NULL,
  `desiredrate` float DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `desiredstartdate` varchar(50) DEFAULT NULL,
  `requestdetails` text,
  `proposaldescription` text,
  `proposedhourlyrate` float DEFAULT NULL,
  `coachingcategoryId` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestdetails`
--

LOCK TABLES `requestdetails` WRITE;
/*!40000 ALTER TABLE `requestdetails` DISABLE KEYS */;
INSERT INTO `requestdetails` VALUES (1,1,'Request Name1','Feb 20,2013',20,'Chicago','Feb 20,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.',30,11),(2,1,'Request Name2','Feb 21,2013',24,'Chicago','Feb 21,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.',25,5),(3,1,'Request Name3','Feb 22,2013',22,'Chicago','Feb 22,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.',24,12),(4,1,'Request Name4','Feb 24,2013',21,'Chicago','Feb 24,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.',23,6),(5,1,'Request Name5','Feb 25,2013',25,'Chicago','Feb 25,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.',21,5),(6,1,'Request Name6','Feb 20,2013',20,'Chicago','Feb 20,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.',20,7),(9,1,'Request Name7','Feb 22,2013',22,'Chicago','Feb 22,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','Chinna Testing',12,4),(10,1,'Request Name8','Feb 22,2013',22,'Chicago','Feb 22,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','Chinna Testing',12,13),(11,1,'Request Name9','Feb 20,2013',20,'Chicago','Feb 20,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','Testing is done',12,7),(12,1,'Request Name10','Feb 20,2013',20,'Chicago','Feb 20,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','Testing 123',12,1),(13,1,'Request Name11','Feb 20,2013',20,'Chicago','Feb 20,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','cc',12,1),(14,1,'Request Name12','Feb 20,2013',20,'Chicago','Feb 20,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','sdfds',12.35,3),(15,1,'Request Name5','Feb 25,2013',25,'Chicago','Feb 25,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','Submitted',12,6),(16,1,'Request Name7','Feb 22,2013',22,'Chicago','Feb 22,2013','We are looking to use a hosted PURL software solution that requires that someone be very versed in Java. We are looking for someone to join our team as we offer personalized URL\'s to our clients for marketing purposes. You can find most of what you would need to see at this site http://support.purlhub.com/\r\n\r\nIf you feel you have the skills needed to work with this software, and if you feel you could be a part of a smart, US based software firm, and you have the time to devote to making this a success, then bid on the work. Others please, don\'t waste our time.','Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',2,3);
/*!40000 ALTER TABLE `requestdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumescertificates`
--

DROP TABLE IF EXISTS `resumescertificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumescertificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `content` longblob,
  `CONTENTTYPE` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `CONTENTTYPE2` varchar(75) CHARACTER SET latin1 NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_profile_id_rc_fk_idx` (`user_profile_id`),
  KEY `resumecertificates_up_fk_idx` (`user_profile_id`),
  CONSTRAINT `resumecertificates_up_fk` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumescertificates`
--

LOCK TABLES `resumescertificates` WRITE;
/*!40000 ALTER TABLE `resumescertificates` DISABLE KEYS */;
INSERT INTO `resumescertificates` VALUES (1,1,'PK\0\0\0\0\0!\0	$‡‚\0\0\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”MOƒ@†ï&ş²WÛz0Æ”ö õ¨M¬ñ¼.CÙÈ~dgûõïJKª¡¥Z½À2ïûÌ3ƒÑJ—Ñ<*kRÖOz,#m¦Ì,e¯ÓÇø–E„ÉDi\r¤l\rÈFÃË‹Átí\0#ª6˜²\"wÇ9Ê´ÀÄ:0t’[¯E [?ãNÈ1~İëİpiM\0âPi°áàr1/C4^ÑãšÄC‰,º¯_¬¼R&œ+•HùÂdß\\â­CB•›w°P¯ƒñV‡êä°Á¶î™¢ñ*ƒh\"|xš0øÒúŒgVÎ5õ—iá´y®$4õ•šóV\"e®Ë¤9ÑB™ÿAëğï)jİíßT(Æy’>vw\Zãªé¤¶Ø«ívƒ(¤SL¾ş‚qWè¸UîDXÂûË¿Qì‰w‚ä4\ZSñ^Â	‰ÿ0ŒFº\"Ğ¼ß\\ûgsldYÒdL¼uHûÃÿ¢íİ‚¨ªc\Z9>(hVDÛˆ5´{Îîªí–AÖâÍ7Ûtø	\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·ó\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’ÛJA†ïßaÈ}7Û\n\"ÒÙŞH¡w\"ë„™ìwÌ¤Ú¾½£ ºPÛ^æôçËOÖ›ƒ›Ô;§<¯aYÕ Ø›`Gßkxm·‹PYÈ[š‚g\rGÎ°inoÖ/<‘”¡<Œ1«¢â³†A$>\"f3°£\\…È¾TºI	S‘ÌõŒ«º¾ÇôWš™¦ÚY\rigï@µÇX6_Ö]7\Z~\nfïØË‰ÈaoÙ.b*lIÆrj)õ,\Zl0Ï%‘b¬\n6ài¢ÕõDÿ_‹…,	¡	‰Ïó|uœZ^tÙ¢yÇ¯;!Y,}{ûCƒ³/h>\0\0ÿÿ\0PK\0\0\0\0\0!\0|;—9\"\0\0¹\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬“MO„0†ï&şÒ»V]Ù²5Ù«®ñÜ-Sh„–tÆş½³\nÊ¢.Mfš¾ÏÓI»Z¿ÕUô³‚¥qÂ\"°ÊåÆ‚=loO.Y„$m.+gA°­³ã£ÕT’Â!,MƒQH±(XIÔ\\qª„Zbì\Z°aG;_K\n¥/x#Õ“,€/’dÉ}?ƒeƒÌh“æ7ù)‹¶mÈg;­‚k§k°4‚àDáf2¥/€ÛwâàÉø¸Ââ€Bm”wè4ÅÊÕü“şA½^Œ#µà£¡òFkPÔÇÿÜšòHxŒŒù£èÈ½Atõ~9\'ÂozWònM§ÎçtĞÎÒVîªÇWkJâlN‰WØİÿz•½æ^„>\\ö\0\0ÿÿ\0PK\0\0\0\0\0!\0è´ÇW:\n\0\0{%\0\0\0\0\0word/document.xmläZÙnãÈ}(è!H\0/’-oJ[oİi =ãiOƒY«E²8Å¢eÍS~#¿—/É¹—,Š¢–¦Û A,‹¬ºû¹§néİ/I,•ÍµI¯{ƒ£~O¨40¡Ng×½¿ıòşğ²\'r\'ÓPÆ&U×½¥Ê{?Œÿ»w‹Qh‚\"Q©Ø\"ÍG‹,¸îEÎe£ãã<ˆT\"ó£DÖäfê“›éTêxalx|ÒôùSfM òòîdú,ó^µ]²¹›ÉT\nYScéò#cgÇ‰´ó\";Äî™tz¢cí–Ø»î·1×½Â¦£J¡ÃZ!Z2*ªşøvÃŠ-rË•÷•Xâ±U1t0iéleÆ·î#¯Òó>#“Ø¿·ÈÃ\ryµÉ]bpoå¡Xm¸±İg„å¢$.ı@ñ]Eµ½ã ¿Ï˜*\"´E­CÖezM©Óz›osMÓ¹¨ˆ·ä÷kŠ¬V\'ÓoÛíc:¯÷¢Â|…fıs®¼¦iù«6Ø(İ§Hfª\'’`ôq–\Z+\'14Z†‚2²7XLL¸¤¿™XŒ\06áçë^¿u38½½éù¯îÕT±k<á–ÿÜ†üwbœ3	–<ËøºG¸Còb”ÿvİCÕãC&HĞçÀÄõ,gzÇãwÇÏÛĞ‡r[ŞÓ?«’szÃñ{•,3\'„yrÒ:l§CèFû¦2ˆ¿0·2˜ÓÎd`ùîC\ZÖoV\"7ì>>\\mµ{8<»ººïÑŠR3BCoRfU®ì³êŸ\n|ŒDK]Áµo+´“G2!ğ[H13&_ÌDÄJÚî.RÀügmMJp~$Ä_”X`…Q8üW™Ğ)>I‘ª…°&Vâ×BóxÙÖn×ºÙ–×Ş`§mH)¥RªX£q‘@WCËÔÅKR˜,BÓš«ÈÄ!zÛÑš\nşFHv§âFHÆpO­EåPr‰Htòò¿©6V$*™@a¦¬•S2ƒ«ø-ÖôBğš¶W\Zíñ§±ó\\,T‹…v›ÙP†^â1IõšİNóWŠ%º°IDH›™œ)$<Éç<zqÊ¦2FtUl2æ$ş@ü|#ş “ìÏâö¦möË˜«8ËÉ±í…¯ó—JsÔÍŞMÎÎÃ«s®?7şµÄ\'|¦ùr ;bg7;ä_•eŞ næ_•=”ƒ3kiY›¤–SA”ê\0şGu‡\\¨xˆ²åå‘Œ9 z})µQ#êQ¡ÊáfúğBÀj,\'ÀyGoúà\'¡ª*…I…),*3I´£,èR„_uBåGj;ı²™ßûòkšE¬Â™âğ’[À%PW‘´aÓ -°r &…\"ª“sB€üòEÇSL¥ÈM¨T_$“mœ@ğ£_!ÅEhh¼(ÔyP€ØªXÑs@œ²üÜoáÑ|+Ã#™áƒ¢	·»UO¸«­µë‡³şÉ÷Xî2­|uÉ#šq¿syñ¾Ï}tÇ>/ßŸË6] òÍ†_vVK½ÜWÏšÚŒ_\\Œöì‚.¹½iıÕ·ÉöÀÑfú`	;İ2È3 13…’Ô¨úmÚŒÒçN\"A8¾ÀÑš¸­]rwT1egï)·FMj`4“D¦Kß/u’³$™tÄƒ¢Qa­©‹„idfeÒŒ«5n0qĞe‹•÷ØÅH\0¥Pş°Ïi4]Y¢­Gb´ÇUÿgŸ›™Ê‡W‰¤!”HLî¼î>=À+˜C§K‘ürÖäBÒ•^#lA&ã? !Ç\nÂ†t#@MŒ³Â\"àıtª:ï.ÛFğÿóe;F…†Â Ã	â:Mâ¡¦˜¸VßZ—Ê¤“§:ğ{ÊêF(\nnà°G!h`VËU7©šte7qM´ª²”Ù÷âgiµ)r(xNDÜå‚é÷·§\'ƒ“Š5ê´dßhU&„*×362²éıŠòz±«^±Ê8:k¤¢¶NÌ¤Ss¥¾è¦ m$É³1Sş`)$˜Ê¤Ï—¨¯¤Có«Lóı¢ÑÉ\ZFwP]ÙPM¾@·—sRõ5C­÷§;Zì0SÀÉ&Š­±ÆVx6 n£ç”÷¤\"×¾tZß¸qç†«*W¬@E[Oïˆ+uŒ»Ó³‹ûÓŞ?WO6C+4eól}¹=^o‡fğ¿Ê;v2†{.‡ãûòÄ\'æNqhö*ï±5ó)¸˜ÌxUkG·Å¬“ôU¼MövÕš¯gòÛ´OõJêr2CpòÿèƒÜ$\n€üß`º“9ÎThLğıkÇ£Õ”_[ˆãM¹†ìÃüœ#\r+ø\0İ¤h<Ü,ï\n¦q´Èİ2n;c{q¬\nt%ØÇ„§â 3pEø6\'Û%lÑğ-dLT 1>!zKl´°â~î,¦õ±­å õP¢´Oä.Atx}ŠÆ,\ZkÁ’(ãÅj1b\\¼1ël=	|úÎ\"ú25.Ôˆƒ•½v“F½P“9Ä÷à3ÿÛ}vüè/‘û§\"Á<~)î0Vâ£à?ÁŸÒ»üS«¹’»uË·Gÿô~pÅ,™EÆ8ã}V)ÆÎ*|ÄpôÖ*9g÷ï0TÌšî˜ç)œådj>›UC§*ß[vNc=£ıãŸíyåöõİ`F½€œ;2.Yˆ¡#kLÅÈæÎòı0¦‘Õ‰„À?#¬Y<íQ«40lœêÁa=/GçX Ê¥ˆ\r§±z©.}¸^›E¹ªx¾à¬TÖ?\r”Mx\nßrbİxèÄÓ¿ìŸ=Ür,w+/2\ZH!¤-\\¸~ŒfwóÓé!jœÈH³i¨e9’ß§Ëûó³‹‹‹R—q®Üa‘Õ›{cÙÒæ‘úĞeú¾}›6¶Ó`—ûZË:‡Û:ª”öÜ­ÉÓWæìò¤Sn	ûàcØ_âOYÌ$pÒÚ˜­EsxqzöPŞ¥íˆfYmmo•Í™dY/Í`™¹”ñ&ÿbÆBi¿š¶‡ÚÒÁœßŒPÀ\Z\0ave1–à Ñx‚\0Ç½òG\n~º“á7ôƒŞOí(‰ÂL¨>lyáãæü.\r¡t÷–@4¼²/?Ñe!ÀH,x¨ÕòÑvèØÂ\0=AÔiq7Ü	0\'ğ~Ë™,«£sKÄZ\\ûƒ»Ë²’¶s’µƒw{«=%ÁgtfõL>Ã‘>¥A\'	Jşöf½vZ7}MÇTVwLhªAJ¨Í7¯ĞP`x\\ä\0±î~>k/õ	Bè×Tc»Ÿ00jŒ¾\r¸æ¨˜Çµ@5 /›=ıİ¸Ç?9ò]A„Ïg—ø\\r™Ù\'\Z–œÉğı°|ÅêY„ŸøËŸ\n¬şÕ´ñ4ÂØPá>ââ„·Ÿ\Zƒš«ÿT‚pK)7^Åù‹xZÂZà\'P¬¦ÿüóQ»\0ZóS¸¦4‘¯(Êß?à;ÿ«©ñ¿\0\0ÿÿ\0PK\0\0\0\0\0!\00İC)¨\0\0¤\0\0\0\0\0word/theme/theme1.xmlìYOoÛ6¿Øw toc\'v\ZuŠØ±›-MÄn‡i‰–ØP¢@ÒI}Úã€Ãºa‡Øm‡a[Ø¥û4Ù:lĞ¯°GR’ÅX^’6ØŠ­>$ùãûÿ©«×îÇ!)OÚ^ırÍC$ñy@“°íİö/­yH*œ˜ñ„´½)‘Şµ÷ß»Š×UDb‚`}\"×qÛ‹”J×—–¤ÃX^æ)I`nÌEŒ¼Šp)øèÆli¹V[]Š1M<”àÈŞ\Z©OĞP“ô6râ=¯‰’zÀgb Ig…ÁuSÙebÖö€OÀ†ä¾òÃRÁDÛ«™Ÿ·´qu	¯g‹˜Z°¶´®o~ÙºlAp°lxŠpT0­÷­+[}`j×ëõº½zAÏ\0°ïƒ¦V–2ÍF­ŞÉi–@öqv·Ö¬5\\|‰şÊœÌ­N§Óle²X¢dsøµÚjcsÙÁÅ7çğÎf·»êà\rÈâWçğı+­Õ†‹7 ˆÑä`­ÚïgÔÈ˜³íJø\ZÀ×j|†‚h(¢K³óD-Šµßã¢\0\rdXÑ©iJÆØ‡(îâx$(Öğ:Á¥;äË¹!ÍI_ĞTµ½S1£÷êù÷¯?EÇ?øéøáÃã?ZBÎªmœ„åU/¿ıìÏÇ£?~óòÑÕxYÆÿúÃ\'¿üüy5Òg&Î‹/ŸüöìÉ‹¯>ıı»GğMGeøÆD¢›äíó3Vq%\'#q¾ÃÓòŠÍ$”8ÁšKıŠôÍ)f™w9:Äµàå£\nx}rÏx‰‰¢œw¢ØîrÎ:\\TZaGó*™y8IÂjæbRÆíc|XÅ»‹Ç¿½I\nu3KGñnD1÷NIBÒsü€\níîRêØu—ú‚K>Vè.EL+M2¤#\'šf‹¶i~™Véşvl³{u8«Òz‹ºHÈ\nÌ*„æ˜ñ:(W‘â˜•\r~«¨JÈÁTøe\\O*ğtHG½€HYµæ–\0}KNßÁP±*İ¾Ë¦±‹ŠTÑ¼9/#·øA7ÂqZ…Ğ$*c?¢íqUßån†èwğNºû%»O¯·ièˆ4=3¾¼N¸¿ƒ)cbJ\ru§VÇ4ù»ÂÍ(TnËáâ\n7”Ê_?®ûm-Ù›°{UåÌö‰B½w²<w¹èÛ_·ğ$Ù#ó[Ô»âü®8{ÿùâ¼(Ÿ/¾$Ïª0hİ‹ØFÛ´İñÂ®{L¨)#7¤i¼%ì=Aõ:sâ$Å),àQg20pp¡Àf\r\\}DU4ˆp\nM{İÓDB™‘%J¹„Ã¢®¤­ñĞø+{ÔlêCˆ­«]Øá=œŸ5\n2FªĞhsF+šÀY™­\\Éˆ‚n¯Ã¬®…:3·ºÍE‡[¡²6±9”ƒÉÕ`°°&45Z!°ò*œù5k8ì`Fmwë£Ü-Æé\"á€d>ÒzÏû¨nœ”ÇÊœ\"ZúàxŠÕJÜZšìp;‹“Êì\ZØåŞ{/å<óP;™,)\'\'KĞQÛk5—›òqÚöÆpN†Ç8¯KİGbÂe“¯„\rûS“ÙdùÌ›­\\17	êpõaí>§°SR!Õ–‘\r\r3•…\0K4\'+ÿrÌzQ\nTT£³I±²Áğ¯Ivt]KÆcâ«²³K#Úvö5+¥|¢ˆDÁ\Z±‰ØÇà~ª O@%\\w˜Š _ànN[ÛL¹Å9Kºò˜ÁÙqÌÒgåV§hÉn\nR!ƒy+‰ºUÊn”;¿*&å/H•rÿÏTÑû	Ü>¬Ú>\\\rŒt¦´=.TÄ¡\n¥õû\ZS; Zà~¦!¨à‚ÚüäPÿ·9gi˜´†C¤Ú§!ö#	Bö ,™è;…X=Û»,I–2UW¦Vì9$l¨kàªŞÛ=A¨›j’•ƒ;î{–A£P79å|s*Y±÷Úø§;›Ì ”[‡MC“Û¿±hf»ª]o–ç{oY=1k³\ZyV\0³ÒVĞÊÒş5E8çVk+ÖœÆËÍ\\8ğâ¼Æ0X4D)Ü!!ıö?*|f¿vè\ruÈ÷¡¶\"øx¡‰AØ@T_²ÒÒ q²ƒ6˜4)kÚ¬uÒVË7ëît¾\'Œ­%;‹¿Ïiì¢9sÙ9¹x‘ÆÎ,ìØÚ-45xödŠÂĞ8?ÈÇ˜Ïdå/Y|t½ß&LILğJ`è¡& ù-G³tã/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0´>qaÇ\0\0´	\0\0\0\0\0word/settings.xml´V[oÛ6~°ÿ`èy$[Šc!N‘ØñÖ\"^‡)ı”DÛDxIYqıI1j5(VìIä¹|çÊstıá™ÑÉ	+M_EéEM0¯ECøa}yÜN¯¢‰6ˆ7ˆ\nWÑëèÃÍ¯¿\\w…ÆÆ€˜\0×«WÑÑYÄ±®˜!}!$æÀÜÅ«:Ä©§VNkÁ$2¤\"”˜s<K’Ë¨‡«¨U¼è!¦ŒÔJh±7V¥û=©qÿ	\ZêGìzÍ¨[†¹qc…)ø ¸>©\Zû¯hâ1€œŞâÄhëÒä=É>ÜN¨æEãGÜ³\nR‰\Zk\rbÔ‡Ëá/0iöè%ÕêØÛ-¨§‰;\rkúF¤Ú¾Š¤RHù2CX/X]|<p¡PE¡©º4‹n £¾\nÁ&]!±ª¡H«h™D±¥C,b_\Zd0pµÄ”ºö¬)F€Õ…4Ö*ò§Óà=j©yDUi„¡—³²>\"…jƒU)Q\rhkÁ4È5âOaÖĞ¤\nrèğ-kİñ§Ò·?hpÄ Oí[z\'\Zl=ky“§ïæÙ*8/!.†qC«\"\r†Ğ(.Í™â-8_’¯ø–7ŸZm<×Ø?áÁ{`n-†Çıx–x‹‘i!Mÿ“1W‰-%rG”ê#o 5~ÖXŠhË	³¯Ñáğ·&”!Iòl~¿¼õ¹°b\'¹Jòû»1N–åËåf”³˜ç÷£œïÛÉ/Óly9†¶È’t}5ÆYŞ¦ó»Q¯o¯Û¤¯ãYÏóÅf>†vŸ\'³Å¨Ûd¾I—c:ÛË|±XŒrîæ³tf9Pƒ>ó¬°³ó/usíO¶\'Ì?…5b•\"h²³Ó´XQ©§;Â¿Â°]ğ·œ²­s:õÍ¥[xïáRÀŠ†h¹Á{KwHÜ^BRa¶|zÁ²£\n«ß•h¥·Ö)$}›si–õx„›Â]·U´8LÈoX-o>Ÿ”Œ‡ôt…Åêûâ‡Ğ˜O¿”VºšªÒ._¼CRÂX‘ê®\"JG“Ú\'jàÖÀv—ê0ëy3Çƒ›å¹ªmd İ¬€?‚Thó@›4X1^.hy åí2Ğà\' +0Sø\'œáhé{A©èpóG ®¢7$Ÿ}DC]íü‡‡-\nGè‚œ\nüË7ÄÀ¿$\rCÏğë“Ì\\“÷ÒEk^ÉZ$+,_Q\'\r2Ô]©^)»ÿ—/]Ñàš@;–gV\rëæÂ;N‰6%–°™ŒP²[¿9äáwëæ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0 N\0\0¬\0\0\0\0\0word/webSettings.xmlŒĞÁJ1à»à;,¹·Ù•\"²t· Rñ\"‚ú\0ivvÌdÂLj¬OoÚª ^zË$™™¹ú@_½‹£Ğ©f^«\n‚¥Á…©S¯/ëÙª$™0O:µQ«şòb™Û›gH©ü”ª(AZ´Ú¦[­ÅnÌ)B(#1šTJ4\Z~ÛÅ™%Œ&¹ó.íõU]_«o†ÏQh…;²;„ıšÁ‘‚l]”-Ÿ£eâ!2Y)û ?yh\\øešÅ?e\ZÓ¼,£OéUÚ›úxB¯*´íÃˆÍÆ—s³P}‰brè>aM|Ë”X®÷”ŸïK¡ÿdÜ\0\0ÿÿ\0PK\0\0\0\0\0!\0°Ø(»\0\0^=\0\0\Z\0\0\0word/stylesWithEffects.xml´›mSÛ8ÇßßÌ}ßCH äÊ4íPè3m60÷Z±¢Á¶|~ pŸşV’­;¶wc÷U‰cíoW»ú¯ Ò»Ïaà<ñ$2Z¸Óã×á‘\'}=,Üû»ÏG¹Nš±ÈgŒøÂ}á©ûáıŸ¼Û^¤ÙKÀSDéÅ6öî&Ëâ‹É$õ6<déq(¼D¦r{2œÈõZx|²•‰?™LOôOq\"=¦@»bÑKİÂ\\Ø´&ck-“eé±L&!Kóø¬Ç,+ˆìlŸœ—fäÂÍ“è¢pèÈ:¤†\\‡ŠÊI#Š=\\3òZzyÈ£L\'	À¥ïÂ8Ô\Z„¸)]zê\nâ)Ê÷¶ñô¬Á³!crp°-¤bg°anÏdøfP˜yPùİeµnqzÒL‘eÂú€qá5³ô$d\"²f›šêäÂzRß_™ÇÖX³v=Z[jY<;9×+¯\ZZJ2ĞXºË\r‹¹ë„ŞÅÍC$¶\nÀ£íôÌQé¾©ğ¥wÍ×,²T}Ln“âcñIÿóYFYêl/Xê	qVB¿^F©páÎÒì2lï—õÖŞo¼4«Xû(|áN1ıl>±`áÎfå“+åÁ«g‹Êg<:º_V=Y¸öÑ\nì.\\–-/•±‰³ü·nü*xø¤]‰™+8lq!P1Å	„ÊîlŠf>üÊÕä²<“D\0XÕ,|¬Í8h(ÕÒ(6|Ë×ß¤÷Èıe_,\\Í‚‡÷7·‰	ÈèÂ}ûV1áá’‡â«ğ}®\ZDñì>ÚŸÿ³áÑ}ÊıİóŸŸµ<=™G¸>×U¤ş§gÇJ&ÁtÄT†¨ a\nG;”‹7æAªş[\"§&‡{)ÎTKs´ÿ u>4SUĞvI¾7q6ÜÄ›á&tñ›‹ùp/`#34#¦6*U‰Oj&=S|Õy8}ÛQ²jD£ŠzG4Š¦wD£FzG4J¢wD£zG4Ş;¢‘ßŞtvğ˜®zêÙ@-ì;‘Ğ\'{”n:PêŠVãÜ²„=$,Ş8ª±ÖİîËe¾Êp®j9=\\,—Y\"Õv³gF ;«¥{°&\nã\rKìÊû@§şNm}œ/‰€íkê)¾FLzc²·…İÌãø<qîø³É(aüé,Í.£×¹iı&6™»BÕr{aç-“Ş>Æş7‘ê9èìæç-¡ôGåğ¼¥.Ûç¾ÈÃrj»‘s£ç„4×ÚÅî):S)j®®Ş(T0!˜vAAÛGøošİ¾Ê1ÆÓŠ´ğß4®íëúèÎ/Yi®áÏ*jyÍÉk÷J2YçA¹zåaN^Á¼ˆ­}”HÌÉ+ø•|:—¿¹aê”œ‹(ätŠ^løXÈI©ÉŞ”9A5ÖŒÀ\Z¦µYtñ\'¡şLmZ¥í^³w9Ÿ¶Ì\0´ Ôúg.³ş=ô¬Eó°”›ş\\’rG;mYyXZQO¦ßr<¬ñ@Ã: 4¬@-õÑ¾ç±=Ş	,²,Û.¦Ë­Ìs²2[­ŒÔ7û¯–ÕÛ^Í¾‰ Ôì›\n9;µ^fû&‚5ZßD°ZºF{ªšJ	ŠÜ7« »@D4x#@ãˆ74x#@ÃÅ»2x#Xdm°šZoH¿BùUß‚ªâ\0‘µÁ¨]ñ7£²ïi+İ¿Ü Ş\n9AMñFPÈÙioK¿B©„\ZËJ‚5x#@ãˆ74x#@ãˆ74x#@ÃÅ»2x#Xdm°šZoˆ,ToH¿BÑ†½â­Wıoo…œ ¦x#(äìÔÕnR,r‚j,+Ş–~…RK7%¨qÄÑ8â\0#ŞĞ8â\0\rï~Èxâ`‘µÁjjU¼ ²<XPU¼ ²6ìo½»x#(ä5ÅA!g§&¨Vç,r‚j,+Ş–®—Áâ\0éWQ\"\ZG¼#ŞĞ8â\0\rï~Èxâ`‘µÁjjU¼ ²<XPU¼ ²6ìo½F~»x#(ä5ÅA!g§&¨V¼,r‚j,+uÖ8â\0éÂ,Ş~å\0^E”4#ŞˆˆÆoh¸x÷CÆo‹¬\rVS«â\0‘åÁ‚ªâ\0‘µA³…ó¢èã©Ó–\"À3(O5 ³–$aE€¿øš\'p«÷Ÿ,#$[ÊâG)ÜÁîÓ–A£Ä*Ré~Ñ§t*Nç7	îş¾r¾š0qº¤^Ÿ¼ÛCÕëBúz’º8~f/1\\Ù‰Ë“åÊ\Z\\R÷ºŠ+@úNè\r\\*®õ¨Áê¼¨/UõÿÛTøˆz`åm€åÁ¨TqàİAÒÇİëà–SñÚ‘İ•ŒÒÍâtüneŞ{uF³ÓïLïğYŸïœ#G¿b²Út.gi—ú<„”­sÅ~¸‰|ˆp[ÜÎ2ÉôŸ™1ß_ñ øÎô…´LÆí¯|™o§\'ºÖL­d–É°}|¢ˆkOö€r¨:c>ª Úë$ÊÃOŠãæ­%©:‡¾‰öº$ÍY×–RÀÎôÎ·ò§ôıÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0-€ûR\0\0‰\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’_kƒ0Åßû’çi¢¥jÙú´Â`{ÉmfbH²Ú~ûEm¥{øÏ¹¿œs5ŸïUíÀ:Yë¥	Ah^©7z[-âŠœgZ°ªÖP 84/¯¯rn(¯-¼ØÚ€õ\\HÚQn\n´õŞPŒß‚b.	Äumóáh7Ø0şÅ6€3B¦Xg‚y†[`l\":\"æÛV@p(ĞŞá4Iñ¯×ƒUîÏN9•ô:ãÙ‚÷âàŞ;9›¦IšI#äOñÇòùµ«\ZKİîŠ*sÁ)·À|mËØ¬n¢%³<ºÏñHj×X1ç—aãk	âápá¾t´Cv²ıfå4Çãc¸·«Ù_\"\nÁi_ó¤¼OŸVTf$Ä$<·«ŒPrG	ùlÃÍ·EúêñŸÄŒ’Ù9ñ(»Äç?Où\0\0ÿÿ\0PK\0\0\0\0\0!\0N#…;\0\0m:\0\0\0\0\0word/styles.xml´›ßs›8Çßoæş†÷Ô±Æ×LİNš¶×Ì´½´NæecMq 7Iÿú[­0!``7Ğ§˜ÚV»ú®ìH¯ßŞÇ‘÷Sf¹ÒÉÒŸ¾8ö=™:TÉíÒ¿¹şxô—ïåF$¡ˆt\"—şƒÌı·oşüãõİYn\"™{` ÉÏâ`éoIÏ&“<ØÊXä/t*x¸ÑY,\\f·“Xd?véQ ãTµV‘2“Ùññ©_˜É(Vôf£ù^»X&ÛO2Eä[•æ{kwkw:ÓL2ÏÁé8röb¡’ÒÌô¤a(VA¦s½1/À™‰ëÑÄš‚æÓcüG¾g—·‰ÎÄ:‚Á»›øo`äB¼—±‹Ln/³«¬¸,®ğÏG˜Ü»;y Ô5)ˆØútäÊ‡\'Räæ<WâàÃ­}ëà“ 7kïT¨ü‰%æ¿ÀæO-ıÙlçÂöàÉ½H$·û{29ºYU{²ôË[k°»ôEv´:·Æ&èæşoÅİô‰óp…]IE\0Á\0Ø	I9b9‘²98[@¾¸‹ï;;®bgtA\0«š…ËÚˆC®@æ¬\\ÃS¹ù¬ƒ2\\x°ô‘7o.¯2¥3HÒ¥ÿê•eÂÍ•ŒÕ\'†ÒÎ—âŞM²U¡üw+“›\\†÷¿}Ää/,z—èşé³ ÊÃ÷LmÚ‚éDØµ\r q vh§{ãnÔ¨xó¿=rêbx²•ÂÎpûß	B¯wƒA3ëQÕ´Ëêë|¸‰“á&^7É;l,Ã{º>4\".7*YIªÑK¾ê8Ì_u¤¬mÑÈ¢Ş¤émÑÈ‘Ş”èmÑÈ€Ş€÷¶hÄ··E#œ-ÂUÏ¢9ib_+IÛ¾S€¦¥®(5Ş•ÈÄm&Ò­gk½Û]b¹Ú­\r­«(§ÏË•ÉtrÛ;\"PíÔ}¶&ˆÓ­È¬’z†~6pè¯íªÇû;Sa/ê¥K¾†O¸09XÂ®\"È­B™y×òŞE”Ñş«öVn•ÑÛ¹aı¬n·Æ[m±äöÂN[½}$œıÏ*Ç1èœL§-®ô\'Åğ´%/Û‘¡ÚÅû¡!¬FN3Â\\C`»‡èÄ†¨9»z½° ¸àÊß´Oè¿+.|û6Æ”ş»RôLû„ş»ÂõLû˜İñe+Í{øÒê‘¦×‚=w/t¤³Í.ÚÏ^yX°gp‰ ¹ÀÄ¥}’H,Ø3ø‰|zçA\0ßÜ(yÊÅ£2(ìp8\nN6º/ì ÔdoÊğˆ \ZkÆ`\rÓZˆ-ºßåOeãTér­Ù;ç-#\0%ˆ´†ş¶Ó¦\r=kÑ<*å2ŸKréÑhó–™G¥ùäê#ÆÃ\n4¬2@ÃJ!Ô’ík²&Ò!Ã‹#ƒÅ–å²ŠaÚ‘•yÁVæÄ+#ÕMÂú«eö¶çB³n(ì\05ë&ÂN­–•u“À\Z­nX-U£=FUMå8Å®›UP¹ x4x@ãˆ74x@ÃÅ»2xXlm(5µ*Ş¾Âùª_‚ªâM\0±µÁ©]ñ›Ñ¾î¡•î/·#ˆ7ÂPS¼	vtÚÄ›ÀÂW8™Pc•RG`#ŞĞ8âM\0#ŞĞ8âM\0#ŞĞpñî‡Œ\'Ş[JM­Š7Ä–‡To_áhÃAñÆYÿÛÅ›@a¨)Ş\n;:5A-©;@5V)Ş¾ÂI†‚…ÉÍqjñ&x4x@ãˆ74x@ÃÅ»2xXlm(5µ*Ş[JPU¼	 ¶6oœŒ¿]¼	v€šâM °£SÔRç,v€j¬R¼	,Ì—ÁâM\0á+Ïq<\ZG¼	#ŞĞ8âM\0\rï~ÈxâM`±µ¡ÔÔªx@ly(AUñ&€ØÚpP¼qüvñ&PØjŠ7ÂNMPKñ&°Øª±J©#°Æos°x@øÊ3@8‹8a\ZG¼	#ŞĞpñî‡Œ\'Ş[JM­Š7Ä–‡Toˆ­\rvŸ-ì%oO¶$uŸÁ~W8k	X8ø]nd‡¬dÿîÀ½‡bKzP]|§õ¶±{Ş’ d”ZGJã–îÜ¥S9ˆ0_tœ$¸şçÂûäÀ4ÚaJ=İy§‡ªÇ…ğx’=8ı4)ÙI÷;Ë­58 dÏuG€ğˆÜ%*õØÆöœ¼ˆ‡ªŠÛøÛ‚\nŸˆ\r›¨`¬\0NDu Š\rïå$Üî^·ìŠÇ<ÉØw³Øÿ¸†rï=Ù£ÙÙocw‚wôwŠw‘‡¯¸¨6;‡³°K}=„­#wÄ>\\&!x‡ñ¿f.˜á½p¦àù…Œ¢/¤¶¿\ZÉqO§ÇXk¦ÖÚ··Ïpƒ8öäH‡jgÜ¥u¢=O’]¼–œğêó¯ÚV<‰ö4%İ^×–T ôcßöŸò7ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0M¶öÂ\0\0¢\0\0\0\0\0word/fontTable.xml¤’MnÛ0…÷zû˜¤¬¤‰9Ü\Zè¦‹\"=\0MSQşÚªoß)+#€İJ\0!½á<Ì|xÏ/¬)*€ö®!|ÁH¡œô;íö\rùõ¶¹{$DávÂx§\ZrR@^VŸ?=uë]„ûÔV6¤‹±¯)Ù)+`á{å°Øú`EÄß°§V„ß‡şNzÛ‹¨·Úèx¢%cd²	×¸ø¶ÕR}õò`•‹©ŸeĞÑ;ètg·á\Z·Á‡]¼T\0¸³5ÙÏ\níf^]Y-ƒßÆ.CóDt´ÂvÎÒ—5¤°²ş¾w>ˆ­Av¯ÈjWµÅµ0zt*ôÂyPkGa\ZÂJ¶a÷xoÅ–ãIèè ;@Åù\"Ër+¬6§³\nƒÈ…^GÙõ£z(—@ï±p€-kÈ7Î+7’Ş\n…×õ¬”8T~¦;ËYÁäà`É\']áOÉô™ºÒœ4Gç‚Ä›¶\nŠj(~z+ÜDJö€$î‘ÇHfy‘|Ák‰ààåë¼?n²FåËcÅ§ıo\"’}®\'²£!> 1È$F\"·eãßH\\fƒU3›w)	˜¨ÿÉÆXı\0\0ÿÿ\0PK\0\0\0\0\0!\0ŞpÒö\0\0û\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œSËnÛ0¼è?ºÇ”7p\rŠAá ğ¡mXIÎ[je¥H‚dŒ¸_ß¥ËrÚSuš}p9šò»×NgGôAYSåå¬È34Ò6Êì«ü±şz³Ì³Á4 ­Á*?aÈïÄÇ|ë­C†ŒF˜På‡İŠ± ØA˜QÙP¥µ¾ƒH¡ß3Û¶Jâ½•/šÈæEqËğ5¢i°¹qãÀ|˜¸:ÆÿÚX™ø…§úäˆ°à5vNCDñ#ÑÑ³ÆÆ³1ËkA×ªCQ–Ÿ©0†|{bÎÙ\0ø³õM‹¢äl€|}\02’†b>_ÒéI‚qN+	‘äß•ô6Ø6f½Y\ZÀÙ´…“8;”/^Å“(8›†ü›2D%ñqó°÷àA|JÇˆï$h\\“¢³K‚oÒz· ˆ1?ÆÕe´>ê7-xg?!`®Êà˜H¦¶!è±v!zQ«¨i6Õ†¸‡Ó¶)VAšQ/ëÆ”8Páš]Cxhéßâ?È–S²=‡ê„Îw¼›º¶s;²ÕI­­wÖ÷«£¾õ¤%ü\n®¶÷ÉNoê^\'\'xVñ°s “…n—´¤‹7&%¾#aCË>¼$ø†6áuº•Îš=6ç¿ÉmOÃ[åbVĞ×Ûëœ#ŒLü\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0	$‡‚\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·ó\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0º\0\0_rels/.relsPK-\0\0\0\0\0\0!\0|;—9\"\0\0¹\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ş\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0è´ÇW:\n\0\0{%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B	\0\0word/document.xmlPK-\0\0\0\0\0\0!\00İC)¨\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0«\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0´>qaÇ\0\0´	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†\Z\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0 N\0\0¬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0°Ø(»\0\0^=\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0°\0\0word/stylesWithEffects.xmlPK-\0\0\0\0\0\0!\0-€ûR\0\0‰\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0£\'\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0N#…;\0\0m:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,*\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0M¶öÂ\0\0¢\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0”1\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0ŞpÒö\0\0û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†3\0\0docProps/app.xmlPK\0\0\0\0\0\0	\0\0²6\0\0\0\0','application/vnd.openxmlformats-officedocument.wordprocessingml.document','Test1',1),(2,1,'PK\0\0\0\0\0!\0|l˜l\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ì”]KÃ0†ïÿCÉ­4Ù&ˆÈº]øq©çˆÍé\Z–&!\'›Û¿÷4û@¤nzÓĞæœ÷}’4ïp¼jL¶„€ÚÙ‚õye`K§´ìmú”ß²£´J\Zg¡`k@6]^§k˜Q·Å‚Õ1ú;!°¬¡‘ÈK3•Œô\ZfÂËr.g ½Ş(`c[\r6\Z>@%&f+ú¼!	`e÷›ÂÖ«`Ò{£K‰T,­úæ’o8u¦\Z¬µÇ+Â`¢Ó¡ùÙ`Û÷B[´‚l\"C|–\raˆ•.Ìß›óÃ\"”®ªt	Ê•‹†v€£ Ö\0±1<¼‘Úî¸ø§bièŸ¤]_>‘cğO8®ÿˆ#Òÿ\"=$IæÈ`\\À3¯v#zÌ¹–Ôk”gøª}ˆƒîÑ$8”(Nß…]d´İ¹\'!QÃ>4º.ßŞ‘ÒètÃo·Ú¼S :¼EÊ×Ñ\'\0\0\0ÿÿ\0PK\0\0\0\0\0!\0µU0#õ\0\0\0L\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’ÏNÃ0ÆïH¼CäûênH¡¥»LH»!TÀ$îµ£$@÷ö„‚JcÛÑöçÏ?[ŞîæiTb/NÃº(A±3b{×jx­ŸV b\"giÇ\ZaWİŞl_x¤”›b×û¨²‹‹\Zº”ü#b4Oñìr¥‘0QÊahÑ“¨eÜ”å=†¿P-<ÕÁj{ª>ú<ù²·4Mox/æ}b—NŒ@;ËvåCf©ÏÛ¨šBËIƒóœÓÉû\"c&Ú\\Oôÿ¶8q\"K‰ĞHàó<ßŠs@ëë.Ÿh©ø½Î<â§„áMdøaÁÅT_\0\0\0ÿÿ\0PK\0\0\0\0\0!\0Ş	ı(\0\0Ô\0\0\Z\0xl/_rels/workbook.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼“ÏjÃ0Æïƒ½ƒÑ}q’ne”:½ŒA¯[÷\0&QâĞÄ6–ö\'o?“Cº@É.¡ƒ$ü}?Ğ§ıá§ïÄjU%)´¥«ZÛ(ø8½><ƒ Ö¶Ò³¨`@‚Cq·ÃNsüD¦õ$¢Š%†Ùï¤¤Ò`¯)qmœÔ.ôšc\ZéuyÖ\rÊ<M·2üÕ€b¦)•‚p¬6 NƒÎÿk»ºnK|qåg–¯XÈoÎd9ŠêĞ +˜Z$ÇÉ&‰Ä ¯Ãä7†É—`²ÃdK0Û5aÈè€Õ;‡˜Bº¬jÖ^‚yZ†‡.†~\nõ’ıãšöO	/îc)ÇwÚ‡œİbñ\0\0ÿÿ\0PK\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0xl/workbook.xmlŒRMOÃ0½#ñ¢ÜYºvë`Z:	b„ÄçĞ¸k´4©’Œnÿ7Ó>8Ù_Ÿ_2›ï\ZM¾Àye\r§ÃAB	˜ÒJeÖœ¾/Ÿnn)ñA)´5Àé<×W³ÎºÍ§µ‚ÆsZ‡ĞNóe\rğÛ‚ÁNe]#–nÍ|ë@H_„F³4IrÖeèaêşÃa«J•ğ`Ëm&HhP¾¯Uëi1«”†Õa#\"ÚöE4¨{§)ÑÂ‡G©HNÇXÚ~¸m{¿U\Z»wY’QVœ–|uDB%¶:,q½#;ú•Ò4ï‘½+?_êK²ûPFÚÓ,Gk÷Çj‚ó»ØùP2ÔœæùùèÔºœN&£¤çfäÑ>#1q··ŞÒ!¾S(s7U˜¸…ö¿Ğé\Zó:ı] 1?¡£G,’£¤RèêC1\ZçiœÎ¥ø\0\0ÿÿ\0PK\0\0\0\0\0!\0ûb¥m”\0\0§\0\0\0\0\0xl/theme/theme1.xmlìYOoÛ6¿Øw tom\'¶uŠØ±›­MÄn‡i™–XS¢@ÒI}Úã€Ãºa—»í0l+Ğ»tŸ&[‡­úöHJ²ËKÒÖÕ‡D\"|ÿßã#uõÚƒˆ¡C\"$åqÛ«]®zˆÄ>Ó8h{w†ıK’\nÇcÌxLÚŞœHïÚÖûï]Å›*$A°>–›¸í…J%›•ŠôaËË<!1ÌM¸ˆ°‚WTÆİˆUÖªÕf%Â4öPŒ# {{2¡>ACMÒÛÊˆ÷¼ÆJêŸ‰&Mœ;Ö4BÎe—	tˆYÛ>c~4$”‡–\n&Ú^Õü¼ÊÖÕ\nŞL1µbma]ßüÒué‚ñtÍğÁ(gZë×[WvrúÀÔ2®×ëu{µœ`ßM­,EšõşF­“Ñ,€ìã2ínµQ­»øıõ%™[N§ÑJe±D\rÈ>Ö—ğÕf}{ÍÁÅ7–ğõÎv·ÛtğdñÍ%|ÿJ«Ywñ2\ZO—ĞÚ¡ı~J=‡L8Û-…o\0|£šÂ(ˆ†<º4‹	ÕªX‹ğ}.ú\0Ğ@†‘š\'d‚}ˆâ.F‚bÍ\0o\\˜±C¾\\\ZÒ¼ôMTÛû0Áz¯ÿêùSôêù“ã‡ÏştüèÑñÃ--gá.ƒâÂ—ß~öç×£?~óòñåxYÄÿúÃ\'¿üüy92h!Ñ‹/ŸüöìÉ‹¯>ıı»Ç%ğmGEøFD¢[äğt3†q%\'#q¾ÃSgv	é\nà­9fe¸qwW@ñ(^Ÿİwd„b¦h	çaä\0÷8g.J\rpCó*Xx8‹ƒræbVÄ`|XÆ»‹cÇµ½YU3JÇöİ8bî3+˜(¤çø”íîQêØuú‚K>QèELKM2¤#\'‹vi~™—é®vl³wu8+Óz‡ºHHÌJ„æ˜ñ:)•‘âˆ\r~«°LÈÁ\\øE\\O*ğt@G½1‘²lÍmúœ~C½*uû›G.R(:-£ys^Dîği7ÄQR†Ğ8,b?SQŒö¹*ƒïq7Cô;øÇ+İ}—Çİ§‚;4pDZˆ™‰_^\'Ü‰ßÁœM01UJºS©#\Zÿ]Ùfê¶åğ®l·½mØÄÊ’g÷D±^…û–è<‹÷	dÅòõ®B¿«ĞŞ[_¡WåòÅ×åE)†*­Ûk›Î;ZÙxO(c5gä¦4½·„\rhÜ‡A½Î:I~KBxÔ™\\ °YƒWQBœ@ß^ó4‘@¦¤‰.á¼h†Kik<ôşÊ6úb+‡ÄjíğºÎ9#U`Î´£uMà¬ÌÖ¯¤DA·×aVÓB™[ÍˆfŠ¢Ã-WY›ØœËÁä¹j0˜[:ıX¹	Ç~Í\ZÎ;˜‘±¶»õQæã…‹t‘ñ˜¤>Òz/û¨fœ”ÅÊ’\"ZúìxŠÕ\nÜZšìp;‹“Šìê+ØeŞ{/e¼ğP;™,.&\'‹ÑQÛk5Ö\ZòqÒö&pT†Ç(¯KİLbÀ}“¯„\rûS“ÙdùÂ›­L17	jpûaí¾¤°S!Õ–¡\r\r3•†\0‹5\'+ÿZÌzQ\n”T£³I±¾Áğ¯Ivt]K&â«¢³#Úvö5-¥|¦ˆ„ã#4b3q€Áı:TAŸ1•pãa*‚~ë9mm3åç4éŠ—bgÇ1KBœ–[¢Y&[¸)H¹æ­ èV*»Qîüª˜”¿ UŠaü?SEï\'p±>ÖğávX`¤3¥íq¡BU(	©ßĞ8˜ÚÑW¼0\rAwÔæ¿ ‡ú¿Í9KÃ¤5œ$Õ\r °©P²eÉDß)ÄjéŞeI²”‰¨‚¸2±bÈ!aC]›zo÷P¡nªIZîdü¹ïiİäóÍ©dùŞksàŸî|l2ƒRn6\rMfÿ\\Ä¼=Xìªv½Yí½EEôÄ¢ÍªgYÌ\n[A+Mû×áœ[­­XK\Z¯52áÀ‹Ë\ZÃ`Ş%p‘„ôØÿ¨ğ™ıà¡7Ô!?€ÚŠàû…&aQ}É6HH;8‚ÆÉÚ`Ò¤¬iÓÖI[-Û¬/¸ÓÍù0¶–ì,ş>§±óæÌeçäâE\Z;µ°ck;¶ÒÔàÙ“)\nC“ì cc¾”?fñÑ}pô|6˜1%M0Á§*¡‡˜<€ä·ÍÒ­¿\0\0\0ÿÿ\0PK\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0xl/worksheets/sheet2.xmlŒ’ÁjÃ0†ïƒ½ƒñ½qÚ­Û\Z’”A)ëa0Æ¶»ã(‰ilÛ]Û·Ÿ’2è¥7	IŸırº>™–ı‚ó\ZmÆçQÌX…¥¶uÆ¿¿¶³Î|¶”-ZÈø<_ç÷wéİŞ7\0ÁúŒ7!t‰^5`¤°K•\n‘RWß9å0dZ±ˆã\'a¤¶|$$îV•V°Au0`ÃqĞÊ@ú}£;?ÑŒºg¤Ûº™BÓ¢Ğ­çÊ™QÉ®¶èdÑÒŞ§ù£T{H®ğF+‡«NŒB¯w^‰• R–š6èmgªŒ¿Î¹ÈÓÁœ\rGÿ/f½×â¾/ìÊŒÇ}«¸êİ^8VB%møÄãèº	tØ%iïWHÊó¼\"ï-–—G72H¢v²†wéjm=k¡\Zº9s#&(Øõ³Ï„,04SÖĞu®GœUˆaJzµ—ÿ’ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0xl/worksheets/sheet3.xmlŒ’ÁjÃ0†ïƒ½ƒñ½qÚ­Û\Z’”A)ëa0Æ¶»ã(‰ilÛ]Û·Ÿ’2è¥7	IŸırº>™–ı‚ó\ZmÆçQÌX…¥¶uÆ¿¿¶³Î|¶”-ZÈø<_ç÷wéİŞ7\0ÁúŒ7!t‰^5`¤°K•\n‘RWß9å0dZ±ˆã\'a¤¶|$$îV•V°Au0`ÃqĞÊ@ú}£;?ÑŒºg¤Ûº™BÓ¢Ğ­çÊ™QÉ®¶èdÑÒŞ§ù£T{H®ğF+‡«NŒB¯w^‰• R–š6èmgªŒ¿Î¹ÈÓÁœ\rGÿ/f½×â¾/ìÊŒÇ}«¸êİ^8VB%møÄãèº	tØ%iïWHÊó¼\"ï-–—G72H¢v²†wéjm=k¡\Zº9s#&(Øõ³Ï„,04SÖĞu®GœUˆaJzµ—ÿ’ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0=#ÿ±p\0\0i\0\0\0\0\0xl/worksheets/sheet1.xml”U]¢0}ßdÿá}(¨¨d2êLv6™ìçs-\Z)%mı˜¿—VtMôE(§çôœÛö\Z?xéì¨TLTs7ğ|×¡)«ò¹ûû×ÛÓÔu”ÆUŠKQÑ¹ûI•ûœ|ıï…Ü¨‚Rí€B¥æn¡u=CH‘‚r¬<QÓ\nLH5eT-)N\r‰—hàûcÄ1«\\«0“÷hˆ,c„®ÙrZi+\"i‰5øW«ÕI“{ä8–›mıD¯AbÍJ¦?¨ëp2{Ï+!ñº„Ü‡`„ÉIÛ®ä9#R(‘iä5z9B¥$N$hÊîHšÍİ—pö\Zø.JbS ?ŒîUçİÑxı“–”hšÂ>¹NSÿµ›fâ;|2TtÅ}3õÿNJ3¼-õ±ÿFY^h	!Ok–~®¨\"POñac‚ˆ–‡_‡38¨>˜ç¥ºhØŞ$ğ£áTÈViÁÿ#İ‡G\"<OÄ‘7˜†A8†…şÃDved…5Nb)öœ\r˜­jÜœ´`vÓ9Xnæ¾„Pà]2\Z1Ú%1\"Çï BHeP¿-»ØoÕÅ-µÖßøcëo:nµŒïˆ´ş†}ìµ‹Z¬çaòˆ‡ÉÑÃ9õ\0\"­‡°]Ç`Ë.v®QÏCÓ0îŞ§éÑÃEÖˆÜôĞÅnxˆñY“I?ëDZQ[v±à|z…€Ûü@%`¶9²á9’İF¦õqq^–=ğ\"@ÓNÎÌi›Àš´­ÂŞ°\Zçô;–9«”SÒVó=Øiiû„y×¢6_á\"¬…†Û~\ZĞÒ)\\9ßƒ+	¡Oh\"¨ı“Hş\0\0ÿÿ\0PK\0\0\0\0\0!\0î„A\0\0Û\0\0\0\0\0xl/sharedStrings.xmll‘ËNÃ0E÷HüÃÈûÔ)B¡$!±(âQÄÚÄÓÄŒƒgLÛ¿Ç(¬¬.çŒî½ó¨Vûq€ì<Õj¹( µŞ:êjõ¶¹/.°²fğ„µ: «UszR1$-q­z‘éJkn{\r/ü„”:[F#©æ) ±Ü#Ê8è³²¼Ğ£q¤ õ‘$å+ˆä¾#Şşƒ¥j*vM%Í‹·†JKSé?2ÓMD¶æãçëœÜø}Üb¦ ¶~ü®ˆìœô$à	q/iwœ8÷\\›Ğæì5ä>§ïhéè $Ø#éìsè]´˜«gOıdèË|æÍµ³Eº\0‰Ğé9Í/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0ĞÌH”H\0\0ì\0\0\r\0\0\0xl/styles.xml¤”M‹Û0†ï…ş¡»#ÇM¶I°½d\rÛRH\n½*¶ìˆÕ‡‘äÔiéïÈvœ„=´°k4\Z=zg4rüØJNÌX®U‚§“#¦r]pU%øû>YGUA…V,ÁgfñcúñClİY°İ‘1‡\0¡l‚ÎÕ+Bl~d’Ú‰®™‚•RILMElm-¬ß$‰ÂğHÊî	+™ÿDRóÚÔA®eM?pÁİ¹ca$óÕs¥´¡RÛéŒæv7yƒ—<7ÚêÒM\0GtYòœ½U¹$K¤4.µråºQjhÂêUéŸ*óKŞÙG¥±ı…NT€gŠI\ZçZhƒT„uE%ë#6Tğƒá>¬¤’‹sï¼£+æ\'9¤æÄë›¸£ªÈ\0G\ZCu3*ƒ	\Zìı¹†ã\\déâş]zFó›\r¤;0ÚĞ8×z\\\\i,Xé@¨áÕÑN×ğ=hç Êi\\pZiE˜¤‡Œ¤“3!v¾¹~”wì¶Dª‘™tÏE‚¡M}.&$2˜=¯Ÿxş-­g¿‹ÚòÄÙw¢Çã‘¿ïõ¯A@çth¸p\\İ»ôY´×„şœïì~õRv¨DÁJÚ·|µ¿°‚72\Z£¾ñ“v\"ÁWûÅßÔôÁŸÁZ÷b¡½`Dá	şı´ş¼Ü>eQ°×‹`ö‰Íƒå|½\ræ³Íz»Í–anşÜ<´w<³îwÆğ°VVÀc4C²CŠ»«/Á7“^~×£ ®ı’±ão*ı\0\0ÿÿ\0PK\0\0\0\0\0!\0ìûË¤\0\0a\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ“AoÛ0…ïöİ9IQ¬¢H;ä°aœ¶gM¦c¡²$ˆ¬‘ô×O¶‘ÆÙÚËnßÃÃ\'R·‡ÖfD4Şl>ËYNûÊ¸}Áwß¯¾±I¹JYï `G@v+¿~ÛèD2€YŠpX°†(¬8Gİ@«p–d—”ÚÇVQ:Æ=÷um4Ü{ıÚ‚#¾ÈóWAuŞÙ˜¸êèC+¯{>|ÚC–â.k´¢tKùÓèèÑ×”=4XÁ§¢Ht%è×hè(sÁ§GQjea‚e­,‚àç†Ø€ê‡¶U&¢­:Ğäc†æ-mÁ²ß\n¡Ç)X§¢QVoCmR”Ï>¾`@(x2ŒÍ¡œz§µ¹–ËÁŠKc0‚$áqgÈşª·*ÒÄË)ñÀ0ò8eÏ7Ÿò½“Òâsi$ŞjTâû‹híÛ ÜQ– \"foûùb¶ö1ø8¬Rğ“Gü0îÃÎß+‚Óz.›¢lT„*mô¤Ÿb“6m²n”ÛCuòü+ôéiü1r~=Ë—yz\'“àç¿!ÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\r8¥©K\0\0m\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’_OÃ ÅßMü\rÏ¶”U·IÚ.şÉ\\bbÆ7w±Ğpİ¾½´İjÍ|ğÎ¹?Î¹!]ìUìÀXYé‘(Fh^	©7z-–áÖ1-XYiÈĞ,Zä—)¯)¯<›ªã$ØÀ“´¥¼ÎĞÖ¹šblù³‘wh/®+£˜óG³Á5ãŸlxÇS¬À1ÁÃ-0¬\":\"õ—);€àJP Å$\"øÇëÀ(ûç@§ŒœJºCí;ãÙ‚÷âàŞ[9›¦‰š¤‹áóü¾zzéª†R·»â€òTpÊ\r0W™|	f\'Ë«`ÅîR<’Ú5–Ìº•ßøZ‚¸?œ¹ÏİUé\0øp´¯rRŞ’‡Çb‰òIL’0&a|]½™ÒdöÑø5ß†í/Ô1ÆˆÓ‚Ìi|KoÆÄ OñÙÉ¿\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0|l˜l\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0µU0#õ\0\0\0L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¥\0\0_rels/.relsPK-\0\0\0\0\0\0!\0Ş	ı(\0\0Ô\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0Ë\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r	\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0ûb¥m”\0\0§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0™\n\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0xl/worksheets/sheet2.xmlPK-\0\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô\0\0xl/worksheets/sheet3.xmlPK-\0\0\0\0\0\0!\0=#ÿ±p\0\0i\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Š\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\0î„A\0\0Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0ĞÌH”H\0\0ì\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0f\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0ìûË¤\0\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ù\Z\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0\r8¥©K\0\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0docProps/core.xmlPK\0\0\0\0\0\0\0\05 \0\0\0\0','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','Test1',1),(3,1,'PK\0\0\0\0\0!\0|l˜l\0\0 \0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ì”]KÃ0†ïÿCÉ­4Ù&ˆÈº]øq©çˆÍé\Z–&!\'›Û¿÷4û@¤nzÓĞæœ÷}’4ïp¼jL¶„€ÚÙ‚õye`K§´ìmú”ß²£´J\Zg¡`k@6]^§k˜Q·Å‚Õ1ú;!°¬¡‘ÈK3•Œô\ZfÂËr.g ½Ş(`c[\r6\Z>@%&f+ú¼!	`e÷›ÂÖ«`Ò{£K‰T,­úæ’o8u¦\Z¬µÇ+Â`¢Ó¡ùÙ`Û÷B[´‚l\"C|–\raˆ•.Ìß›óÃ\"”®ªt	Ê•‹†v€£ Ö\0±1<¼‘Úî¸ø§bièŸ¤]_>‘cğO8®ÿˆ#Òÿ\"=$IæÈ`\\À3¯v#zÌ¹–Ôk”gøª}ˆƒîÑ$8”(Nß…]d´İ¹\'!QÃ>4º.ßŞ‘ÒètÃo·Ú¼S :¼EÊ×Ñ\'\0\0\0ÿÿ\0PK\0\0\0\0\0!\0µU0#õ\0\0\0L\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’ÏNÃ0ÆïH¼CäûênH¡¥»LH»!TÀ$îµ£$@÷ö„‚JcÛÑöçÏ?[ŞîæiTb/NÃº(A±3b{×jx­ŸV b\"giÇ\ZaWİŞl_x¤”›b×û¨²‹‹\Zº”ü#b4Oñìr¥‘0QÊahÑ“¨eÜ”å=†¿P-<ÕÁj{ª>ú<ù²·4Mox/æ}b—NŒ@;ËvåCf©ÏÛ¨šBËIƒóœÓÉû\"c&Ú\\Oôÿ¶8q\"K‰ĞHàó<ßŠs@ëë.Ÿh©ø½Î<â§„áMdøaÁÅT_\0\0\0ÿÿ\0PK\0\0\0\0\0!\0Ş	ı(\0\0Ô\0\0\Z\0xl/_rels/workbook.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼“ÏjÃ0Æïƒ½ƒÑ}q’ne”:½ŒA¯[÷\0&QâĞÄ6–ö\'o?“Cº@É.¡ƒ$ü}?Ğ§ıá§ïÄjU%)´¥«ZÛ(ø8½><ƒ Ö¶Ò³¨`@‚Cq·ÃNsüD¦õ$¢Š%†Ùï¤¤Ò`¯)qmœÔ.ôšc\ZéuyÖ\rÊ<M·2üÕ€b¦)•‚p¬6 NƒÎÿk»ºnK|qåg–¯XÈoÎd9ŠêĞ +˜Z$ÇÉ&‰Ä ¯Ãä7†É—`²ÃdK0Û5aÈè€Õ;‡˜Bº¬jÖ^‚yZ†‡.†~\nõ’ıãšöO	/îc)ÇwÚ‡œİbñ\0\0ÿÿ\0PK\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0xl/workbook.xmlŒRMOÃ0½#ñ¢ÜYºvë`Z:	b„ÄçĞ¸k´4©’Œnÿ7Ó>8Ù_Ÿ_2›ï\ZM¾Àye\r§ÃAB	˜ÒJeÖœ¾/Ÿnn)ñA)´5Àé<×W³ÎºÍ§µ‚ÆsZ‡ĞNóe\rğÛ‚ÁNe]#–nÍ|ë@H_„F³4IrÖeèaêşÃa«J•ğ`Ëm&HhP¾¯Uëi1«”†Õa#\"ÚöE4¨{§)ÑÂ‡G©HNÇXÚ~¸m{¿U\Z»wY’QVœ–|uDB%¶:,q½#;ú•Ò4ï‘½+?_êK²ûPFÚÓ,Gk÷Çj‚ó»ØùP2ÔœæùùèÔºœN&£¤çfäÑ>#1q··ŞÒ!¾S(s7U˜¸…ö¿Ğé\Zó:ı] 1?¡£G,’£¤RèêC1\ZçiœÎ¥ø\0\0ÿÿ\0PK\0\0\0\0\0!\0ûb¥m”\0\0§\0\0\0\0\0xl/theme/theme1.xmlìYOoÛ6¿Øw tom\'¶uŠØ±›­MÄn‡i™–XS¢@ÒI}Úã€Ãºa—»í0l+Ğ»tŸ&[‡­úöHJ²ËKÒÖÕ‡D\"|ÿßã#uõÚƒˆ¡C\"$åqÛ«]®zˆÄ>Ó8h{w†ıK’\nÇcÌxLÚŞœHïÚÖûï]Å›*$A°>–›¸í…J%›•ŠôaËË<!1ÌM¸ˆ°‚WTÆİˆUÖªÕf%Â4öPŒ# {{2¡>ACMÒÛÊˆ÷¼ÆJêŸ‰&Mœ;Ö4BÎe—	tˆYÛ>c~4$”‡–\n&Ú^Õü¼ÊÖÕ\nŞL1µbma]ßüÒué‚ñtÍğÁ(gZë×[WvrúÀÔ2®×ëu{µœ`ßM­,EšõşF­“Ñ,€ìã2ínµQ­»øıõ%™[N§ÑJe±D\rÈ>Ö—ğÕf}{ÍÁÅ7–ğõÎv·ÛtğdñÍ%|ÿJ«Ywñ2\ZO—ĞÚ¡ı~J=‡L8Û-…o\0|£šÂ(ˆ†<º4‹	ÕªX‹ğ}.ú\0Ğ@†‘š\'d‚}ˆâ.F‚bÍ\0o\\˜±C¾\\\ZÒ¼ôMTÛû0Áz¯ÿêùSôêù“ã‡ÏştüèÑñÃ--gá.ƒâÂ—ß~öç×£?~óòñåxYÄÿúÃ\'¿üüy92h!Ñ‹/ŸüöìÉ‹¯>ıı»Ç%ğmGEøFD¢[äğt3†q%\'#q¾ÃSgv	é\nà­9fe¸qwW@ñ(^Ÿİwd„b¦h	çaä\0÷8g.J\rpCó*Xx8‹ƒræbVÄ`|XÆ»‹cÇµ½YU3JÇöİ8bî3+˜(¤çø”íîQêØuú‚K>QèELKM2¤#\'‹vi~™—é®vl³wu8+Óz‡ºHHÌJ„æ˜ñ:)•‘âˆ\r~«°LÈÁ\\øE\\O*ğt@G½1‘²lÍmúœ~C½*uû›G.R(:-£ys^Dîği7ÄQR†Ğ8,b?SQŒö¹*ƒïq7Cô;øÇ+İ}—Çİ§‚;4pDZˆ™‰_^\'Ü‰ßÁœM01UJºS©#\Zÿ]Ùfê¶åğ®l·½mØÄÊ’g÷D±^…û–è<‹÷	dÅòõ®B¿«ĞŞ[_¡WåòÅ×åE)†*­Ûk›Î;ZÙxO(c5gä¦4½·„\rhÜ‡A½Î:I~KBxÔ™\\ °YƒWQBœ@ß^ó4‘@¦¤‰.á¼h†Kik<ôşÊ6úb+‡ÄjíğºÎ9#U`Î´£uMà¬ÌÖ¯¤DA·×aVÓB™[ÍˆfŠ¢Ã-WY›ØœËÁä¹j0˜[:ıX¹	Ç~Í\ZÎ;˜‘±¶»õQæã…‹t‘ñ˜¤>Òz/û¨fœ”ÅÊ’\"ZúìxŠÕ\nÜZšìp;‹“Šìê+ØeŞ{/e¼ğP;™,.&\'‹ÑQÛk5Ö\ZòqÒö&pT†Ç(¯KİLbÀ}“¯„\rûS“ÙdùÂ›­L17	jpûaí¾¤°S!Õ–¡\r\r3•†\0‹5\'+ÿZÌzQ\n”T£³I±¾Áğ¯Ivt]K&â«¢³#Úvö5-¥|¦ˆ„ã#4b3q€Áı:TAŸ1•pãa*‚~ë9mm3åç4éŠ—bgÇ1KBœ–[¢Y&[¸)H¹æ­ èV*»Qîüª˜”¿ UŠaü?SEï\'p±>ÖğávX`¤3¥íq¡BU(	©ßĞ8˜ÚÑW¼0\rAwÔæ¿ ‡ú¿Í9KÃ¤5œ$Õ\r °©P²eÉDß)ÄjéŞeI²”‰¨‚¸2±bÈ!aC]›zo÷P¡nªIZîdü¹ïiİäóÍ©dùŞksàŸî|l2ƒRn6\rMfÿ\\Ä¼=Xìªv½Yí½EEôÄ¢ÍªgYÌ\n[A+Mû×áœ[­­XK\Z¯52áÀ‹Ë\ZÃ`Ş%p‘„ôØÿ¨ğ™ıà¡7Ô!?€ÚŠàû…&aQ}É6HH;8‚ÆÉÚ`Ò¤¬iÓÖI[-Û¬/¸ÓÍù0¶–ì,ş>§±óæÌeçäâE\Z;µ°ck;¶ÒÔàÙ“)\nC“ì cc¾”?fñÑ}pô|6˜1%M0Á§*¡‡˜<€ä·ÍÒ­¿\0\0\0ÿÿ\0PK\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0xl/worksheets/sheet2.xmlŒ’ÁjÃ0†ïƒ½ƒñ½qÚ­Û\Z’”A)ëa0Æ¶»ã(‰ilÛ]Û·Ÿ’2è¥7	IŸırº>™–ı‚ó\ZmÆçQÌX…¥¶uÆ¿¿¶³Î|¶”-ZÈø<_ç÷wéİŞ7\0ÁúŒ7!t‰^5`¤°K•\n‘RWß9å0dZ±ˆã\'a¤¶|$$îV•V°Au0`ÃqĞÊ@ú}£;?ÑŒºg¤Ûº™BÓ¢Ğ­çÊ™QÉ®¶èdÑÒŞ§ù£T{H®ğF+‡«NŒB¯w^‰• R–š6èmgªŒ¿Î¹ÈÓÁœ\rGÿ/f½×â¾/ìÊŒÇ}«¸êİ^8VB%møÄãèº	tØ%iïWHÊó¼\"ï-–—G72H¢v²†wéjm=k¡\Zº9s#&(Øõ³Ï„,04SÖĞu®GœUˆaJzµ—ÿ’ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0xl/worksheets/sheet3.xmlŒ’ÁjÃ0†ïƒ½ƒñ½qÚ­Û\Z’”A)ëa0Æ¶»ã(‰ilÛ]Û·Ÿ’2è¥7	IŸırº>™–ı‚ó\ZmÆçQÌX…¥¶uÆ¿¿¶³Î|¶”-ZÈø<_ç÷wéİŞ7\0ÁúŒ7!t‰^5`¤°K•\n‘RWß9å0dZ±ˆã\'a¤¶|$$îV•V°Au0`ÃqĞÊ@ú}£;?ÑŒºg¤Ûº™BÓ¢Ğ­çÊ™QÉ®¶èdÑÒŞ§ù£T{H®ğF+‡«NŒB¯w^‰• R–š6èmgªŒ¿Î¹ÈÓÁœ\rGÿ/f½×â¾/ìÊŒÇ}«¸êİ^8VB%møÄãèº	tØ%iïWHÊó¼\"ï-–—G72H¢v²†wéjm=k¡\Zº9s#&(Øõ³Ï„,04SÖĞu®GœUˆaJzµ—ÿ’ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0=#ÿ±p\0\0i\0\0\0\0\0xl/worksheets/sheet1.xml”U]¢0}ßdÿá}(¨¨d2êLv6™ìçs-\Z)%mı˜¿—VtMôE(§çôœÛö\Z?xéì¨TLTs7ğ|×¡)«ò¹ûû×ÛÓÔu”ÆUŠKQÑ¹ûI•ûœ|ıï…Ü¨‚Rí€B¥æn¡u=CH‘‚r¬<QÓ\nLH5eT-)N\r‰—hàûcÄ1«\\«0“÷hˆ,c„®ÙrZi+\"i‰5øW«ÕI“{ä8–›mıD¯AbÍJ¦?¨ëp2{Ï+!ñº„Ü‡`„ÉIÛ®ä9#R(‘iä5z9B¥$N$hÊîHšÍİ—pö\Zø.JbS ?ŒîUçİÑxı“–”hšÂ>¹NSÿµ›fâ;|2TtÅ}3õÿNJ3¼-õ±ÿFY^h	!Ok–~®¨\"POñac‚ˆ–‡_‡38¨>˜ç¥ºhØŞ$ğ£áTÈViÁÿ#İ‡G\"<OÄ‘7˜†A8†…şÃDved…5Nb)öœ\r˜­jÜœ´`vÓ9Xnæ¾„Pà]2\Z1Ú%1\"Çï BHeP¿-»ØoÕÅ-µÖßøcëo:nµŒïˆ´ş†}ìµ‹Z¬çaòˆ‡ÉÑÃ9õ\0\"­‡°]Ç`Ë.v®QÏCÓ0îŞ§éÑÃEÖˆÜôĞÅnxˆñY“I?ëDZQ[v±à|z…€Ûü@%`¶9²á9’İF¦õqq^–=ğ\"@ÓNÎÌi›Àš´­ÂŞ°\Zçô;–9«”SÒVó=Øiiû„y×¢6_á\"¬…†Û~\ZĞÒ)\\9ßƒ+	¡Oh\"¨ı“Hş\0\0ÿÿ\0PK\0\0\0\0\0!\0î„A\0\0Û\0\0\0\0\0xl/sharedStrings.xmll‘ËNÃ0E÷HüÃÈûÔ)B¡$!±(âQÄÚÄÓÄŒƒgLÛ¿Ç(¬¬.çŒî½ó¨Vûq€ì<Õj¹( µŞ:êjõ¶¹/.°²fğ„µ: «UszR1$-q­z‘éJkn{\r/ü„”:[F#©æ) ±Ü#Ê8è³²¼Ğ£q¤ õ‘$å+ˆä¾#Şşƒ¥j*vM%Í‹·†JKSé?2ÓMD¶æãçëœÜø}Üb¦ ¶~ü®ˆìœô$à	q/iwœ8÷\\›Ğæì5ä>§ïhéè $Ø#éìsè]´˜«gOıdèË|æÍµ³Eº\0‰Ğé9Í/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0ĞÌH”H\0\0ì\0\0\r\0\0\0xl/styles.xml¤”M‹Û0†ï…ş¡»#ÇM¶I°½d\rÛRH\n½*¶ìˆÕ‡‘äÔiéïÈvœ„=´°k4\Z=zg4rüØJNÌX®U‚§“#¦r]pU%øû>YGUA…V,ÁgfñcúñClİY°İ‘1‡\0¡l‚ÎÕ+Bl~d’Ú‰®™‚•RILMElm-¬ß$‰ÂğHÊî	+™ÿDRóÚÔA®eM?pÁİ¹ca$óÕs¥´¡RÛéŒæv7yƒ—<7ÚêÒM\0GtYòœ½U¹$K¤4.µråºQjhÂêUéŸ*óKŞÙG¥±ı…NT€gŠI\ZçZhƒT„uE%ë#6Tğƒá>¬¤’‹sï¼£+æ\'9¤æÄë›¸£ªÈ\0G\ZCu3*ƒ	\Zìı¹†ã\\déâş]zFó›\r¤;0ÚĞ8×z\\\\i,Xé@¨áÕÑN×ğ=hç Êi\\pZiE˜¤‡Œ¤“3!v¾¹~”wì¶Dª‘™tÏE‚¡M}.&$2˜=¯Ÿxş-­g¿‹ÚòÄÙw¢Çã‘¿ïõ¯A@çth¸p\\İ»ôY´×„şœïì~õRv¨DÁJÚ·|µ¿°‚72\Z£¾ñ“v\"ÁWûÅßÔôÁŸÁZ÷b¡½`Dá	şı´ş¼Ü>eQ°×‹`ö‰Íƒå|½\ræ³Íz»Í–anşÜ<´w<³îwÆğ°VVÀc4C²CŠ»«/Á7“^~×£ ®ı’±ão*ı\0\0ÿÿ\0PK\0\0\0\0\0!\0ìûË¤\0\0a\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ“AoÛ0…ïöİ9IQ¬¢H;ä°aœ¶gM¦c¡²$ˆ¬‘ô×O¶‘ÆÙÚËnßÃÃ\'R·‡ÖfD4Şl>ËYNûÊ¸}Áwß¯¾±I¹JYï `G@v+¿~ÛèD2€YŠpX°†(¬8Gİ@«p–d—”ÚÇVQ:Æ=÷um4Ü{ıÚ‚#¾ÈóWAuŞÙ˜¸êèC+¯{>|ÚC–â.k´¢tKùÓèèÑ×”=4XÁ§¢Ht%è×hè(sÁ§GQjea‚e­,‚àç†Ø€ê‡¶U&¢­:Ğäc†æ-mÁ²ß\n¡Ç)X§¢QVoCmR”Ï>¾`@(x2ŒÍ¡œz§µ¹–ËÁŠKc0‚$áqgÈşª·*ÒÄË)ñÀ0ò8eÏ7Ÿò½“Òâsi$ŞjTâû‹híÛ ÜQ– \"foûùb¶ö1ø8¬Rğ“Gü0îÃÎß+‚Óz.›¢lT„*mô¤Ÿb“6m²n”ÛCuòü+ôéiü1r~=Ë—yz\'“àç¿!ÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\r8¥©K\0\0m\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’_OÃ ÅßMü\rÏ¶”U·IÚ.şÉ\\bbÆ7w±Ğpİ¾½´İjÍ|ğÎ¹?Î¹!]ìUìÀXYé‘(Fh^	©7z-–áÖ1-XYiÈĞ,Zä—)¯)¯<›ªã$ØÀ“´¥¼ÎĞÖ¹šblù³‘wh/®+£˜óG³Á5ãŸlxÇS¬À1ÁÃ-0¬\":\"õ—);€àJP Å$\"øÇëÀ(ûç@§ŒœJºCí;ãÙ‚÷âàŞ[9›¦‰š¤‹áóü¾zzéª†R·»â€òTpÊ\r0W™|	f\'Ë«`ÅîR<’Ú5–Ìº•ßøZ‚¸?œ¹ÏİUé\0øp´¯rRŞ’‡Çb‰òIL’0&a|]½™ÒdöÑø5ß†í/Ô1ÆˆÓ‚Ìi|KoÆÄ OñÙÉ¿\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0|l˜l\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0µU0#õ\0\0\0L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¥\0\0_rels/.relsPK-\0\0\0\0\0\0!\0Ş	ı(\0\0Ô\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0Ë\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r	\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0ûb¥m”\0\0§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0™\n\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0xl/worksheets/sheet2.xmlPK-\0\0\0\0\0\0!\0~ÁŠå`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô\0\0xl/worksheets/sheet3.xmlPK-\0\0\0\0\0\0!\0=#ÿ±p\0\0i\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Š\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\0î„A\0\0Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0ĞÌH”H\0\0ì\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0f\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0ìûË¤\0\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ù\Z\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0\r8¥©K\0\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\0\0docProps/core.xmlPK\0\0\0\0\0\0\0\05 \0\0\0\0','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','Test1',1),(4,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','Test1',1),(5,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','test2',1),(6,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','Test1',2),(7,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','test3',2);
/*!40000 ALTER TABLE `resumescertificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorydetails`
--

DROP TABLE IF EXISTS `subcategorydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategorydetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `subcategoryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorydetails`
--

LOCK TABLES `subcategorydetails` WRITE;
/*!40000 ALTER TABLE `subcategorydetails` DISABLE KEYS */;
INSERT INTO `subcategorydetails` VALUES (1,1,'SUB CATEGORY'),(2,1,'SUB CATEGORY1'),(3,1,'SUB CATEGORY2'),(4,2,'SUB CATEGORY'),(5,2,'SUB CATEGORY1'),(6,3,'SUB CATEGORY');
/*!40000 ALTER TABLE `subcategorydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `gender` varchar(75) DEFAULT NULL,
  `address1` varchar(75) DEFAULT NULL,
  `address2` varchar(75) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `state` varchar(75) DEFAULT NULL,
  `postalCode` varchar(75) DEFAULT NULL,
  `country` varchar(75) DEFAULT NULL,
  `phoneNumber` varchar(75) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `male` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1001,'Marc','Fervil','M','601 Pawnee ln',NULL,'Naperville','Illinois','60563','USA','630-638-3201','mfervil@yahoo.com','2010-09-12 00:00:00',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_industry`
--

DROP TABLE IF EXISTS `user_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_industry` (
  `userIndustryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `industry_industryId` bigint(20) NOT NULL,
  `user_userId` bigint(20) NOT NULL,
  PRIMARY KEY (`userIndustryId`),
  KEY `industry_industryId` (`industry_industryId`),
  KEY `user_userId` (`user_userId`),
  CONSTRAINT `user_industry_ibfk_1` FOREIGN KEY (`industry_industryId`) REFERENCES `industry` (`industryId`),
  CONSTRAINT `user_industry_ibfk_2` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_industry`
--

LOCK TABLES `user_industry` WRITE;
/*!40000 ALTER TABLE `user_industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `user_profile_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NOT NULL,
  `company_of_highest_position` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hourly_rate` double NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `overview` varchar(255) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `skills_expertise` varchar(255) DEFAULT NULL,
  `summary_of_highest_position` varchar(255) DEFAULT NULL,
  `user_profile_type` int(11) NOT NULL,
  `user_user_id` bigint(20) NOT NULL,
  `coaching_category` int(11) NOT NULL,
  `coaching_subcategory` int(11) DEFAULT NULL,
  `industry_experience` int(11) DEFAULT NULL,
  `company_experience` varchar(75) DEFAULT NULL,
  `firstname` varchar(75) DEFAULT NULL,
  `lastname` varchar(75) DEFAULT NULL,
  `country` varchar(75) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`user_profile_id`),
  KEY `usrp_coaching_category_id_fk_idx` (`coaching_category`),
  CONSTRAINT `usrp_coaching_category_id_fk` FOREIGN KEY (`coaching_category`) REFERENCES `coaching_category` (`coaching_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.9700901105091781',40,'All my test keywords','2012-10-27 16:46:57','This is my test overview 111111111111111 1111111111111111111 11111111111111111111 1111111111111111111111 1111111111111111111   ',' $50 US. Dollars Per hour','This is my test ','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,1,NULL,NULL,'Marc',NULL,'1',NULL),(2,1,'Information Resources Inc','Marco','mfervil@searshc.com0.7471429012264647',40,'All my test keywords','2012-10-28 08:37:51','This is my test overview 222222222222 222222222222 222222222222222 2222222222222222  222222222222222222 22222222222222222222222   22222222222222222      2222222222222222 2222222222222222 22222222222222222222 222222222222 222222222222222222 ',' $50 US. Dollars Per hour','This is my test ','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,2,NULL,NULL,'Claude',NULL,'1',NULL),(3,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.5448189772039423',40,'All my test keywords','2012-10-28 08:37:59','This is my test overview 333333333333333333333333333333333333  333333333333333333333333   3333333333333333333333333    3333333333333333333333333333   333333333333333333333333333333   33333333333333333333333333333333    ',' $50 US. Dollars Per hour','This is my test service description','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,2,NULL,NULL,'MarcArthur',NULL,'2',NULL),(4,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.9461215823837887',40,'All my test keywords','2012-10-28 08:38:04','This is my test overview 444444444444444444444444444444444444 444444444444444444444444   4444444444444444444444444444  ',' $50 US. Dollars Per hour','This is my test service description','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,1,NULL,NULL,'Marco',NULL,'2',NULL),(5,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.39966577184653773',40,'All my test keywords','2012-10-28 08:38:09','This is my test overview 55555555555555555555555 5555555555555555555555 55555555555555555555555555 555555555555555555555555555       ',' $50 US. Dollars Per hour','This is my test service description','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,3,NULL,NULL,'Marco',NULL,'3',NULL),(6,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.9666374583399593',40,'All my test keywords','2012-10-28 08:38:13','This is my test overview 666666666666666666666   6666666666666666666666 666666666666666666666 6666666666666666666 6666666666666666 6 ',' $50 US. Dollars Per hour','This is my test service description','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,NULL,NULL,NULL,'Marc',NULL,'3',NULL),(7,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.9997509217915487',40,'All my test keywords','2012-10-28 08:38:17','This is my test overview 7777777777777777777777777 77777777777777777777777777777 7777777777777777777777777 7777777777777777777 7777777777777777777 ',' $50 US. Dollars Per hour','This is my test service description','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,2,NULL,NULL,'Marc',NULL,'1',NULL),(8,1,'Information Resources Inc','Marco','mfervil@yahoo.com0.12712534319661117',40,'All my test keywords','2012-10-28 08:38:22','This is my test overview 66666666666666666666666666 666666666666666666666666666 66666666666666666666666666 6666666666666666666666 66666666666666666666 66666666666666666666 666666666     55555555555555555555 ',' $50 US. Dollars Per hour','This is my test service description','This is all the skills expertise','This is the summary of Highest Description',1,1001,100,NULL,NULL,NULL,NULL,NULL,'2',NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activation_code` varchar(255) DEFAULT NULL,
  `activation_date` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'2012-10-28 16:36:10','2012-10-28 16:30:59','mfervil@yahoo.com','ecb6fdf35d3237ef035beb022581039a0dbfae8e','ROLE_USER','8ls8M1qLZU6vHZk','marc');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_experience`
--

DROP TABLE IF EXISTS `work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_experience` (
  `workExpUserId` bigint(20) NOT NULL,
  `jobTitle` varchar(75) DEFAULT NULL,
  `companyName` varchar(75) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `workExperienceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`workExperienceId`),
  KEY `workExpUserId` (`workExpUserId`),
  KEY `user_profile_id_we_fk_idx` (`user_profile_id`),
  CONSTRAINT `user_profile_id_we_fk` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`user_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `work_experience_ibfk_1` FOREIGN KEY (`workExpUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_experience`
--

LOCK TABLES `work_experience` WRITE;
/*!40000 ALTER TABLE `work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `package_info`
--

/*!50001 DROP TABLE IF EXISTS `package_info`*/;
/*!50001 DROP VIEW IF EXISTS `package_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `package_info` AS select `a`.`id` AS `id`,`a`.`packageName` AS `packageName`,`a`.`price` AS `price`,`a`.`optOutDays` AS `optOutDays`,`a`.`PROFILEID` AS `profileid`,count(`b`.`id`) AS `totalsold` from (`packagedetails` `a` left join `packages_sold` `b` on((`a`.`id` = `b`.`package_details_id`))) group by `a`.`packageName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-18  5:24:45
