<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coaching/Trainig Contact Coach Email Form</title>
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

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
<%--  ===================================================================================================== --%>

           		<div class="comment-box">
                	<div class="form-row">
						
						<form method="post" action="wrsendEmailNoOrder" enctype="multipart/form-data">
						
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

								<tr>
									<td>Message:</td>
									<td><textarea cols="50" rows="5" name="message" class="text-area" style="width:97%;border-radius:5px" id="message"></textarea></td>
								
								 <td class="error" id=messsageerror>
                    
                                </td>
                               </tr> 
								<tr>
									<td>NO-ORDER ------ Attach file:</td>
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
					
</div><!-- #wrapper -->		
	
		<div class="separator"></div>
		
		<div class="clear"></div>		
	</div><!-- #boxed-page-bg -->			
	

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>