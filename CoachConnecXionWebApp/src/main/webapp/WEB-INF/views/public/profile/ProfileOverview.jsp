<%@ page import="com.fervil.spring.careercoach.util.Constants" %>
<%@ include file="/WEB-INF/views/common/include.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<%@ page import="java.io.File"%>

<%@ page import="com.fervil.spring.careercoach.util.SystemUtil" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coach/Trainer Profile Overview</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="View the profile of our Coaches and Trainers" />
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


table td {
	height: 30px;
	text-align: center;
	vertical-align: middle;
	margin-top: 4px;
}
</style>
<STYLE>
body,input {
	margin: 0px;
	padding: 0px;
}

/*
a {
	color: #0254EB
}

a:visited {
	color: #0254EB
}
*/

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

table tr:nth-child(2n) {
	background: none;
	
}

</STYLE>

<SCRIPT>
	$(document).ready(function() {
						var showChar = 300;
						var ellipsestext = "...";
						var moretext = "more";
						var lesstext = "less";
						$('.more').each(function() {
											var content = $(this).html();

											if (content.length > showChar) {

												var c = content.substr(0, showChar);
												var h = content.substr(showChar - 1, content.length	- showChar);

												var html = c
														+ '<span class="moreelipses">'
														+ ellipsestext
														+ '</span>&nbsp;<span class="morecontent"><span>'
														+ h
														+ '</span>&nbsp;&nbsp;<a href="" class="morelink">'
														+ moretext
														+ '</a></span>';

												$(this).html(html);
											}

										});

						$(".morelink").click(function() {
							if ($(this).hasClass("less")) {
								$(this).removeClass("less");
								$(this).html(moretext);
							} else {
								$(this).addClass("less");
								$(this).html(lesstext);
							}
							$(this).parent().prev().toggle();
							$(this).prev().toggle();
							return false;
						});
					});
</SCRIPT>


</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

<c:choose>  
    <c:when test="${profileOfCurrentUser}" >  
		<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a> <br><br>
	</c:when>  
	<c:otherwise>
		<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a> &gt;&gt;<a href="${pageContext.request.contextPath}/public/coachSelection">New Search</a>
		&gt;&gt;<a href="${pageContext.request.contextPath}/public/coachSelection?BREADCRUMB=y">Coach List</a><br><br>
	</c:otherwise>
</c:choose>


	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->

<div id="profilevideo" style="display: none;">
		<p><a href="#" onClick="window.parent.jQuery('#profilevideo').hide();"> Close this video</a> </p>
		<c:set var="URL" value="${utubeVideoLink}"/>
		<c:set var="URL1" value="${URL}=" />
		<c:set var="a" value="${fn:split(URL, '=')}" />
		<c:set var="utubeVideo" value="${a[1]}" />
		
		<c:set var="embedinfo" value="${embed}"/>
		
		<%
		
		out.println("<iframe width=\"600\" height=\"600\" src=\"//www.youtube.com/embed/"+ pageContext.findAttribute("embedinfo")  +"\" frameborder=\"0\" allowfullscreen></iframe>");	
		%>	
	
</div>
						
<div class="tabs">
				<ul >
					<li><a href="#overview">OVERVIEW &nbsp;&nbsp; /</a></li>
					<li><a href="#education">TRAINING:EDUCATION &nbsp;&nbsp; /</a></li>
					<li><a href="#jobhistory">JOB HISTORY &nbsp;&nbsp; /</a></li>

					<c:choose>  
					    <c:when test="${profileOfCurrentUser}" >  
							<li><a href="#packages">SELL SERVICES - ASK QUESTIONS</a></li>
						</c:when>  
						<c:otherwise>
							<li><a href="#packages">BUY SERVICES - ASK QUESTIONS</a></li>
						</c:otherwise>
					</c:choose>
					
					<li > &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
					<span id="siteseal"  style="text-align: right; align-items: right; right: 0px; align: right"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
					</li>
				</ul>
				
<div id="overview">
<%
String finalPath = request.getContextPath();
%>

<c:set var="tmpprofileId" value ="${userProfileDetails.user_profile_id}" />
<% 

	/*
	String finalURL = finalPath + Constants.UPLOAD_DIRECTORY + "/" + request.getAttribute("profileId") + "/" + "USERPROFILEIMAGE" + request.getAttribute("profileId") + ".jpg"; 

	ServletContext app = getServletContext();
	String path1 = app.getRealPath(".." + finalURL);
	File theImage1 = new File(path1);									
	
	if(!theImage1.exists())
	{
		finalURL = "/spring-security-demo-2CCUP/general/nopicture.png";
	}	

	//long userProfileId = SystemUtil.getUserProfileId(request);
	*/
	
