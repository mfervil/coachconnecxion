<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Create Coaching/Training request</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Create a request for Coaching/Training services in order for a coach to contact you" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
		
			<!-- COACHING REQUEST FORM -->
	<form:form method="post" commandName="coachingRequest" action="createcoachingRequest">
		  <table>
		  <tbody>
		    <tr>										
		      <td class="leftalign" colspan="2">Request Title: <input type="text" size="35"  /> 
		      						Category/Sub-Category: <input type="text" size="35"  /> /
		      												<input type="text" size="35"  /> 
		      </td>
		    </tr>
		    <tr>										
		      <td class="leftalign">Latest Position: ${coachesToContact} <form:errors path="currentPosition" cssClass="error" /><br>
		        <form:input size="35" path="currentPosition" /></td>
		      <td class="leftalign">Current Company: <form:errors path="currentCompany" cssClass="error" /><br>
		        <form:input size="35" path="currentCompany" /></td>
		    </tr>
		    <tr>
		      <td class="leftalign">Career Category: <form:errors path="careerCategory" cssClass="error" /><br>
		      <!-- Find complete list from job categories in career builder -->
		        <form:select size="1" path="careerCategory" >
		          <option selected  value="-1">Select from list</option>
		          <option value="1">Accounting</option>
		          <option value="2">Automotive</option>
		          <option value="3">Banking</option>
		          <option value="4">Biotech</option>
		          <option value="5">Business Development</option>
		          <option value="6">Business Opportunity</option>

		        </form:select></td>
		      <td class="leftalign">Type of Coaching Desired: <form:errors path="coachingType" cssClass="error" /><br>
		        <form:select size="1" path="coachingType" >
		          <option  value="-1">Select a type from list</option>
		          <option value="1">Executive Coaching</option>
		          <option value="2">Leadership Coaching</option>
		          <option value="3">Business Management Coaching</option>
		          <option value="4">International Executive</option>
		        </form:select></td>
		    </tr>
		    <tr>
		      <td class="leftalign">Roadblocks: <form:errors path="roadblocks" cssClass="error" /><br>
		        <form:select size="1" path="roadblocks" >
		          <option  value="-1">Select from list</option>
		          <option value="1">Lack of Time</option>
		          <option value="2">Education</option>
		        </form:select></td>
		        
		      <td class="leftalign">Desired Coaching Style: <form:errors path="coachingStyle" cssClass="error" /><br>
		        <form:select size="1" path="coachingStyle" >
		          <option selected  value="-1">Select from list</option>
		          <option value="1">In-Person</option>
		          <option  value="2">Electronic (Phone &amp; Email)</option>
		        </form:select></td>
		    </tr>
		    <tr>
		      <td class="leftalign">Desired Start Date: <form:errors path="startDate" cssClass="error" /><br>
		        <form:input path="startDate"  size="20" class="date-picker" /> (This should be a date picker</td>
		      <td class="leftalign">Desired hours (ex. 2 hours/week, 3 hours/month ): <form:errors path="hours" cssClass="error" /><br>
		        <form:input path="hours"  size="41" /></td>
		    </tr>
		    <tr>
		      <td class="leftalign" colspan="2">Overall Goals (Please be as detailed as
		        possible): <form:errors path="goals" cssClass="error" /><br>
		        <form:textarea rows="7" path="goals"  cols="80" /></textarea>
		        <p>&nbsp;<a href="http://www.secureinfossl.com/carts/shopping_cart/oneClickProductBuy/a645047933ed7b2eb3be5defd91e083e/0"><img src="https://www.secureinfossl.com/images/cart_buttons/cart_button_6.gif" border="0"></a></td>
		    </tr>
		    </tbody>
		  </table>
		  <form:hidden path="selectedCoaches"  />

		  <p>&nbsp;</p>
		  <p><input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2"></p>

	</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
