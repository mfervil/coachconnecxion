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
	<link href="css/style.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 941px)" />
	<link href="css/style-tablet-responsive.css" rel="stylesheet" media="only screen and (min-width: 516px) and (max-width: 940px)" />		<!-- SWITCH TO SMALLER, RESPONSIVE LIQUID LAYOUT -->
	<link href="css/style-responsive.css" rel="stylesheet" media="only screen and (max-width: 515px)" />		<!-- SWITCH TO SMALLEST, RESPONSIVE LIQUID LAYOUT -->
	
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>	
	<script>
	$(document).ready(function(){
	$( "form" ).submit(function( event ) {
		//alert("Hello....");
		var flag=true;
		var name=$("#name").val();
		var phno=$("#phno").val();
		var emailid=$("#emailId").val().trim();
		
		var address=$("#address").val();
		var pass=$("#password").val();
		var confirmpass=$("#confirmPass").val();
		
		var skypeName=$("#skypeName").val();
		if(name == "")
			{
			
			$("#nameerror").html("Please Enter Name");
			flag=false;
			//alert("---"+flag);
			}
		if(skypeName == "")
		{
		
		$("#skypeNameerror").html("Please Enter Skype Name");
		flag=false;
		//alert("---"+flag);
		}
		
		var regEx = new RegExp("/[0-9]/");
		if((phno.length !=10) || (phno.match(regEx)))
		{
			$("#phnoerror").html('Please enter a valid phone number.');
		     flag=false;
		}
		
		var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		if(emailid == "" || (!filter.test(emailid)))
		{
			
			$("#emailIderror").html('Please enter a valid Email Id');
		     flag=false;
		}
		
		if(pass == ""){
			$("#passworderror").html('Please enter a password');
			flag=false;
		}
		
		if(confirmpass == ""){
			$("#confirmPasserror").html('Please enter a password');
			flag=false;
		}
		if(address == ""){
			$("#addresserror").html('Please enter Address');
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
				
				
				<a href="#"><img src="images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>
			<div id="menutopmost">
                <a  style="font-size:12px;color:#727377" href="loginPage.html">Login </a> | 
                <a style="font-size:12px;color:#727377"  href="addCustomer.html">Register</a>
			</div>
			<div class="clear"></div>
		   <div class="separator"></div>
		
		   <div class="login-card" style="width: 400px;">
                <h1>Register</h1><br>
                
              <div class="error">
				<c:if test="${!empty msg}">
		             ${msg}
		        </c:if>
			</div>
                 <form:form method="POST" action="/sdnext/saveCustomer.html">
                     Name: 
                     <form:input path="name" value="${customer.customername}" name="user" placeholder="Username" id="name"/>
                     <div class="error" id="nameerror">
			         </div>
			          Skype Name: 
                     <form:input path="skypeName" value="${customer.skypeName}" name="user" placeholder="Username" id="skypeName"/>
                     <div class="error" id="skypeNameerror">
			         </div>
                     Phone No :
                     <form:input path="phno" value="${customer.phno}" name="Phone No" placeholder="phoneno" id="phno"/>
                     <div class="error" id="phnoerror">
			         </div>
				     Email Id  :
				     <form:input path="emailid" value="${customer.emailid}" name="email" placeholder="emailId" id="emailId" />
				     <div class="error" id="emailIderror">
			         </div>
					 Password :
					 <form:password path="password" value="${customer.password}" name="user" placeholder="password" id="password" />
					 <div class="error" id="passworderror">
			         </div>
                     Confirm Password:
                     <form:password path="confirmpassword" value="${customer.confirmpassword}" name="pass" placeholder="Password" id="confirmPass"/>
                     <div class="error" id="confirmPasserror">
			         </div>
                  
					Address :
                     <form:textarea  path="address" value="${customer.address}" name="address" placeholder="Address" rows="15" cols="25" style="height: 100%;width: 100%;" id="address"/>
                     <div class="error" id="addresserror">
			         </div>
                    <input type="submit" name=Register class="login login-submit" value="Register" >
                  </form:form>
            
                  
            </div>
		
	</div><!-- #wrapper -->		
	
	<!-- 				
		</section>
 -->
 		
		<div class="separator"></div>
		
		<div class="clear"></div>		
	</div><!-- #boxed-page-bg -->			
	
	
	<!-- FOOTER LINE -->
	<section id="footer-line">
		<div id="left">
			<%--  <p style="font-size:12px;"><span class="colorizer">CoachConnecXion.com</span> BY CoachSessions LLC &COPY; 2014  - ALL RIGHTS RESERVED!</p> --%>
			<p style="font-size:12px;"><a href="https://www.coachconnecxion.com/" class="colorizer"> CoachConnecXion.com </a> BY CoachSessions LLC &COPY; 2014 - 2016 - ALL RIGHTS RESERVED! | <a href="/sitemap/">Sitempa</a></</p>

		</div>
		
	</section>
	
	
	</div> <!-- #background	-->	
 </div> <!-- #background_repeat -->	
	
</body>
</html>	
	
</body>
</html>