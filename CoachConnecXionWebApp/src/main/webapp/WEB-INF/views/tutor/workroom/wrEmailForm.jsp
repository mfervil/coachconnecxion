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

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

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

  <script>
	$(document).ready(function(){
		$( "form" ).submit(function( event ) {
			//alert("Hello....");
			var flag=true;
			var messsage=$("#message").val();
			var subject=$("#subject").val();
		    var file=$("#file").val();
		    
			
			
			if(subject == "")
			{
			//alert("Please enter a valid Email Id");
				$("#subjecterror").html('Please Enter Subject');
			     flag=false;
			}
			if(subject != "")
			{
			//alert("Please enter a valid Email Id");
				$("#subjecterror").html('');
			     flag=true;
			}
			
			if(messsage == ""){
				//alert("Please enter a valid Email Id32");
				$("#messsageerror").html('Please enter Message');
				flag=true;
			}
			if(messsage !=""){
				//alert("Please enter a valid Email Id32");
				$("#messsageerror").html('');
				flag=true;
			}
			/* if(file == ""){
				//alert("Please enter a valid Email Id144");
				$("#fileerror").html('Please Select a file');
				flag=false;
			}
			if(file != ""){
				//alert("Please enter a valid Email Id144");
				$("#fileerror").html('');
				flag=true;
			} */
			//file
		/* 	$('#file').each(function () {
			    $(this).rules('add', {
			        required: true,
			    });
			    
			}); */
			
			
			if(flag){
				 return;
			}
			 event.preventDefault();
		});
		
		setInterval(function() {
			//alert("hii.....");
		  var id=$("#id").val();
	    
	          $.ajax({
	              url : 'loadMessageDetails.html',data :"id=" +  id, 
	              success : function(data) {
	              //	alert("data"+data);
	              //	alert($('#msg_box').html());
	              	var totalhtml=data+$('#msg_box').html();
	              	//alert("TEST SUCCESS "); 
	                  $('#msg_box').html(data);  
	              }
	          });
	    
			
			
			}, 1000 * 30 * 1);
		
		
		});
	/* $('#file').each(function () {
	    $(this).rules('add', {
	        required: true,
	    });
	    
	}); */
	</script>



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

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>
	
<%--  ===================================================================================================== --%>

<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	 "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	
	
	<!-- UPDATE BROWSER WARNING IF IE 7 OR LOWER -->
	<!--[if lt IE 8]>
	<link href="/css/stop_ie.css" rel="stylesheet" type="text/css" />		
	<![endif]-->
	
	<!-- JAVASCRIPTS -->
	
	<!-- ENABLE HTML5 FOR IE -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="/js/html5shiv.js"></script>	
	<![endif]-->
	
	<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>


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

.content-wrap h1 {
	font-size:16px;
	color:#727377;
	padding:0 0 10px 0;
}
  </style>  
  
  <script>
	$(document).ready(function(){
		$( "form" ).submit(function( event ) {
			//alert("Hello....");
			var flag=true;
			var messsage=$("#message").val();
			var subject=$("#subject").val();
		    var file=$("#file").val();
		    
			
			
			if(subject == "")
			{
			//alert("Please enter a valid Email Id");
				$("#subjecterror").html('Please Enter Subject');
			     flag=false;
			}
			if(subject != "")
			{
			//alert("Please enter a valid Email Id");
				$("#subjecterror").html('');
			     flag=true;
			}
			
			if(messsage == ""){
				//alert("Please enter a valid Email Id32");
				$("#messsageerror").html('Please enter Message');
				flag=true;
			}
			if(messsage !=""){
				//alert("Please enter a valid Email Id32");
				$("#messsageerror").html('');
				flag=true;
			}
			/* if(file == ""){
				//alert("Please enter a valid Email Id144");
				$("#fileerror").html('Please Select a file');
				flag=false;
			}
			if(file != ""){
				//alert("Please enter a valid Email Id144");
				$("#fileerror").html('');
				flag=true;
			} */
			//file
		/* 	$('#file').each(function () {
			    $(this).rules('add', {
			        required: true,
			    });
			    
			}); */
			
			
			if(flag){
				 return;
			}
			 event.preventDefault();
		});
		
		setInterval(function() {
			//alert("hii.....");
		  var id=$("#id").val();
	    
	          $.ajax({
	              url : 'loadMessageDetails.html',data :"id=" +  id, 
	              success : function(data) {
	              //	alert("data"+data);
	              //	alert($('#msg_box').html());
	              	var totalhtml=data+$('#msg_box').html();
	              	//alert("TEST SUCCESS "); 
	                  $('#msg_box').html(data);  
	              }
	          });
	    
			
			
			}, 1000 * 30 * 1);
		
		
		});
	/* $('#file').each(function () {
	    $(this).rules('add', {
	        required: true,
	    });
	    
	}); */
	</script>
  	

	<title>Certified Professional Coach - Personal Trainer Website | CoachConnecXion</title>
	<meta name="description" content="" />

</head>

<body>
<body>

	<div id="topline"></div>		
	<div id="wrapper">			
			<!-- LOGO -->
			<div id="logo">
				<a href="#"><img src="/sdnext/images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>
			<div id="menutopmost">
               <%@ include file="wrlogout.jsp" %> | 
                <a style="font-size:12px;color:#727377"  href="/sdnext/home.html">Home</a>
			</div>
			<div class="clear"></div>
		   <div class="separator"></div>
				   
	<div class="content-wrap">
