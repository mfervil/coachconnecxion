package com.fervil.spring.careercoach.model.domain;

import java.io.OutputStream;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "USER_PROFILE")
public class UserProfile  implements Serializable {
	public UserProfile() {
		
	}	      

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long userProfileId;

	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
		
		OutputStream o = null;
		byte[] b = null;
		try{
				o.write(b);
			}
		catch(Exception e){}
		
	}
	
/*
	private String profilepicturestring;
	
	public String getProfilepicturestring() {
		return profilepicturestring;
	}

	public void setProfilepicturestring(Blob profilepicture) {
		
		String imgLen = String.valueOf(this.profilepicture);		
		
		byte [] rb = new byte[imgLen.length() ];
		String byteArray ="";
		
		try{
			int blobLength = (int) profilepicture.length();  
			byte[] blobAsBytes = profilepicture.getBytes(1, blobLength);			
			
			byteArray = new String(blobAsBytes );
		} catch (Exception e) {
			//No action required if empty string found.....
		}
		
		this.profilepicturestring = byteArray;
	}
*/
	
	private String phone;
	private String displayName;
	private int userProfileType;
	private long user_user_id;
	private int accountType;
	private String email;
	
	@Column(name = "gender")
	private String gender;
	@Column(name = "dobmonth")
	private int dobmonth;
	@Column(name = "dobday")
	private int dobday;
	@Column(name = "dobyear")
	private int dobyear;
	@Column(name = "experience")
	private int experience;
	@Column(name = "coachstyleonline")
	private String coachstyleonline;		
	public String getCoachstyleonline() {
		return coachstyleonline;
	}

	private String lvlelementary;
	private String lvljuniorhigh;
	private String lvlhighschool;
	private String lvlcollege;
	private String lvlprofessional;
	private String lvlleisure;
	
	
	public void setCoachstyleonline(String coachstyleonline) {
		this.coachstyleonline = coachstyleonline;
	}


	public String getCoachstyleinperson() {
		return coachstyleinperson;
	}


	public void setCoachstyleinperson(String coachstyleinperson) {
		this.coachstyleinperson = coachstyleinperson;
	}

	@Column(name = "coachstyleinperson")
	private String coachstyleinperson;		
	
	@Column(name = "profilepicturestring")
	private String profilepicturestring;
	
	@Column(name = "coachingcategory1")
	private int coachingcategory1 = -1;
	@Column(name = "coachingcategory2")
	private int coachingcategory2 = -1;
	@Column(name = "coachingcategory3")
	private int coachingcategory3 = -1;

	@Column(name = "industryfocus1")
	private int industryfocus1 = -1;
	@Column(name = "industryfocus2")
	private int industryfocus2 = -1;
	@Column(name = "industryfocus3")
	private int industryfocus3 = -1;

	@Column(name = "companyexperience1")
	private String companyexperience1;
	@Column(name = "companyexperience2")
	private String companyexperience2;
	@Column(name = "companyexperience3")
	private String companyexperience3;

	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getApartment() {
		return apartment;
	}


	public void setApartment(String apartment) {
		this.apartment = apartment;
	}

	@Column(name = "address")
	private String address;
	@Column(name = "apartment")
	private String apartment;
	
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


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	@Column(name = "city")
	private String city;
	@Column(name = "state")
	private String state;
	@Column(name = "zipcode")
	private String zipcode;
	
	
	public int getCoachingcategory1() {
		return coachingcategory1;
	}


	public void setCoachingcategory1(int coachingcategory1) {
		this.coachingcategory1 = coachingcategory1;
	}


	public int getCoachingcategory2() {
		return coachingcategory2;
	}


	public void setCoachingcategory2(int coachingcategory2) {
		this.coachingcategory2 = coachingcategory2;
	}


	public int getCoachingcategory3() {
		return coachingcategory3;
	}


	public void setCoachingcategory3(int coachingcategory3) {
		this.coachingcategory3 = coachingcategory3;
	}


	public int getIndustryfocus1() {
		return industryfocus1;
	}


	public void setIndustryfocus1(int industryfocus1) {
		this.industryfocus1 = industryfocus1;
	}


	public int getIndustryfocus2() {
		return industryfocus2;
	}


	public void setIndustryfocus2(int industryfocus2) {
		this.industryfocus2 = industryfocus2;
	}


	public int getIndustryfocus3() {
		return industryfocus3;
	}


	public void setIndustryfocus3(int industryfocus3) {
		this.industryfocus3 = industryfocus3;
	}


	public String getCompanyexperience1() {
		return companyexperience1;
	}


	public void setCompanyexperience1(String companyexperience1) {
		this.companyexperience1 = companyexperience1;
	}


	public String getCompanyexperience2() {
		return companyexperience2;
	}


	public void setCompanyexperience2(String companyexperience2) {
		this.companyexperience2 = companyexperience2;
	}


	public String getCompanyexperience3() {
		return companyexperience3;
	}


	public void setCompanyexperience3(String companyexperience3) {
		this.companyexperience3 = companyexperience3;
	}

	
	
	@Column(name = "overview", nullable = false,  columnDefinition="TEXT")
	private String overview=".";

	@Column(name = "serviceDescription", nullable = false, columnDefinition="TEXT")
	private String serviceDescription=".";

	@Column(name = "availability", nullable = false, columnDefinition="TEXT")
	private String availability=" ";
	
	@Column(name = "skillsExpertise", nullable = false, columnDefinition="TEXT")
	private String skillsExpertise=".";

	private String summaryOfHighestPosition;
	private String companyOfHighestPosition;
	private double hourlyrate;
	private String paymentTerms;

	@Column(name = "keywords", nullable = false, columnDefinition="TEXT")
	private String keywords=".";
	
	private Date modifiedDate;
	
	private int coaching_category;
	//private Integer coaching_subcategory;
	//private Integer industry_experience;
	private String company_experience;

	@Column(name = "firstname")
	private String firstname;
	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	@Column(name = "middleinitial")
	private String middleinitial;
	@Column(name = "lastname")
	private String lastname;

	private String language;
	private String countryname;
	
	public String getMiddleinitial() {
		return middleinitial;
	}


	public void setMiddleinitial(String middleinitial) {
		this.middleinitial = middleinitial;
	}
	
	@Column(name = "profilepicture")
	@Lob
	private Blob profilepicture;

	@Column(name = "profile_picture_type")
	private String profile_picture_type;
	
	@Column(name = "profile_picture_name")
	private String profile_picture_name;

	@Column(name = "video_url")
	private String video_url;
	
	@Column(name = "userProfileId", unique = true, nullable = false, precision = 10, scale = 0)
	public Long getUserProfileId() {
		return userProfileId;
	}

	
	public void setUserProfileId(Long userProfileId) {
		this.userProfileId = userProfileId;
	}	
	
	@Column(name = "disPlayName", nullable = false, length = 75)
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}	

	@Column(name = "user_profile_type", nullable = false)
	public int getUserProfileType (){
		return userProfileType;
	}
	
	public void setUserProfileType(int userProfileType){
		this.userProfileType = 	userProfileType;
	}
	
	@Column(name = "user_userId", nullable = false)
	public long getUser_userId (){
		return user_user_id;
	}
	
	
	public void setUser_userId(long user_userId){
		this.user_user_id = user_userId;
	}
	
	@Column(name = "accountType", nullable = false)
	public int getAccountType(){
		return accountType;
	}
	
	public void setAccountType(int accountType){
		this.accountType = accountType;
	}
	
	@Column(name = "email", nullable = false, length = 75)
	public String getEmail (){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getOverview(){
		return overview;
	}
	
	public void setOverview(String overview){
		this.overview = overview;
	}
	
	public String getServiceDescription(){
		return serviceDescription;
	}
	
	public void setServiceDescription(String serviceDescription){
		this.serviceDescription = serviceDescription;
	}
	
	public String getSkillsExpertise(){
		return skillsExpertise;
	}
	
	public void setSkillsExpertise(String skillsExpertise){
		this.skillsExpertise = skillsExpertise;
	}
	
	@Column(name = "TitleSummayOfhighestPosition", nullable = true, length = 75)
	public String getSummaryOfHighestPosition(){
		return summaryOfHighestPosition;
	}
	
	public void setSummaryOfHighestPosition(String summayOfhighestPosition){
		this.summaryOfHighestPosition = summayOfhighestPosition;
	}
	
	@Column(name = "companyOfHighestPosition", nullable = true, length = 75)
	public String getCompanyOfHighestPosition(){
		return companyOfHighestPosition;
	}
	
	public void setCompanyOfHighestPosition(String companyOfHighestPosition){
		this.companyOfHighestPosition = companyOfHighestPosition;
	}
	
	@Column(name = "hourlyrate", nullable = false)
	public double getHourlyrate(){
		return hourlyrate;
	}

	
	public void setHourlyrate (double hourlyrate){
		this.hourlyrate = hourlyrate;
	}
	
	@Column(name = "paymentTerms", nullable = false)
	public String getPaymentTerms(){
		return paymentTerms;
	}
	
	public void setPaymentTerms(String paymentTerms){
		this.paymentTerms = paymentTerms;
	}
	
	public String getKeywords(){
		return keywords;
	}
	
	public void setKeywords(String keywords){
		this.keywords = keywords;
	}
	
	@Column(name = "modifiedDate")
	public Date getModifiedDate(){
		return modifiedDate;
	}
	
	public void setModifiedDate(Date modifiedDate){
		this.modifiedDate = modifiedDate;
	}

/*	
	public void setCoaching_category(int coaching_category){
		this.coaching_category = coaching_category;
	}
	
	@Column(name = "coaching_category", nullable = false)
	public int getCoaching_category(){
		return coaching_category;
	}

	@Column(name = "coaching_subcategory")
	public int getCoaching_subcategory() {
		return coaching_subcategory;
	}


	public void setCoaching_subcategory(int coaching_subcategory) {
		this.coaching_subcategory = coaching_subcategory;
	}

	@Column(name = "industry_experience")
	public int getIndustry_experience() {
		return industry_experience;
	}


	public void setIndustry_experience(int industry_experience) {
		this.industry_experience = industry_experience;
	}
*/
	
	@Column(name = "company_experience")
	public String getCompany_experience() {
		return company_experience;
	}


	public void setCompany_experience(String company_experience) {
		this.company_experience = company_experience;
	}

	@Column(name = "firstname")
	public String getFirstName() {
		return firstname;
	}


	public void setFirstName(String firstname) {
		this.firstname = firstname;
	}

	@Column(name = "lastname")
	public String getLastName() {
		return lastname;
	}


	public void setLastName(String lastName) {
		this.lastname = lastName;
	}


	public String getProfilepicturestring() {

		return profilepicturestring;
		
		/*
		String imgLen = String.valueOf(this.profilepicture);		
		
		byte [] rb = new byte[imgLen.length() ];
		String byteArrayBlobString ="";
		
		try{
			int blobLength = (int) profilepicture.length();  
			byte[] blobAsBytes = profilepicture.getBytes(1, blobLength);			
			
			byteArrayBlobString = new String(blobAsBytes );
		} catch (Exception e) {
			//No action required if empty string found.....
		}
		byteArrayBlobString = "ZZZZZZZZ";
		
		return byteArrayBlobString;
		*/
	}

	public void setProfilepicturestring(String psprofilePictureString) {
		this.profilepicturestring = psprofilePictureString;
		
		//this.setProfilepicturestring(profilepicture);
	}	
	
	public void setProfilepicture(Blob psprofilepicture) {
		this.profilepicture = psprofilepicture;
		
		//this.setProfilepicturestring(profilepicture);
	}

	public Blob getProfilepicture(){
		return profilepicture;
	}
	
	public String getProfile_picture_type() {
		return profile_picture_type;
	}

	public void setProfile_picture_type(String profile_picture_type) {
		this.profile_picture_type = profile_picture_type;
	}

	public String getProfile_picture_name() {
		return profile_picture_name;
	}

	public void setProfile_picture_name(String profile_picture_name) {
		this.profile_picture_name = profile_picture_name;
	}

	/*
	public String getProfilePicture() throws Exception {
		String imgLen = String.valueOf(this.profilepicture);		
		
		byte [] rb = new byte[imgLen.length() ];
		String byteArray ="";
		
		int blobLength = (int) this.profilepicture.length();  
		byte[] blobAsBytes = this.profilepicture.getBytes(1, blobLength);			
			
		byteArray = new String(blobAsBytes );
		return byteArray;
		//return rb;
	}
	*/

	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCountryname() {
		return countryname;
	}

	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}

	@Override
	public String toString() {
		return "UserProfile [userProfileId=" + userProfileId + ", phone="
				+ phone + ", displayName=" + displayName + ", userProfileType="
				+ userProfileType + ", user_user_id=" + user_user_id
				+ ", accountType=" + accountType + ", email=" + email
				+ ", dobmonth=" + dobmonth + ", dobday=" + dobday
				+ ", dobyear=" + dobyear + ", profilepicturestring="
				+ profilepicturestring + ", coachingcategory1="
				+ coachingcategory1 + ", coachingcategory2="
				+ coachingcategory2 + ", coachingcategory3="
				+ coachingcategory3 + ", industryfocus1=" + industryfocus1
				+ ", industryfocus2=" + industryfocus2 + ", industryfocus3="
				+ industryfocus3 + ", companyexperience1=" + companyexperience1
				+ ", companyexperience2=" + companyexperience2
				+ ", companyexperience3=" + companyexperience3 + ", address="
				+ address + ", apartment=" + apartment + ", city=" + city
				+ ", state=" + state + ", zipcode=" + zipcode + ", overview="
				+ overview + ", serviceDescription=" + serviceDescription
				+ ", skillsExpertise=" + skillsExpertise
				+ ", summaryOfHighestPosition=" + summaryOfHighestPosition
				+ ", companyOfHighestPosition=" + companyOfHighestPosition
				+ ", hourlyrate=" + hourlyrate + ", paymentTerms="
				+ paymentTerms + ", keywords=" + keywords + ", modifiedDate="
				+ modifiedDate + ", coaching_category=" + coaching_category
				+ ", company_experience=" + company_experience + ", firstname="
				+ firstname + ", middleinitial=" + middleinitial
				+ ", lastname=" + lastname + ", language=" + language
				+ ", countryname=" + countryname + ", profilepicture="
				+ profilepicture + ", profile_picture_type="
				+ profile_picture_type + ", profile_picture_name="
				+ profile_picture_name + ", video_url=" + video_url + "]";
	}


	public int getDobmonth() {
		return dobmonth;
	}


	public void setDobmonth(int dobmonth) {
		this.dobmonth = dobmonth;
	}


	public int getDobday() {
		return dobday;
	}


	public void setDobday(int dobday) {
		this.dobday = dobday;
	}


	public int getDobyear() {
		return dobyear;
	}


	public void setDobyear(int dobyear) {
		this.dobyear = dobyear;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getExperience() {
		return experience;
	}


	public void setExperience(int experience) {
		this.experience = experience;
	}


	public String getLvlelementary() {
		return lvlelementary;
	}


	public void setLvlelementary(String lvlelementary) {
		this.lvlelementary = lvlelementary;
	}


	public String getLvljuniorhigh() {
		return lvljuniorhigh;
	}


	public void setLvljuniorhigh(String lvljuniorhigh) {
		this.lvljuniorhigh = lvljuniorhigh;
	}


	public String getLvlhighschool() {
		return lvlhighschool;
	}


	public void setLvlhighschool(String lvlhighschool) {
		this.lvlhighschool = lvlhighschool;
	}


	public String getLvlcollege() {
		return lvlcollege;
	}


	public void setLvlcollege(String lvlcollege) {
		this.lvlcollege = lvlcollege;
	}


	public String getLvlprofessional() {
		return lvlprofessional;
	}


	public String getLvlleisure() {
		return lvlleisure;
	}

	public long getUser_user_id() {
		return user_user_id;
	}


	public void setUser_user_id(long user_user_id) {
		this.user_user_id = user_user_id;
	}

	public void setLvlprofessional(String lvlprofessional) {
		this.lvlprofessional = lvlprofessional;
	}


	public void setLvlleisure(String lvlleisure) {
		this.lvlleisure = lvlleisure;
	}


	public String getAvailability() {
		return availability;
	}


	public void setAvailability(String availability) {
		this.availability = availability;
	}

}
