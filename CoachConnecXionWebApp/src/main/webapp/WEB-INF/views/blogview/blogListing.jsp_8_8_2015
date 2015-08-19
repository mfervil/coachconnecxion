<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Create user profile</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Create a profile to become a Coach or Trainer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
<script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
 
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
	$(function()

			{

				$('#wysiwygskills').wysiwyg();

			});
		</script>
		<script type="text/javascript">
			$(function()

			{

				$('#wysiwygkeywords').wysiwyg();

			});
</script>

    <script>
    $(document).ready(function(){
            $('#form').validate();
    })
</script>

<style>
	label {font-size:14px;}
	
	hr.drop_shadow {
	
	    height: 10px;
	
	    border: 1;
	
	    box-shadow: inset 0 9px 9px -3px rgba(141,179,134,0.8);
	
	      -webkit-border-radius: 5px;
	
	      -moz-border-radius: 5px;
	
	      -ms-border-radius: 5px;
	
	      -o-border-radius: 5px;
	
	      border-radius: 5px;
</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
	<table>
	<tr>
	<td style="text-align: left;"><a href="https://www.coachconnecxion.com">&gt;&gt;Home</a></td>
	<td style="text-align: right;">
		                     <span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
	<%-- 
	<span id="siteseal" style="text-align:right"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
	--%>
	</td>
	</tr>
	</table>
			<br>
		<!-- CONTACT FORM -->
		<form:form method="post" commandName="blogPost" id="blogPostForm" enctype="multipart/form-data">
		<h3 style="color:red"> ${errorMessage} </h3>
     
	<table style="width: 900px;">
			<tr>
				<td style="width: 730px; padding: 5px;">
					<table>
						<tr>
							<td style="margin-top: 4px; vertical-align: top;"> <!-- style="margin-top -->
							
							<c:choose>
							    <c:when test="${not empty blogPostListing}">
    							
									<c:forEach items="${blogPostListing}" varStatus="status" var="blogPost">
										<a name="${blogPost.blogid}"></a>
										<br>
										<table>
											<tr>
												<td style=" vertical-align: top; padding: 5px; text-align: left; background-color: #CCCCFF; white-space: nowrap;" >Posted by: ${blogPost.creatorfirstname} ${blogPost.creatorlastname}<br>
												Date: ${blogPost.publishmonth} / ${blogPost.publishday} / ${blogPost.publishyear} </td>
												<td style="text-align: left; width: 100%"><h1 style="color: #9966FF">&nbsp;&nbsp;${blogPost.blogtitle}</h1></td>
											</tr>
										</table>
										<table>
											<tr><td>&nbsp;</td></tr>
											<tr>
												<td class="leftalign" > ${blogPost.blogposting} </td>
											</tr>
											<tr><td style="text-align: left">
												<a href="${pageContext.request.contextPath}/update-blog/blogId/${blogPost.blogid}">.</a>
												<a style="color: blue" href="${pageContext.request.contextPath}/blogview/professional-and-life-coaches/blogref/${blogPost.blogid}/cattitle/${fn:replace(blogPost.coachingcategoryName, ' ', '-')}-${fn:replace(blogPost.blogtitle, ' ', '-')}">More... View / Leave Comments</a>
											</td></tr>
										</table>
										<hr class="drop_shadow">
									</c:forEach>	
						    </c:when>
						    <c:otherwise>								
								<p style="color: red; font-size: 14px;"> NO BLOG POSTS AVAILABLE FOR THIS SELECTION	</p>								
						    </c:otherwise>
						</c:choose> 							
								
							</td> <!-- End style="margin-top -->
							<td style="vertical-align: text-top; white-space: nowrap; text-align: left; ">
							<%@ include file="/WEB-INF/views/blogview/blogRecents.jsp" %>
							<br>
							<%@ include file="/WEB-INF/views/blogview/blogArchives.jsp" %>
							<%--
								<a style="color: blue;" href="${pageContext.request.contextPath}/blogview/recent-personal-coach-blogs"> &nbsp; ** &nbsp; MOST RECENT BLOGS &nbsp; ** &nbsp;</a>
								
								<c:forEach items="${blogPostListing}" varStatus="status" var="blogPost">
									<p><a style="color: blue;" href="#${blogPost.blogid}">&nbsp;*&nbsp;${fn:substring(blogPost.blogtitle, 0, 29)}...</a></p>								
								</c:forEach>	
								
								<br>
								&nbsp; ** &nbsp; ARCHIVES &nbsp; ** <br>
								<c:forEach items="${blogmonths}" varStatus="status" var="blogmonths">
									<c:set var="dateParts" value="${fn:split(blogmonths, '*')}" />
									<a style="color: blue;" href="${pageContext.request.contextPath}/blogview/professional-coaches/month/${dateParts[1]}/year/${dateParts[2]}">&nbsp;*&nbsp;${dateParts[0]}</a>
									<br>
								</c:forEach>							
							 --%>
							</td>
						</tr>
					</table>			
				</td>
			</tr>	
	</table>
		<input type="hidden" name="blogId" id="blogId" value="${blogId}"></input>
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>