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
	private String coachstyle;	
	private String coachstyleonline;	
	private String coachstyleinperson;	
	private String zipcode;
	
/////////    Added for Tutors    ///////////	
	private String gradelevel;
	private int maxrate;
	private String subject;

	public CoachSelection() {
		coachstyle = "coachstyleinperson";
	}
	
	
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
	public String getCoachstyleonline() {
		return coachstyleonline;
	}
	public void setCoachstyleonline(String coachstyleonline) {
		this.coachstyleonline = coachstyleonline;
	}
	public String getCoachstyleinperson() {
		return coachstyleinperson;
	}
	public void setCoachstyleinperson(String coachstyleinperson) {
		this.coachstyleinperson = coachstyleinperson;
	}
	/**
	 * @return the zipcode
	 */
	public String getZipcode() {
		return zipcode;
	}
	/**
	 * @param zipcode the zipcode to set
	 */
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	/**
	 * @return the coachstyle
	 */
	public String getCoachstyle() {
		return coachstyle;
	}
	/**
	 * @param coachstyle the coachstyle to set
	 */
	public void setCoachstyle(String coachstyle) {
		this.coachstyle = coachstyle;
	}

}
