package com.fervil.spring.careercoach.model.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "PAYMENT_INFORMATION")
public class PaymentInformation {
	
	@Id
	@Column(name = "id")
	@GeneratedValue
	private long id;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "entrytype")
	private int entrytype;
	public int getEntrytype() {
		return entrytype;
	}

	public void setEntrytype(int entrytype) {
		this.entrytype = entrytype;
	}

	@Column(name = "credit_card_type")
	private String creditCardType;
	@Column(name = "credit_card_number1")
	private String creditCardNumber1;
	@Column(name = "credit_card_number2")
	private String creditCardNumber2;
	@Column(name = "credit_card_number3")
	private String creditCardNumber3;
	@Column(name = "credit_card_number4")
	private String creditCardNumber4;
    @NotNull
    @Email
	@Column(name = "email")
	private String email;
	@Column(name = "phone_number1")
	private String phoneNumber1;
	@Column(name = "phone_number2")
	private String phoneNumber2;
	@Column(name = "phone_number3")
	private String phoneNumber3;
	@Column(name = "expiration_month")
	private int expirationMonth;
	@Column(name = "expiration_year")
	private int expirationYear;
	@Column(name = "cvv2")
	private int cvv2;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "street1")
	private String street1;
	@Column(name = "street2")
	private String street2;
	@Column(name = "city")
	private String city;
	@Column(name = "state")
	private String state;
	@Column(name = "zip")
	private int zip;
	//private String countryCode;
	@Column(name = "order_description")
	private String orderDescription;
	@Column(name = "currency_code")
	private String currencyCode;
	@Column(name = "package_price")
	private float packagePrice;
	@Column(name = "credit_card_type_value")
	private String creditCardTypeValue;
	@Column(name = "expiration_month_value")
	private String expirationMonthValue;
	@Column(name = "expiration_year_value")
	private String expirationYearValue;
	@Column(name = "state_value")
	private String stateValue;
	@Column(name = "package_name")
	private String packageName;
	@Column(name = "package_id")
	private int packageId;
	@Column(name = "currentdate")
	private Date orderdate;
	
	/*
	 * NEED TO PUT THE PROPER DATE IN THE DATABASE	
	 * 
	 * java.util.Date dt = new java.util.Date();

	 	java.text.SimpleDateFormat sdf = 
     	new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String currentTime = sdf.format(dt);
	 * 
	 */

    @Size(min = 3, max = 20, message = "{password.error.size}")
    @Pattern(regexp = "[^\\s\\{\\}]+$", message = "{password.error.symbols}")
	private String password;

    @Size(min = 3, max = 20, message = "{password.error.size}")
    @Pattern(regexp = "[^\\s\\{\\}]+$", message = "{password.error.symbols}")
    private String confirmedpassword;    

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public float getPackagePrice() {
		return packagePrice;
	}
	
	public void setPackagePrice(float packagePrice) {
		this.packagePrice = packagePrice;
	}

	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getCreditCardType() {
		return creditCardType;
	}
	public void setCreditCardType(String creditCardType) {
		this.creditCardType = creditCardType;
	}
	public String getCreditCardNumber1() {
		return creditCardNumber1;
	}
	public void setCreditCardNumber1(String creditCardNumber1) {
		this.creditCardNumber1 = creditCardNumber1;
	}
	public String getCreditCardNumber2() {
		return creditCardNumber2;
	}
	public void setCreditCardNumber2(String creditCardNumber2) {
		this.creditCardNumber2 = creditCardNumber2;
	}
	public String getCreditCardNumber3() {
		return creditCardNumber3;
	}
	public void setCreditCardNumber3(String creditCardNumber3) {
		this.creditCardNumber3 = creditCardNumber3;
	}
	public String getCreditCardNumber4() {
		return creditCardNumber4;
	}
	public void setCreditCardNumber4(String creditCardNumber4) {
		this.creditCardNumber4 = creditCardNumber4;
	}
	public int getExpirationMonth() {
		return expirationMonth;
	}
	public void setExpirationMonth(int expirationMonth) {
		this.expirationMonth = expirationMonth;
	}
	public int getExpirationYear() {
		return expirationYear;
	}
	public void setExpirationYear(int expirationYear) {
		this.expirationYear = expirationYear;
	}
	public int getCvv2() {
		return cvv2;
	}
	public void setCvv2(int cvv2) {
		this.cvv2 = cvv2;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStreet1() {
		return street1;
	}
	public void setStreet1(String street1) {
		this.street1 = street1;
	}
	public String getStreet2() {
		return street2;
	}
	public void setStreet2(String street2) {
		this.street2 = street2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
/*	
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
*/	
	public String getOrderDescription() {
		return orderDescription;
	}
	public void setOrderDescription(String orderDescription) {
		this.orderDescription = orderDescription;
	}
	public String getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	public int getPackageId() {
		return packageId;
	}
	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber1() {
		return phoneNumber1;
	}
	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}
	public String getPhoneNumber2() {
		return phoneNumber2;
	}
	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}
	public String getPhoneNumber3() {
		return phoneNumber3;
	}
	public void setPhoneNumber3(String phoneNumber3) {
		this.phoneNumber3 = phoneNumber3;
	}

	public String getCreditCardTypeValue() {
		return creditCardTypeValue;
	}
	public void setCreditCardTypeValue(String creditCardTypeValue) {
		this.creditCardTypeValue = creditCardTypeValue;
	}
	public String getExpirationMonthValue() {
		return expirationMonthValue;
	}
	public void setExpirationMonthValue(String expirationMonthValue) {
		this.expirationMonthValue = expirationMonthValue;
	}
	public String getExpirationYearValue() {
		return expirationYearValue;
	}
	public void setExpirationYearValue(String expirationYearValue) {
		this.expirationYearValue = expirationYearValue;
	}
	public String getStateValue() {
		return stateValue;
	}
	public void setStateValue(String stateValue) {
		this.stateValue = stateValue;
	}
	
	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "PaymentInformation [id=" + id + ", creditCardType="
				+ creditCardType + ", creditCardNumber1=" + creditCardNumber1
				+ ", creditCardNumber2=" + creditCardNumber2
				+ ", creditCardNumber3=" + creditCardNumber3
				+ ", creditCardNumber4=" + creditCardNumber4 + ", email="
				+ email + ", phoneNumber1=" + phoneNumber1 + ", phoneNumber2="
				+ phoneNumber2 + ", phoneNumber3=" + phoneNumber3
				+ ", expirationMonth=" + expirationMonth + ", expirationYear="
				+ expirationYear + ", cvv2=" + cvv2 + ", firstName="
				+ firstName + ", lastName=" + lastName + ", street1=" + street1
				+ ", street2=" + street2 + ", city=" + city + ", state="
				+ state + ", zip=" + zip + ", orderDescription="
				+ orderDescription + ", currencyCode=" + currencyCode
				+ ", packagePrice=" + packagePrice + ", creditCardTypeValue="
				+ creditCardTypeValue + ", expirationMonthValue="
				+ expirationMonthValue + ", expirationYearValue="
				+ expirationYearValue + ", stateValue=" + stateValue
				+ ", packageName=" + packageName + ", packageId=" + packageId
				+ ", orderdate=" + orderdate + ", password=" + password
				+ ", confirmedpassword=" + confirmedpassword + "]";
	}

	public String getConfirmedpassword() {
		return confirmedpassword;
	}

	public void setConfirmedpassword(String confirmedpassword) {
		this.confirmedpassword = confirmedpassword;
	}
}
