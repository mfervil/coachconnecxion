package com.fervil.spring.careercoach.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EDUCATIONDETAILS")
public class EducationDetails {
	@Id  
	@Column(name = "ID")
	@GeneratedValue
	private Integer Id;
	@Column(name = "CUSTOMERID")
	private Integer customerId;
	@Column(name = "SCHOOLNAME")
	private String schoolName;
	@Column(name = "FROMDATE")
	private String fromDate;
	@Column(name = "TODATE")
	private String toDate;
	@Column(name = "GRADUATED")
	private Integer graduatedId;
	@Column(name = "CONCENTRATIONS")
	private String concentrationsName;
	@Column(name = "COUNTRY")
	private String countryName;
	@Column(name = "LOCATIONS")
	private String locationsName;
	@Column(name = "DEGREELEVEL")
	private String degreeLevel;
	@Column(name = "user_profile_id")
	private Long profileId;
	

	public String getDegreeLevel() {
		return degreeLevel;
	}

	public void setDegreeLevel(String degreeLevel) {
		this.degreeLevel = degreeLevel;
	}

	public Long getProfileId() {
		return profileId;
	}

	public void setProfileId(Long profileId) {
		this.profileId = profileId;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public Integer getGraduatedId() {
		return graduatedId;
	}

	public void setGraduatedId(Integer graduatedId) {
		this.graduatedId = graduatedId;
	}

	public String getConcentrationsName() {
		return concentrationsName;
	}

	public void setConcentrationsName(String concentrationsName) {
		this.concentrationsName = concentrationsName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getLocationsName() {
		return locationsName;
	}

	public void setLocationsName(String locationsName) {
		this.locationsName = locationsName;
	}

}
