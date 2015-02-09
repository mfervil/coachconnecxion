package com.connection.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Entity
@Table(name="attachment")

public class UserAttachment {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) 
	@Column(name = "attachid")
	private int attachid;
	@Column(name = "attachment_name")
	private String attachment_name;
	@ManyToOne
	@JoinColumn(name="messageid")
	private Usermessage messageid;
	 public UserAttachment(){}
	 
	 public UserAttachment(String attachmentname, Usermessage message){
		 this.attachment_name=attachmentname;
		 this.messageid=message;
	 }
	
	public int getAttachid() {
		return attachid;
	}
	public void setAttachid(int attachid) {
		this.attachid = attachid;
	}
	public String getAttachmentname() {
		return attachment_name;
	}
	public void setAttachmentname(String attachmentname) {
		this.attachment_name = attachmentname;
	}
	
	/*
	public Message getMessage() {
		return messageid;
	}
	public void setMessage(Message message) {
		this.messageid = message;
	}
	*/
	
	public Usermessage getMessageid() {
		return messageid;
	}
	
	public void setMessageid(Usermessage message) {
		this.messageid = message; 
	}
	
	
}
