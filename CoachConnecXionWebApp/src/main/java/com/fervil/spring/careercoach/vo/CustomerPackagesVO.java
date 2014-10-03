package com.fervil.spring.careercoach.vo;

import java.util.Date;

public class CustomerPackagesVO {
	String packagename = "";
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	String email = "";
	
	float price = 0;
	public String getOrderdate() {
		return orderdate;
	}


	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}


	String orderdate;
	String displayname = "";
	long clientId = 0;
	long userProfileId = 0;
	long packageId = 0;
	long paymentId = 0;

	public long getPaymentId() {
		return paymentId;
	}


	public void setPaymentId(long paymentId) {
		this.paymentId = paymentId;
	}


	public long getPackageId() {
		return packageId;
	}


	public void setPackageId(long packageId) {
		this.packageId = packageId;
	}


	String phone;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPackagename() {
		return packagename;
	}


	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}

	public String getDisplayname() {
		return displayname;
	}


	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}


	public long getClientId() {
		return clientId;
	}


	public void setClientId(long clientId) {
		this.clientId = clientId;
	}


	public long getUserProfileId() {
		return userProfileId;
	}


	public void setUserProfileId(long userProfileId) {
		this.userProfileId = userProfileId;
	}


	@Override
	public String toString() {
		return "CustomerPackagesVO [packagename=" + packagename + ", email="
				+ email + ", price=" + price + ", orderdate=" + orderdate
				+ ", displayname=" + displayname + ", clientId=" + clientId
				+ ", userProfileId=" + userProfileId + ", packageId="
				+ packageId + ", paymentId=" + paymentId + ", phone=" + phone
				+ "]";
	}


	public CustomerPackagesVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CustomerPackagesVO(String packagename, float price, String orderdate,
			String displayname, long clientId, long userProfileId, String email, String phone, long packageId, long paymentId) {
		super();
		this.packagename = packagename;
		this.price = price;
		this.orderdate = orderdate;
		this.displayname = displayname;
		this.clientId = clientId;
		this.userProfileId = userProfileId;
		this.email = email;
		this.phone = phone;
		this.packageId = packageId;
		this.paymentId = paymentId;
	}
}