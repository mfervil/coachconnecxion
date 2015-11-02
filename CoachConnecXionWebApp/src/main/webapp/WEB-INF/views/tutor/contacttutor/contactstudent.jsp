<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Add Coach/Trainer Education</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Area where Coaches and Trainers can add or edit their education" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

	<script>

		function updateSubcategoryValue(subCatPassed){
			document.getElementById ("coachingSubcategory").value = subCatPassed;
		}
	</script>		
	
<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}
</style><STYLE>
body,input {
	margin: 0px;
	padding: 0px;
}

a {
	color: #0254EB
}

a:visited {
	color: #0254EB
}

#header h2 {
	color: white;
	background-color: #00A1E6;
	margin: 0px;
	padding: 5px;
}

.comment {
	width: 100%;
	background-color: #f0f0f0;
}

a.morelink {
	text-decoration: none;
	outline: none;
}

.morecontent span {
	display: none;
}

.Row
{
    display: table;
    /*width: 100%; Optional*/
    table-layout: fixed; /*Optional*/
    border-spacing: 10px; /*Optional*/
}
.Column
{
    display: table-cell;
    /*background-color: red; Optional*/
}

</style>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js">
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.wysiwyg.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.wysiwyg.js"></script>
 
<script type="text/javascript">
	$(function()

	{

		$('#wysiwyg').wysiwyg();

	});
</script>
<script type="text/javascript">
	$(function()

	{

		$('#wysiwyg1').wysiwyg();

	});
	$(function()

	{

		$('#wysiwygskills').wysiwyg();

	});
</script>
<script type="text/javascript">
	$(function()

	{

		$('#wysiwygkeywords').wysiwyg();

	});
</script>

<link href="${pageContext.request.contextPath}/css/calendar.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>
	$(document).ready(function() {
		$('input#tmpOpen').click(function($e) {
			$('div#myDialog').show(5000);
		});

		$('input#tmpClose').click(function($e) {
			$('div#myDialog').hide(5000);
		});
	});
</script>
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
<script>
	function checkForSuccess() {		
		var value1 = document.getElementById("success").value;	
		if(value1 !=""){
			document.getElementById("submit1").disabled=true;
			if (document.all || document.getElementById) {
				for (i = 0; i < addEducation.length; i++) {
				var formElement = addEducation.elements[i];
				
					if (true) {
						formElement.disabled = true;
					}
				}
			}
		}else{		
			document.getElementById("submit1").disabled=false;
		}
	}	
	
	$(document).ready(function() {
		   $('input[type="radio"]').click(function() {
		       if($(this).attr('id') == '2' ) {
		            $('#showzipecodecoachstylepreference').hide();   
		       } else if ($(this).attr('id') == '1' || $(this).attr('id') == '3') {
		            $('#showzipecodecoachstylepreference').show();   
		       }
		   });
		});
	
	
	
</script>
	
