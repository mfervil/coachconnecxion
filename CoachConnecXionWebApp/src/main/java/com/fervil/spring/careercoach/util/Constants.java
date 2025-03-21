package com.fervil.spring.careercoach.util;

public class Constants {

	public static final String UPLOAD_DIRECTORY = "CCUP";

	public static final String ERROR_MSG_KEY = "errorMessage";
	public static final String ERROR_MSG = "An error occurred while processing your request.  Please try again later";
	
	//Reset password string
	public static final String RESET_PLACE_HOLDER = "rrrresetttt";
	
	//Coaching Category Values
	public static final String ADD_ADHD_COACHES_CATEGORY_NAME = "ADD / ADHD Coaches";
	public static final int ADD_ADHD_COACHES_CATEGORY_ID = 1;
	public static final String BUSINESS_COACHES_CATEGORY_NAME = "Business Coaches";
	public static final int BUSINESS_COACHES_CATEGORY_ID = 2;
	public static final String CAREER_COACHES_CATEGORY_NAME = "Career Upgrade Coaches";
	public static final int CAREER_COACHES_CATEGORY_ID = 3;
	public static final String COLLEGE_PREP_CATEGORY_NAME = "College Prep. Testing Coaches";
	public static final int COLLEGE_PREP_CATEGORY_ID = 24;
	public static final String NUTRITION_COACHES_CATEGORY_NAME = "Diet / Nutrition / Weight Loss Coaches";
	public static final int NUTRITION_COACHES_CATEGORY_ID = 5;
	public static final String ENTREPRENEURSHIP_CATEGORY_NAME = "Entrepreneurship Coaches";
	public static final int ENTREPRENEURSHIP_CATEGORY_ID = 25;
	public static final String EXECUTIVE_MANAGEMENT_COACHES_CATEGORY_NAME = "Executive / Management Coaches";
	public static final int EXECUTIVE_MANAGEMENT_COACHES_CATEGORY_ID = 14;
	public static final String FAMILY_COACHES_CATEGORY_NAME = "Family Coaches";
	public static final int FAMILY_COACHES_CATEGORY_ID = 9;
	public static final String FINANCE_COACHES_CATEGORY_NAME = "Finance / Money Coaches";
	public static final int FINANCE_COACHES_CATEGORY_ID = 10;
	public static final String FITNESS_COACHES_CATEGORY_NAME = "Health / Fitness / Exercise Coaches";
	public static final int FITNESS_COACHES_CATEGORY_ID = 22;
	public static final String LEADERSHIP_CATEGORY_NAME = "Leadership Coaches";
	public static final int LEADERSHIP_CATEGORY_ID = 12;
	public static final String LIFE_COACHES_CATEGORY_NAME = "Life Coaches";
	public static final int LIFE_COACHES_CATEGORY_ID = 13;
	public static final String MOTIVATAIONAL_PERFORMANCE_CATEGORY_NAME = "Performance / Motivational Coaches";
	public static final int MOTIVATAIONAL_PERFORMANCE_CATEGORY_ID = 16;
	public static final String RELATIONSHIP_COACHES_CATEGORY_NAME = "Relationship / Couples Coaches";
	public static final int RELATIONSHIP_COACHES_CATEGORY_ID = 18;
	public static final String SALES_CATEGORY_NAME = "Sales Coaches";
	public static final int SALES_CATEGORY_ID = 20;
	public static final String TEAM_GROUP_CATEGORY_NAME = "Team Building and Group Coaches";
	public static final int TEAM_GROUP_CATEGORY_ID = 23;
	
	
	//Tutor Category Values
	public static final String ART_TUTOR_CATEGORY_NAME = "Art Tutor";
	public static final int ART_TUTOR_CATEGORY_ID = 1010;
	public static final String BUSINESS_TUTOR_CATEGORY_NAME = "Business Tutor";
	public static final int BUSINESS_TUTOR_CATEGORY_ID = 1020;
	public static final String COMMUNICATION_TUTOR_CATEGORY_NAME = "Communicaion/Presentation Tutor";
	public static final int COMMUNICATION_TUTOR_CATEGORY_ID = 1050;
	public static final String COMPUTER_BUSINESS_TUTOR_CATEGORY_NAME = "Computer Business Tutor";
	public static final int COMPUTER_BUSINESS_TUTOR_CATEGORY_ID = 1030;
	public static final String COMPUTER_PROGRAMMING_TUTOR_CATEGORY_NAME = "Computer Programming Tutor";
	public static final int COMPUTER_PROGRAMMING_TUTOR_CATEGORY_ID = 1040;
	public static final String ENGLISH_TUTOR_CATEGORY_NAME = "English/Reading/Writing Tutor";
	public static final int ENGLISH_TUTOR_CATEGORY_ID = 1060;
	public static final String HISTORY_TUTOR_CATEGORY_NAME = "History Tutor";
	public static final int HISTORY_TUTOR_CATEGORY_ID = 1070;
	public static final String HOMESCHOOL_TUTOR_CATEGORY_NAME = "Homeschool Tutor";
	public static final int HOMESCHOOL_TUTOR_CATEGORY_ID = 1080;
	public static final String LANGUAGE_TUTOR_CATEGORY_NAME = "Language Tutor";
	public static final int LANGUAGE_TUTOR_CATEGORY_ID = 1090;
	public static final String MATH_TUTOR_CATEGORY_NAME = "Math Tutor";
	public static final int MATH_TUTOR_CATEGORY_ID = 1100;
	public static final String MUSIC_TUTOR_CATEGORY_NAME = "Music Tutor";
	public static final int MUSIC_TUTOR_CATEGORY_ID = 1110;
	public static final String SCIENCE_TUTOR_CATEGORY_NAME = "Science Tutor";
	public static final int SCIENCE_TUTOR_CATEGORY_ID = 1120;
	public static final String SPECIAL_NEEDS_TUTOR_CATEGORY_NAME = "Special Needs (ADD/ADHD/etc...)";
	public static final int SPECIAL_NEEDS_TUTOR_CATEGORY_ID = 1130;
	public static final String TEST_PREP_TUTOR_CATEGORY_NAME = "Test Preperation Tutor";
	public static final int TEST_PREP_TUTOR_CATEGORY_ID = 1140;
	
