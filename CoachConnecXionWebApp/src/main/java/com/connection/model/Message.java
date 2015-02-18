package com.connection.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CascadeType;
import org.springframework.stereotype.Component;


@Entity
@Table(name="message")

public class Message {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "messageid")
	private int messageid;
	
	private long orderid;

	private long toprofileid;
	private long fromprofileid;
	
	@Column(name = "description")
	private String description;
	@Column(name = "type")
	private String type;
	 @ManyToOne(cascade=javax.persistence.CascadeType.ALL) 
	 @JoinColumn(name="fromuser")
	//@Column(name = "fromuser") 
	private Customer fromuser;
	//@Column(name = "touser")
	 @ManyToOne(cascade=javax.persistence.CascadeType.ALL)  
	 @JoinColumn(name="touser")
	private Customer touser;
	@Column(name = "read_status")
	private String read_status;
	@Column(name = "date")
	private Date date;
	@OneToMany(mappedBy="messageid",fetch = FetchType.EAGER, cascade = javax.persistence.CascadeType.ALL)   
	 private Set<Attachment> attachment;
	public int getMessageid() {
		return messageid;
	}
	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Customer getFromuser() {
		return fromuser;
	}
	public void setFromuser(Customer fromuser) {
		this.fromuser = fromuser;
	}
	public Customer getTouser() {
		return touser;
	}
	public void setTouser(Customer touser) {
		this.touser = touser; 
	}
	public String getReadstatus() {
		return read_status;
	}
	public void setReadstatus(String readstatus) {
		this.read_status = readstatus;
	}
	public Set<Attachment> getAttachment() {
		return attachment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setAttachment(Set<Attachment> attachment) {
		this.attachment = attachment; 
	}
	public long getOrderid() {
		return orderid;
	}
	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}
	public long getToprofileid() {
		return toprofileid;
	}
	public void setToprofileid(long toprofileid) {
		this.toprofileid = toprofileid;
	}
	public long getFromprofileid() {
		return fromprofileid;
	}
	public void setFromprofileid(long fromprofileid) {
		this.fromprofileid = fromprofileid;
	}
}