%>

<table>
	<tr> 

<%--

<td >
		 <img id="photo2" src="displayProfileImage?profileId=${profileId}" width="125px;" height="115px"/>  
			<img id="photo2" src="<%=finalURL %>" width="25px;" height="115px"/>
</td>
<td style="vertical-align: bottom; text-align: right; background-image: url('<%=finalURL %>'); background-size: 100% 100%; width: 125px; height: 115px;">
	
--%>

											<c:choose>
    											<c:when test="${empty profileInfo.profile_picture_type}">
													<!--  <td style="vertical-align: bottom; text-align: right; background-image: url('https://s3.amazonaws.com/ccxvi/nopicture.png'); background-size: 100% 100%; width: 125px; ">  -->
													<td>
														<img id="photo1" src="https://s3.amazonaws.com/ccxvi/nopicture.png" width="125px;"/>
												</c:when>
    											<c:otherwise>
													<td> 
														<img id="photo2" src="https://s3.amazonaws.com/ccxvi/ccxv1${profileInfo.userProfileId}.${profileInfo.profile_picture_type}" width="125px;" /> 
													<!--  <td style="vertical-align: bottom; text-align: right; background-image: url('https://s3.amazonaws.com/ccxvi/ccxv1${profileInfo.userProfileId}.${profileInfo.profile_picture_type}'); background-size: 100% 100%; width: 125px; ">  -->
    											</c:otherwise>
											</c:choose>			

<br /> 
<c:if test="${not empty profileInfo.getVideo_url()}">
		<a href="#" onClick="window.parent.jQuery('#profilevideo').show();">PLAY VIDEO
		</a>
		 
		<!--
		<img id="photo2" onClick="window.parent.jQuery('#profilevideo').show();" src="${pageContext.request.contextPath}/images/player_play_2.png" width="30px;" height="30px" Title="Click to play video"/> 
		-->
</c:if>		
</td>

		 <td >
							<table>
								<tr>
									<td style="float: left; color: blue; font-weight: bold; font-size: 20px;">${profileInfo.getDisplayName()}
									</td>
									<c:if test="${profileOfCurrentUser}" > 					
										<td style="float: right;"><a href="../createuserprofile?profileId=${profileId}" style="color: blue; text-decoration: underline;">&nbsp;EDIT MY PROFILE</a> </td>
									</c:if>
								<%--	<td style="float: right;"><input type="submit" value="Edit Profile"
										style="text-decoration: none; font-size: 14px; background-color: lightblue; background-position: right;" />
									</td>
								--%>	
								</tr>
							</table>

							<table border="1">
							<tr> <td class="leftalign"><b>City:&nbsp;</b> ${profileInfo.getCity()} </td> <td class="leftalign"><b>State:&nbsp;</b> </td> <td class="leftalign">${profileInfo.getState()} </td>
							</tr>
							<tr>
								 <!--  <td class="rightalign"><b>Clients:&nbsp;</b> </td> <td class="leftalign"><c:out value="${totalClients}"></c:out> </td>  --> <td class="leftalign"><b>Average Rating:&nbsp;</b> <%@ include file="/WEB-INF/views/common/average_rating.jsp" %> </td>
							</tr>
							<c:if test="${not profileOfCurrentUser}" > 					
								<tr>
									<td style="text-align: left;"><br>
										<a  rel="nofollow" style ="background-color: #0099CC; color: white; width: 200px; padding: 3px; border: 1px solid navy;" 
										href="${pageContext.request.contextPath}/feedbackAddNoOrder?vendorName=${profileInfo.getDisplayName()}&vendorId=${profileInfo.userProfileId}&customerId=${profileId}">
											Provide Feedback & Rating
										</a>
									</td> 
								</tr>
							</c:if>	
							<%--
							<tr>
								 <td class="rightalign" nowrap><b>Position:&nbsp;</b> </td> <td class="leftalign" colspan="3"> ${profileInfo.getSummaryOfHighestPosition()} </td>
							</tr>
							 --%>
							<%--
							<tr>
								<td style="font-size: 12px; text-align: left; vertical-align: top;"><b>Country:</b> USA &nbsp; <b>Language:</b> English <br><b>Clients:</b> <c:out value="${totalClients}"></c:out> &nbsp; <b>Average Rating:</b> <%@ include file="/WEB-INF/views/common/average_rating.jsp" %><br><b>Highest Position Held:</b> VP Of Information Technology
								</td>
							</tr>
							 --%>
							</table>
							