	//Default Values
	public static final String COACHING_CATEGORY_NAME_SEPERATOR = "ZZZ";
	public static final String DEFAULT_URL_STRING = "null";
	public static final int DEFAULT_URL_NUMBER = -1;
	
	public static final String COACH_STYLE_IN_PERSON = "coachstyleinperson";
	public static final String COACH_STYLE_ONLINE = "coachstyleonline";
	
	public static final String JSON_URL = "https://www.zipwise.com/webservices/radius.php?key=7wntjyde93vph7m3&zip=zzzipcodeee&radius=50&format=json";
	
	public static final String CONTACT_STUDENT_DEV_ENV = "href='http://localhost:8080/CoachConnecXionWebApp-3/tutor/contact/contactstudent?ctt1=";
	public static final String CONTACT_STUDENT_PROD_ENV = "href='http://www.coachconnecxion.com/tutor/contact/contactstudent?ctt1=";

	public static final String CONTACT_STUDENT_USER_PROFILE_URL_DEV = "href='http://localhost:8080/CoachConnecXionWebApp-3/tutor/public/profile?profileId=";
	public static final String CONTACT_STUDENT_USER_PROFILE_URL_PROD = "href='http://www.coachconnecxion.com/tutor/public/profile?profileId=";

	public static final String CONTACT_COACH_CLIENT_DEV_ENV = "href='http://localhost:8080/CoachConnecXionWebApp-3/coach/contact/contactclient?ctt1=";
	public static final String CONTACT_COACH_CLIENT_PROD_ENV = "href='http://www.coachconnecxion.com/coach/contact/contactclient?ctt1=";

	public static final String CONTACT_COACH_CLIENT_USER_PROFILE_URL_DEV = "href='http://localhost:8080/CoachConnecXionWebApp-3/public/profile?profileId=";
	public static final String CONTACT_COACH_CLIENT_USER_PROFILE_URL_PROD = "href='http://www.coachconnecxion.com/public/profile?profileId=";
	
	
	public static final int COACH_USER_PROFILE_TYPE = 1;
	public static final int TUTOR_USER_PROFILE_TYPE = 2;
	public static final int COACH_CLIENT_USER_PROFILE_TYPE = 3;
	public static final int TUTOR_STUDENT_USER_PROFILE_TYPE = 4;
			
}
