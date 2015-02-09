package com.connection.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Customer")

public class Customer implements java.io.Serializable{
	private static final long serialVersionUID = 2L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "customerid")
	private Integer customerid;
	@Column(name = "customername")
	private String customername;
	@Column(name = "address")
	private String address;
	@Column(name = "phno")
	private Long phno;
	@Column(name = "createddate")
	private Date createddate;
	@Column(name = "skypeName")
	private String skypeName;
	public String getSkypeName() {
		return skypeName;
	}
	public void setSkypeName(String skypeName) {
		this.skypeName = skypeName;
	}
	@Column(name = "emailid")
	private String emailid;
	@Column(name = "password")
	private String password;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "touser",cascade=CascadeType.ALL)     
	 private Set<Message> toMessage;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "fromuser",cascade=CascadeType.ALL)     
	 private Set<Message> fromMessage;
	
	
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
	public Integer getCustomerid() {
		return customerid;
	}
	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getPhno() {
		return phno;
	}
	public void setPhno(Long phno) {
		this.phno = phno;
	}
	public Date getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}
	public Set<Message> getToMessage() {
		return toMessage;
	}
	public void setToMessage(Set<Message> toMessage) {
		this.toMessage = toMessage;
	}
	public Set<Message> getFromMessage() {
		return fromMessage;
	}
	public void setFromMessage(Set<Message> fromMessage) {
		this.fromMessage = fromMessage;
	}

}
