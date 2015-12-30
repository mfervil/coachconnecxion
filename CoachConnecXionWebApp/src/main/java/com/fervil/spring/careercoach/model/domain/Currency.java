package com.fervil.spring.careercoach.model.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Currency {
    //@JsonProperty("zipcodes")
    //Zipcode[] zipcodes;	
	
	  private String success; 
	  private String currency_code; 
	  private double exchange_rate; 
	  private String time_stamp_eastern;
	  private long unix_time_stamp;
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getCurrency_code() {
		return currency_code;
	}
	public void setCurrency_code(String currency_code) {
		this.currency_code = currency_code;
	}
	public double getExchange_rate() {
		return exchange_rate;
	}
	public void setExchange_rate(double exchange_rate) {
		this.exchange_rate = exchange_rate;
	}
	public String getTime_stamp_eastern() {
		return time_stamp_eastern;
	}
	public void setTime_stamp_eastern(String time_stamp_eastern) {
		this.time_stamp_eastern = time_stamp_eastern;
	}
	public long getUnix_time_stamp() {
		return unix_time_stamp;
	}
	public void setUnix_time_stamp(long unix_time_stamp) {
		this.unix_time_stamp = unix_time_stamp;
	}


}
