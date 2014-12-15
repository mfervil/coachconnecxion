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
INSERT INTO `jobratingdetails` VALUES (1,2,'Feb 12,2013','TestingClient1','Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a companyâ??s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a companyâ??s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a companyâ??s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',1,1.8,1.6,2.45,2.25,'TestingProject1',1,'Mar-07-2013',1,'fdgfdg',1),(2,2.3,'Feb 12,2013','TestingClient2','Testing Testing ccccccccccccccccccccccccccccccccccccccccccc cccc cccccccccc cccccccccccc ccccc cccccccc cccccccc cccccccccccccccccccc ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',1,3.55,3.6,3.5,3.55,'TestingProject2',1,'Mar-07-2013',0,'Testing by chinna',2),(3,3,'Feb 12,2013','TestingClient3',NULL,1,2.5,4.5,1.55,3.45,'TestingProject3',0,'Mar-04-2013',0,'cHINNA tESTING pROJECT3',2),(4,0.3,'Feb 12,2013','TestingClient4',NULL,1,0.35,0.4,0.3,0.3,'TestingProject4',1,'Mar-13-2013',1,'Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.\r\nStarting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',3),(5,2.1,'Feb 12,2013','TestingClient5',NULL,1,1.65,3.6,0.6,2.6,'TestingProject5',1,'Mar-13-2013',1,'Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle. Starting to test by focusing on familiar problems is quick and powerful, but it can mislead us. Problems that are significant in one product (for example, polish in the look of the user interface in a commercial product) may be less significant in another context (say, an application developed for a company?s internal users). A product developed in one context (for example, one in which programmers perform lots of unit testing) might have avoided problems familiar to other us in other contexts (for example, one in which programmers are less diligent). Focusing on familiar problems might divert our attention away from other consistency principles that are more relevant to the task at hand. Perhaps most importantly, a premature search for bugs might distract us from a crucial task in the early stages of testing: a search for benefits and features that will help us to develop better ideas about value, risk, and coverage, and will inform deeper and more thoughtful testing.Note that any pattern of familiar problems must eventually reduce to one of the consistency heuristics; if it was a problem before, it was because the system was inconsistent with some oracle principle.',3);
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
INSERT INTO `resumescertificates` VALUES (1,1,'PK\0\0\0\0\0!\0	$���\0\0�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��MO�@��&��W�z0Ɣ����M��.C��~dg���JK���Z���2���3��J��<*kR�Oz,#m��,e�����E��Di\r�l\r�F�ˋ�t�\0#�6��\"w�9����:0t�[�E�[?�N�1~���piM\0�Pi���r1/C4^���C�,��_��R&�+��H��d�\\�CB��w�P���V������*�h\"|x�0����gV�5���i�y�$4����V\"e�ˤ9�B��A���)j���T(�y�>vw\Z�餶ث�v�(�SL���qW�U�DX��˿Q�w��4\ZS�^�	��0�F�\"м�\\�gsld�Y�dL�uH�����݂��c\Z9>(hVDۈ5��{����A���7�t�	\0\0��\0PK\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���JA���a�}7�\n\"���H�w\"����w̤ھ�� �P�^����O֛���;�<�aYՠ؛`G�kxm��PY�[��g\rGΰino�/<���<�1��ⳆA$>\"f3��\\�ȾT��I	S����������W����Y\rig�@��X6_�]7\Z~\nf��ˉ�ao�.b*lI�r�j)�,\Zl0�%��b�\n6�i���D�_���,	�	���|u�Z^t٢yǯ;!Y,}{�C��/h>\0\0��\0PK\0\0\0\0\0!\0|;�9\"\0\0�\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��MO�0��&�һV]�ٲ5٫���-Sh��t����\nʢ.Mf����I�Z��U�����q�\"�����=loO.Y�$m.+gA������T��!,M�QH�(XI�\\q���Zb�\Z�aG;_K\n�/x#Փ,�/�d�}?�e��h��7�)��m�g;���k��k�4��D�f2�/��w�������Bm�w�4������A�^�#�࣡�FkP���ܚ�Hx�����ȽAt�~9\'���ozW�nM���t���V�WkJ�lN�W���z���^�>\\�\0\0��\0PK\0\0\0\0\0!\0��W:\n\0\0{%\0\0\0\0\0word/document.xml�Z�n��}�(�!H\0/�-oJ[o�i =�iO��Y�E�8Ţe�S~#��/ɹ�,����ۍ A�,������n��/I,��͵I�{��~O�40�Ng׽�����\'r\'�P�&U׽��{?���w�Qh�\"Q��\"�G�,��E�e���<�T\"�D��f����T�xalx|���SfM����d�,�^�]����T\nYSc��#cgǉ��\";��tz�c�ػ�1׽¦�J��Z!Z2*���vÊ-r˕��X�U1t0i�leƷ�#���>#��ؿ���\ry��]bpo��Xm���g��$.�@�]E��㠿Ϙ*\"�E�C�ezM��z�osMӹ�����k��V\'�o��c:����|�f�s���i��6�(ݧHf�\'�`�q�\Z+\'14Z��2�7XLL����X�\06���^�u38�������T�k<����܆�wb�3	�<���G�C�b��v�C��C&H�����,gz��wǐ��Їr[�Ӎ?��sz��{�,3\'�yr�:l�C�F��2���0�2���d`��C\Z�oV\"7�>�>\\m�{8<����ъR3BCoRfU��ꍟ\n|�DK]��o+��G2!�[H13&_�D�J��.R��gmMJp~$�_�X`�Q8�W��)>I����&V��B�x�ցn׺ٖ��`�mH�)�R�X�q�@WC���KR�,BӚ���!z�њ\n�FHv��FH�pO�E�Pr�Ht���6V$*�@a���S2����-��B�W\Z���\\,T��v��P�^�1I���N�W�%��IDH���)$<��<zqʦ2Ft�Ul2�$�@�|#� ������m�˘�8�ɱ텯�Js���M��ës�?7����\'|��r ;bg7�;�_�eޠn�_�=��3kiY���SA��\0�Gu�\\�x�����9��z})�Q�#�Q���f��B�j,\'�yGo��\'��*�I�),*3I��,�R�_uB�Gj;������k��E���[�%PW��aӠ-�r &�\"���sB���E�SL��M�T_$�m�@�_!�Eh�h�(�yP�تX�s@����o��|+�#���	��UO����뇳���X�2���|u�#�q�sy��}t�>/ߟ�6] �͆_vVK��WϚڌ_\\���.��i�շ����f�`	;�2�3 13��Ԩ�mڌ��N\"A8���њ��]rwT1eg�)��FMj`4�D�K�/u��$�t����Qa����idfeҌ�5n0q�e�����H\0�P���i4]Y��Gb��U�g�����W��!�HL��>=�+�C�K��r��Bҕ^#lA&�? !�\n��t#@M����\"��t��:�.�F���e;F�� �	�:M⡦��V��Z�ʤ��:�{��F(\nn�G!h`V�U7��te7qM��������gi�)r�(xN�D�������\'���5�d�hU�&�*�362�����z��^���8:k���N̤Ss���� m$ɳ1S�`)$��ʤϗ���C�L�����\ZFwP]�PM�@��sR�5C����;Z�0S��&���ƁVx6 n�����\"׾tZ��q熫*W�@E[O�+u���ӳ����?WO6C+4e�l}�=^o��f��;v2�{.�����\'�Nqh�*�5�)����xUkG�Ŭ��U�M�v���g�۴O�J�r2Cp����$\n���`��9�ThL��kǣՔ_[��M�������#\r+�\0ݤh�<�,�\n�q���2n;c{q�\nt%�Ǆ��3pE�6\'�%l��-�dLT 1>!zKl����~�,������P��O�.Atx}��,\Zk��(��j1b\\�1�l=	|��\"�25.Ԉ���v�F��P�9���3��}v��/���\"�<~)�0V��?�����S����u˷�G��~p�,�E�8�}V)��*|�p��*9g��0T̚��)��dj>�UC�*�[vNc=����y����`F���;�2.Y��#kL�������0��Չ��?#�Y<��Q�40l���a=/G�X�ʥ�\r���z�.}��^�E��x��T�?\r�Mx\n�rb�x��ӿ�=�r,w+/2\ZH�!�-\\�~�fw���!j��H��i�e9�ߧ��󳋋�R�q��a�՛{c�����e��}�6��`��Z�:��:���ܭ��W���Sn	���c�_�OY�$p�ژ�Esxqz�Pޥ�fYmmo�͙dY�/�`����&�b�Bi��������ߌP�\Z\0ave1�� �x�\0ǽ�G\n~���7�ސO�(���L�>ly����.\r�t��@4��/?�e!�H,x����v���\0=A�iq7�	0\'�~˙,��sK�Z\\���˲��s���w{�=%�gtf�L>Ñ>�A\'	J��f�vZ7}M�TVwLh�AJ��7��P`x\\�\0��~>k/�	B��Tc��00j���\r�樘ǵ@5 /�=����?9�]A��g��\\r��\'\Z�������|��Y���˟\n���մ�4��P�>�ℷ�\Z�����T�pK)7^���xZ�Z�\'P�����Q�\0Z���S��4��(��?�;����\0\0��\0PK\0\0\0\0\0!\00�C)�\0\0�\0\0\0\0\0word/theme/theme1.xml�YOo�6��w toc\'v\Zu�ر�-M�n�i���P�@�I}��úa��m�a[�إ�4�:lЯ�GR��X^�6؊�>$���������!)O�^�r�C$�y@�����/�yH*��񄴽)�޵��߻��UDb�`}\"�qۋ�Jח���X^�)I`n�E���p)���li�V[]�1M<����\Z��O�P��6r�=���z�gb�Ig��u��S�eb���O������R�D۫����qu	�g��Z����o~ٺlAp�lx�pT0���+[}`j�����zA�\0�V�2�F���i�@�q�v�֬5\\|��ʜ̭N��le�X�ds���jcs����7����f����\r��W���+�Ն�7����`���g�Ș��J�\Z��j|��h(�K��D-����\0\rdX��iJ�؇(��x$(��:��;�˹!�I_�T��S1�������?E��?������?ZBΪm���U/������?�~����xY����\'���y5�g&΋/����ɋ�>���G�M�Ge���D�����3Vq%\'#q�����$�8��K�����)f�w9:ĵ��\nx}r�x����w���r�:\\TZaG�*�y8I�j�bR��c|XŻ�ǿ�I\nu3KG�nD1�NIB�s���\n��R��u���K>V�.EL+M2�#\'�f��i~�V��vl�{u8��z��H�\n�*���:�(W�☕\r~��J��T�e\\O*�tHG��HY��\0}KN��P�*ݾ˦���TѼ�9/#��A7�qZ��$*c?���qU��n��w�N��%��O��i�4=3��N���)cbJ\ru�V�4����(Tn���\n7��_?���m-ٛ�{U����B�w�<w���_���$�#��[Ի���8{���(�/�$Ϫ0h݋�F۴��®{L�)#7�i�%�=A�:s�$�),��Qg20pp��f\r\\}DU4�p\nM{��DB��%J��â������+{�l�C���]��=��5\n2F��hsF+��Y��\\Ɉ�n�ì��:3���E�[��6�9����`��&45Z!��*��5k8�`Fmw��-��\"�d>�z���n���ʜ\"Z��x��J�Z��p;����\Z���{/�<�P;��,)\'\'K�Q�k5���q���pN��8�K�Gb�e���\r�S��d�̛�\\17	�p�a�>��SR!���\r\r3��\0K4\'+�r�zQ\nTT��I����Ivt]K�c⫲�K#�v�5+�|��D�\Z�����~��O@%\\w���_�nN[�L��9K����q��g�V�h��n\nR!�y+��U�n�;�*&�/H�r��T��	�>��>\\\r�t��=.Tġ\n���\ZS; Z�~�!������P��9gi���C�ڧ!�#	B��,��;�X=ۻ,I�2UW�V�9$l�k���=A��j���;�{�A�P79�|s*Y�����;�̠�[�MC�ۿ�hf��]o��{oY=1k�\ZyV\0��V����5E8�Vk+֜���\\8���0X4D)�!!��?*|f�v�\ru����\"�x��A�@T_������q��6�4)kڬu�V�7��t�\'��%;���i�9s�9�x���,��ڎ-45x�d���8?�ǘ�d�/Y|t��&LIL�J`�& �-G�t�/\0\0\0��\0PK\0\0\0\0\0!\0�>qa�\0\0�	\0\0\0\0\0word/settings.xml�V[o�6~��`�y�$[�c!N����\"^�)��D�DxIYq�I1j5(V�I�|��st����	+M_E�EM0�EC�a}y�N���6�7�\n�W����ͯ�\\w��ƀ��\0��W��Yı���!}!$���Ő��:���VNk�$2�\"��s<K�˨���U��!���Jh�7V��=�q�	\Z�G�z͍�[��qc�)� �>�\Z��h�1�����h����=�>�N��E�Gܳ\nR�\Zk\rbԇ��/0i��%����ێ-���;\r�k�F�ھ��RH�2CX/X]|<p�PE���4�n���\n�&]!���H�h�D��C,b_\Zd0p�Ĕ���)F���4�*����=j�yDUi�����>\"�j�U)Q\rhk��4�5�Oa�Ф\nr��-k��ҷ?hp� O�[z\'\Zl=ky�����*8/!.�qC��\"\r��(.͙�-8_����7�Zm<��?��{`n-���x�x��i!M��1W�-%rG��#o�5~�X�h�	�����&�!I�l~�����b\'�J���1N����f����������/�ly9��Ȓt}5�Yަ�Q�o�ۤ��Y���f>�v�\'�Ũ�d�I�c:��|�X�r��tf9P�>󬰳�/us�O��\'�?�5b�\"h����XQ��;��°]𷜲�s:���[x��R���h��{KwH�^B�Ra�|z���\n�ߕh���)$}�si��x���]�U�8L�oX-o>�����t������Ѝ�O��V����._�CR�X�ꐮ\"JG��\'j���v��0�y3ǃ���md ���?�Th�@�4X1^.hy���2��\'�+�0S�\'��h�{A��p�G ��7$�}DC]����-\nG����\n��7����$\rC����\\����Ek^�Z$+,_Q\'\r2�]�^)���/]���@;�gV\r���;N�6%����P�[�9��w��\0\0\0��\0PK\0\0\0\0\0!\0�N\0\0�\0\0\0\0\0word/webSettings.xml���J1��;,��ٕ\"�t� R�\"��\0ivv�d�Lj�Ooڪ ^z�$�����@_���Щf^�\n�����S�/�ٍ�$�0O:�Q���b���gH����(AZ��ڦ[��n��)B(�#1�TJ�4\Z~�ř%�&���.��U]_�o��Qh��;�;��������l]�-��e�!2Y)��?yh\\�e��?�e\ZӼ,�O�Uڛ�xB�*�����Ɨs�P}��br�>aM|˔X������K��d�\0\0��\0PK\0\0\0\0\0!\0���(�\0\0^=\0\0\Z\0\0\0word/stylesWithEffects.xml��mS�8����}��CH���4�P�3m�60�Z����|~ p��V��;�wc�U�c�oW����һ�a�<�$2Z�����\'}=,����G�N���g����}�������^��K�SD��6��&���$�6<d�q(�D�r�{2���Zx|���?��LO�Oq\"=��@�b�K��\\ش&ck-��e�L&!K����,+��l���f��͓�p��:��\\���I#�=\\3�ZzyȣL\'	����8�\Z��)]z�\n�)��������!crp��-�bg�an�d�fP�yP��e�nqz�L�e���q�5��$d\"�f�����zR�_��֝X�v=Z[jY<;9�+�\ZZJ2�X��\r������C$�\n�����Q���w��,�T}Ln��c�I��YFY�l/X�	qVB�^F�p����2l����o�4�X�(|�N1�l>�`��f�+���g��g<:�_V=Y���\n�.\\�-/������n�*x��]��+8l�q!P1�	���l�f>����<�D\0X�,|��8h(��(6|��ߤ���e_,\\͂��7���	���}�V1�ᒇ��}�\ZD��>������}���󟟵<=�G�>�U���g��J&�t�T���a��\nG;���7�A���[\"�&�{)�TKs��� u>4SU�vI��7q6�ě�&t����p/`#34#�6*U�Oj&=S|�y8}�Q�jD��zG4��wD�FzG4J�wD�zG4�;�����tv���z���@-�;��\'{�n:P�V�ܲ�=$,�8������e��p�j9=\\,�Y\"�v�gF�;��{�&\n�\rK���@��Nm}�/���k�)�FLzc�������<q����(a��,�.�׹�i�&6��B�r{a�-��>��7��9����-��G��.ۍ���rj��s��4����):S)j���(T0!�vAA�G�o�ݾ�1�ӊ����4������/Yi���*jy��k�J2Y�A�z�aN^������}�H��+��|:����aꔜ���(�t�^l�X�I��ޔ9A5֌�\Z��Yt�\'��LmZ��^�w9���\0� ��g.��=��E󰔛�\\�rG;mYyXZQO��r<��@�: 4�@-�Ѿ�=�	,�,�.����s�2[���7�����^;�����\n9;�^f�&�5Z�D�Z�F{���J	��7� �@D4�x#@�74�x#@�Ż2�x#Xdm��ZoH�B�U߂��\0����]�7���i+ݿ܎ �\n9AM�FP��ioK�B��\Z�J�5�x#@�74�x#@�74�x#@�Ż2�x#Xdm��Zo�,ToH�Bц��W�oo����x#(����nR,r�j,+��~�RK7%�q��8�\0�#��8�\0\r�~�x�`���jjU� �<XPU� �6�o��x#(�5�A!g�&�V�,r�j,+������\0�WQ\"\ZG��#��8�\0\r�~�x�`���jjU� �<XPU� �6�o�F~�x#(�5�A!g�&�V�,r�j,+u�8�\0��,��~�\0�^E�4�#ވ��oh�x�C�o��\rVS��\0������\0��A������Ӗ\"��3(O5����$a�E����\'p����,#$[��G)���ӖA��*R�~ѧt*N�7	���r��0�q��^����C��B�z��8~f/1\\ى˓��\Z\\R���+@�N�\r\\*�������/U����T��z`�m�����Tq�ݞA������S�ڑݕ����t�ne�{uF���L���Y��#G�b��t.gi��<���s�~��|�p[��2����1�_� ���L��|��o�\'��L�d�ɰ}|��kO��r�:c>� ��$��O���%�:�����$�YזR���η����\0\0\0��\0PK\0\0\0\0\0!\0-��R\0\0�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��_k�0�����i��j����`{�mfbH��~�Em��{�Ϲ��s5��U��:Y��	Ah^�7z[-���gZ���P�84/��rn(�-��ڀ�\\H�Qn\n���P�߂b.	�um��h7�0��6�3B�X�g�y�[`l\":\"���V@p(���4I�׃U�ρN9��:�ق����;9��I�I#�O������\ZK��*s�)��|m�؝�n�%�<���Hj�X1�a�k	��p�t�Cv��f�4��c����_\"\n�i_�O�VTf$��$<���PrG	�lÝͷE���Č��9�(���?O�\0\0��\0PK\0\0\0\0\0!\0N#��;\0\0m:\0\0\0\0\0word/styles.xml���s�8��o����Ա���L�N���̴��N�e�cMq 7I��[�0!``7Ч�ڏV����H���Ǒ�Sf���ҟ�8�=�:T��ҿ��x����F$��t\"������o�����Yn\"�{` ���`�o�I�&�<��X�/t*x��Y,\\f��Xd?v�Q��T�V�2����_��(V�f��^�X&�O2�E��[��{kwkw:�L2���8r�b������a(VA�s�1/�����Ě���c�G�g�����:������o`�B����Ln/����,���G��ܻ;y��5)���t��ʇ\'R��<W��í}��� 7k�T���%���O-��l����ɽH$��{29�YU{���[k���Ev�:��&���o����p�]IE\0�\0��	I9b9��98[@����;;�bgtA\0����ڈC�@�\\�S����2\\x���7o.�2�3Hҥ��e�͕��\'��Η��M�U��w+��\\����}��/,z����� ����Lmڂ�D��\r q vh�{�nԨx�=r�bx�����p��	B�w�A3�Q�����|����&^7��;l,�{�>4\".7*YI�сK��8�_u��m�Ȣ����m�ȑ����m�Ȁ�����hķ�E#��-��UϢ9�ib_+I۾S����(5ޕ��m&ҭgk��]b�ڭ\r��(��˕�tr�;\"P���}�&�ӭ���z�~6p����;Sa/�K��O�09X®\"ȭ�B�y���E�����Vn��۹�a��n��[m����N[�}$���*�1�L�-��\'��%/ۍ������!�FN��3�\\C`���Ć�9�z��������O�+.|�6Ɣ��R�L������L����e+�{��ꑦׂ=w/t���.�ρ^yX�gp�����ĥ}�H,�3��|z�A\0��(yʎţ�2(�p8\nN6�/��do����\Zk�`\r�Z�-���Oe�T�r��;��-#\0%�����Ӧ\r=k�<*�2��Kr��h�G����#��\n4�2@�J!Ԓ�k��&�!Ë#�Ŗ岊aڑ�y�V��+#�M���e���B�n(�\05�&�N���u��\Z�nX-U�=FUM�8Ů�UP� x4�x@�74�x@�Ż2�xXlm(5�*�����_���M\0����]�Ѿ�/�#�7��PS�	vt�ě��W8�Pc�RG`�#��8�M\0�#��8�M\0�#��p�\'�[JM��7Ė�To_�h�A��Y��ś@a�)�\n;:5A-�;@5V)���I�����qj�&x4�x@�74�x@�Ż2�xXlm(5�*�[JPU�	 �6o���]�	v���M���S�R�,v�j�R�	,̗��M\0�+�q<\ZG�	�#��8�M\0\r�~�x�M`����Ԫx@ly(AU�&���pP�q��v�&P�j�7�NMPK�&����J�#��os�x@��3@8�8a\ZG�	�#��p�\'�[JM��7Ė�To��\rv�-�%oO��$u��~W8k	X8�]nd��d����bKzP]|�����{ޒ d�ZGJ��ܥS9�0_t�$�������4�aJ=�y���ǅ�x�=8�4)�I�;˭58 d�uG����%*�������������ۂ\n���\r��`�\0NDu��\r��$��^��ǎ<��w�����r�=٣��ocw�w�w�w������6;���K}=���#w�>\\&!x��f.��p������/����\ZɍqO��Xk������p�8��H�jgܥu�=O�]�������V<��4%�^זT���c����7�\0\0��\0PK\0\0\0\0\0!\0M����\0\0�\0\0\0\0\0word/fontTable.xml��Mn�0��z�������9�\Z見\"=\0MSQ�ڪo�)+#��J\0!��<�|x�/�)�*���!|�H���;��\r����{$D�v�x�\ZrR@^V�?=u�]���V6����)�)+`�{���`E�߰�V�߇�Nzۋ����x�%cd�	׸���R}��`����e��;�tg��\Z���]�T\0��5��\n�f^]Y-���.C�Dt��v�җ5�����w>��Av��jW�ŵ0zt*��yPkGa\Z�J�a�x�oŖ�I�� ;@��\"�r+�6��\n�ȅ^Gٝ��z(�@�p�-k�7�+7�ސ\n�����8T~��;�Y���`�\']�O����Ҝ4G�ě�\n�j(~z+�DJ��$��Hfy��|�k�����?n�F��cŧ�o\"�}�\'��!> 1�$F\"�e��H\\f�U3�w)	�����X�\0\0��\0PK\0\0\0\0\0!\0�p��\0\0�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�S�n�0��?�ǔ7p\r�A��mXI�[je�H�d��_ߥ�r�Su�}p9���NgG�AYS���34�6�����z�̳�4���*?a����|�C��F�P�݊� �A�Q�P����H��3۶J⽕/���Eq��5�i��q��|��:���X�����䈰�5vNCD�#�ѳ�Ǝ�1�kAתCQ���0�|{b��\0���M���l�|}\02��b>_��I�qN+	��ߕ�6�6f�Y\Z�ٴ��8;�/^œ(8����2D%�q���A|Jǈ�$h\\����K�o�z���1?��e�>�7-x�g?!`�ʏ��H��!�v!zQ��i6Ն��Ӷ)VA�Q/��Ɣ8P�]Cxh���?ȖS�=�����w�����s;���I����w��������%�\n�����No�^\'\'�xV�s ��n����7&%�#aC�>�$��6�u��Κ=6瞿�mO�[�bV����#���L�\0\0��\0PK-\0\0\0\0\0\0!\0	$���\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0|;�9\"\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0��W:\n\0\0{%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B	\0\0word/document.xmlPK-\0\0\0\0\0\0!\00�C)�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0�>qa�\0\0�	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\Z\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0�N\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0���(�\0\0^=\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/stylesWithEffects.xmlPK-\0\0\0\0\0\0!\0-��R\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\'\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0N#��;\0\0m:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,*\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0M����\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�1\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0�p��\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�3\0\0docProps/app.xmlPK\0\0\0\0\0\0	\0\0�6\0\0\0\0','application/vnd.openxmlformats-officedocument.wordprocessingml.document','Test1',1),(2,1,'PK\0\0\0\0\0!\0|l�l\0\0�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0̔]K�0���Cɭ4�&�Ⱥ]�q�����\Z�&!\'�ۿ�4�@�nz����}�4�p�jL����ق�y�e`K����m��߲��J\Zg�`k@6]^�k�Q�ł�1�;!����ȝK3����\Zf��r.g �ލ(��`c[\r6\Z>@%&f�+��!	`�e���֫`�{�K�T,���o8u�\Z���+�`�ӡ���`��B[��l\"C|�\ra��.�ߝ���\"���t	ʕ��v�� �\0�1<�������bi��]_>�c�O8���#��\"=$I��`\\�3�v#z̹��k�g��}����$8��(N߅]d�ݹ\'!Q�>4�.�ޑ��t�o�ڼS�:�E���\'\0\0\0��\0PK\0\0\0\0\0!\0�U0#�\0\0\0L\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N�0��H�C���nH���LH�!T�$����$@����Jc�����?[���iTb/Nú(A�3b{�jx��V�b\"gi�\Z�aW��l_x���b������\Z���#b4O��r��0Q�ahѓ�eܔ�=��P-<��j{�>�<���4Mox/�}b�N�@�;�v�Cf��ۨ�B�I�����\"c�&�\\O���8q\"K��H��<ߊs@��.�h����<⧄�Md�a��T_\0\0\0��\0PK\0\0\0\0\0!\0�	�(\0\0�\0\0\Z\0xl/_rels/workbook.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j�0���}q�ne�:��A�[�\0&Q���6��\'o?�C�@�.��$�}?Ч����j�U�%)���Z�(�8�><� ֶҝ��`@�Cq��Ns�D��$��%��襤�`�)qm��.��c\Z�uy�\r�<M�2�Հb�)���p�6 N����k��nK|q�g���X�o�d9��� +�Z$��&�� ���7�ɗ`��dK0�5a���;��B��j�^�yZ��.�~\n������O	/�c)�wڇ��b�\0\0��\0PK\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0xl/workbook.xml�RMO�0�#���Y�v�`Z:	b���иk�4���n�7�>8َ_��_2��\ZM��ye\r��AB	��Je֜�/�nn)�A)�5��<��W�κͧ���sZ��N�e\r��ۂ�Ne]#�n�|�@H_�F�4Ir�e�a���a�J��`�m&HhP��U�i1����a#\"��E4�{�)�G�HN�X�~�m{�U\Z�wY�QV��|uDB%�:,q�#;����4+�?_�K��PFڎ�,Gk��j����P2Ԝ����Ժ�N&���f��>#1q����!�S(s7U�������\Z�:��]�1?��G,���R���C1\Z�i�Ύ��\0\0��\0PK\0\0\0\0\0!\0�b�m�\0\0�\0\0\0\0\0xl/theme/theme1.xml�YOo�6��w tom\'�u�ر��M�n�i��XS�@�I}��úa���0l+��t�&[����HJ��K��ՇD\"|���#u�ڃ��C\"$�q۫]�z��>�8h{w��K�\n�c�xL�ޜH�����]ś*$A�>����J%����a��<!1�M����WT�݈U֪�f%�4�P�# {{2�>ACM��ʈ���J����&M�;��4B�e�	t�Y�>c~4$���\n&�^������\n�L1�bma]���u��t���(gZ��[Wvr���2���u{���`�M�,E���F���,���2�n�Q�����%�[�N��Je�D\r�>֗��f}{����7����v��t�d��%|�J�Yw�2\ZO��ڡ�~J=�L8�-�o\0|���(��<�4�	�ժX��}.�\0�@����\'d�}��.�F�b�\0o\\��C�\\\ZҼ��MT��0��z�����S�����ώ�t�����--g�.����~����?�~����xY����\'���y92h!ы/����ɋ�>����%�m�GE��FD�[��t3�q%\'#q��Sg�v	�\n�9fe�q�wW@�(^��wd�b�h	�a�\0�8g.J\rpC�*Xx8��r�bV�`|Xƻ�cǵ�YU3J��ݐ8b�3+��(�������Q��u���K>Q�ELKM2�#\'��vi~����vl�wu8+�z��HH�J���:�)���\r~��L��\\�E\\O*�t@G�1��l�m��~C�*u��G.R(:-�ys^D��i7�QR��8,b?�SQ���*��q7C�;��+�}��ݧ�;4pDZ����_^\'܉���M01UJ�S�#\Z�]�f���l��m��ʒg�D�^����<��	d����B����[_�W�����E)�*��k��;Z�xO(c5g�4���\rh܇A��:I~KBxԙ\\ �Y�WQB�@�^�4�@���.�h�Kik<��ʞ6�b+��j����Ύ9#U`δ�uM��֯�DA��aV�B��[͈f���-WY�؜���j0�[:�X�	�~�\Z�;������Q�ㅋt��>�z/��f���ʒ\"Z��x��\n�Z��p;�����+�e�{/e��P;��,.&\'��Q�k5�\Z�q��&pT��(�K�Lb�}���\r�S��d��L17	jp�a��S!���\r\r3��\0�5\'+�Z�zQ\n�T��I����Ivt]K&⫢�#�v�5-�|����#4b3q���:TA�1�p�a*�~��9mm3��4銗bg�1KB��[��Y&[�)H�� �V*�Q������ U�a�?SE�\'p�>���vX`�3��q�BU(	���8���W�0\rAw�� ����9Kä5�$�\r����P�e�D�)�j��eI�������2�b��!aC]�zo�P�n�IZ�d���i����ͩd��ks���|l2�Rn6\rMf�\\ļ=X�v�Y��EE�ĢͪgY�\n[A+M���[��XK\Z�52����\Z�`�%p���������7�!?�ڊ���&aQ}�6HH;8����`Ҥ�i��I[-۬/�����0���,�>�����e���E\Z;��ck;����ٓ)\nC�� cc��?f��}p�|6�1%M0��*����<���ҭ�\0\0\0��\0PK\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0xl/worksheets/sheet2.xml���j�0���qڭ�\Z��A)�a0ƶ��(�il�]۷���2�7	I��r�>�����\Zm��Q�X���uƿ����|���-Z��<_��w���7\0����7!t�^5`���K�\n���RW�9��0dZ���\'a��|$$�V�V�Au0`�q��@�}�;?ь�g����B��Э�ʙQɮ��d��ާ��T{H��F+��N�B�w^�� R���6�mg���ι����\rG�/f���/�ʌ�}����^8VB%m����	t�%i�WH���\"�-��G72H�v��w�jm=k�\Z��9s#&�(���τ,04S��u��G�U�aJz�����\0\0��\0PK\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0xl/worksheets/sheet3.xml���j�0���qڭ�\Z��A)�a0ƶ��(�il�]۷���2�7	I��r�>�����\Zm��Q�X���uƿ����|���-Z��<_��w���7\0����7!t�^5`���K�\n���RW�9��0dZ���\'a��|$$�V�V�Au0`�q��@�}�;?ь�g����B��Э�ʙQɮ��d��ާ��T{H��F+��N�B�w^�� R���6�mg���ι����\rG�/f���/�ʌ�}����^8VB%m����	t�%i�WH���\"�-��G72H�v��w�jm=k�\Z��9s#&�(���τ,04S��u��G�U�aJz�����\0\0��\0PK\0\0\0\0\0!\0=#��p\0\0i\0\0\0\0\0xl/worksheets/sheet1.xml�U]��0}�d��}(��d2�Lv6���s-\Z)%m����VtM�E(������\Z?x��TLTs7�|ס)��������u��U�KQѹ�I���|��ܨ�R�B��n�u=CH��r�<Q�\n�LH�5e�T-)N\r��h��c�1�\\�0��h�,c���rZi+\"i�5�W��I��{�8��m�D�Ab�J�?���p2{�+!�܇`��I���9#R(�i�5z�9B�$N$h��H��ݗp�\Z�.JbS�?��U���x����h��>�NS���f�;|2Tt�}3���NJ3�-���FY^h	!Ok�~��\"PO��ac����_�38�>�瞥�h��$��T�Vi���#��G\"<Ođ7��A8����Dved�5Nb)��\r��jܜ�`v�9Xn澄P�]2\Z1�%1\"�� BHeP��-��o��-�����c�o:n�������}쵋�Z��a����9��\0\"���]�`�.v�Q�C�0�ާ���E������nx��Y�I?�DZQ[v��|�z����@%`�9��9�ݎF��qq^�=�\"@�N��i������ް\Z��;�9��S�V�=�ii��yע6_�\"����~\Z��)\\9߃+�	�Oh\"���H�\0\0��\0PK\0\0\0\0\0!\0�A\0\0�\0\0\0\0\0xl/sharedStrings.xmll��N�0E�H�����)B�$!�(�Q����Đ��gLۿ�(��.���V�q��<�j�( ��:�j���/.��f���: �UszR1$-q�z��Jkn{\r/���:[F#���)���#�8賲�Уq����$�+��#����j*vM%͋��JKS�?2�MD�������}�b� �~������$�	q/iw�8�\\����5�>��h��$�#��s�]���gO�d��|�͵�E�\0���9�/\0\0\0��\0PK\0\0\0\0\0!\0��H�H\0\0�\0\0\r\0\0\0xl/styles.xml��M��0�����#�M�I���d\r�RH\n�*��Շ���i���v��=��k4\Z=zg4r��J�N�X�U���#�r]pU%��>YGUA�V,�gf�c��Cl�Y�ݑ1�\0�l����+Bl~d�ډ����RILMElm-��$����H��	+��DR���A�eM?p�ݹca$��s���R���v7y��<7���M\0GtY�U�$K�4.�r�Qjh��U�*�K��G����NT�g�I\Z�Zh�T�uE%�#6T���>����s�+�\'9���������\0G\ZCu3*�	\Z�����\\d����]z�F�\r�;0���8�z\\\\i,X�@���яN��=h��i\\pZiE������3!v��~�w�D���t�E��M}.&$2�=��x�-�g������w��㑿���A@�th�p\\���Y�������~�Rv�D�J��|����72\Z���v\"�W��������Z�b��`D��	������>eQ�׋`��̓�|�\r��z�͖an��<�w<��w���VV�c4C�C���/�7�^~ף �����o*�\0\0��\0PK\0\0\0\0\0!\0��ˤ\0\0a\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��Ao�0����9IQ���H;�a��gM�c��$�����O������n���\'R���fD4�l>�YN�ʸ}�w߯��I�JY�`G@v+�~��D2�Y�pX��(�8G�@�p�d����VQ:�=�um4�{�ڂ#���WAu�٘���C+�{>|�C��.k��tK�����ה=4X���Ht%��h�(s��GQjea��e�,���؀ꇶU&��:��c��-�m���\n��)X��Q�VoCmR��>�`@(x2�͡�z��������Kc0�$�qg����*���)��0�8e�7����si$��jT���h�۠�Q��\"fo��b��1�8�R�G�0����+��z.��lT�*m���b�6m�n��Cu��+��i�1r~=˗yz\'����!�\0\0\0��\0PK\0\0\0\0\0!\0\r8��K\0\0m\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��_O� ��M�\r϶�U�I�.�ɞ\\bb��7w��pݾ���j�|�ι?ι!]�U��XY��(Fh^	�7z-���1-XYi��,Z�)�)�<���$��������ֹ�bl���wh/�+���G��5�lx�S��1��-0�\":\"���);��JP���$\"����(��@���J�C�;�ق����[9����������zz骆R����Tp�\r0W�|	f\'˫`��R<��5�̺���Z��?�����U�\0�p��rRޒ��b��IL�0&a|]����d���5߆�/�1��ӂ�i|Ko�� O��ɿ\0\0��\0PK-\0\0\0\0\0\0!\0|l�l\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�U0#�\0\0\0L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�	�(\0\0�\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r	\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0�b�m�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\n\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0xl/worksheets/sheet2.xmlPK-\0\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/worksheets/sheet3.xmlPK-\0\0\0\0\0\0!\0=#��p\0\0i\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\0�A\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0��H�H\0\0�\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0f\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0��ˤ\0\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\Z\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0\r8��K\0\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0docProps/core.xmlPK\0\0\0\0\0\0\0\05 \0\0\0\0','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','Test1',1),(3,1,'PK\0\0\0\0\0!\0|l�l\0\0�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0̔]K�0���Cɭ4�&�Ⱥ]�q�����\Z�&!\'�ۿ�4�@�nz����}�4�p�jL����ق�y�e`K����m��߲��J\Zg�`k@6]^�k�Q�ł�1�;!����ȝK3����\Zf��r.g �ލ(��`c[\r6\Z>@%&f�+��!	`�e���֫`�{�K�T,���o8u�\Z���+�`�ӡ���`��B[��l\"C|�\ra��.�ߝ���\"���t	ʕ��v�� �\0�1<�������bi��]_>�c�O8���#��\"=$I��`\\�3�v#z̹��k�g��}����$8��(N߅]d�ݹ\'!Q�>4�.�ޑ��t�o�ڼS�:�E���\'\0\0\0��\0PK\0\0\0\0\0!\0�U0#�\0\0\0L\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N�0��H�C���nH���LH�!T�$����$@����Jc�����?[���iTb/Nú(A�3b{�jx��V�b\"gi�\Z�aW��l_x���b������\Z���#b4O��r��0Q�ahѓ�eܔ�=��P-<��j{�>�<���4Mox/�}b�N�@�;�v�Cf��ۨ�B�I�����\"c�&�\\O���8q\"K��H��<ߊs@��.�h����<⧄�Md�a��T_\0\0\0��\0PK\0\0\0\0\0!\0�	�(\0\0�\0\0\Z\0xl/_rels/workbook.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j�0���}q�ne�:��A�[�\0&Q���6��\'o?�C�@�.��$�}?Ч����j�U�%)���Z�(�8�><� ֶҝ��`@�Cq��Ns�D��$��%��襤�`�)qm��.��c\Z�uy�\r�<M�2�Հb�)���p�6 N����k��nK|q�g���X�o�d9��� +�Z$��&�� ���7�ɗ`��dK0�5a���;��B��j�^�yZ��.�~\n������O	/�c)�wڇ��b�\0\0��\0PK\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0xl/workbook.xml�RMO�0�#���Y�v�`Z:	b���иk�4���n�7�>8َ_��_2��\ZM��ye\r��AB	��Je֜�/�nn)�A)�5��<��W�κͧ���sZ��N�e\r��ۂ�Ne]#�n�|�@H_�F�4Ir�e�a���a�J��`�m&HhP��U�i1����a#\"��E4�{�)�G�HN�X�~�m{�U\Z�wY�QV��|uDB%�:,q�#;����4+�?_�K��PFڎ�,Gk��j����P2Ԝ����Ժ�N&���f��>#1q����!�S(s7U�������\Z�:��]�1?��G,���R���C1\Z�i�Ύ��\0\0��\0PK\0\0\0\0\0!\0�b�m�\0\0�\0\0\0\0\0xl/theme/theme1.xml�YOo�6��w tom\'�u�ر��M�n�i��XS�@�I}��úa���0l+��t�&[����HJ��K��ՇD\"|���#u�ڃ��C\"$�q۫]�z��>�8h{w��K�\n�c�xL�ޜH�����]ś*$A�>����J%����a��<!1�M����WT�݈U֪�f%�4�P�# {{2�>ACM��ʈ���J����&M�;��4B�e�	t�Y�>c~4$���\n&�^������\n�L1�bma]���u��t���(gZ��[Wvr���2���u{���`�M�,E���F���,���2�n�Q�����%�[�N��Je�D\r�>֗��f}{����7����v��t�d��%|�J�Yw�2\ZO��ڡ�~J=�L8�-�o\0|���(��<�4�	�ժX��}.�\0�@����\'d�}��.�F�b�\0o\\��C�\\\ZҼ��MT��0��z�����S�����ώ�t�����--g�.����~����?�~����xY����\'���y92h!ы/����ɋ�>����%�m�GE��FD�[��t3�q%\'#q��Sg�v	�\n�9fe�q�wW@�(^��wd�b�h	�a�\0�8g.J\rpC�*Xx8��r�bV�`|Xƻ�cǵ�YU3J��ݐ8b�3+��(�������Q��u���K>Q�ELKM2�#\'��vi~����vl�wu8+�z��HH�J���:�)���\r~��L��\\�E\\O*�t@G�1��l�m��~C�*u��G.R(:-�ys^D��i7�QR��8,b?�SQ���*��q7C�;��+�}��ݧ�;4pDZ����_^\'܉���M01UJ�S�#\Z�]�f���l��m��ʒg�D�^����<��	d����B����[_�W�����E)�*��k��;Z�xO(c5g�4���\rh܇A��:I~KBxԙ\\ �Y�WQB�@�^�4�@���.�h�Kik<��ʞ6�b+��j����Ύ9#U`δ�uM��֯�DA��aV�B��[͈f���-WY�؜���j0�[:�X�	�~�\Z�;������Q�ㅋt��>�z/��f���ʒ\"Z��x��\n�Z��p;�����+�e�{/e��P;��,.&\'��Q�k5�\Z�q��&pT��(�K�Lb�}���\r�S��d��L17	jp�a��S!���\r\r3��\0�5\'+�Z�zQ\n�T��I����Ivt]K&⫢�#�v�5-�|����#4b3q���:TA�1�p�a*�~��9mm3��4銗bg�1KB��[��Y&[�)H�� �V*�Q������ U�a�?SE�\'p�>���vX`�3��q�BU(	���8���W�0\rAw�� ����9Kä5�$�\r����P�e�D�)�j��eI�������2�b��!aC]�zo�P�n�IZ�d���i����ͩd��ks���|l2�Rn6\rMf�\\ļ=X�v�Y��EE�ĢͪgY�\n[A+M���[��XK\Z�52����\Z�`�%p���������7�!?�ڊ���&aQ}�6HH;8����`Ҥ�i��I[-۬/�����0���,�>�����e���E\Z;��ck;����ٓ)\nC�� cc��?f��}p�|6�1%M0��*����<���ҭ�\0\0\0��\0PK\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0xl/worksheets/sheet2.xml���j�0���qڭ�\Z��A)�a0ƶ��(�il�]۷���2�7	I��r�>�����\Zm��Q�X���uƿ����|���-Z��<_��w���7\0����7!t�^5`���K�\n���RW�9��0dZ���\'a��|$$�V�V�Au0`�q��@�}�;?ь�g����B��Э�ʙQɮ��d��ާ��T{H��F+��N�B�w^�� R���6�mg���ι����\rG�/f���/�ʌ�}����^8VB%m����	t�%i�WH���\"�-��G72H�v��w�jm=k�\Z��9s#&�(���τ,04S��u��G�U�aJz�����\0\0��\0PK\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0xl/worksheets/sheet3.xml���j�0���qڭ�\Z��A)�a0ƶ��(�il�]۷���2�7	I��r�>�����\Zm��Q�X���uƿ����|���-Z��<_��w���7\0����7!t�^5`���K�\n���RW�9��0dZ���\'a��|$$�V�V�Au0`�q��@�}�;?ь�g����B��Э�ʙQɮ��d��ާ��T{H��F+��N�B�w^�� R���6�mg���ι����\rG�/f���/�ʌ�}����^8VB%m����	t�%i�WH���\"�-��G72H�v��w�jm=k�\Z��9s#&�(���τ,04S��u��G�U�aJz�����\0\0��\0PK\0\0\0\0\0!\0=#��p\0\0i\0\0\0\0\0xl/worksheets/sheet1.xml�U]��0}�d��}(��d2�Lv6���s-\Z)%m����VtM�E(������\Z?x��TLTs7�|ס)��������u��U�KQѹ�I���|��ܨ�R�B��n�u=CH��r�<Q�\n�LH�5e�T-)N\r��h��c�1�\\�0��h�,c���rZi+\"i�5�W��I��{�8��m�D�Ab�J�?���p2{�+!�܇`��I���9#R(�i�5z�9B�$N$h��H��ݗp�\Z�.JbS�?��U���x����h��>�NS���f�;|2Tt�}3���NJ3�-���FY^h	!Ok�~��\"PO��ac����_�38�>�瞥�h��$��T�Vi���#��G\"<Ođ7��A8����Dved�5Nb)��\r��jܜ�`v�9Xn澄P�]2\Z1�%1\"�� BHeP��-��o��-�����c�o:n�������}쵋�Z��a����9��\0\"���]�`�.v�Q�C�0�ާ���E������nx��Y�I?�DZQ[v��|�z����@%`�9��9�ݎF��qq^�=�\"@�N��i������ް\Z��;�9��S�V�=�ii��yע6_�\"����~\Z��)\\9߃+�	�Oh\"���H�\0\0��\0PK\0\0\0\0\0!\0�A\0\0�\0\0\0\0\0xl/sharedStrings.xmll��N�0E�H�����)B�$!�(�Q����Đ��gLۿ�(��.���V�q��<�j�( ��:�j���/.��f���: �UszR1$-q�z��Jkn{\r/���:[F#���)���#�8賲�Уq����$�+��#����j*vM%͋��JKS�?2�MD�������}�b� �~������$�	q/iw�8�\\����5�>��h��$�#��s�]���gO�d��|�͵�E�\0���9�/\0\0\0��\0PK\0\0\0\0\0!\0��H�H\0\0�\0\0\r\0\0\0xl/styles.xml��M��0�����#�M�I���d\r�RH\n�*��Շ���i���v��=��k4\Z=zg4r��J�N�X�U���#�r]pU%��>YGUA�V,�gf�c��Cl�Y�ݑ1�\0�l����+Bl~d�ډ����RILMElm-��$����H��	+��DR���A�eM?p�ݹca$��s���R���v7y��<7���M\0GtY�U�$K�4.�r�Qjh��U�*�K��G����NT�g�I\Z�Zh�T�uE%�#6T���>����s�+�\'9���������\0G\ZCu3*�	\Z�����\\d����]z�F�\r�;0���8�z\\\\i,X�@���яN��=h��i\\pZiE������3!v��~�w�D���t�E��M}.&$2�=��x�-�g������w��㑿���A@�th�p\\���Y�������~�Rv�D�J��|����72\Z���v\"�W��������Z�b��`D��	������>eQ�׋`��̓�|�\r��z�͖an��<�w<��w���VV�c4C�C���/�7�^~ף �����o*�\0\0��\0PK\0\0\0\0\0!\0��ˤ\0\0a\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��Ao�0����9IQ���H;�a��gM�c��$�����O������n���\'R���fD4�l>�YN�ʸ}�w߯��I�JY�`G@v+�~��D2�Y�pX��(�8G�@�p�d����VQ:�=�um4�{�ڂ#���WAu�٘���C+�{>|�C��.k��tK�����ה=4X���Ht%��h�(s��GQjea��e�,���؀ꇶU&��:��c��-�m���\n��)X��Q�VoCmR��>�`@(x2�͡�z��������Kc0�$�qg����*���)��0�8e�7����si$��jT���h�۠�Q��\"fo��b��1�8�R�G�0����+��z.��lT�*m���b�6m�n��Cu��+��i�1r~=˗yz\'����!�\0\0\0��\0PK\0\0\0\0\0!\0\r8��K\0\0m\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��_O� ��M�\r϶�U�I�.�ɞ\\bb��7w��pݾ���j�|�ι?ι!]�U��XY��(Fh^	�7z-���1-XYi��,Z�)�)�<���$��������ֹ�bl���wh/�+���G��5�lx�S��1��-0�\":\"���);��JP���$\"����(��@���J�C�;�ق����[9����������zz骆R����Tp�\r0W�|	f\'˫`��R<��5�̺���Z��?�����U�\0�p��rRޒ��b��IL�0&a|]����d���5߆�/�1��ӂ�i|Ko�� O��ɿ\0\0��\0PK-\0\0\0\0\0\0!\0|l�l\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�U0#�\0\0\0L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�	�(\0\0�\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0*g_\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r	\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0�b�m�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\n\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0xl/worksheets/sheet2.xmlPK-\0\0\0\0\0\0!\0~���`\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/worksheets/sheet3.xmlPK-\0\0\0\0\0\0!\0=#��p\0\0i\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\0�A\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0��H�H\0\0�\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0f\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0��ˤ\0\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\Z\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0\r8��K\0\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0docProps/core.xmlPK\0\0\0\0\0\0\0\05 \0\0\0\0','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','Test1',1),(4,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','Test1',1),(5,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','test2',1),(6,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','Test1',2),(7,1,'{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss\\fcharset0 MS Shell Dlg;}}\r\n{\\colortbl ;\\red0\\green0\\blue0;\\red255\\green255\\blue255;\\red59\\green182\\blue60;}\r\n\\viewkind4\\uc1\\pard\\cf1\\b\\f0\\fs17 Chat Log   C:\\\\Users\\\\mfervil\\\\Documents\\\\ChatLog Sears Mobile_ Sprint 1 Demp 2013_04_15 16_33.rtf\\b0\\par\r\n\\cf2\\par\r\n\\cf3\\b Jeff (to All - Entire Audience)\\b0 : \\cf1 ok\\cf0\\par\r\n}\r\n\0','application/msword','test3',2);
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
