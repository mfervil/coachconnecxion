package com.fervil.spring.careercoach.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EXPERIENCEDETAILS")
public class Experiencedetails {
	private static final long serialVersionUID = -5527566248002296042L;
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer Id;

	@Column(name = "CUSTOMERID")
	private Integer customerId;
	@Column(name = "EMPLOYER")
	private String employerName;  
	@Column(name = "LABEL")
	private String labelName;
	@Column(name = "COUNTRY")
	private String countryName;
	@Column(name = "LOCATION")
	private String locationName;
	@Column(name = "DESCRIPTION"  , columnDefinition="TEXT")
	private String descriptionDetails;
	@Column(name = "STARTDATE")
	private String startDate;
	@Column(name = "ENDDATE")
	private String endDate;
	@Column(name = "user_profile_id")
	private long profileId;
	
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	
	public long getProfileId() {
		return profileId;
	}
	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}
	
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getEmployerName() {
		return employerName;
	}
	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getDescriptionDetails() {
		return descriptionDetails;
	}
	public void setDescriptionDetails(String descriptionDetails) {
		this.descriptionDetails = descriptionDetails;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}
