<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- CSS 	
	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
	-->
	<link href="${pageContext.request.contextPath}/css/elastic_slider.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 9]>
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 941px)" />
	<link href="${pageContext.request.contextPath}/css/style-tablet-responsive.css" rel="stylesheet" media="only screen and (min-width: 516px) and (max-width: 940px)" />		<!-- SWITCH TO SMALLER, RESPONSIVE LIQUID LAYOUT -->
	<link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet" media="only screen and (max-width: 515px)" />		<!-- SWITCH TO SMALLEST, RESPONSIVE LIQUID LAYOUT -->
	<link href="${pageContext.request.contextPath}/css/colorizer.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/jplayer-gray.css" rel="stylesheet" type="text/css" />		<!-- HTML5 AUDIO PLAYER -->
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zebra_datepicker.css" type="text/css">
	
	<!-- UPDATE BROWSER WARNING IF IE 7 OR LOWER -->
	<!--[if lt IE 8]>
	<link href="${pageContext.request.contextPath}/css/stop_ie.css" rel="stylesheet" type="text/css" />		
	<![endif]-->
	
	<!-- JAVASCRIPTS -->
	
	<!-- ENABLE HTML5 FOR IE -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.js"></script>	
	<![endif]-->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.elastic.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.twitter.js"></script>		
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contact_form.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jplayer.min.js"></script>		<!-- HTML5 AUDIO PLAYER -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/startup.js"></script>
		
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zebra_datepicker.js"></script>
		
	<!-- HTML5 AUDIO PLAYER (JPLAYER.ORG) -->
	<script type="text/javascript">	
	$(document).ready(function(){

		$("#jquery_jplayer_1").jPlayer({
			ready: function () {
				$(this).jPlayer("setMedia", {
					m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
					oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
				});
			},
			swfPath: "swf",
			supplied: "m4a, oga"
		});
	});
	</script>

<!-- Used to populate the selected coach list on userprofileList.jsp page -->
<script type="text/javascript">
$(document).ready(function(){

	$(".removeSelectedCoach").click(function() {
		if ($('#selectedCoaches').val() != '-1'){
			$('#selectedCoaches option:selected').remove();	 
		}
	});
	
	
	$(".coachSelected").click(function() {
		$('#selectedCoaches').append('<option value=' + this.getAttribute("data-value-2") + '>' + this.getAttribute("data-value-1").substring(0,28) + '</option>');
	 
	});

	$("#submitSelectedCoaches").click(function() {
		$("#selectedCoaches option").attr("selected","selected");
		$("#selectedCoaches option[value='-1']").attr("selected", false);
	});
	
	 $('input.date-picker').Zebra_DatePicker();
		
});

</script>

  <style>
    .error { color: red; }
  </style>  	

<!-- 
<style style="text/css">
#staticcontent{
 position:fixed; 
}
</style>
 -->

<style>
.ui-datepicker-calendar {
    display: none;
    }
</style>

