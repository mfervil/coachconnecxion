package com.fervil.spring.careercoach.model.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Date;

@Entity
@Table(name = "PACKAGE")
public class Package {

	long user_profile_id;
	String packagename;
	int category;
	int subcategory;
	float price;
	String overview=".";
	String packagedetails=".";
	int opt_out_days;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private long packageId;
	
	@Column(name = "package_id", unique = true, nullable = false, precision = 10, scale = 0)
	public long getPackageId() {
		return packageId;
	}
	public void setPackageId(long packageId) {
		this.packageId = packageId;
	}
	
	@Column(name = "user_profile_id", nullable = false)
	public long getUser_profile_id() {
		return user_profile_id;
	}
	public void setUser_profile_id(long user_profile_id) {
		this.user_profile_id = user_profile_id;
	}
	
	@Column(name = "packageName", nullable = false, length = 75)
	public String getPackageName() {
		return packagename;
	}
	public void setPackageName(String packageName) {
		this.packagename = packageName;
	}
	
	@Column(name = "category")
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
	@Column(name = "subcCategory")
	public int getSubCategory() {
		return subcategory;
	}
	public void setSubCategory(int subCategory) {
		this.subcategory = subCategory;
	}

	@Column(name = "price")
	public double getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	@Column(name = "overview")
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	@Column(name = "packageDetail")
	public String getPackageDetails() {
		return packagedetails;
	}
	public void setPackageDetails(String packageDetails) {
		this.packagedetails = packageDetails;
	}

	@Column(name = "opt_out_days")
	public int getOpt_out_days() {
		return opt_out_days;
	}
	public void setOpt_out_days(int optOutDays) {
		this.opt_out_days = optOutDays;
	}
}