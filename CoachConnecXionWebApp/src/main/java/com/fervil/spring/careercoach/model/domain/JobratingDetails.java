package com.fervil.spring.careercoach.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "JOBRATINGDETAILS")
public class JobratingDetails {
	private static final long serialVersionUID = -5527566248002296042L;
	@Id
	@Column(name = "ID")
	@GeneratedValue(generator="JOBRATINGDETAILS_id_seq")
	@SequenceGenerator(name="JOBRATINGDETAILS_id_seq", sequenceName="JOBRATINGDETAILS_ID" )
	private Integer Id;
	@Column(name = "CUSTOMERID")
	private Integer customerId;
	@Column(name = "PACKAGEID")
	private Integer packageId;
	@Column(name = "PROJECTNAME")
	private String projectName;
	@Column(name = "VENDORNAME")
	private String vendorName;
	@Column(name = "CLIENTNAME")
	private String clientName;
	@Column(name = "AWARDEDDATE")
	private String awardedDate;
	@Column(name = "COMMENTS"  , columnDefinition="TEXT")
	private String commentDetails;
	@Column(name = "QUALITY")
	private float qualityDetails;
	@Column(name = "EXPERIENCE")
	private float experienceDetails;
	@Column(name = "RESPONSE")
	private float responseDetails;
	@Column(name = "PROFESSIONALISM")
	private float professionalismDetails;
	@Column(name = "AVERAGERATING")
	private float averageRating;
	@Column(name = "RATINGDONE")
	private Integer ratingDone;
	@Column(name = "RATINGDATE")
	private String ratingDate;
	@Column(name = "CLIENTRESPONSE")
	private Integer clientResponse;
	@Column(name = "FEEDBACKS"  , columnDefinition="TEXT")
	private String feedBacks;

	@Column(name = "PAYMENTID")
	private long paymentId;


	@Column(name = "user_profile_id")
	private long vendorId;
	
	public long getVendorId() {
		return vendorId;
	}
	public void setVendorId(long vendorId) {
		this.vendorId = vendorId;
	}
	public String getFeedBacks() {
		return feedBacks;
	}
	public void setFeedBacks(String feedBacks) {
		this.feedBacks = feedBacks;
	}
	public Integer getClientResponse() {
		return clientResponse;
	}
	public void setClientResponse(Integer clientResponse) {
		this.clientResponse = clientResponse;
	}
	public String getRatingDate() {
		return ratingDate;
	}
	public void setRatingDate(String ratingDate) {
		this.ratingDate = ratingDate;
	}
	public Integer getRatingDone() {
		return ratingDone;
	}
	public void setRatingDone(Integer ratingDone) {
		this.ratingDone = ratingDone;
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
	
	
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getAwardedDate() {
		return awardedDate;
	}
	public void setAwardedDate(String awardedDate) {
		this.awardedDate = awardedDate;
	}
	public String getCommentDetails() {
		return commentDetails;
	}
	public void setCommentDetails(String commentDetails) {
		this.commentDetails = commentDetails;
	}
	public float getQualityDetails() {
		return qualityDetails;
	}
	public void setQualityDetails(float qualityDetails) {
		this.qualityDetails = qualityDetails;
	}
	public float getExperienceDetails() {
		return experienceDetails;
	}
	public void setExperienceDetails(float experienceDetails) {
		this.experienceDetails = experienceDetails;
	}
	public float getResponseDetails() {
		return responseDetails;
	}
	public void setResponseDetails(float responseDetails) {
		this.responseDetails = responseDetails;
	}
	public float getProfessionalismDetails() {
		return professionalismDetails;
	}
	public void setProfessionalismDetails(float professionalismDetails) {
		this.professionalismDetails = professionalismDetails;
	}
	public float getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(float averageRating) {
		this.averageRating = averageRating;
	}
	public long getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(long paymentId) {
		this.paymentId = paymentId;
	}
	public Integer getPackageId() {
		return packageId;
	}
	public void setPackageId(Integer packageId) {
		this.packageId = packageId;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	
	@Override
	public String toString() {
		return "JobratingDetails [Id=" + Id + ", customerId=" + customerId
				+ ", packageId=" + packageId + ", projectName=" + projectName
				+ ", vendorName=" + vendorName + ", clientName=" + clientName
				+ ", awardedDate=" + awardedDate + ", commentDetails="
				+ commentDetails + ", qualityDetails=" + qualityDetails
				+ ", experienceDetails=" + experienceDetails
				+ ", responseDetails=" + responseDetails
				+ ", professionalismDetails=" + professionalismDetails
				+ ", averageRating=" + averageRating + ", ratingDone="
				+ ratingDone + ", ratingDate=" + ratingDate
				+ ", clientResponse=" + clientResponse + ", feedBacks="
				+ feedBacks + ", paymentId=" + paymentId + ", vendorId="
				+ vendorId + "]";
	}

	
	
}
