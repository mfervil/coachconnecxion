<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coach/Trainer Frequently Asked Questions</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Questions asked by coaches looking to use our site" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>
	
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

<style>
li {font-size:16px;}
</style>

<style>
p {font-size:16px;}
</style>


</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>


<p style="text-align:left;">
Bellow are the commonly asked questions for coaches looking for clients.
</p>
<br>
<ul >
<li style="text-align:left;">Q. What&#39;s the best way to work with your client <br>
A. The best way to interact with your client is through phone and email.  We do not recommend meeting face to face
<br> <br>
</li>
<li style="text-align:left;">Q. Is any of my information shared with any other companies <br>
A. No, none of your information is shared by any other companies
<br><br>
</li>
<li style="text-align:left;">Q. After a package is purchased, how soon should I contact my client<br>
A. You should contact your client within 3 days
<br><br>
</li>
<li style="text-align:left;">Q. How do I get paid<br>
A. The funds will be deposited directly to your paypal account
<br><br>
</li>
<li style="text-align:left;">Q. How soon do I get paid after a user purchases a package<br>
A. You will get paid a week after the package is purchased
</li>
</ul>
 
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>