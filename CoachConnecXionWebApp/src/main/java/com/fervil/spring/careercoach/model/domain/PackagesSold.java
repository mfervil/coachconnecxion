package com.fervil.spring.careercoach.model.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PACKAGES_SOLD")
public class PackagesSold implements Serializable {

	private static final long serialVersionUID = -5527566248002296042L;
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer Id;
	@Column(name = "PACKAGE_DETAILS_ID")
	private Integer packagedetailsId;
	@Column(name = "CLIENT_ID")
	private Integer clientId;

	@Column(name = "ORDERDATE")
	private Date orderdate;
	
	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	@Column(name = "user_profile_id")
	private long profileId;
	
	public long getProfileId() {
		return profileId;
	}

	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Integer getPackagedetailsId() {
		return packagedetailsId;
	}

	public void setPackagedetailsId(Integer packagedetailsId) {
		this.packagedetailsId = packagedetailsId;
	}

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}


	
}
