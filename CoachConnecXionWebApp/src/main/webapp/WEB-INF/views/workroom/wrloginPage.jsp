<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--[if lt IE 9]>
	<link href="/css/style.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href="/sdnext/css/style.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 941px)" />
	<link href="/sdnext/css/style-tablet-responsive.css" rel="stylesheet" media="only screen and (min-width: 516px) and (max-width: 940px)" />		<!-- SWITCH TO SMALLER, RESPONSIVE LIQUID LAYOUT -->
	<link href="/sdnext/css/style-responsive.css" rel="stylesheet" media="only screen and (max-width: 515px)" />		<!-- SWITCH TO SMALLEST, RESPONSIVE LIQUID LAYOUT -->
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>	
	<script>
	$(document).ready(function(){
		$( "form" ).submit(function( event ) {
			//alert("Hello....");
			var flag=true;
			var emailid=$("#emailid").val();
			var password=$("#password").val();
			
		
			
			var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
			if(emailid == "" || (!filter.test(emailid)))
			{
				
				$("#emailiderror").html('Please enter a valid Email Id');
			     flag=false;
			}
			
			if(password == ""){
				$("#passworderror").html('Please enter a password');
				flag=false;
			}
			
			
			
			if(flag){
				 return;
			}
			 event.preventDefault();
		});
		});
	</script>

  <style>
    .error { color: red; }
  </style>  	

	<title>Certified Professional Coach - Personal Trainer Website | CoachConnecXion</title>
	<meta name="description" content="" />

</head>

<body>

	<div id="topline"></div>		
	<div id="wrapper">			
			<!-- LOGO -->
			<div id="logo">
				
				
				<a href="#"><img src="/sdnext/images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>
			<!-- <div id="menutopmost">
                <a  style="font-size:12px;color:#727377" href="/">Login </a> | 
                <a style="font-size:12px;color:#727377"  href="/">Signup</a>
			</div> -->
			<div class="clear"></div>
		   <div class="separator"></div>
		
		   <div class="login-card">
                <h1>Log-in</h1><br>
                <div class="error">
                
                <c:if test="${!empty msg}">
		           ${msg}
		        </c:if>
		        </div>
                  <form:form method="POST" action="/sdnext/login.html">
                    <form:input type="text" name="user" placeholder="Username" path="emailid" value="${customer.emailid}" id="emailid"></form:input>
                    <div class="error" id=emailiderror>
                    
                    </div>
                    <form:input type="password" path="password" name="pass" placeholder="Password" value="${customer.password}" id="password"></form:input>
                    
                    <div class="error" id=passworderror>
                    
                    </div>
                    <input type="submit" name="login" class="login login-submit" value="login">
                  </form:form>
            
                  <div class="login-help">
                    <a href="addCustomer.html">Register</a> <a href="forgotPasswordPage.html">Forgot Password</a>
                  </div>
            </div>
		
	</div><!-- #wrapper -->		
	
 		
		<div class="separator"></div>
		
		<div class="clear"></div>		
	</div><!-- #boxed-page-bg -->			
	
	
	<!-- FOOTER LINE -->
	<section id="footer-line">
		<div id="left">
			<%-- <p style="font-size:12px;"><span class="colorizer">CoachConnecXion.com</span> BY CoachSessions LLC &COPY; 2014  - ALL RIGHTS RESERVED!</p>  --%>
			<p style="font-size:12px;"><a href="https://www.coachconnecxion.com/" class="colorizer"> CoachConnecXion.com </a> BY CoachSessions LLC &COPY; 2014 - 2016 - ALL RIGHTS RESERVED! | <a href="/sitemap/">Sitemap</a></</p>

		</div>
	</section>
	
	
	</div> <!-- #background	-->	
 </div> <!-- #background_repeat -->	
	
</body>
</html>	
	
