package com.fervil.spring.careercoach.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REQUESTDETAILS")
public class RequestDetails {
	private static final long serialVersionUID = -5527566248002296042L;
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer Id;
	@Column(name = "CUSTOMERID")
	private Integer customerId;
	@Column(name = "REQUESTNAME")
	private String requestName;
	@Column(name = "DATEPOSTED")
	private String datePosted;
	@Column(name = "DESIREDRATE")
	private float desiredRate;
	@Column(name = "LOCATION")
	private String locationName;
	@Column(name = "DESIREDSTARTDATE")
	private String desiredstartDate;
	@Column(name = "REQUESTDETAILS" , columnDefinition="TEXT")
	private String requestDetails;
	@Column(name = "PROPOSALDESCRIPTION" , columnDefinition="TEXT")
	private String proposalDescription;
	@Column(name = "PROPOSEDHOURLYRATE")
	private float proposedhourlyrate;
	@Column(name = "COACHINGCATEGORYID")
	private Integer coachingcategoryId;

	public Integer getCoachingcategoryId() {
		return coachingcategoryId;
	}

	public void setCoachingcategoryId(Integer coachingcategoryId) {
		this.coachingcategoryId = coachingcategoryId;
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

	public String getRequestName() {
		return requestName;
	}

	public void setRequestName(String requestName) {
		this.requestName = requestName;
	}

	public String getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(String datePosted) {
		this.datePosted = datePosted;
	}

	public float getDesiredRate() {
		return desiredRate;
	}

	public void setDesiredRate(float desiredRate) {
		this.desiredRate = desiredRate;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getDesiredstartDate() {
		return desiredstartDate;
	}

	public void setDesiredstartDate(String desiredstartDate) {
		this.desiredstartDate = desiredstartDate;
	}

	public String getRequestDetails() {
		return requestDetails;
	}

	public void setRequestDetails(String requestDetails) {
		this.requestDetails = requestDetails;
	}

	public String getProposalDescription() {
		return proposalDescription;
	}

	public void setProposalDescription(String proposalDescription) {
		this.proposalDescription = proposalDescription;
	}

	public float getProposedhourlyrate() {
		return proposedhourlyrate;
	}

	public void setProposedhourlyrate(float proposedhourlyrate) {
		this.proposedhourlyrate = proposedhourlyrate;
	}

}
