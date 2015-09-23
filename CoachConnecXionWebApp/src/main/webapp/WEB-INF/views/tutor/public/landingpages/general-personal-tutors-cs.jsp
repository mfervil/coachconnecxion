<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Personal Coaches-Hire a Coach-Self Help Motivation - CoachConnecXion</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Our personal coaches will create a safe environment in which you can more clearly see your self; the coaches will listen to you and work with you to understand whats holding you back, and what you can do to succeed." />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

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
</style>
	
<script type="text/javascript" src="js/calendar.js">
</script>
<link href="css/calendar.css" rel="stylesheet" type="text/css" />
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
</script>
	
</head>
<body onload="checkForSuccess();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a>

	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">
		<h1>Search For Online Personal Coaches </h1></div>
	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 900px;">

				<tr>
					<td style="width: 150px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/tutor/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td>
						<table>
							<tr>
								<td>
								
								<%-- 	<%@ include file="/WEB-INF/views/tutor/public/landingpages/generalsearchSelection.jsp" %> --%>
									
								 	<%@ include file="/WEB-INF/views/tutor/public/landingpages/generalsearchSelection-cs.jsp" %> 
									<%-- 
									<% session.setAttribute("categoryName", "Business Coach"); %>
									<% session.setAttribute("categoryId", "2"); %>
									--%>
									
									<%--
									<jsp: include page="/WEB-INF/views/tutor/public/landingpages/searchSelection.jsp" flush="true">
									    <jsp:param name="category" value="Business Coaches"/>
									</jsp: include>									
									 --%>
									
									
								</td>
							</tr>
							
							<%-- 
							<title>Hire a Coach - Self Help Motivation - CoachConnecXion</title>
							--%>
							
							<tr><td>
									<h3 style="text-align: left;"><br><B>Coaches: </B><a  rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/tutor/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
							</td></tr>	
								<tr><td><br><img src="${pageContext.request.contextPath}/images/hbr_coach_info.png" alt="Reasons for coaching" height="500" width="450"/></td></tr>
							<tr><td>
									<h2 style="text-align: left; text-decoration: underline;">What an Online Personal Coach does:</h2>
									<h3 style="text-align: left;">A personal coach creates a safe environment in which people see themselves more clearly; the coach does this by listening, asking focused questions, 
																	reflecting back, challenging, and acknowledging the individual.  
																	If you're serious about reaching your goals, the quickest path is to hire a coach through CoachConnecXion to work with you on self help motivation techniques 
																	and provide guidance and training to help you get to your destination.</h3><br>
							</td></tr>
							<tr>
								<td>						
									<h3 style="text-decoration: underline;">A Personal Coach may be helpful for the following reasons:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Helps you more clearly identify where you are and where you want to be</li>
										<li style="text-align: left;">Works with you to develop your potential or facilitate transition</li>
										<li style="text-align: left;">Helps you develop a long term strategy to get you to your end goal</li>
										<li style="text-align: left;">Works with you to understand your potential pitfalls and obstacles and helps you devise a solution to bypass those obstacles</li>
										<li style="text-align: left;">Helps you identify your passion and purpose</li>
									</ul>
									<br>Referenced from: www.coaching.com
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>