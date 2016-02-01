<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils, com.fervil.spring.careercoach.util.Constants" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find Business Coaching Services | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion has listings of professional business coaches online. We have a variety of business strategic advisors to help you meet your goal. " />
<meta name="keywords" content="business coach, business coaching, business coaches, find business coach" />
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
		<h1>Search For <%= Constants.BUSINESS_COACHES_CATEGORY_NAME %> </h1></div>
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
							<%--  Keywords
								Online business strategic advisors - Business Coaches - CoachConnecXion							
							 --%>
							<tr>
								<td>						
									<h3 style="text-align: left;"><B>Coaches: </B><a  rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
									<br>
								</td>
							</tr>
							<tr><td><img src="${pageContext.request.contextPath}/images/landingpages/landing_coach_3.png" alt="Consulting Coaching Therapy" height="200" width="600"/><br>
										The stages of the coaching process used by professional advisors to get you to the next level <br>							
							</td></tr>
							<tr><td style="text-align: left;"> 
								<br>							
								Business owners and aspiring entrepreneurs frequently have great ideas, but just need a little guidance as they get started with a new business. But even if you’ve been in business for a while, you might still need advice sometimes. Either way, an online Business Coach from CoachConnecXion can help answer your questions and keep you and your business moving forward.
								<br><br>
								A business coach can help you to get through the difficult transition periods every business owner experiences when starting or growing a business. Business coaching can also assist you in identifying your own strengths and weaknesses, help you develop better work-life balance -- which is always a challenge for business owners -- and can put you in contact with organizations or professionals who can help you solve problems you may have.
								<br><br>
								With the help of your business coach, you can also learn how to set achievable goals and motivate yourself so you can make real progress with your plan for your business. You’ll experience more self-confidence and a greater sense of pride in your work as you achieve your dreams with the help of a qualified business coach.
								<br><br>
								So find your ideal business coach today with CoachConnecXion. And if you’re a business coach, <a href="https://www.coachconnecxion.com/users/create"  style="color: blue;"> register with us </a> for free and find new clients!
								<br><br>    
								
								<%-- 
									<br>		
									<h2 style="text-align: left;  text-decoration: underline;">What an Online Business Coach Does For You, the Small Business Owner:</h2>
									<h3 style="text-align: left;">Business owners seeking the expert guidance of Business Coaches typically look for coaches who not only are successful Business Coaches and professionals, but who also have a genuine interest in assisting them.  
																	At CoachConnecXion we have a variety of business strategic advisors to help you meet your goal.</h3> <br>
								--%>
								
								</td>
							</tr>
							<tr><td>	
									<h3 style="text-decoration: underline;">Your Business Coach:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Helps you look at the big picture so you do not get lost in the details</li>
										<li style="text-align: left;">Helps you identify business opportunities.</li>
										<li style="text-align: left;">Guides you in enhancing your business skills and intellectual development.</li>
										<li style="text-align: left;">Helps you maximize your strengths and works with you on your weaknesses</li>
										<li style="text-align: left;">Works with you during your transitional periods if starting or growing a small enterprise.</li>
										<li style="text-align: left;">Listens to the problems you are facing, helps you set goals and develop a plan, and requires you to carry out and implement your plans.</li>
									</ul>
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	