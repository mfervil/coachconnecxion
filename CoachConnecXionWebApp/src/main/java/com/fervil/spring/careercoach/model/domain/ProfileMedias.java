package com.fervil.spring.careercoach.model.domain;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

//@Entity
//@Table(name = "PROFILEMEDIAINFO")
public class ProfileMedias {
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;

	@Column(name = "CUSTOMERID")
	private Integer customerid;

	@Column(name = "CONTENT")
	@Lob
	private Blob content;

	@Column(name = "CONTENTTYPE")
	private String contenttype;
	
	@Column(name = "video_url")
	private String video_url;

	@Column(name = "user_profile_id")
	private Long profileId;
	
	
	public String getVideoUrl() {
		return video_url;
	}

	public void setFileName(String video_url) {
		this.video_url = video_url;
	}

	public Long getProfileId() {
		return profileId;
	}

	public void setProfileId(Long profileId) {
		this.profileId = profileId;
	}
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	public Blob getContent() {
		return content;
	}

	public void setContent(Blob content) {
		this.content = content;
	}

	public String getContenttype() {
		return contenttype;
	}

	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}

	public String getImage() throws Exception {
		String imgLen = String.valueOf(this.content);		
		
		byte [] rb = new byte[imgLen.length() ];
		String byteArray ="";
		
			int blobLength = (int) this.content.length();  
			byte[] blobAsBytes = this.content.getBytes(1, blobLength);			
			
			byteArray = new String(blobAsBytes );
			return byteArray;
	}
}