--%>	
	
<%--		<h1>${sessionScope.Customer.customername}</h1> --%>
           		<div class="comment-box">
                	<div class="form-row">
						
						<form method="post" action="wrsendEmail" enctype="multipart/form-data">
						
						<input type="hidden" name=orderid value="${orderid}" id="id"/>
						<%--  <input type="hidden" name=id value="${toprofileid}" id="id"/> --%>
						<input type="hidden" name=emailid value="${emailid}"/>
						<input type="hidden" name=subject value="Message from Coach -- CoachConnecXion"/>
						<input type="hidden" name=fromprofileid value="${fromprofileid}"/>
						<input type="hidden" name=toprofileid value="${toprofileid}"/>

						<input type="hidden" name=fromemail value="${fromemail}"/>
						<input type="hidden" name=toemail value="${toemail}"/>

						<input type="hidden" name=fromdisplayname value="${fromdisplayname}"/>
						<input type="hidden" name=todisplayname value="${todisplayname}"/>


							<table border="0" width="80%">

							<%-- 
								<tr>
									<td>Email To:</td>
									 <td colspan="2"><input type="text" name="name" value="${name}" style="width:97%;border-radius:5px" readonly="true" id="emailid"/></td>           
								
								</tr> 
								<tr>
									<td>Subject:</td>
									 <td><input type="text" name="subject" style="width:97%;border-radius:5px" id="subject"/></td>      
								 <td class="error" id=subjecterror>
                    
                                </td>
								</tr>
							--%>	
								 
								<tr>
									<td>Message:</td>
									<td><textarea cols="50" rows="5" name="message" class="text-area" style="width:97%;border-radius:5px" id="message"></textarea></td>
								
								 <td class="error" id=messsageerror>
                    
                                </td>
                               </tr> 
								<tr>
									<td>Attach file:</td>
									<td  style="text-align:left"><input style="float: left;" type="file" name="attachFile" size="60" id="file" /></td>
							 <td class="error" id=fileerror>
                    
                              </td>
								</tr>				
								<tr>
								<td></td>
									<td style="text-align:left">
									 <input type="submit" value="Send Message" style="font-size:14px;background: #0066CC; color: white;" > &nbsp;&nbsp;
							 		 <a style="text-align:left; font-size:15px;background-color:#12A5F4; color: white;" href="skype:Select/Add_Contact?chat" >&nbsp;Start sKype Chat/Call&nbsp;</a>
										
									</td>
									<tr><td>&nbsp;</td></tr>
								</tr>
							</table>
						</form>
						
						<div class="row-top clearfix">
                	<span>Sender</span> 
                	<%-- <span>Receiver</span> --%>
                    <strong>Message | Attachments</strong>
                    <em>Date/Time</em>
                </div>
						
						<c:if test="${!empty messages}">
	
<div class="msg_box" id="msg_box">
         
		<c:forEach items="${messages}" var="messages">
		   
			
				<div class="detail-msg clearfix">
            		<%-- <strong>${messages.fromuser.customername}</strong>
            		<strong>${messages.touser.customername}</strong>
            		--%>
            		
					<%--  <strong>FromCustomer</strong> --%>
            		
            		<c:if test="${messages.fromprofileid == toprofileid}">
            			<c:set var="displayname" value="${todisplayname}"/>						
            		</c:if>

            		<c:if test="${messages.fromprofileid == fromprofileid}">
            			<c:set var="displayname" value="${fromdisplayname}"/>						
            		</c:if>

            		<strong>${fn:substring(displayname, 0, 24)}</strong>		
            		
                    <div class="para"><p>${messages.description}</p>
	                    <c:forEach items="${messages.userattachment}" var="attachment">
	                    	<a  style="color:blue" href="downloadFromAWSSE?attachId=${attachment.attachid}&orderid=${orderid}&messageid=${messages.messageid}&filename=${attachment.attachmentname}"><p>${attachment.attachmentname}</p></a>
	                    </c:forEach>
					</div>
                    <small>${fn:substring(messages.date, 0, 16)}</small>
            	 </div>
			
		</c:forEach>
		</div>
</c:if>
					
					<!-- 	<div class="msg_box">
            	<div class="row-top clearfix">
                	<span>Sender</span> 
                	<span>Receiver</span> 
                    <strong>Message | Attachments</strong>
                    <em>Date/Time</em>
                </div>
                
                 <div class="filter-row clearfix">
            		<a href="#">Filter Messages</a>
            	 </div>
                 
                 <div class="detail-msg clearfix">
            		<strong>Name of company</strong>
                    <div class="para"><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
						<p>ATTACHMENTS</p>
					</div>
                    <small>3.15 p.m</small>
            	 </div>
                 <div class="detail-msg clearfix">
            		<strong>Name of company</strong>
                    <div class="para"><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
						<p>ATTACHMENTS</p>
				   </div>
                    <small>3.15 p.m</small>
            	 </div>
            </div> -->
	
</div><!-- #wrapper -->		
	
	<!-- 				
		</section>
 -->
 		
		<div class="separator"></div>
		
		<div class="clear"></div>		
	</div><!-- #boxed-page-bg -->			
	

</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>