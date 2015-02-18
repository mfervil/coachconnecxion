<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coaching/Trainig Orders</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Coaches and trainers can view all the requests made for their services" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

	<script>
	function fileDownload(attachId,filename)
	{
		
		$.ajax({
				url:'download.html',
				type:'GET',
				
			    data:'&attachId='+attachId+'&filename='+filename,	    
			    cache:false,					
				async:true,	
			    success: function(data)
			    {
			    	
			    },
				error:function(data)
				{
					//alert("Error >>> "+data);
				}
			});
		
		
	}
	
	$(document).ready(function(){
		setInterval(function() {
			//alert("hii.....");
		 // var emailid=$("#emailid").val();
	      $.ajax({
				url : 'loadTotalMsg.html',
				async:true,
				cache:false,
				type:'get',
				//data :"emailid=" +  emailid,
				success :function(data){
	               $("#msg_box").html(data);
				}
			
	      });
		}, 1000 * 30 * 1);
	
	      setInterval(function() {
	      $.ajax({
				url : 'loadFileDetails.html',
				async:true,
				cache:false,
				type:'get',
				
				success :function(data){
					
					//alert(data);
					 $("#msg_box2").html(data);
					
				}
			
	    });
			
	 		
			}, 1000 * 30 * 1);
		});
	
	
	</script>

  <style>
    .error { color: red; }
	
	.comment-box {
		background:#f1f8fe;
		border:1px solid #d9e0e6;
		padding:10px;
		margin:0 0 10px 0;
	}
	
	.text-area {
		background:#fff;
		border:1px solid #CCC;
		width:98%;
		resize:none;
		height:100px;
		padding:10px;
		margin:0 0 15px 0;
	}
	
	a.link1 {
	display:block;
	float:left;
	padding:8px 10px;
	background:#a53692;
	color:#fff;
	margin:0 5px 0;
}

a.link2{
	display:block;
	float:left;
	padding:8px 10px;
	background:#0098db;
	color:#fff;
}

.form-row {
	margin:0 0 10px 0;
}
#addv{
 width:40%;
}
#addh{
 width:40%;
}

.content-wrap h1 {
	font-size:16px;
	color:#727377;
	padding:0 0 10px 0;
}
  </style>  	


	
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
</script>
<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}
</style>

	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
<%--  ===================================================================================================== --%>


<%--
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	
	
	<!-- UPDATE BROWSER WARNING IF IE 7 OR LOWER -->
	<!--[if lt IE 8]>
	<link href="/css/stop_ie.css" rel="stylesheet" type="text/css" />		
	<![endif]-->
	
	<!-- JAVASCRIPTS -->
	
	<!-- ENABLE HTML5 FOR IE -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="/js/html5shiv.js"></script>	
	<![endif]-->
	
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>	
	<script>
	function fileDownload(attachId,filename)
	{
		
		$.ajax({
				url:'download.html',
				type:'GET',
				
			    data:'&attachId='+attachId+'&filename='+filename,	    
			    cache:false,					
				async:true,	
			    success: function(data)
			    {
			    	
			    },
				error:function(data)
				{
					//alert("Error >>> "+data);
				}
			});
		
		
	}
	
	$(document).ready(function(){
		setInterval(function() {
			//alert("hii.....");
		 // var emailid=$("#emailid").val();
	      $.ajax({
				url : 'loadTotalMsg.html',
				async:true,
				cache:false,
				type:'get',
				//data :"emailid=" +  emailid,
				success :function(data){
	               $("#msg_box").html(data);
				}
			
	      });
		}, 1000 * 30 * 1);
	
	      setInterval(function() {
	      $.ajax({
				url : 'loadFileDetails.html',
				async:true,
				cache:false,
				type:'get',
				
				success :function(data){
					
					//alert(data);
					 $("#msg_box2").html(data);
					
				}
			
	    });
			
	 		
			}, 1000 * 30 * 1);
		});
	
	
	</script>


  <style>
    .error { color: red; }
	
	.comment-box {
		background:#f1f8fe;
		border:1px solid #d9e0e6;
		padding:10px;
		margin:0 0 10px 0;
	}
	
	.text-area {
		background:#fff;
		border:1px solid #CCC;
		width:98%;
		resize:none;
		height:100px;
		padding:10px;
		margin:0 0 15px 0;
	}
	
	a.link1 {
	display:block;
	float:left;
	padding:8px 10px;
	background:#a53692;
	color:#fff;
	margin:0 5px 0;
}

