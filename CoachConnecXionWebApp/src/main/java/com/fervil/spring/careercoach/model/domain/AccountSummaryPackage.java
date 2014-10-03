package com.fervil.spring.careercoach.model.domain;

public class AccountSummaryPackage {
	private Object Id;
	private Object packageName;
	private Object priceValue;
	private Object optOutDays;
	private Object numberSold;
	public AccountSummaryPackage(){
		
	}
	public AccountSummaryPackage(Object Id, Object packageName, Object priceValue,
			Object optOutDays, Object numberSold) {
		this.Id = Id;
		this.packageName = packageName;
		this.priceValue = priceValue;
		this.optOutDays = optOutDays;
		this.numberSold = numberSold;
	}
	public Object getId() {
		return Id;
	}
	public void setId(Object id) {
		Id = id;
	}
	public Object getPackageName() {
		return packageName;
	}
	public void setPackageName(Object packageName) {
		this.packageName = packageName;
	}
	public Object getPriceValue() {
		return priceValue;
	}
	public void setPriceValue(Object priceValue) {
		this.priceValue = priceValue;
	}
	public Object getOptOutDays() {
		return optOutDays;
	}
	public void setOptOutDays(Object optOutDays) {
		this.optOutDays = optOutDays;
	}
	public Object getNumberSold() {
		return numberSold;
	}
	public void setNumberSold(Object numberSold) {
		this.numberSold = numberSold;
	}


}
