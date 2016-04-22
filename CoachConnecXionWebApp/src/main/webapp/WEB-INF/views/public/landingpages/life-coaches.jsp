<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils, com.fervil.spring.careercoach.util.Constants" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find a Life Coach | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion will help you find the leading life coach in the industry. They provide the drive and guidance individuals need to improve their life." />
<meta name="keywords" content="life coach, life coaching, life coaches, find life coach" />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
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

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a>

	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">
		<h1>Search For <%= Constants.LIFE_COACHES_CATEGORY_NAME %> </h1></div>
	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 900px;">

				<tr>
					<td style="width: 150px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td>
						<table style="border-spacing: 3px; border-collapse: separate;">
							<tr>
								<td>
								
									<%@ include file="/WEB-INF/views/public/landingpages/searchSelection.jsp" %>
									
									<%-- 
									<% session.setAttribute("categoryName", "Business Coach"); %>
									<% session.setAttribute("categoryId", "2"); %>
									--%>
									
									<%--
									<jsp: include page="/WEB-INF/views/public/landingpages/searchSelection.jsp" flush="true">
									    <jsp:param name="category" value="Business Coaches"/>
									</jsp: include>									
									 --%>
									
									
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<%--
								<title>self help motivation - CoachConnecXion</title>
							 --%>
							<tr>
								<td>
									<h3 style="text-align: left;"><B>Coaches: </B><a   rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
								</td>
							</tr>
							<tr><td><img src="${pageContext.request.contextPath}/images/landingpages/landing_coach_3.png" alt="Stages of coaching" height="200" width="600"/> <br>
								The stages of the coaching process used by our professionals to get you to the next level 							
							</td></tr>
							<tr><td style="text-align: left;">
							<br>
							When you feel as though you’re stuck in a rut or need a push to be your best, a Life Coach can sometimes provide just the sort of help you need. For instance, you might need a life coach if you want to improve your work-life balance, if you need some self-motivation techniques to get you “unstuck,” or if you need some guidance in how to move forward in your career. 
							<br><br>
							A life coach can also help you learn to manage stress better and to identify your strengths and talents so you can use them to your best advantage. You might want to work with a life coach long term, or perhaps you just need someone to speak to when you need to make a major life decision (such as moving or changing jobs) and you’d like an unbiased opinion on your options. 
							<br><br>
							Whatever your reason for choosing a certified life coach, CoachConnecXion can help you find just the right one to help you make better choices and bring out your hidden talents. And if you’re a life coach yourself and are looking for new clients, click here to register -- listing with CoachConnecXion is free!
							<br><br>							
								<%-- 
								<td>	<br>	
									<h2 style="text-align: left; text-decoration: underline;">What an Online Life Coach from CoachConnecXion does:</h2>
									<h3 style="text-align: left;">These coaches provide the drive and guidance individuals need to improve their careers, relationships, and overall emotional state. 
																	</h3><br>
								</td>
								--%>
								</td>
							</tr>
							<tr><td>		
									<h3 style="text-decoration: underline;">A Life coach may be helpful for the following reasons:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Need some guidance on moving forward in your career</li>
										<li style="text-align: left;">Want to learn how to take advantage of your strengths and talents</li>
										<li style="text-align: left;">Don&#39;t know what to do about a major life decision, such as a move or promotion</li>
										<li style="text-align: left;">Don&#39;t have an acceptable work-life balance</li>
										<li style="text-align: left;">Have a lot of stress</li>
										<li style="text-align: left;">Need help recognizing your skills and achieving your dreams</li>
										<li style="text-align: left;">Having trouble moving past challenges that stand in the way of your goals</li>
										<li style="text-align: left;">Provide self help motivation tools and techniques to help you along the way to your goal</li>
									</ul>
									<br>List above referenced from: www.webmd.com
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	