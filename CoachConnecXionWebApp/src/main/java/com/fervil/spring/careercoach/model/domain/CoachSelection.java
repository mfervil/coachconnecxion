package com.fervil.spring.careercoach.model.domain;

public class CoachSelection {

	private int coachingCategory;
	private String coachingcategoryname;
	private int coachingSubcategory;
	private int industryExperience;
	private String companyExperience;
	private String coachFirstName;
	private String coachLastName;
	private String city;
	private String state;

/////////    Added for Tutors    ///////////	
	private String gradelevel;
	private int maxrate;
	private String subject;
	
	public String getGradelevel() {
		return gradelevel;
	}
	public void setGradelevel(String gradelevel) {
		this.gradelevel = gradelevel;
	}
	public int getMaxrate() {
		return maxrate;
	}
	public void setMaxrate(int maxrate) {
		this.maxrate = maxrate;
	}
///////////////////////////////////////////
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public int getCoachingCategory() {
		return coachingCategory;
	}
	public void setCoachingCategory(int coachingCategory) {
		this.coachingCategory = coachingCategory;
	}
	public int getCoachingSubcategory() {
		return coachingSubcategory;
	}
	public void setCoachingSubcategory(int coachingSubcategory) {
		this.coachingSubcategory = coachingSubcategory;
	}
	public int getIndustryExperience() {
		return industryExperience;
	}
	public void setIndustryExperience(int industryExperience) {
		this.industryExperience = industryExperience;
	}
	public String getCompanyExperience() {
		return companyExperience;
	}
	public void setCompanyExperience(String companyExperience) {
		this.companyExperience = companyExperience;
	}
	public String getCoachFirstName() {
		return coachFirstName;
	}
	public void setCoachFirstName(String coachFirstName) {
		this.coachFirstName = coachFirstName;
	}
	public String getCoachLastName() {	
		return coachLastName;
	}
	public void setCoachLastName(String coachLastName) {
		this.coachLastName = coachLastName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCoachingcategoryname() {
		return coachingcategoryname;
	}
	public void setCoachingcategoryname(String coachingcategoryname) {
		this.coachingcategoryname = coachingcategoryname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
