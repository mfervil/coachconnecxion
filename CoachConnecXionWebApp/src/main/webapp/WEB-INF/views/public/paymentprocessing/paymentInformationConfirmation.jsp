
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Selecting your coach</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>


<style>
label {font-size:14px;}
</style>

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

		<!-- CONTACT FORM -->
		<form:form method="post" commandName="paymentInformation"  >
			 <table>
			  	<tbody >
			  	<form:hidden path="packageId" id="packageId" value="${paymentInformation.packageId}"/>
			    <tr>
			      <td class="centeralign"><label style="font:bold 18px/30px Georgia, serif;">Please confirm your order</label>
				</td></tr>
			  	</tbody >
			  	</table>
			  	<br>
			  	<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>									
			  	
				<p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Order Details</p> 
			  	<table>
			  	<tbody >
			    <tr>
			      <td class="leftalign"><label>Package Name: ${paymentInformation.packageName}</label>
				</td></tr>
			    <tr>
			      <td class="leftalign"><label>Package Price: ${paymentInformation.packagePrice}</label>
				</td></tr>
			  	</tbody >
			  	</table>
			  	<br>
			 <p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Payment Information</p> 
			  	<table>
			  	<tbody >
		    	<form:hidden path="creditCardType" id="creditCardType" value="${paymentInformation.creditCardType}"/>
			    <tr>
			      <td class="leftalign"><label>Card Type: ${paymentInformation.creditCardTypeValue}</label>
				</td></tr>

		    	<form:hidden path="creditCardNumber1" id="creditCardNumber1" value="${paymentInformation.creditCardNumber1}"/>
		    	<form:hidden path="creditCardNumber2" id="creditCardNumber2" value="${paymentInformation.creditCardNumber2}"/>
		    	<form:hidden path="creditCardNumber3" id="creditCardNumber3" value="${paymentInformation.creditCardNumber3}"/>
		    	<form:hidden path="creditCardNumber4" id="creditCardNumber4" value="${paymentInformation.creditCardNumber4}"/>
				
				<tr>
				      <td class="leftalign"><label>Last 4 Card Number: ${paymentInformation.creditCardNumber4}</label>
				        </td>
				</tr>

		    	<form:hidden path="expirationMonth" id="expirationMonth" value="${paymentInformation.expirationMonth}"/>
			    <tr>
			      <td class="leftalign"><label>Expiration Date: ${paymentInformation.expirationMonthValue} - ${paymentInformation.expirationYearValue}</label> 
			    	<form:hidden path="expirationYear" id="expirationYear" value="${paymentInformation.expirationYear}"/>
				</td></tr>
				<tr>
			    	<form:hidden path="cvv2" id="cvv2" value="${paymentInformation.cvv2}"/>
				</tr>
				</tbody>
			 </table>
			 <br>
			 <p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Billing Details</p> 
			 <table>
			  	<tbody >
		    	<form:hidden path="firstName" id="firstName" value="${paymentInformation.firstName}"/>
				<tr>
			      <td class="leftalign"><label>First Name: ${paymentInformation.firstName}</label>
			        </td>
				</tr>

		    	<form:hidden path="lastName" id="lastName" value="${paymentInformation.lastName}"/>
				<tr>
			      <td class="leftalign"><label>Last Name: ${paymentInformation.lastName}</label>
			        </td>
				</tr>

		    	<form:hidden path="email" id="email" value="${paymentInformation.email}"/>
				<tr>
			      <td class="leftalign"><label>Email: ${paymentInformation.email}</label>
			        </td>
				</tr>

		    	<form:hidden path="phoneNumber1" id="phoneNumber1" value="${paymentInformation.phoneNumber1}"/>
		    	<form:hidden path="phoneNumber2" id="phoneNumber2" value="${paymentInformation.phoneNumber2}"/>
		    	<form:hidden path="phoneNumber3" id="phoneNumber3" value="${paymentInformation.phoneNumber3}"/>
				<tr>
				      <td class="leftalign"><label>Phone Number: ${paymentInformation.phoneNumber1} - ${paymentInformation.phoneNumber2} - ${paymentInformation.phoneNumber3}</label>
				        </td>
				</tr>

		    	<form:hidden path="street1" id="street1" value="${paymentInformation.street1}"/>
				<tr>
			      <td class="leftalign"><label>Billing Street Address 1: ${paymentInformation.street1}</label>
			        </td>
				</tr>

		    	<form:hidden path="street1" id="street2" value="${paymentInformation.street2}"/>
				<tr>
			      <td class="leftalign"><label>Billing Street Address 2: ${paymentInformation.street2}</label>
			        </td>
				</tr>

		    	<form:hidden path="city" id="city" value="${paymentInformation.city}"/>
				<tr>
			      <td class="leftalign"><label>City: ${paymentInformation.city}</label>
			        </td>
				</tr>

		    	<form:hidden path="state" id="state" value="${paymentInformation.state}"/>
			    <tr>
			      <td class="leftalign"><label>State: ${paymentInformation.stateValue}</label>
				</td></tr>

		    	<form:hidden path="zip" id="zip" value="${paymentInformation.zip}"/>
				<tr>
			      <td class="leftalign"><label>Zip Code: ${paymentInformation.zip}</label>
			        </td>
				</tr>
<%--
		    	<form:hidden path="countryCode" id="countryCode" value="${paymentInformation.countryCode}"/>
			    <tr>
			      <td class="leftalign">Country: ${paymentInformation.countryCodeValue}
				</td></tr>
 --%>
		    	<form:hidden path="orderDescription" id="orderDescription" value="${paymentInformation.orderDescription}"/>
				<tr>
			      <td class="leftalign"><label>Order Description: ${paymentInformation.orderDescription}</label>
			        </td>
				</tr>

		    	<form:hidden path="currencyCode" id="currencyCode" value="${paymentInformation.currencyCode}"/>
				<tr>
			      <td class="leftalign"><label>Currency Code: ${paymentInformation.currencyCode}</label>
			        </td>
				</tr>

				<form:hidden path="packagePrice" id="packagePrice" value="${paymentInformation.packagePrice}"/>
				<form:hidden path="packageId" id="packageId" value="${paymentInformation.packageId}"/>

				<form:hidden path="password" id="password" value="${paymentInformation.password}"/>
				<form:hidden path="confirmedpassword" id="confirmedpassword" value="${paymentInformation.confirmedpassword}"/>
				<tr><td></td> </tr>
				<tr>
					<td style="text-align: left; width: 150px;"><input
						type="submit" value="Confirm Order" name="submitPayment" id="submitPayment"
						style="text-decoration: none; font-size: 14px; background-color: lightblue;" />
					</td>
				</tr>
				</tbody>	
			</table>
			<input type="hidden" name="processPayment" value="processPaymentYes"/>
			
		<!--  This section is opened in header_no_side.jsp -->
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