</td>
</tr>
</table>
<hr><hr>
							<table>
								<tr>
									<td><h1 style="color: blue; text-align: center;">Overview</h1></td>
								</tr>

							</table>
							<table>
								<tr>
									<td style="text-align: left;"> ${profileInfo.getOverview()}
										<%-- <div class="comment more">${profileInfo.getOverview()} ---  CoachConnecXion Pro Audio manufactures
											professional digital and analog audio equipment for quality
											conscious people. Expect no less than excellence in design,
											ergonomics and sonic quality. This is what our name stands
											for.  CoachConnecXion Pro Audio manufactures professional digital and
											analog audio equipment for quality conscious people. Expect
											no less than excellence in design, ergonomics and sonic
											quality. This is what our name stands for.  CoachConnecXion Pro Audio
											manufactures professional digital and analog audio equipment
											for quality conscious people. Expect no less than excellence
											in design, ergonomics and sonic quality. This is what our
											name stands for.</div>
										--%>	
									</td>
								</tr>
							</table> <br></br>
							<table>
								<tr>
									<td><h1 style="color: blue; text-align: center;">Service
											Description</h1></td>
								</tr>

							</table>
							<table>
								<tr>
									<td style="text-align: left;">${profileInfo.getServiceDescription()}
										<%-- <div class="comment more">${profileInfo.getServiceDescription()} ---  CoachConnecXion Pro Audio manufactures
											professional digital and analog audio equipment for quality
											conscious people. Expect no less than excellence in design,
											ergonomics and sonic quality. This is what our name stands
											for.  CoachConnecXion Pro Audio manufactures professional digital and
											analog audio equipment for quality conscious people. Expect
											no less than excellence in design, ergonomics and sonic
											quality. This is what our name stands for.  CoachConnecXion Pro Audio
											manufactures professional digital and analog audio equipment
											for quality conscious people. Expect no less than excellence
											in design, ergonomics and sonic quality. This is what our
											name stands for.</div>
										 --%>	
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td><h1 style="color: blue; text-align: center;">Skills</h1></td>
								</tr>

							</table>
							<table>
								<tr>
									<td style="text-align: left;">${profileInfo.getSkillsExpertise()}
										<%--<div class="comment more">${profileInfo.getSkillsExpertise()} ---  CoachConnecXion Pro Audio manufactures
											professional digital and analog audio equipment for quality
											conscious people. Expect no less than excellence in design,
											ergonomics and sonic quality. This is what our name stands
											for.  CoachConnecXion Pro Audio manufactures professional digital and
											analog audio equipment for quality conscious people. Expect
											no less than excellence in design, ergonomics and sonic
											quality. This is what our name stands for.  CoachConnecXion Pro Audio
											manufactures professional digital and analog audio equipment
											for quality conscious people. Expect no less than excellence
											in design, ergonomics and sonic quality. This is what our
											name stands for.</div>
										 --%>	
									</td>
								</tr>
							</table> <br></br>
</div><!-- end of overview -->
<div id="jobhistory">
							
							<table>
								<tr style="border-bottom:1px solid #000;">
									<td style="text-align: left; font-weight: bold;"><h2>JOB HISTORY </h2></td>
									<td> <c:url var="jobhistoryUrl" value="/workexperience" />
										<%--
										<form:form method="GET" action="${jobhistoryUrl}" commandName="jobHistoryAttribute"> 
										<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
											
											<table>
												<tr>
													<td><input type="submit" value="Add / Edit / Delete Job History"
														style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: right;" /></td>
												</tr>
											</table>
											--%>
											<c:if test="${profileOfCurrentUser}" > 					
												<a href="${jobhistoryUrl}?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;">&nbsp;&nbsp;&nbsp;&nbsp;Click here to ADD / EDIT / DELETE JOB HISTORY</a>
											</c:if>
										</td>
								</tr>
							</table> 
							<hr>
							<c:if test="${!empty addExperiences}">
								<table class="data" style="width:100%;">
									<tr>
										<th style="text-align: left;">&nbsp;&nbsp;Company</th>
										<th style="text-align: left;">Title</th>
										<th style="text-align: left;">City/State</th>
										<th style="text-align: left;">From</th>
										<th style="text-align: left;">To</th>

									</tr>
									<c:forEach items="${addExperiences}" var="jobHostory">
										<tr>
											<td style="text-align: left;">
											<div style="width:200px;word-wrap: break-word;">${jobHostory.employerName}</div></td>
											<td style="text-align: left;"><div style="word-wrap: break-word; width:150px;">${jobHostory.labelName}</div></td>
											<td style="text-align: left;"><div style="word-wrap: break-word; width:150px;">${jobHostory.countryName}</div></td>
											<td style="text-align: left;"><div style="word-wrap: break-word; width:100px;">${jobHostory.startDate}</div></td>
											<td style="text-align: left;"><div style="word-wrap: break-word; width:100px;">${jobHostory.endDate}</div></td>
										</tr>
									</c:forEach>
								</table>
							</c:if><br></br>
