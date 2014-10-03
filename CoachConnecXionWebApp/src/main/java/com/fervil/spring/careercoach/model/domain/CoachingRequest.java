package com.fervil.spring.careercoach.model.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "COACHING_REQUEST")
public class CoachingRequest  implements Serializable {
	public CoachingRequest() {
		
	}	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long COACHING_REQUEST_ID;
	
	private Long userId; 
	private String currentPosition;
	private String currentCompany;
	private Short careerCategory;
	
	private Short coachingType;
	private Short roadblocks;
	
	private Short coachingStyle;
	private String hours;
	private String goals;
	private String selectedCoaches;
	private Date startDate;

	private String request_name;
	private Date date_posted;
	private Long coaching_category_id;

	//private String requestTitle;
	//private String category;
	//private String subcategory;
	
/*	
	public String getRequestTitle() {
		return requestTitle;
	}

	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
*/	
	@Column(name = "Request_Name", length = 75)
	public String getRequest_name() {
		return request_name;
	}

	public void setRequest_name(String request_name) {
		this.request_name = request_name;
	}

	@Column(name = "date_posted", nullable = false)
	public Date getDate_posted() {
		return date_posted;
	}

	public void setDate_posted(Date date_posted) {
		this.date_posted = date_posted;
	}

	@Column(name = "coaching_category_id", nullable = false)
	public Long getCoaching_category_id() {
		return coaching_category_id;
	}

	public void setCoaching_category_id(Long coaching_category_id) {
		this.coaching_category_id = coaching_category_id;
	}
	
	
	////////////////    Testing Area Starts     ////////////////////////////
	//private String testInfoNotToSave;
	//public String getTestInfoNotToSave() {
	//	return testInfoNotToSave;
	//}
	//
	//public void setTestInfoNotToSave(String ptestInfoNotToSave) {
	//	this.testInfoNotToSave = ptestInfoNotToSave;
	//}	
	////////////////    Testing Area Ends     ////////////////////////////

	@Column(name = "COACHING_REQUEST_ID", unique = true, nullable = false, precision = 10, scale = 0)
	public Long getCoachingRequestId() {
		return COACHING_REQUEST_ID;
	}
	
	public void setCoachingRequestId(Long coachingRequestId) {
		this.COACHING_REQUEST_ID = coachingRequestId;
	}	

	public void setUserId(Long userId) {
		this.userId = userId;
	}	
	
	@Column(name = "USER_ID", nullable = false)
	public Long getUserId() {
		return userId;
	}
	
	
	@Column(name = "CURRENT_POSITION", nullable = false, length = 75)
	public String getCurrentPosition() {
		return currentPosition;
	}

	public void setCurrentPosition(String currentPosition) {
		this.currentPosition = currentPosition;
	}	

	@Column(name = "CURRENT_COMPANY", nullable = false, length = 75)
	public String getCurrentCompany (){
		return currentCompany;
	}
	
	public void setCurrentCompany(String currentCompany){
		this.currentCompany = 	currentCompany;
	}
	

	@Column(name = "CAREER_CATEGORY", columnDefinition = "SMALLINT", nullable = false)
	public Short getCareerCategory (){
		return careerCategory;
	}
	
	public void setCareerCategory(Short careerCategory){
		this.careerCategory = careerCategory;
	}
	
	@Column(name = "COACHING_TYPE",  columnDefinition = "SMALLINT",  nullable = false)
	public Short getCoachingType(){
		return coachingType;
	}
	
	public void setCoachingType(Short coachingType){
		this.coachingType = coachingType;
	}
	
	@Column(name = "roadblocks",  columnDefinition = "SMALLINT", nullable = false)
	public Short getroadblocks (){
		return roadblocks;
	}
	
	public void setroadblocks(Short roadBlocks){
		this.roadblocks = roadBlocks;
	}
	
	@Column(name = "COACHING_STYLE",  columnDefinition = "SMALLINT", nullable = false)
	public Short getCoachingStyle(){
		return coachingStyle;
	}
	
	public void setCoachingStyle(Short coachingStyle){
		this.coachingStyle = coachingStyle;
	}
	
	@Column(name = "START_DATE", nullable = false)
	public Date getStartDate(){
		return startDate;
	}
	
	public void setStartDate(Date startDate){
		this.startDate = startDate;
	}
	
	@Column(name = "HOURS", length = 75)
	public String getHours(){
		return hours;
	}
	
	public void setHours(String hours){
		this.hours = hours;
	}
	
	@Column(name = "GOALS", nullable = true, length = 1000)
	public String getGoals(){
		return goals;
	}
	
	public void setGoals(String goals){
		this.goals = goals;
	}

	@Column(name = "SELECTED_COACHES", nullable = true)
	public String getSelectedCoaches(){
		return selectedCoaches;
	}
	
	public void setSelectedCoaches(String selectedCoaches){
		this.selectedCoaches = selectedCoaches;
	}
	
	public String toString() {
		StringBuffer buffer = new StringBuffer();
		buffer.append(" coachingRequestId: " + COACHING_REQUEST_ID + ";");
		buffer.append(" currentPosition: " + currentPosition + ";");
		buffer.append(" userId: " + userId + ";");
		buffer.append(" currentCompany: " + currentCompany + ";");
		buffer.append(" careerCategory: " + careerCategory + ";");
		buffer.append(" coachingType: " + coachingType + ";");
		buffer.append(" roadBlocks: " + roadblocks + ";");
		buffer.append(" coachingStyle: " + coachingStyle + ";");
		buffer.append(" startDate: " + startDate + ";");
		buffer.append(" hours: " + hours + ";");
		buffer.append(" goals: " + goals + ";");
		buffer.append(" selected coaches: " + selectedCoaches + ";");
		buffer.append(" request Name: " + request_name + ";");
		buffer.append(" date posted: " + date_posted + ";");
		buffer.append(" coaching_category_id: " + coaching_category_id + ";");
		
		
		return buffer.toString();
	}
	
}
