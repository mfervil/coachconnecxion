package com.fervil.spring.careercoach.model.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blog_comment")
public class BlogComment {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long blogcommentid;
	public Long getBlogcommentid() {
		return blogcommentid;
	}
	public void setBlogcommentid(Long blogcommentid) {
		this.blogcommentid = blogcommentid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Column(name = "blogid")
	private long blogid;
	public long getBlogid() {
		return blogid;
	}
	public void setBlogid(long blogid) {
		this.blogid = blogid;
	}
	
	public Date getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}
	
	@Column(name = "createddate")
	private Date createddate;
	@Column(name = "name")
	private String name;
	@Column(name = "email")
	private String email;
	@Column(name = "website")
	private String website;
	@Column(name = "comment", nullable = false,  columnDefinition="TEXT")
	private String comment;
	@Column(name = "status")
	private int status;
	@Override
	public String toString() {
		return "BlogComments [blogcommentid=" + blogcommentid + ", name="
				+ name + ", email=" + email + ", website=" + website
				+ ", comment=" + comment + ", status=" + status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((blogcommentid == null) ? 0 : blogcommentid.hashCode());
		result = prime * result + (int) (blogid ^ (blogid >>> 32));
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + status;
		result = prime * result + ((website == null) ? 0 : website.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BlogComment other = (BlogComment) obj;
		if (blogcommentid == null) {
			if (other.blogcommentid != null)
				return false;
		} else if (!blogcommentid.equals(other.blogcommentid))
			return false;
		if (blogid != other.blogid)
			return false;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (status != other.status)
			return false;
		if (website == null) {
			if (other.website != null)
				return false;
		} else if (!website.equals(other.website))
			return false;
		return true;
	}

}
