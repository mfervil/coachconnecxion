<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Feedback and Comment for the coach or Trainer</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Provide feedback and comments for the Coach or Trainer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}
</style>
<style type='text/css'>
div#myDialog {
text-align:center;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 350px;
	
	margin: -101px 0 0 -251px;
	border: 1px solid rgb(128, 128, 128);
	background-color: #EAEAEA;
	border-radius:10px;
	padding:10px;
}
</style>
<link href="css/webwidget_rating_bar.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/webwidget_rating_bar.js"></script>
<script>
	function valueCheck() {
		var value = document.getElementById('my_text_input').value;
		var value1 = document.getElementById('my_text_input1').value;
		var value2 = document.getElementById('my_text_input2').value;
		var value3 = document.getElementById('my_text_input3').value;
		var value4 = document.getElementById('TextArea1').value;		
		if (value < 1) {
			alert("Quality Rating should not empty");
			return false;
		} else {
			if (value1 < 1) {
				alert("Experience Rating should not empty");
				return false;
			} else {
				if (value2 < 1) {
					alert("Repsonse Rating should not empty");
					return false;
				} else {
					if (value3 < 1) {
						alert("professionalism Rating should not empty");
						return false;
					} else {					
						if(value4==""){
							alert("Comments should not empty");
							return false;
						}else{
							return true;
						}														
					}
				}
			}
		}

	}
	
	
</script>
<script>
	function myFunction() {		
		var value2 = document.getElementById("success").value;
		var value1 = document.getElementById("rating1").value;	
		if(value1 !="" || value2 !=""){
			document.getElementById("submit1").disabled=true;
		}else{		
			document.getElementById("submit1").disabled=false;
		}
	}	
</script>

</head>
<body  onload="myFunction();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a> &gt;&gt;<a href="${pageContext.request.contextPath}/viewOrders">My Orders</a><br><br>
	
<input type="hidden" value="${RatingDone}" name="rating1" id="rating1"/>
<input type="hidden" name="success" id="success" value="${successMessage}"></input>
	<c:choose>
						<c:when test="${not empty successMessage}">
							<div id='myDialog'>
								<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
								 <br>
								 <br>
								Click&nbsp;&nbsp;<a href="jobRating" style="font-size: 14px;text-decoration: underline;color:blue;">here</a>&nbsp;&nbsp;To go back to your order list.							
								<div style="height: 15px;"></div>
							</div>
						</c:when>
					</c:choose>
	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">Feedback
		comments</div>
	<c:url var="feedbackCommentsUrl"
		value="/feedbackAdd?id=${feedbackUrlAttribute.id}" />
	<form:form modelAttribute="feedbackUrlAttribute" method="POST"
		action="${feedbackCommentsUrl}">
		<div align="center">
			<div style="height: 15px"></div>
			<table style="width: 900px;">
				<tr>
					<td style="font-weight: bold;">Project:</td>
					<td style=""><form:input type="text" path="projectName"
							cssStyle="border:none; background:none;font-weight:bold;"
							readonly="true"></form:input></td>
					<td style="font-weight: bold;">Client:</td>
					<td style=""><form:input type="text" path="clientName"
							cssStyle="border:none; background:none;font-weight:bold;"
							readonly="true" /></td>
					<td style="font-weight: bold;">Date:</td>
					<td><c:out value="${ratingDate1}"/></td>
				</tr>
			</table>
			<div style="height: 15px"></div>
			<table>

				<tr>
					<td><div align="center">
							<table>
								<tr>
									<td>Rate Each Area &nbsp;&nbsp;&nbsp;1...2...3..4..5</td>
								</tr>
							</table>
							<table style="text-align: left; width: 300px;">
								<tr>
									<td style="text-align: left;">Quality</td>
									<td><script type="text/javascript">
										function test(value) {
											alert("This rating's value is "
													+ value);
										}
										$(function() {
											$("#my_text_input")
													.webwidget_rating_bar(
															{
																rating_star_length : '5',
																rating_default_value : '0',
																rating_function_name : '',//this is function name for click
																directory : 'images'
															});
										});
									</script> <input type="hidden" name="my_text_input" value=""
										id="my_text_input" size="2" /></td>

								</tr>
								<tr>
									<td style="text-align: left;">Experience</td>
									<td><script type="text/javascript">
										$(function() {
											$("#my_text_input1")
													.webwidget_rating_bar(
															{
																rating_star_length : '5',
																rating_default_value : '0',
																rating_function_name : '',//this is function name for click
																directory : 'images'
															});
										});
									</script> <input type="hidden" name="my_text_input1" value=""
										id="my_text_input1" size="2" /></td>

								</tr>
								<tr>
									<td style="text-align: left;">Response</td>
									<td><script type="text/javascript">
										$(function() {
											$("#my_text_input2")
													.webwidget_rating_bar(
															{
																rating_star_length : '5',
																rating_default_value : '0',
																rating_function_name : '',//this is function name for click
																directory : 'images'
															});
										});
									</script> <input type="hidden" name="my_text_input2" value=""
										id="my_text_input2" size="2" /></td>

								</tr>
								<tr>
									<td style="text-align: left;">Professionalism</td>
									<td><script type="text/javascript">
										$(function() {
											$("#my_text_input3")
													.webwidget_rating_bar(
															{
																rating_star_length : '5',
																rating_default_value : '0',
																rating_function_name : '',//this is function name for click
																directory : 'images'
															});
										});
									</script> <input type="hidden" name="my_text_input3" value=""
										id="my_text_input3" size="2" /></td>

								</tr>

							</table>
						</div></td>
				</tr>
				<tr>
					<td style="font-weight: bold; text-align: left;">Comments:</td>
				</tr>
				<tr>
					<td align="center" colspan="6" style="width: 650px;">
					<textarea
							id="TextArea1" name="TextArea1" cols="100" name="S1" rows="10"
							style="max-width: 900px;"></textarea>
							<h1 style="color:red;font-size:14px;">${errorMessage}</h1></td>
							
				</tr>
			</table>
		</div>
		<div style="height: 60px;">
		
		<br>
		<input type="submit" name="submit1" id="submit1"
			style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; margin-left: 280px;"
			value="Save Changes" onclick="return valueCheck();deletePackage();" disabled>
</div>
	</form:form>
	<c:url var="mainUrl" value="/jobRating" />
	<form:form method="GET" action="${mainUrl}" commandName="/jobRating"
		cssStyle="margin-left: 400px;margin-top: -40px;">
		<input type="submit" value="Cancel"
			style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;" />
			<div style="height: 10px;"></div>
	</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
