package com.connection.bean;

import java.util.Date;

public class CustomerBean {
	private Integer id;
	private String name;
	//private Integer age;
	private Long phno;
	private String address;
	private Date createddate;
	private String emailid;
	private String password;
	private String searchValue;
	private String skypeName;
	public String getSkypeName() {
		return skypeName;
	}
	public void setSkypeName(String skypeName) {
		this.skypeName = skypeName;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	private String confirmpassword;
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		//System.out.println("Name-----");
		this.name = name;
	}
	
	public Long getPhno() {
		return phno;
	}
	public void setPhno(Long phno) {
		//System.out.println("PHno.....");
		this.phno = phno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		//System.out.println("Address----------------------------------");
		this.address = address;
	}
	public Date getCreateddate() {
		return createddate;
	}
	public void setCreateddate(java.util.Date date) {
		this.createddate = date;
	}
}