</div><!-- end of jobhistory -->
<div id="education">
							<table>
								<tr style="border-bottom:1px solid #000;">
									<td style="text-align: left; font-weight: bold;"><h2>EDUCATION / CERTIFICATES</h2></td>
									<td><c:url var="educationUrl" value="/education" /> <%-- <form:form method="GET" action="${educationUrl}"> --%>
									<td>
										<c:if test="${profileOfCurrentUser}" > 					
											<a href="${educationUrl}?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;">&nbsp;&nbsp;&nbsp;&nbsp;Click here to ADD / EDIT / DELETE EDUCATION</a>
										</c:if>	
									</td>
									<%-- 
										<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
											<table>
												<tr>
													<td><input type="submit" value="Add / Edit / Delete Education"
														style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: right;" /></td>
												</tr>
											</table>
										</form:form></td>
									--%>	
								</tr>
							</table> 
							<hr>
							<c:if test="${!empty addEducations}">
								<table class="data">
									<tr>
										<td style="text-align: left; font-weight: bold;width:200px;">School/Organization</td>
										<td style="text-align: left; font-weight: bold;width:200px;">Degree/certificate</td>
										<td style="text-align: left; font-weight: bold;width:200px;">Concentrations</td>
										<td style="text-align: left; font-weight: bold;width:100px;">Graduation Date</td>
									</tr>
									<c:forEach items="${addEducations}" var="educations">

										<tr>
											<td style="text-align: left;"><div style="width:200px;word-wrap: break-word;">${educations.schoolName}</div></td>
											<td style="text-align: left;"><div style="width:200px;word-wrap: break-word;">${educations.degreeLevel}</div></td>
											<td style="text-align: left;"><div style="width:200px;word-wrap: break-word;">${educations.concentrationsName}</div></td>
											<td style="text-align: left;"><div style="width:100px;word-wrap: break-word;">${educations.toDate}</div></td>

										</tr>
									</c:forEach>
								</table>
							</c:if> <br></br>
