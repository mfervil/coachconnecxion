package com.fervil.spring.careercoach.model.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Date;

@Entity
@Table(name = "CONTACTCOACH")
public class ContactCoach {

	int category;
	//String course;
	//String coachstyleonline;
	//String coachstyleinperson;
	//String gradelevel;
	int startmonth;
	int startday;
	int startyear;
	String zipcode;
	long userprofileid;
	String coachstylepreference;
	int daysavailable;
	int weeksavailable;
	String city;
	String state;
	String studentemail;
	String studentfirstname;
	int coachselected;
	
	@Column(name = "coachcase", nullable = false, columnDefinition="TEXT")
	private String coachcase=" ";
	

	@Column(name = "availability", nullable = false, columnDefinition="TEXT")
	String availability;

	@Column(name = "overview", nullable = false, columnDefinition="TEXT")
	String overview;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private long contactcoachid;

/*	
	@Column(name = "package_id", unique = true, nullable = false, precision = 10, scale = 0)
	public long getPackageId() {
		return packageId;
	}
	public void setPackageId(long packageId) {
		this.packageId = packageId;
	}
	
	@Column(name = "user_profile_id", nullable = false)
	public long getUser_profile_id() {
		return user_profile_id;
	}
	public void setUser_profile_id(long user_profile_id) {
		this.user_profile_id = user_profile_id;
	}
	
	@Column(name = "packageName", nullable = false, length = 75)
	public String getPackageName() {
		return packagename;
	}
	public void setPackageName(String packageName) {
		this.packagename = packageName;
	}
	
	@Column(name = "category")
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
	@Column(name = "subcCategory")
	public int getSubCategory() {
		return subcategory;
	}
	public void setSubCategory(int subCategory) {
		this.subcategory = subCategory;
	}

	@Column(name = "price")
	public double getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	@Column(name = "overview")
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	@Column(name = "packageDetail")
	public String getPackageDetails() {
		return packagedetails;
	}
	public void setPackageDetails(String packageDetails) {
		this.packagedetails = packageDetails;
	}

	@Column(name = "opt_out_days")
	public int getOpt_out_days() {
		return opt_out_days;
	}
	public void setOpt_out_days(int optOutDays) {
		this.opt_out_days = optOutDays;
	}
	
*/

	//@Column(name = "availability", nullable = false,  columnDefinition="TEXT")
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	@Column(name = "contactcoachid", unique = true, nullable = false, precision = 10, scale = 0)
	public long getContactcoachid() {
		return contactcoachid;
	}
	public void setContactcoachid(long contactcoachid) {
		this.contactcoachid = contactcoachid;
	}
	
	/*
	@Column(name = "course")
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	
	@Column(name = "coachstyleonline")
	public String getCoachstyleonline() {
		return coachstyleonline;
	}
	public void setCoachstyleonline(String coachstyleonline) {
		this.coachstyleonline = coachstyleonline;
	}
	@Column(name = "coachstyleinperson")
	public String getCoachstyleinperson() {
		return coachstyleinperson;
	}
	public void setCoachstyleinperson(String coachstyleinperson) {
		this.coachstyleinperson = coachstyleinperson;
	}
	
	@Column(name = "gradelevel")
	public String getGradelevel() {
		return gradelevel;
	}
	public void setGradelevel(String gradelevel) {
		this.gradelevel = gradelevel;
	}
	*/
	@Column(name = "startmonth")
	public int getStartmonth() {
		return startmonth;
	}
	public void setStartmonth(int startmonth) {
		this.startmonth = startmonth;
	}
	@Column(name = "startday")
	public int getStartday() {
		return startday;
	}
	public void setStartday(int startday) {
		this.startday = startday;
	}
	@Column(name = "startyear")
	public int getStartyear() {
		return startyear;
	}
	public void setStartyear(int startyear) {
		this.startyear = startyear;
	}

	@Column(name = "daysavailable")
	public int getDaysavailable() {
		return daysavailable;
	}
	public void setDaysavailable(int daysavailable) {
		this.daysavailable = daysavailable;
	}
	@Column(name = "weeksavailable")
	public int getWeeksavailable() {
		return weeksavailable;
	}
	public void setWeeksavailable(int weeksavailable) {
		this.weeksavailable = weeksavailable;
	}

	@Column(name = "category")
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	@Column(name = "zipcode")
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	@Column(name = "userprofileid")
	public long getUserprofileid() {
		return userprofileid;
	}
	public void setUserprofileid(long userprofileid) {
		this.userprofileid = userprofileid;
	}
	@Column(name = "coachstylepreference")
	public String getCoachstylepreference() {
		return coachstylepreference;
	}
	public void setCoachstylepreference(String coachstylepreference) {
		this.coachstylepreference = coachstylepreference;
	}
	public String getcoachcase() {
		return coachcase;
	}
	public void setcoachcase(String coachcase) {
		this.coachcase = coachcase;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStudentemail() {
		return studentemail;
	}
	public void setStudentemail(String studentemail) {
		this.studentemail = studentemail;
	}
	@Column(name = "coachselected")
	public int getcoachselected() {
		return coachselected;
	}
	public void setcoachselected(int coachselected) {
		this.coachselected = coachselected;
	}
	public String getStudentfirstname() {
		return studentfirstname;
	}
	public void setStudentfirstname(String studentfirstname) {
		this.studentfirstname = studentfirstname;
	}
}