<%@ include file="/WEB-INF/views/common/include.jsp" %>
<%@ include file="/WEB-INF/views/common/header_no_side.jsp" %>	
<style>
li {font-size:16px;}
</style>

<style>
p {font-size:16px;}
</style>

<title>Coach and Trainer Related News</title>
<meta name="description" content="Read some of the news and benefits of coaching" />
 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!-- CONTACT FORM -->
		<form:form method="post" commandName="userProfile" enctype="multipart/form-data">
	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
<tr><td>	

<p style="text-align:left;">
COACH RELATED NEWS
</p>
<br>

<c:out value="${news}" escapeXml="false" />

<%--
<ul >
<li style="text-align:left;">Q. What's the best way to work with my coach <br>
A. The best way to interact with your coach is through phone and email.  We do not recommend meeting face to face
<br> <br>
</li>
<li style="text-align:left;">Q. Is any of my information kept <br>
A. None of your information is kept by CoachConnecXion.com
<br><br>
</li>
<li style="text-align:left;">Q. Is any of my information shared with any other companies <br>
A. No, none of your information is shared by any other companies
<br><br>
</li>
<li style="text-align:left;">Q. After I buy a package, how long untill the coach contacts me.<br>
A. The coach will contact you within 3 days after purchasing the package
</li>
</ul>
--%>
 
</td></tr>
				</table>			
			</td>
		</table>
			
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
