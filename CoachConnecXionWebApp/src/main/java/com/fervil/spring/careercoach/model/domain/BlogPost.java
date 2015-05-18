package com.fervil.spring.careercoach.model.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BLOG")
public class BlogPost {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long blogid;

	public int getPublishyear() {
		return publishyear;
	}

	public void setPublishyear(int publishyear) {
		this.publishyear = publishyear;
	}

	public int getPublishmonth() {
		return publishmonth;
	}

	public void setPublishmonth(int publishmonth) {
		this.publishmonth = publishmonth;
	}

	public int getPublishday() {
		return publishday;
	}

	public void setPublishday(int publishday) {
		this.publishday = publishday;
	}

	@Column(name = "publishyear")
	private int publishyear;
	@Column(name = "publishmonth")
	private int publishmonth;
	@Column(name = "publishday")
	private int publishday;
	
	public Long getUserprofileid() {
		return userprofileid;
	}

	public void setUserprofileid(Long userprofileid) {
		this.userprofileid = userprofileid;
	}

	@Column(name = "user_profile_id")
	private Long userprofileid;
	
	@Override
	public String toString() {
		return "BlogPost [blogid=" + blogid + ", publishyear=" + publishyear
				+ ", publishmonth=" + publishmonth + ", publishday="
				+ publishday + ", userprofileid=" + userprofileid
				+ ", blogtitle=" + blogtitle + ", publishdate=" + publishdate
				+ ", updateddate=" + updateddate + ", creatorfirstname="
				+ creatorfirstname + ", creatorlastname=" + creatorlastname
				+ ", creatoremail=" + creatoremail + ", blogposting="
				+ blogposting + ", coachingcategory=" + coachingcategory
				+ ", coachingcategoryId=" + coachingcategoryId
				+ ", coachingcategoryName=" + coachingcategoryName + "]";
	}

	@Column(name = "blogtitle")
	private String blogtitle; 

	public String getBlogtitle() {
		return blogtitle;
	}

	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle;
	}
	
	public Long getBlogid() {
		return blogid;
	}

	public void setBlogid(Long blogid) {
		this.blogid = blogid;
	}

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public Date getUpdateddate() {
		return updateddate;
	}

	public void setUpdateddate(Date updateddate) {
		this.updateddate = updateddate;
	}

	public String getCreatorfirstname() {
		return creatorfirstname;
	}

	public void setCreatorfirstname(String creatorfirstname) {
		this.creatorfirstname = creatorfirstname;
	}

	public String getCreatorlastname() {
		return creatorlastname;
	}

	public void setCreatorlastname(String creatorlastname) {
		this.creatorlastname = creatorlastname;
	}

	public String getCreatoremail() {
		return creatoremail;
	}

	public void setCreatoremail(String creatoremail) {
		this.creatoremail = creatoremail;
	}

	public String getBlogposting() {
		return blogposting;
	}

	public void setBlogposting(String blogposting) {
		this.blogposting = blogposting;
	}

	@Column(name = "publishdate")
	private Date publishdate;

	@Column(name = "updateddate")
	private Date updateddate;

	@Column(name = "creatorfirstname")
	private String creatorfirstname;
	
	@Column(name = "creatorlastname")
	private String creatorlastname;

	@Column(name = "creatoremail")
	private String creatoremail;
	
	@Column(name = "blogposting", nullable = false,  columnDefinition="LONGTEXT")
	private String blogposting;
	
	public long getCoachingcategoryId() {
		return coachingcategoryId;
	}

	public void setCoachingcategoryId(long coachingcategoryId) {
		this.coachingcategoryId = coachingcategoryId;
	}

	public String getCoachingcategoryName() {
		return coachingcategoryName;
	}

	public void setCoachingcategoryName(String coachingcategoryName) {
		this.coachingcategoryName = coachingcategoryName;
	}

	public String getCoachingcategory() {
		return coachingcategory;
	}

	public void setCoachingcategory(String coachingcategory) {
		this.coachingcategory = coachingcategory;
	}

	@Column(name = "COACHING_CATEGORY")
	private String coachingcategory;
	@Column(name = "COACHING_CATEGORY_ID")
	private long coachingcategoryId;
	@Column(name = "COACHING_CATEGORY_NAME")
	private String coachingcategoryName;
	

}