a.link2{
	display:block;
	float:left;
	padding:8px 10px;
	background:#0098db;
	color:#fff;
}

.form-row {
	margin:0 0 10px 0;
}
#addv{
 width:40%;
}
#addh{
 width:40%;
}

.content-wrap h1 {
	font-size:16px;
	color:#727377;
	padding:0 0 10px 0;
}
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
               <%@ include file="wrlogout.jsp" %>  | 
                <a style="font-size:12px;color:#727377"  href="/sdnext/home.html">Home</a>
			</div>
			<div class="clear"></div>
		   <div class="separator"></div>
		
           <div class="content-wrap">
           
 --%>          
           	<h1>${sessionScope.Customer.customername}</h1>
           		<div class="comment-box">
                	<div class="form-row">
                	
                	 <form:form method="POST" action="/sdnext/search.html">
					<table>
						<tr>
							<td><span>Search By Name Or Email</span>
							</td>
							<td>
							<form:input path="searchValue" value="${customer.searchValue}" name="search"/>
								
							</td>
							<td>
							
							    
								 <!-- <a href="/sdnext/search.html" class="link1">Search User</a> -->
								 <input type="submit" value="Submit" class="link1"/>
							</td>
							</tr>
					</table>
					</form:form>

                   
                    </div>
                    <c:if test="${!empty customers}">
					<table>
						<tr>
						
						<td style="width:50%;vertical-align: top;height: 100%;" colspan="2">
							<div class="msg_box">
							<div class="row-top clearfix">
							<span>Customer Name</span>
							<span>Skype Call</span>
								<strong id="addh">Customer Address</strong>
								<em>Customer Email Id</em>
							</div>
							
							 <c:forEach items="${customers}" var="customer">
		                                <div class="detail-msg clearfix">
										<strong><a href="wrsendMessage?id=${customer.customerid}"><c:out value="${customer.customername}"/></a></strong>
										<strong><a href="skype:${customer.skypeName}?call">Call me</a></strong><%-- |<strong><a href="skype:your.skype.${customer.skypeName}?add">Add me</a></strong> --%>
										<div class="para" id="addv"><p><c:out value="${customer.address}"/></p>
										</div>
										<small><c:out value="${customer.emailid}"/></small>
									 </div>
					          </c:forEach>
							 
							 
						</div>
					</td>
						
						</tr>
					</table>
                  
                    </c:if>
                    
                  <!--  <a href="#" class="link2">Invite People</a>-->
                    <div class="clear"></div>
                </div>
           	
			<table>
				<tr>
					<td style="width:50%;vertical-align: top;height: 100%;">
						<div class="msg_box" id="msg_box">
							<div class="row-top clearfix">
								<span>USERS</span>
								<strong>MESSAGES</strong>
								<em>Date</em>
							</div>
							<c:if test="${!empty listarray}">
							<c:forEach items="${listarray}" var="listarray">
							
							 <div class="detail-msg clearfix">
								<strong><a href="wrsendMessage?id=${listarray[3]}"><c:out value="${listarray[0]}"/></a></strong>
								<div class="para"><p><c:out value="${listarray[2]}"/> Messages</p>
								</div>
								<small><c:out value="${listarray[1]}"/></small>
							 </div>

							</c:forEach>
							</c:if>
						</div>
					</td>
					<td style="width:50%;vertical-align: top;height: 100%;">
							<div class="msg_box" id="msg_box2">
							<div class="row-top clearfix">
								<span>USERS</span>
								<strong>Attachments</strong>
								<em>Date</em>
							</div>
							<c:if test="${!empty listdownload}">
							<c:forEach items="${listdownload}" var="listdownload">
							
							
							 
							 
							  <div class="detail-msg clearfix">
								<strong><c:out value="${listdownload[0]}"/></strong>
								<div class="para"><p><a href="download.html?attachId=${listdownload[3]}&filename=${listdownload[2]}" ><c:out value="${listdownload[2]}"/></a></p>
								</div>
								<small><c:out value="${listdownload[1]}"/></small>
							 </div>

							</c:forEach>
							
							</c:if></div>
					</td>
				</tr>
			</table>
			
            
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
