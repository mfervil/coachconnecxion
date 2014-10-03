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
);

-- Account type:  Is it business or personal
-- Profile type -- Are you a coach or Need a coach 

CREATE TABLE `user_profile` (
  `userProfileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileType` smallint,
  `user_userId` bigint(20),
  `accountType` smallint, 
  `displayName` varchar(75) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `overview` varchar(1000) DEFAULT NULL,
  `serviceDescription` varchar(1000) DEFAULT NULL,
  `skillsExpertise` varchar(1000) DEFAULT NULL,
  `TitleSummayOfhighestPosition` varchar(75) DEFAULT NULL,
  `companyOfHighestPosition` varchar(75) DEFAULT NULL,
  `hourlyRate` bigint(20) DEFAULT NULL,
  `paymentTerms` varchar(500) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
   FOREIGN KEY (user_userId)
               REFERENCES user(userId),
   CONSTRAINT uc_Email UNIQUE (email, userProfileType, accountType),
  PRIMARY KEY (`userProfileId`)
);


CREATE TABLE `industry` (
  `industryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `industryName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`industryId`)
);

CREATE TABLE `user_industry` (
  `userIndustryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `industry_industryId` bigint(20) NOT NULL,
  `user_userId` bigint(20) NOT NULL,
   FOREIGN KEY (industry_industryId)
               REFERENCES industry(industryId),
   FOREIGN KEY (user_userId)
               REFERENCES user(userId),
  PRIMARY KEY (`userIndustryId`)
);

CREATE TABLE `feedback` (
  `feedbackId` bigint(20) NOT NULL AUTO_INCREMENT,
  `providerUserId` bigint(20) NOT NULL,
  `recepientUserId` bigint(20) NOT NULL,
  `ratings` smallint NOT NULL,
  `providerComment` varchar(1000) NOT NULL,	
   FOREIGN KEY (providerUserId)
               REFERENCES user(userId),
   FOREIGN KEY (recepientUserId)
               REFERENCES user(userId),
  PRIMARY KEY (`feedbackId`)
);


CREATE TABLE `work_experience` (
  `workExperienceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `workExpUserId` bigint(20) NOT NULL,
  `jobTitle` varchar(75) DEFAULT NULL,
  `companyName` varchar(75) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
   FOREIGN KEY (workExpUserId)
               REFERENCES user(userId),
  PRIMARY KEY (`workExperienceId`)
);

CREATE TABLE `education` (
  `educationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `educationUserId` bigint(20) NOT NULL,
  `schoolName` varchar(75) DEFAULT NULL,
  `majorOrProgram` varchar(75) DEFAULT NULL,
  `degree` varchar(75) DEFAULT NULL,
  `graduationDate` datetime DEFAULT NULL,
   FOREIGN KEY (educationUserId)
               REFERENCES user(userId),
  PRIMARY KEY (`educationId`)
);

drop table coaching_request;

CREATE TABLE `coaching_request` (
  `COACHING_REQUEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `CURRENT_POSITION` varchar(75) DEFAULT NULL,
  `CURRENT_COMPANY` varchar(75) DEFAULT NULL,
  `CAREER_CATEGORY` smallint NOT NULL,
  `COACHING_TYPE` smallint NOT NULL,
  `ROADBLOCKS` smallint NOT NULL,
  `COACHING_STYLE` smallint NOT NULL,
  `HOURS` varchar(75) DEFAULT NULL,
  `GOALS` varchar(1000) DEFAULT NULL,
  `SELECTED_COACHES`  varchar(75) DEFAULT NULL,
  `START_DATE`  datetime DEFAULT NULL, 
   FOREIGN KEY (USER_ID)
               REFERENCES user(userId),
  PRIMARY KEY (`COACHING_REQUEST_ID`)
);