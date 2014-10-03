package com.fervil.spring.careercoach.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "COACHING_CATEGORY")
public class CoachingCategory {
	private static final long serialVersionUID = -5527566248002296042L;
	@Id
	@Column(name = "COACHING_CATEGORY_ID")
	@GeneratedValue
	private Integer categoryId;
	@Column(name = "COACHING_CATEGORY_PARENT_ID")
	private Integer parentId;
	@Column(name = "COACHING_CATEGORY_NAME")
	private String categoryName;
	
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