</div><!-- end of education -->
<div id="packages">
							<!-- ============================  Packages  =========================================== -->
							<form:form	method="GET" action="${packagesUrl}">							
							<table>
								<%-- <tr><td style="text-align: left;">
										<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
								 		<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span> 
									</td></tr> 
								--%>
								<tr style="border-bottom:1px solid #000;">
									<td style="text-align: left; font-weight: bold;"><h2>AVAILABLE PACKAGES</h2>
									</td>
									<td>
										<c:url var="packagesUrl" value="/packages" /> 
											<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
											<%-- <table>
												<tr>  --%>
														<c:if test="${profileOfCurrentUser}" > 					
															<a href="${packagesUrl}?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;">&nbsp;&nbsp;&nbsp;&nbsp;Click here to ADD / EDIT / DELETE PACKAGES</a>
														</c:if>	
														<%-- <input type="submit" value="Add / Edit / Delete Packages"
														style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: right;" /></td>
														 --%>
												<%-- </tr>
											</table> --%>
									</td>		
								</tr>
							</table> 
							</form:form>
							<hr>
							<!-- ============================  Packages  =========================================== -->

							<c:if test="${!empty availablePackages}">
								<c:forEach items="${availablePackages}" var="availablePackages">
								    <!--  <a href="http://www.secureinfossl.com/carts/shopping_cart/oneClickProductBuy/a645047933ed7b2eb3be5defd91e083e/0"><img src="https://www.secureinfossl.com${pageContext.request.contextPath}/images/cart_buttons/cart_button_6.gif" border="0"></a></td>  -->

									<c:url var="paymentinformation" value="/public/paymentinformation" />
									<form:form method="GET" action="${paymentinformation}"
										commandName="paymentinformation">
									<table class="data">
										<tr>
											<td style="text-align: left;">
												<input style="color: white; border: 1px solid navy; background-color: #0099CC; padding: 3px; border: 1px; solid gray" type="submit" class="input-button" value="Buy This Package" />
											</td>	

											<td style="text-align: left;">
												<!-- <a style="color: blue; border-style: solid; border-width: 1px  solid navy; padding: 5px;" --> 
												<a style ="background-color: #0099CC;
														    color: white;	
														    width: 200px;
														    padding: 3px;
														    border: 1px solid navy;"
													href="${pageContext.request.contextPath}/workroom/wrsendMessageNoOrder?coachProfileId=${profileId}&coachDisplayName=${profileInfo.getDisplayName()}&packageId=${availablePackages.id}&coachEmail=${profileInfo.getEmail()}&packageName=${availablePackages.packageName}&packagePrice=${availablePackages.priceValue}">
													Assessment & Ask Questions
												</a>
												
											</td> 
										</tr>
										<tr>
											<td width="100%" colspan=2><h1 style="border-style: solid; text-align: center;"><br>Package Name: ${availablePackages.packageName} -- Price:  ${availablePackages.priceValue} </h1>
											</td>
										</tr>
										<tr>
											<td style="text-align: left;" colspan="2"><br><h2>Overview </h2>${availablePackages.overView} <br> &nbsp;</td>
										</tr>
										<tr>
											<td style="text-align: left;" colspan="2"><h2>Details </h2>${availablePackages.packageDetails} </td>
										</tr>
										<tr><td>&nbsp;</td></tr>
									</table>
										<input type="hidden" name="packageId" id="packageId" value="${availablePackages.id}"></input>
										<input type="hidden" name="packageName" id="packageName" value="${availablePackages.packageName}"></input>
										<input type="hidden" name="packagePrice" id="packagePrice" value="${availablePackages.priceValue}"></input>
										<input type="hidden" name="coachEmail" id="coachEmail" value="${profileInfo.getEmail()}"></input>

							    	</form:form>
							    	<hr>
								</c:forEach>

							</c:if> <br></br>

							<!-- ============================ End Packages  =========================================== -->
</div><!-- end of packages -->
</div><!-- tabs-->


							
						</td> <!-- End style="margin-top -->

					</tr>

				</table>
			</td>
			<td
				style="vertical-align: top; width: 60px; background-color: #EAEAEA; padding: 5px;">
				<h1 style="font-size: 14px; text-align: center;">${resumeMessage}</h1>
				<h1 style="font-size: 14px; text-align: center; color: red;">${resumeMessage1}</h1>
				<c:url var="resumeUrl" value="/addResume" /> <form:form
					method="GET" action="${resumeUrl}" commandName="resumeAttribute">
					<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
					<table>
						<tr>
							<td>
								<c:if test="${profileOfCurrentUser}" > 					
									<input type="submit" class="input-button" value="Add Resume/Certifications" />
								</c:if>
							</td>
						</tr>
					</table>
				</form:form> 

				<c:if test="${!empty addResumes}">
					<table class="data">
						<tr>
							<td><label style="font-size: 16px">Credentials</label></td>
						</tr>
						<c:forEach items="${addResumes}" var="document">
							<c:url var="saveUrl" value="/download?id=${document.id}" />


							<c:url var="deleteUrl" value="/remove1?id=${document.id}" />


							<tr>
								<td width="100px" style="text-align: left;">
								<div style="width:90px;word-wrap: break-word;">${document.fileName} </div></td>
								
								<td width="40px"><a href="${saveUrl}"><img
										src="${pageContext.request.contextPath}/images/save_icon.gif" border="0"
										title="Download this document" /></a> 

									<c:if test="${profileOfCurrentUser}" > 					
									<a href="${deleteUrl}"
										onclick="return confirm('Are you sure you want to delete this document?')"><img
										src="${pageContext.request.contextPath}/images/delete_icon.gif" border="0"
										title="Delete this document" /></a>
									</c:if>
								</td>	
										
							</tr>
						</c:forEach>
					</table>
				</c:if> <br />
			</td>
		</tr>	
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
