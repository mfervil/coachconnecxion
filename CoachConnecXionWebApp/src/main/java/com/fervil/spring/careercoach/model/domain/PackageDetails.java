package com.fervil.spring.careercoach.model.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.CascadeType;


	@Entity
	@Table(name = "PACKAGEDETAILS")
	public class PackageDetails implements Serializable {
		private static final long serialVersionUID = -5527566248002296042L;
		@Id
		@Column(name = "ID")
		@GeneratedValue
		private int id;
		
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		@Column(name = "PROFILEID")
		private long profileId;
		
		
		@Column(name = "PACKAGENAME")
		private String packageName;
		
		@Column(name = "CATEGORY")
		private int categoryIndex;
		
		@Column(name = "SUBCATEGORY")
		private int subcategoryIndex;
		
		@Column(name = "PRICE")
		private float priceValue;
		
		@Column(name = "OVERVIEW" , columnDefinition="TEXT")
		private String overView="&nbsp;";
		
		@Column(name = "PACKAGEDETAIL" , columnDefinition="TEXT")
		private String packageDetails="&nbsp;";
		
		@Column(name = "OPTOUTDAYS")
		private String optOutDays;
		
		
		public PackageDetails(){
			
		}
		
		public PackageDetails(Integer Id, long profileId, String packageName, int categoryIndex, int subcategoryIndex,
				float priceValue, String overView, String packageDetails, String optOutDays) {
			this.id = Id;
			this.profileId = profileId;
			this.packageName = packageName;
			this.categoryIndex = categoryIndex;
			this.subcategoryIndex = subcategoryIndex;
			this.priceValue = priceValue;
			this.overView = overView;
			this.packageDetails = packageDetails;
			this.optOutDays = optOutDays;
		}	
		
		
		public long getProfileId() {
			return profileId;
		}

		public void setProfileId(long profileId) {
			this.profileId = profileId;
		}

		public String getPackageName() {
			return packageName;
		}

		public void setPackageName(String packageName) {
			this.packageName = packageName;
		}

		public int getCategoryIndex() {
			return categoryIndex;
		}

		public void setCategoryIndex(int categoryIndex) {
			this.categoryIndex = categoryIndex;
		}

		public int getSubcategoryIndex() {
			return subcategoryIndex;
		}

		public void setSubcategoryIndex(int subcategoryIndex) {
			this.subcategoryIndex = subcategoryIndex;
		}

		public float getPriceValue() {
			return priceValue;
		}

		public void setPriceValue(float priceValue) {
			this.priceValue = priceValue;
		}

		public String getOverView() {
			return overView;
		}

		public void setOverView(String overView) {
			this.overView = overView;
		}

		public String getPackageDetails() {
			return packageDetails;
		}

		public void setPackageDetails(String packageDetails) {
			this.packageDetails = packageDetails;
		}

		public String getOptOutDays() {
			return optOutDays;
		}

		public void setOptOutDays(String optOutDays) {
			this.optOutDays = optOutDays;
		}

	}