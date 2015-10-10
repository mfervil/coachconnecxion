<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<%@ page import="java.util.HashMap, com.fervil.spring.careercoach.util.Constants, java.io.*, java.sql.Blob" %>
<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coach/Trainer User Profile List</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Find a listing of all of our Coaches and Trainers" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

<script type="text/javascript">	
	$(document).ready(function(){
		$("#sortcoachlist").change(function() {
			window.location.href=$( "#sortlink" ).val() + /sortcoachlist/ + $( "#sortcoachlist" ).val();
		});
	});
</script>

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a> &gt;&gt;<a href="${pageContext.request.contextPath}/tutor/public/coachSelection">New Search</a>
	<c:if test="${not empty coachingcategoryname}" >
		 &gt;&gt;<a href="${pageContext.request.contextPath}/tutor/public/landing-business-coaches">Business Coach Search</a>
	</c:if>
	
		<br><br>
		
		<!-- CONTACT FORM -->
		<form:form method="post" id="frmcoachingRequest" commandName="coachingRequest">
				<table>
					<thead>
						<tr>
						<th>LIST OF COACHES </th>
						<th style="text-align: left;">
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SORT LIST BY: 
							<select  id="sortcoachlist" name="sortcoachlist" >
					          ${sortcoachlist =='1' ? "<option value='1' selected>Default: Best Match</option>" : "<option value='1'>Default: Best Match</option>"}
					          ${sortcoachlist =='2' ? "<option value='2' selected>Price: Highest</option>" : "<option value='2'>Price: Highest</option>"}
					          ${sortcoachlist =='3' ? "<option value='3' selected>Price: Lowest</option>" : "<option value='3'>Price: Lowest</option>"}
					          ${sortcoachlist =='4' ? "<option value='4' selected>Rating: Highest</option>" : "<option value='4'>Rating: Highest</option>"}
							</select>
						</th>
						<th style="position: absolute; right:0px;"> 
							Page: ${pageNumber} of ${totalpages} &nbsp;&nbsp;
							<c:if test="${pageNumber > 1}" >
								<%-- <a style="color:#0000FF" href="${pageContext.request.contextPath}/tutor/public/userprofileList?coachingCategory=${coachingCategory}&coachingSubcategory=${coachingSubcategory}&industryExperience=${industryExperience}&companyExperience=${companyExperience}&coachFirstName=${coachFirstName}&coachLastName=${coachLastName}&city=${city}&state=${state}&pageNumber=${pageNumber - 1}&userprofilecount=${userprofilecount}&pagesize=${pagesize}"> &lt;&lt; PREV PAGE </a> &nbsp;&nbsp;&nbsp;&nbsp;
								--%>
								<a style="color:#0000FF" href="${pageContext.request.contextPath}/tutor/public/coachprofileListAdvance/coachingCategory/${coachingCategory}/coachingSubcategory/${coachingSubcategory}/industryExperience/${industryExperience}/companyExperience/${companyExperience}/gradelevel/${gradelevel}/maxrate/${maxrate}/subject/${subject}/coachFirstName/${coachFirstName}/coachLastName/${coachLastName}/city/${city}/state/${state}/pageNumber/${pageNumber - 1}/zipcode/${zipcode}/coachstyleinperson/${coachstyleinperson}/coachstyleonline/${coachstyleonline}/sortcoachlist/${sortcoachlist}"> &lt;&lt; PREVIOUS PAGE </a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
	
							<c:if test="${userprofilecount > (pageNumber * pagesize) }" >
								<a style="color:#0000FF" href="${pageContext.request.contextPath}/tutor/public/coachprofileListAdvance/coachingCategory/${coachingCategory}/coachingSubcategory/${coachingSubcategory}/industryExperience/${industryExperience}/companyExperience/${companyExperience}/gradelevel/${gradelevel}/maxrate/${maxrate}/subject/${subject}/coachFirstName/${coachFirstName}/coachLastName/${coachLastName}/city/${city}/state/${state}/pageNumber/${pageNumber + 1}/zipcode/${zipcode}/coachstyleinperson/${coachstyleinperson}/coachstyleonline/${coachstyleonline}/sortcoachlist/${sortcoachlist}"> NEXT PAGE &gt;&gt; </a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
						</th> 

						<!--  <th>Payment Terms</th>  -->
						</tr>
					</thead>
					<%
						String finalPath = request.getContextPath();
					
					%>
					
   					<c:if test="${empty userProfiles}">
						<p style="color: red; text-align: center; font-size: 16px;"> NO RECORDS FOUND.  TRY TO WIDEN YOUR SEARCH FOR BETTER RESULTS. <br> <br></p>
					</c:if>
					
					<tbody>

						<c:forEach items="${userProfiles}" varStatus="status" var="userProfileDetails">
						
								<c:set var="averageRate1" value ="${userProfileDetails.rating}"/>

								<c:set var="tmpprofileId" value ="${userProfileDetails.user_profile_id}" />
								<% 
								
								/*
									String finalURL = finalPath + Constants.UPLOAD_DIRECTORY + "/" + pageContext.getAttribute("tmpprofileId") + "/" + "USERPROFILEIMAGE" + pageContext.getAttribute("tmpprofileId") + ".jpg"; 
								
									ServletContext app = getServletContext();
									String path1 = app.getRealPath(".." + finalURL);
									
									File theImage1 = new File(path1);									
								
									if(!theImage1.exists())
									{
										//finalURL = "/spring-security-demo-2CCUP/general/nopicture.png"; 
										//finalURL = "${pageContext.request.contextPath}${pageContext.request.contextPath}/images/general/nopicture.png"; 
										finalURL = finalPath + "/images/general/nopicture.png"; //used for image below in source field  inital value was in JSP script src=finalURL "

									}
								*/	
								%>
								
								<tr> 
									<td class="leftalign" width="125px;" height="115px" >
											<c:choose>
    											<c:when test="${empty userProfileDetails.profile_picture_type}">
													<a  rel="nofollow" href="${pageContext.request.contextPath}/tutor/public/profile?profileId=${userProfileDetails.user_profile_id}"><img id="photo2" src="https://s3.amazonaws.com/ccxvi/nopicture.png" width="125px;"/></a>
												</c:when>
    											<c:otherwise>
													<a  rel="nofollow" href="${pageContext.request.contextPath}/tutor/public/profile?profileId=${userProfileDetails.user_profile_id}"><img id="photo2" src="https://s3.amazonaws.com/ccxvi/ccxv1${userProfileDetails.user_profile_id}.${userProfileDetails.profile_picture_type}" width="125px;" /></a>
    											</c:otherwise>
											</c:choose>
											<br><a href="${pageContext.request.contextPath}/tutor/public/coachprofile/profileId/${userProfileDetails.user_profile_id}" style="font-size: 6px;">public coach details</a>			
									</td>																		
								
									<td class="leftalign" width="100%"> <br> 
										 <b> &nbsp;&nbsp;<a  rel="nofollow" href="${pageContext.request.contextPath}/tutor/public/profile?profileId=${userProfileDetails.user_profile_id}"><font color="blue" style="font-size:16px">${userProfileDetails.display_name}</font></a></b> &nbsp;&nbsp;<%@ include file="/WEB-INF/views/tutor/common/average_rating.jsp" %>	
										 <br><br> <p style="color:green"><b>&nbsp;&nbsp;Rate: </b> $<fmt:formatNumber type="number" maxFractionDigits="0" value="${userProfileDetails.hourlyrate}" /> / HOUR  &nbsp; &nbsp;<b>Tutoring Type:&nbsp;</b>  <c:if test="${userProfileDetails.coachstyleinperson == 1}" > + In Person</c:if> <c:if test="${userProfileDetails.coachstyleonline == 1}" > + Online</c:if></p>
										 <b>&nbsp;&nbsp;City:</b> ${userProfileDetails.city} || ${userProfileDetails.profilepicturestring} &nbsp;&nbsp;<b>State/Province: </b> ${userProfileDetails.state} 
									     <br> <!-- <b>&nbsp;&nbsp;# Clients:</b> ${userProfileDetails.num_clients}  
									      &nbsp;&nbsp;<b> Packages from:</b>&nbsp;$${userProfileDetails.packages_from} --> 
									      &nbsp;&nbsp;<b>Coaching Categories: </b>${userProfileDetails.coaching_category_name1} - ${userProfileDetails.coaching_category_name2} - ${userProfileDetails.coaching_category_name3} 

									    		<br><br>&nbsp;&nbsp;
									    		<a style ="background-color: #B0C4DE;
												    color: black;
												    width: 200px;
												    padding: 3px;
												    border: 1px solid navy;"
													href="${pageContext.request.contextPath}/tutor/public/profile?profileId=${userProfileDetails.user_profile_id}" 
													> View More Details & Contact Tutor
												</a>
											<br>	


										<br><br>
									 </td>
								</tr>
								<tr>
									<td class="leftalign" colspan="3">
										<c:if test="${fn:length(userProfileDetails.overview)  > 2000}">
									     	${fn:substring(userProfileDetails.overview, 0, 2000)}<a  rel="nofollow" href="${pageContext.request.contextPath}/tutor/public/profile?profileId=${userProfileDetails.user_profile_id}"><font color="blue" size="14"> . . .read more</font></a> 
									    </c:if> 
										<c:if test="${fn:length(userProfileDetails.overview)  <= 2000}">
									     	${fn:substring(userProfileDetails.overview, 0, 2000)} 
									    </c:if> 
									    
									<%-- 									    
									     <br><a  rel="nofollow" href="${pageContext.request.contextPath}/tutor/public/profile?profileId=${userProfileDetails.user_profile_id}"><font color="blue" size="14"><br><ul>SEE COACH DETAILS & VIDEO, ASK QUESTIONS, PROVIDE FEEDBACK & RATINGS </ul></font></a> <br><br>
									--%>
									</td>      
								 </tr>
								 
								 <tr><td>&nbsp;</td></tr>
								 
								 <c:set var="userProfileId" value ="${userProfile.userProfileId}"/>
								 <!-- <td><c:out value="${customerId}" /></td> -->
						</c:forEach>
					</tbody>	
			</table>
			<table>
						<th></th>
						<th style="position: absolute; right:0px;"> 
							Page: ${pageNumber} of ${totalpages} &nbsp;&nbsp;
							<c:if test="${pageNumber > 1}" >
								<a style="color:#0000FF" href="${pageContext.request.contextPath}/tutor/public/coachprofileListAdvance/coachingCategory/${coachingCategory}/coachingSubcategory/${coachingSubcategory}/industryExperience/${industryExperience}/companyExperience/${companyExperience}/gradelevel/${gradelevel}/maxrate/${maxrate}/subject/${subject}/coachFirstName/${coachFirstName}/coachLastName/${coachLastName}/city/${city}/state/${state}/pageNumber/${pageNumber - 1}/zipcode/${zipcode}/coachstyleinperson/${coachstyleinperson}/coachstyleonline/${coachstyleonline}/sortcoachlist/${sortcoachlist}"> &lt;&lt; PREVIOUS PAGE </a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
	
							<c:if test="${userprofilecount > (pageNumber * pagesize) }" >
								<a style="color:#0000FF" href="${pageContext.request.contextPath}/tutor/public/coachprofileListAdvance/coachingCategory/${coachingCategory}/coachingSubcategory/${coachingSubcategory}/industryExperience/${industryExperience}/companyExperience/${companyExperience}/gradelevel/${gradelevel}/maxrate/${maxrate}/subject/${subject}/coachFirstName/${coachFirstName}/coachLastName/${coachLastName}/city/${city}/state/${state}/pageNumber/${pageNumber + 1}/zipcode/${zipcode}/coachstyleinperson/${coachstyleinperson}/coachstyleonline/${coachstyleonline}/sortcoachlist/${sortcoachlist}"> NEXT PAGE &gt;&gt; </a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
						</th> 
			</table>
		<!--  This section is opened in header_no_side.jsp -->
		</section>
		
		<!-- SIDEBAR -->
		
		<%-- 
		<section id="sidebar">
			<!-- SUB NAVIGATION -->
			<section>
					<p style="font-size:150%"><br><br>Your available coaches are listed.  <br><br> Please select the "Service Details" link to get more information about the coach and the services offered.
			</section>
		</section>	
		--%>
		
		<%-- <form:hidden path="coachingCategory" id="coachingCategory" value="${coachingCategory}"/> --%>
		<input type="hidden" id="coachingCategory" name="coachingCategory" value="${coachingCategory}">
		<input type="hidden" id="sortlink" name="sortlink" value="${pageContext.request.contextPath}/tutor/public/coachprofileListAdvance/coachingCategory/${coachingCategory}/coachingSubcategory/${coachingSubcategory}/industryExperience/${industryExperience}/companyExperience/${companyExperience}/gradelevel/${gradelevel}/maxrate/${maxrate}/subject/${subject}/coachFirstName/${coachFirstName}/coachLastName/${coachLastName}/city/${city}/state/${state}/pageNumber/1/zipcode/${zipcode}/coachstyleinperson/${coachstyleinperson}/coachstyleonline/${coachstyleonline}">
		
	</form:form>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>