</head>
<body onload="checkForSuccess();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

	<div style="text-align: center; width: 900px; font-size: large; color: #00008B;">
		Send Proposal to Student<br><br></div>
		
	<div style="height: 10px"></div>

	<table style="width: 900px;">

		<tr>

			<td>
				<div style="text-align: left;margin-left:10px;">
					<h1 style="font-size: 14px; color: red;">${errorMessage}</h1>
					<input type="hidden" name="success" id="success" 
						value="${successMessage}"></input>

					<!--  ADD MESSAGE TO RETURN TO HOME PAGE AFTER SENDING THE EMAIL -->
					<c:choose>
						<c:when test="${not empty successMessage}">
							<div id='myDialog'>
								<br>
								<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
								 <br>
								<%-- 								 
								 <a href="educationAdd?profileId=${profileId}" 
								 style="font-size: 14px;text-decoration: underline;color:blue;">CREATE ANOTHER EDUCATION</a>

								<c:if test="${sessionScope.newusercreated != '1'}">
									 <br><br>
									<a href="education?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;color:blue;">VIEW YOUR EDUCATION SUMMARY</a>								
									<div style="height: 15px;"></div>
								</c:if>
																
								<c:if test="${sessionScope.newusercreated == '1'}">
									<br><br> <a href="jobhistoryAdd?profileId=${profileId}"
										style="font-size: 14px; text-decoration: underline; color: blue;">NEXT >></a>  
								</c:if>
								--%>
							</div>
						</c:when>
					</c:choose>
				</div>
				
					<c:url var="contacttutorurl" value="/tutor/contact/mass-email-to-tutors" />
					<form:form method="POST" id="contacttutor" commandName="contacttutor" >
					
					<c:choose>
					    <c:when test="${contacttutor.coachstylepreference == 1}">
							<c:url var="coachstylepreferencename" value="In Person" />
					    </c:when>
					    <c:when test="${contacttutor.coachstylepreference == 2}">
							<c:url var="coachstylepreferencename" value="Online" />
					    </c:when>
					    <c:when test="${contacttutor.coachstylepreference == 3}">
							<c:url var="coachstylepreferencename" value="In Person or Online" />
					    </c:when>
					</c:choose>

					<c:choose>
					    <c:when test="${contacttutor.startmonth == 1}">
							<c:url var="startmonthname" value="January" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 2}">
							<c:url var="startmonthname" value="February" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 3}">
							<c:url var="startmonthname" value="March" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 4}">
							<c:url var="startmonthname" value="April" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 5}">
							<c:url var="startmonthname" value="May" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 6}">
							<c:url var="startmonthname" value="June" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 7}">
							<c:url var="startmonthname" value="July" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 8}">
							<c:url var="startmonthname" value="August" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 9}">
							<c:url var="startmonthname" value="September" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 10}">
							<c:url var="startmonthname" value="October" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 11}">
							<c:url var="startmonthname" value="November" />
					    </c:when>
					    <c:when test="${contacttutor.startmonth == 12}">
							<c:url var="startmonthname" value="December" />
					    </c:when>
					</c:choose>

					<c:choose>
					    <c:when test="${contacttutor.gradelevel == 'a'}">
							<c:url var="gradelevelname" value="Elementary (K - 6)" />
					    </c:when>
					    <c:when test="${contacttutor.gradelevel == 'b'}">
							<c:url var="gradelevelname" value="Junior High (6 - 8)" />
					    </c:when>
					    <c:when test="${contacttutor.gradelevel == 'c'}">
							<c:url var="gradelevelname" value="High School (8 - 12)" />
					    </c:when>
					    <c:when test="${contacttutor.gradelevel == 'd'}">
							<c:url var="gradelevelname" value="College" />
					    </c:when>
					    <c:when test="${contacttutor.gradelevel == 'e'}">
							<c:url var="gradelevelname" value="Professional" />
					    </c:when>
					    <c:when test="${contacttutor.gradelevel == 'f'}">
							<c:url var="gradelevelname" value="Leisure" />
					    </c:when>
					</c:choose>					
						<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>

						<form:hidden path="overview" name="overview" id="overview" value="${contacttutor.overview}"></form:hidden>
						<form:hidden path="availability" name="availability" id="availability" value="${contacttutor.availability}"></form:hidden>
						<form:hidden path="daysavailable" name="daysavailable" id="daysavailable" value="${contacttutor.daysavailable}"></form:hidden>
						<form:hidden path="weeksavailable" name="weeksavailable" id="weeksavailable" value="${contacttutor.weeksavailable}"></form:hidden>
						<form:hidden path="category" name="category" id="category" value="${contacttutor.category}"></form:hidden>
						<form:hidden path="course" name="course" id="course" value="${contacttutor.course}"></form:hidden>

						<form:hidden path="coachstylepreference" name="coachstylepreference" id="coachstylepreference" value="${contacttutor.coachstylepreference}"></form:hidden>
						<form:hidden path="zipcode" name="zipcode" id="zipcode" value="${contacttutor.zipcode}"></form:hidden>
						<form:hidden path="gradelevel" name="gradelevel" id="gradelevel" value="${contacttutor.gradelevel}"></form:hidden>
						<form:hidden path="startday" name="startday" id="startday" value="${contacttutor.startday}"></form:hidden>
						<form:hidden path="startmonth" name="startmonth" id="startmonth" value="${contacttutor.startmonth}"></form:hidden>
						<form:hidden path="startyear" name="startyear" id="startyear" value="${contacttutor.startyear}"></form:hidden>
						<form:hidden path="contacttutorid" name="contacttutorid" id="contacttutorid" value="${contacttutor.contacttutorid}"></form:hidden>
						<form:hidden path="studentemail" name="studentemail" id="studentemail" value="${contacttutor.studentemail}"></form:hidden>




						<div class="Row">
							<div class="Column" style="text-align: left;"><label>Overview:&nbsp;</label> </div>
							<div class="Column" style="text-align: left;">${contacttutor.overview} &nbsp; ${contacttutor.availability}</div>
						</div><br>
						<div class="Row">
							<div class="Column" style="text-align: left;"><label>Availability:&nbsp;</label> </div>
							<div class="Column" style="text-align: left;">${contacttutor.availability}<br></div>
						</div><br>
						<div display:inline-block; style="text-align: left;"><label>Length of Tutoring:</label> ${contacttutor.daysavailable} day(s) a week for ${contacttutor.weeksavailable} weeks</div>
						<br>
						<table style="width: 50%;">
							<tr>
								<td style="text-align: left;"><label>Subject:</label> </td><td style="text-align: left;">${contacttutor.category}</td>
								<td style="text-align: left;"><label>Course: </label></td><td style="text-align: left;">${contacttutor.course}</td>
							</tr>
							<tr>
								<td style="text-align: left;"><label>Location Preference:</label> </td><td style="text-align: left;">${coachstylepreferencename}</td>  
								<td style="text-align: left;"><label>Zipcode: </label></td><td style="text-align: left;">${contacttutor.zipcode}</td>
							</tr>
							<!-- 
							<tr>
								<td style="text-align: left;"><label>City: </label></td><td style="text-align: left;">${contacttutor.category}</td>
								<td style="text-align: left;"><label>State: </label></td><td style="text-align: left;"></td>
							</tr>
							 -->
							<tr>
								<td style="text-align: left;"><label>Grade Level: </label></td><td style="text-align: left;">${gradelevelname}</td>
								<td style="text-align: left;"><label>Start Date: </label></td><td style="text-align: left;">${startmonthname} ${contacttutor.startday}, ${contacttutor.startyear}</td>
							</tr>
						
							<tr>
							<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
							<td class="leftalign"  colspan=4 > <label>Make your case why you should be selected for this tutoring job: </label> <font style="font-size: 14px; color: red;"> <form:errors path="tutorcase" cssClass="error" /></font><br>
							<%-- 
								<td colspan=4 style="text-align: left;">
								<br>
								<b>Make your case why you should be selected for this tutoring job:</b><br>
							--%>	
								<form:textarea  name="wysiwyg" class="required" cols="100"
								id="wysiwyg" rows="10" path="tutorcase" value="&nbsp;"/> 
								</td>
							</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>

						<tr>
						<td></td>
							<td style="text-align: left;"><input type="submit"
								style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
								value="Send your proposal to the student" name="submit1" id="submit1" disabled colspan="2">

								<c:if test="${sessionScope.newusercreated == '1'}">
									&nbsp;&nbsp;&nbsp;&nbsp;<a href="jobhistoryAdd?profileId=${profileId}"
										style="font-size: 14px; text-decoration: underline; color: blue;">SKIP EDUCATION</a>
								</c:if>								
							</td>
						</tr>
						</table>
					</form:form>

				<%-- 
				<c:if test="${sessionScope.newusercreated != '1'}">

					<table style="margin-left: 0px; margin-top: -31px;">
						<tr>
							<td><c:url var="profileUrl" value="/education" /> <form:form
									commandName="/tutor/education" method="GET" action="${profileUrl}">
	
									<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
									<input type="submit"
										style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
										value="Cancel">
								</form:form></td>
						</tr>
					</table>
				</c:if>
				--%>
								
			</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>