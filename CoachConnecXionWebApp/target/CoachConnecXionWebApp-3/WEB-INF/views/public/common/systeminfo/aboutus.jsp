<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>About CoachConnecXion</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>
	
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

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

<h1 style="text-align:center;color:#0404B4">About US</h1> <br>
<p>At CoachConnecXion, our aim is to make the process of finding a coach quick and easy.  Our primary experience derives from management to information technology, but We provide access to coaches of various backgrounds, from sports to executive and everything in between.</p>
<br>
<h2 style="text-align:center;color:#0404B4"> Our Mission</h2> <br>
<p>Our mission is simple, we want to promote individual growth.  We want to see individuals grow and reach their full potential.  Too often do we see individuals with great capabilities, unable to get to the next level, not because they are not smart enough or strong enough, but mainly because they have not learned the right path to their destination.  At CoachConnecXion, we can help you find that coach to show you the right path.</p>
<br>
<h2 style="text-align:center;color:#0404B4"> Vision</h2> <br>
<p>Our vision is to provide an efficient and easy to use online system that will help people find the right coach to improve a facet of their lives, rather it be something fun like learning to play an instrument, or something serious like career advancement.</p>
<br>
<h2 style="text-align:center;color:#0404B4"> Values</h2> <br>
<p>Honesty, Integrity, Diversity, Hard Work, Competitive and fair.</p>


</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
