<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Add Coach/Trainer Education</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Area where Coaches and Trainers can add or edit their education" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

	<script>

		function updateSubcategoryValue(subCatPassed){
			document.getElementById ("coachingSubcategory").value = subCatPassed;
		}
	</script>		
	
<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}
</style><STYLE>
body,input {
	margin: 0px;
	padding: 0px;
}

a {
	color: #0254EB
}

a:visited {
	color: #0254EB
}

#header h2 {
	color: white;
	background-color: #00A1E6;
	margin: 0px;
	padding: 5px;
}

.comment {
	width: 100%;
	background-color: #f0f0f0;
}

a.morelink {
	text-decoration: none;
	outline: none;
}

.morecontent span {
	display: none;
}
</style>
	
<script type="text/javascript" src="js/calendar.js">
</script>
<link href="css/calendar.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>
	$(document).ready(function() {
		$('input#tmpOpen').click(function($e) {
			$('div#myDialog').show(5000);
		});

		$('input#tmpClose').click(function($e) {
			$('div#myDialog').hide(5000);
		});
	});
</script>
<style type='text/css'>
div#myDialog {
text-align:center;
	position: absolute;
	top: 25%;
	left: 50%;
	width: 350px;
	
	margin: -101px 0 0 -251px;
	border: 1px solid rgb(128, 128, 128);
	background-color: #EAEAEA;
	border-radius:10px;
	padding:10px;
}
</style>
<script>
	function checkForSuccess() {		
		var value1 = document.getElementById("success").value;	
		if(value1 !=""){
			document.getElementById("submit1").disabled=true;
			if (document.all || document.getElementById) {
				for (i = 0; i < addEducation.length; i++) {
				var formElement = addEducation.elements[i];
				
					if (true) {
						formElement.disabled = true;
					}
				}
			}
		}else{		
			document.getElementById("submit1").disabled=false;
		}
	}	
	
	$(document).ready(function() {
		   $('input[type="radio"]').click(function() {
		       if($(this).attr('id') == '2' ) {
		            $('#showzipecodecoachstylepreference').hide();   
		       } else if ($(this).attr('id') == '1' || $(this).attr('id') == '3') {
		            $('#showzipecodecoachstylepreference').show();   
		       }
		   });
		});
	
	
	
</script>
	
</head>
<body onload="checkForSuccess();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<div style="text-align: center; width: 900px; font-size: large; color: #00008B;">
		Contact Coach Network -- Review & Click Confirm Below<br><br></div>
		
	<div style="height: 10px"></div>

	<table style="width: 900px;">

		<tr>

			<td>
				<div style="text-align: left;margin-left:10px;">
					<h1 style="font-size: 14px; color: red;">${errorMessage}</h1>
					<input type="hidden" name="success" id="success" 
						value="${successMessage}"></input>

					<!--  ADD MESSAGE TO RETURN TO HOME PAGE AFTER SENDING THE EMAIL -->
					<c:choose>
						<c:when test="${not empty successMessage}">
							<div id='myDialog'>
								<h1 style="font-size: 18px; color: green;">${successMessage}</h1>
								 <br>
								 <a href="${pageContext.request.contextPath}/public" 
								 style="font-size: 16px;text-decoration: underline;color:blue;">Click to return to Coaching Home Page</a>

							</div>
						</c:when>
					</c:choose>
				</div>
				
					<c:url var="contactcoachconfirmurl" value="/coach/contact/mass-email-to-coaches-confirm" />
					<form:form method="POST" id="contactcoach" commandName="contactcoach" 
					action="${contactcoachconfirmurl}">
					
						<input type="hidden" name="hcategory" id="hcategory" value="${contactcoach.category}"></input>
						<input type="hidden" name="hcoachstylepreference" id="hcoachstylepreference" value="${contactcoach.coachstylepreference}"></input>
						<%-- <input type="hidden" name="hgradelevel" id="hgradelevel" value="${contactcoach.gradelevel}"></input> --%>
						<input type="hidden" name="hstartmonth" id="hstartmonth" value="${contactcoach.startmonth}"></input>
						<input type="hidden" name="hstartday" id="hstartday" value="${contactcoach.startday}"></input>
						<input type="hidden" name="hstartyear" id="hstartyear" value="${contactcoach.startyear}"></input>
						<input type="hidden" name="hdaysavailable" id="hdaysavailable" value="${contactcoach.daysavailable}"></input>
						<input type="hidden" name="hweeksavailable" id="hweeksavailable" value="${contactcoach.weeksavailable}"></input>
						<input type="hidden" name="hcity" id="hcity" value="${contactcoach.city}"></input>
						<input type="hidden" name="hstate" id="hstate" value="${contactcoach.state}"></input>
						<input type="hidden" name="hstudentemail" id="hstudentemail" value="${contactcoach.studentemail}"></input>
						<input type="hidden" name="hstudentfirstname" id="hstudentfirstname" value="${contactcoach.studentfirstname}"></input>
						
						<table>
						
						<%-- 
						<tr>
						
							<td class="rightalign" nowrap><form:errors path="category"><br><form:errors path="category" cssClass="error" /> 
							<br></form:errors><label>*What subject do you need coaching for: &nbsp;</label> </td>
					    	<td class="leftalign">
						        <form:select disabled="true" size="1" path="category" id="category" >
						          <option value="-1">Select a Subject</option>
						          ${contactcoach.category =='1010' ? "<option selected value='1010' >Art</option>" : "<option value='1010' >Art</option>"}
						          ${contactcoach.category =='1020' ? "<option selected  value='1020' >Business</option>" : "<option value='1020' >Business</option>"}
						          ${contactcoach.category =='1030' ? "<option  selected value='1030' >Computer Bs. (Word, Excel, Etc..)</option>" : "<option value='1030' >Computer Bs. (Word, Excel, Etc..)</option>"}
						          ${contactcoach.category =='1040' ? "<option  selected value='1040' >Computer prog. (Java, .Net, etc..)</option>" : "<option value='1040' >Computer prog. (Java, .Net, etc..)</option>"}
						          ${contactcoach.category =='1050' ? "<option  selected value='1050' >Communication</option>" : "<option value='1050' >Communication</option>"}
						          ${contactcoach.category =='1060' ? "<option  selected value='1060' >English</option>" : "<option value='1060' >English</option>"}
						          ${contactcoach.category =='1070' ? "<option  selected value='1070' >History</option>" : "<option value='1070' >History</option>"}
						          ${contactcoach.category =='1080' ? "<option  selected value='1080' >Homeschool</option>" : "<option value='1080' >Homeschool</option>"}
						          ${contactcoach.category =='1090' ? "<option  selected value='1090' >Language</option>" : "<option value='1090' >Language</option>"}
						          ${contactcoach.category =='1100' ? "<option  selected value='1100' >Math</option>" : "<option value='1100' >Math</option>"}
						          ${contactcoach.category =='1110' ? "<option  selected value='1110' >Music</option>" : "<option value='1110' >Music</option>"}
						          ${contactcoach.category =='1120' ? "<option  selected value='1120' >Science</option>" : "<option value='1120' >Science</option>"}
						          ${contactcoach.category =='1130' ? "<option  selected value='1130' >Special Needs (ADD, ADHD, etc..)</option>" : "<option value='1130' >Special Needs (ADD, ADHD, etc..)</option>"}
						          ${contactcoach.category =='1140' ? "<option  selected value='1140' >Test Prep.((SAT, ACT, GMAT, etc..)</option>" : "<option value='1140' >Test Prep.((SAT, ACT, GMAT, etc..)</option>"}
						        </form:select>
					        </td>
						</tr>
						--%>
						
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<%-- 
						<tr>
							<td style="text-align: right;"><form:errors path="course"><br><form:errors path="course" cssClass="error" /> 
								<br></form:errors>
								<label>*What is the course name (ex: algebra 1, chemistry, anatomy): &nbsp; </label> 
							</td>
							<td style="text-align: left;"><form:input readonly="true" size="25" path="course" /> </td> 
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
--%>						
						<tr>
							<td style="text-align: right;">
					    		<form:errors path="coachstylepreference"><form:errors path="coachstylepreference" cssClass="error" /><br></form:errors><span class="required">*</span>	
					    		<label>What is your coaching preference: &nbsp; </label>
					    	</td>
					    	<td class="leftalign" >
				            	 
				            	<form:radiobutton disabled="true" path="coachstylepreference" id="1" value="1"/> In person only
	                 			<form:radiobutton disabled="true" path="coachstylepreference" id="2" value="2"/> Online only
	                 			<form:radiobutton disabled="true" path="coachstylepreference" id="3" value="3"/> In Person or Online
				    		</td>
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
								<td style="text-align: right;">
					    			<form:errors path="zipcode"><form:errors path="zipcode" cssClass="error" /><br></form:errors><span class="required">*</span>
								<label>What is the zipcode of the coaching location: &nbsp; </label>
							</td>
							<td  class="leftalign">
								<div id='showzipecodecoachstylepreference' style='display:block'>
								      <!-- <label>What is the zipcode of the coaching location: </label><form:errors path="zipcode" cssClass="error" />
									<form:input readonly="true" size="10" path="zipcode" /> -->
									<form:input readonly="true" size="10" path="zipcode" /> &nbsp; City: <form:input readonly="true" size="15" path="city" />  &nbsp; State: <form:input readonly="true" size="15" path="state" />
								</div>
							</td>
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
							<td style="text-align: right;"><form:errors path="studentemail"><br><form:errors path="studentemail" cssClass="error" /> 
								<br></form:errors>
								<label>The email you have on file: : &nbsp; </label> 
							</td>
							<td style="text-align: left;"><form:input readonly="true" size="25" path="studentemail" /> </td> 
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<%-- 						
						<tr>
						  <td  style="text-align: right;" ><form:errors path="gradelevel"><form:errors path="gradelevel" cssClass="error" /><br></form:errors><span class="required">*</span>
					      	<label>What Grade Level is the student: &nbsp; </label>
					      </td>
					      <td style="text-align: left;">
					        <form:select disabled="true" size="1" path="gradelevel" >
					          	<option value="-1">Select your grade level:</option>
								${contactcoach.gradelevel =='a' ? "<option selected value='a'>Elementary (K - 6)</option>" : "<option value='a'>Elementary (K - 6)</option>"}
								${contactcoach.gradelevel =='b' ? "<option  selected value='b'>Junior High (6 - 8)</option>" : "<option value='b'>Junior High (6 - 8)</option>"}
								${contactcoach.gradelevel =='c' ? "<option  selected value='c'>High School (8 - 12)</option>" : "<option value='c'>High School (8 - 12)</option>"}
								${contactcoach.gradelevel =='d' ? "<option  selected value='d'>College</option>" : "<option value='d'>College</option>"}
								${contactcoach.gradelevel =='e' ? "<option  selected value='e'>Professional</option>" : "<option value='e'>Professional</option>"}
								${contactcoach.gradelevel =='f' ? "<option  selected value='f'>Leisure</option>" : "<option value='f'>Leisure</option>"}
							</form:select>
						</tr>
--%>						
						
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
							<td  style="text-align: right;" ><form:errors path="startmonth"><form:errors path="startmonth" cssClass="error" /><br></form:errors><span class="required">*</span>
							 	<label>When would you like to start lessons: &nbsp; </label> 
							 </td>
							 <td style="text-align: left;" >
						        <form:select disabled="true" size="1" path="startmonth" id="startmonth" >
						          <option value="-1">Month</option>
						          ${contactcoach.startmonth =='1' ? "<option  selected value='1' >Jan</option>" : "<option value='1' >Jan</option>"}
						          ${contactcoach.startmonth =='2' ? "<option  selected value='2' >Feb</option>" : "<option value='2' >Feb</option>"}
						          ${contactcoach.startmonth =='3' ? "<option  selected value='3' >Mar</option>" : "<option value='3' >Mar</option>"}
						          ${contactcoach.startmonth =='4' ? "<option  selected value='4' >Apr</option>" : "<option value='4' >Apr</option>"}
						          ${contactcoach.startmonth =='5' ? "<option  selected value='5' >May</option>" : "<option value='5' >May</option>"}
						          ${contactcoach.startmonth =='6' ? "<option  selected value='6' >Jun</option>" : "<option value='6' >Jun</option>"}
						          ${contactcoach.startmonth =='7' ? "<option  selected value='7' >Jul</option>" : "<option value='7' >Jul</option>"}
						          ${contactcoach.startmonth =='8' ? "<option  selected value='8' >Aug</option>" : "<option value='8' >Aug</option>"}
						          ${contactcoach.startmonth =='9' ? "<option  selected value='9' >Sep</option>" : "<option value='9' >Sep</option>"}
						          ${contactcoach.startmonth =='10' ? "<option  selected value='10' >Oct</option>" : "<option value='10' >Oct</option>"}
						          ${contactcoach.startmonth =='11' ? "<option  selected value='11' >Nov</option>" : "<option value='11' >Nov</option>"}
						          ${contactcoach.startmonth =='12' ? "<option  selected value='12' >Dec</option>" : "<option value='12' >Dec</option>"}
						        </form:select>  
						        <form:select disabled="true" size="1" path="startday" id="startday" >
						          <option selected  value="-1">Day</option>
						          ${contactcoach.startday =='1' ? "<option  selected value='1' >01</option>" : "<option value='1' >01</option>"}
						          ${contactcoach.startday =='2' ? "<option  selected value='2' >02</option>" : "<option value='2' >02</option>"}
						          ${contactcoach.startday =='3' ? "<option  selected value='3' >03</option>" : "<option value='3' >03</option>"}
						          ${contactcoach.startday =='4' ? "<option  selected value='4' >04</option>" : "<option value='4' >04</option>"}
						          ${contactcoach.startday =='5' ? "<option  selected value='5' >05</option>" : "<option value='5' >05</option>"}
						          ${contactcoach.startday =='6' ? "<option  selected value='6' >06</option>" : "<option value='6' >06</option>"}
						          ${contactcoach.startday =='7' ? "<option  selected value='7' >07</option>" : "<option value='7' >07</option>"}
						          ${contactcoach.startday =='8' ? "<option  selected value='8' >08</option>" : "<option value='8' >08</option>"}
						          ${contactcoach.startday =='9' ? "<option  selected value='9' >09</option>" : "<option value='9' >09</option>"}
						          ${contactcoach.startday =='10' ? "<option  selected value='10' >10</option>" : "<option value='10' >10</option>"}
						          ${contactcoach.startday =='11' ? "<option  selected value='11' >11</option>" : "<option value='11' >11</option>"}
						          ${contactcoach.startday =='12' ? "<option  selected value='12' >12</option>" : "<option value='12' >12</option>"}
						          ${contactcoach.startday =='13' ? "<option  selected value='13' >13</option>" : "<option value='13' >13</option>"}
						          ${contactcoach.startday =='14' ? "<option  selected value='14' >14</option>" : "<option value='14' >14</option>"}
						          ${contactcoach.startday =='15' ? "<option  selected value='15' >15</option>" : "<option value='15' >15</option>"}
						          ${contactcoach.startday =='16' ? "<option  selected value='16' >16</option>" : "<option value='16' >16</option>"}
						          ${contactcoach.startday =='17' ? "<option  selected value='17' >17</option>" : "<option value='17' >17</option>"}
						          ${contactcoach.startday =='18' ? "<option  selected value='18' >18</option>" : "<option value='18' >18</option>"}
						          ${contactcoach.startday =='19' ? "<option  selected value='19' >19</option>" : "<option value='19' >19</option>"}
						          ${contactcoach.startday =='20' ? "<option  selected value='20' >20</option>" : "<option value='20' >20</option>"}
						          ${contactcoach.startday =='21' ? "<option  selected value='21' >21</option>" : "<option value='21' >21</option>"}
						          ${contactcoach.startday =='22' ? "<option  selected value='22' >22</option>" : "<option value='22' >22</option>"}
						          ${contactcoach.startday =='23' ? "<option  selected value='23' >23</option>" : "<option value='23' >23</option>"}
						          ${contactcoach.startday =='24' ? "<option  selected value='24' >24</option>" : "<option value='24' >24</option>"}
						          ${contactcoach.startday =='25' ? "<option  selected value='25' >25</option>" : "<option value='25' >25</option>"}
						          ${contactcoach.startday =='26' ? "<option  selected value='26' >26</option>" : "<option value='26' >26</option>"}
						          ${contactcoach.startday =='27' ? "<option  selected value='27' >27</option>" : "<option value='27' >27</option>"}
						          ${contactcoach.startday =='28' ? "<option  selected value='28' >28</option>" : "<option value='28' >28</option>"}
						          ${contactcoach.startday =='29' ? "<option  selected value='29' >29</option>" : "<option value='29' >29</option>"}
						          ${contactcoach.startday =='30' ? "<option  selected value='30' >30</option>" : "<option value='30' >30</option>"}
						          ${contactcoach.startday =='31' ? "<option  selected value='31' >31</option>" : "<option value='31' >31</option>"}
						        </form:select>  
						        <form:select disabled="true" size="1" path="startyear" id="startyear" >
						          <option selected  value="-1">Select year</option>
						          <c:forEach var="i" begin="${year}" end="${year + 3}">
						          		<c:if test="${contactcoach.startyear == i}">
						          			<option selected value='${i}' >${i}</option>
						          		</c:if>
						          		<c:if test="${contactcoach.startyear != year}">
						          			<option value='${i}' >${i}</option>
						          		</c:if>
						          		
						          </c:forEach>
						        </form:select>  
		
							</td>
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
							<td  style="text-align: right; vertical-align: top;" ><form:errors path="availability"><form:errors path="availability" cssClass="error" /><br></form:errors><span class="required">*</span>
								<label style="vertical-align: text-top;">When are you available for lessons: &nbsp; </label> 
								
							</td>
							<td style="text-align: left;" >
								<form:textarea readonly="true" rows="6" cols="50" name="wysiwygskills"
								id="wysiwygskills" path="availability" /> 
							</td>
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
							<td  style="text-align: right;" ><form:errors path="daysavailable"><form:errors path="daysavailable" cssClass="error" /><br></form:errors><span class="required">*</span>
							 	<label>How many days a week do you expect to meet with the coach: &nbsp; </label> 
							 </td>
							 <td style="text-align: left;" >
						        <form:select disabled="true" size="1" path="daysavailable" id="daysavailable" >
						          <option value="-1">Select days</option>
							          ${contactcoach.daysavailable =='1' ? "<option  selected value='1' > 01 </option>" : "<option value='1' > 01 </option>"}
							          ${contactcoach.daysavailable =='2' ? "<option  selected value='2' > 02 </option>" : "<option value='2' > 02 </option>"}
							          ${contactcoach.daysavailable =='3' ? "<option  selected value='3' > 03 </option>" : "<option value='3' > 03 </option>"}
							          ${contactcoach.daysavailable =='4' ? "<option  selected value='4' > 04 </option>" : "<option value='4' > 04 </option>"}
							          ${contactcoach.daysavailable =='5' ? "<option  selected value='5' > 05 </option>" : "<option value='5' > 05 </option>"}
							          ${contactcoach.daysavailable =='6' ? "<option  selected value='6' > 06 </option>" : "<option value='6' > 06 </option>"}
							          ${contactcoach.daysavailable =='7' ? "<option  selected value='7' > 07 </option>" : "<option value='7' > 07 </option>"}
						        </form:select> 
							</td>         
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
							<td  style="text-align: right;" ><form:errors path="weeksavailable"><form:errors path="weeksavailable" cssClass="error" /><br></form:errors><span class="required">*</span>
							 	<label>Number of weeks do you expect to work with the coach: &nbsp; </label>
							 </td>
							 <td  style="text-align: left;" >
						        <form:select disabled="true" size="1" path="weeksavailable" id="weeksavailable" > 
						          <option value="-1">Select weeks</option>
						          ${contactcoach.weeksavailable =='1' ? "<option  selected value='1' > 01 </option>" : "<option value='1' > 01 </option>"}
						          ${contactcoach.weeksavailable =='2' ? "<option  selected value='2' > 02 </option>" : "<option value='2' > 02 </option>"}
						          ${contactcoach.weeksavailable =='3' ? "<option  selected value='3' > 03 </option>" : "<option value='3' > 03 </option>"}
						          ${contactcoach.weeksavailable =='4' ? "<option  selected value='4' > 04 </option>" : "<option value='4' > 04 </option>"}
						          ${contactcoach.weeksavailable =='5' ? "<option  selected value='5' > 05 </option>" : "<option value='5' > 05 </option>"}
						          ${contactcoach.weeksavailable =='6' ? "<option  selected value='6' > 06 </option>" : "<option value='6' > 06 </option>"}
						          ${contactcoach.weeksavailable =='7' ? "<option  selected value='7' > 07 </option>" : "<option value='7' > 07 </option>"}
						          ${contactcoach.weeksavailable =='8' ? "<option  selected value='8' > 08 </option>" : "<option value='8' > 08 </option>"}
						          ${contactcoach.weeksavailable =='9' ? "<option  selected value='9' > 09 </option>" : "<option value='9' > 09 </option>"}
						          ${contactcoach.weeksavailable =='10' ? "<option  selected value='10' > 10 </option>" : "<option value='10' > 10 </option>"}
						          ${contactcoach.weeksavailable =='11' ? "<option  selected value='11' > 11 </option>" : "<option value='11' > 11 </option>"}
						          ${contactcoach.weeksavailable =='12' ? "<option  selected value='12' > 12 </option>" : "<option value='12' > 12 </option>"}
						          ${contactcoach.weeksavailable =='13' ? "<option  selected value='13' > 13 </option>" : "<option value='13' > 13 </option>"}
						          ${contactcoach.weeksavailable =='14' ? "<option  selected value='14' > 14 </option>" : "<option value='14' > 14 </option>"}
						          ${contactcoach.weeksavailable =='15' ? "<option  selected value='15' > 15 </option>" : "<option value='15' > 15 </option>"}
						          ${contactcoach.weeksavailable =='16' ? "<option  selected value='16' > 16 </option>" : "<option value='16' > 16 </option>"}
						          ${contactcoach.weeksavailable =='17' ? "<option  selected value='17' > 17 </option>" : "<option value='17' > 17 </option>"}
						          ${contactcoach.weeksavailable =='18' ? "<option  selected value='18' > 18 </option>" : "<option value='18' > 18 </option>"}
						          ${contactcoach.weeksavailable =='19' ? "<option  selected value='19' > 19 </option>" : "<option value='19' > 19 </option>"}
						          ${contactcoach.weeksavailable =='20' ? "<option  selected value='20' > 20 </option>" : "<option value='20' > 20 </option>"}
						          ${contactcoach.weeksavailable =='21' ? "<option  selected value='21' > 21 </option>" : "<option value='21' > 21 </option>"}
						          ${contactcoach.weeksavailable =='22' ? "<option  selected value='22' > 22 </option>" : "<option value='22' > 22 </option>"}
						          ${contactcoach.weeksavailable =='23' ? "<option  selected value='23' > 23 </option>" : "<option value='23' > 23 </option>"}
						          ${contactcoach.weeksavailable =='24' ? "<option  selected value='24' > 24 </option>" : "<option value='24' > 24 </option>"}
						          ${contactcoach.weeksavailable =='25' ? "<option  selected value='25' > 25 </option>" : "<option value='25' > 25 </option>"}
						          ${contactcoach.weeksavailable =='26' ? "<option  selected value='26' > 26 </option>" : "<option value='26' > 26 </option>"}
						          ${contactcoach.weeksavailable =='27' ? "<option  selected value='27' > 27 </option>" : "<option value='27' > 27 </option>"}
						          ${contactcoach.weeksavailable =='28' ? "<option  selected value='28' > 28 </option>" : "<option value='28' > 28 </option>"}
						          ${contactcoach.weeksavailable =='29' ? "<option  selected value='29' > 29 </option>" : "<option value='29' > 29 </option>"}
						          ${contactcoach.weeksavailable =='30' ? "<option  selected value='30' > 30 </option>" : "<option value='30' > 30 </option>"}
						          ${contactcoach.weeksavailable =='31' ? "<option  selected value='31' > 31 </option>" : "<option value='31' > 31 </option>"}
						          ${contactcoach.weeksavailable =='32' ? "<option  selected value='32' > 32 </option>" : "<option value='32' > 32 </option>"}
						          ${contactcoach.weeksavailable =='33' ? "<option  selected value='33' > 33 </option>" : "<option value='33' > 33 </option>"}
						          ${contactcoach.weeksavailable =='34' ? "<option  selected value='34' > 34 </option>" : "<option value='34' > 34 </option>"}
						          ${contactcoach.weeksavailable =='35' ? "<option  selected value='35' > 35 </option>" : "<option value='35' > 35 </option>"}
						          ${contactcoach.weeksavailable =='36' ? "<option  selected value='36' > 36 </option>" : "<option value='36' > 36 </option>"}
						          ${contactcoach.weeksavailable =='37' ? "<option  selected value='37' > 37 </option>" : "<option value='37' > 37 </option>"}
						          ${contactcoach.weeksavailable =='38' ? "<option  selected value='38' > 38 </option>" : "<option value='38' > 38 </option>"}
						          ${contactcoach.weeksavailable =='39' ? "<option  selected value='39' > 39 </option>" : "<option value='39' > 39 </option>"}
						          ${contactcoach.weeksavailable =='40' ? "<option  selected value='40' > 40 </option>" : "<option value='40' > 40 </option>"}
						          ${contactcoach.weeksavailable =='41' ? "<option  selected value='41' > 41 </option>" : "<option value='41' > 41 </option>"}
						          ${contactcoach.weeksavailable =='42' ? "<option  selected value='42' > 42 </option>" : "<option value='42' > 42 </option>"}
						          ${contactcoach.weeksavailable =='43' ? "<option  selected value='43' > 43 </option>" : "<option value='43' > 43 </option>"}
						          ${contactcoach.weeksavailable =='44' ? "<option  selected value='44' > 44 </option>" : "<option value='44' > 44 </option>"}
						          ${contactcoach.weeksavailable =='45' ? "<option  selected value='45' > 45 </option>" : "<option value='45' > 45 </option>"}
						          ${contactcoach.weeksavailable =='46' ? "<option  selected value='46' > 46 </option>" : "<option value='46' > 46 </option>"}
						          ${contactcoach.weeksavailable =='47' ? "<option  selected value='47' > 47 </option>" : "<option value='47' > 47 </option>"}
						          ${contactcoach.weeksavailable =='48' ? "<option  selected value='48' > 48 </option>" : "<option value='48' > 48 </option>"}
						          ${contactcoach.weeksavailable =='49' ? "<option  selected value='49' > 49 </option>" : "<option value='49' > 49 </option>"}
						          ${contactcoach.weeksavailable =='50' ? "<option  selected value='50' > 50 </option>" : "<option value='50' > 50 </option>"}
						          ${contactcoach.weeksavailable =='51' ? "<option  selected value='51' > 51 </option>" : "<option value='51' > 51 </option>"}
						          ${contactcoach.weeksavailable =='52' ? "<option  selected value='52' > 52 </option>" : "<option value='52' > 52 </option>"}
						        </form:select> 
							</td>         
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr>
							<td  style="text-align: right; vertical-align: top;" ><form:errors path="overview"><form:errors path="overview" cssClass="error" /><br></form:errors><span class="required">*</span>
							    <label>Overview / Describe why you are seeking coaching: &nbsp; </label> 
							</td>
							<td  style="text-align: left;" >
								<form:textarea readonly="true" name="wysiwyg" class="required" cols="50"
								id="wysiwyg" rows="6" path="overview" value="&nbsp;"/>
							</td>
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>

						<tr>
						<td></td>
							<td style="text-align: left;"><input type="submit"
								style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
								value="Confirm & Send your requests to coaches" name="submit1" id="submit1" disabled colspan="2">

								<c:if test="${sessionScope.newusercreated == '1'}">
									&nbsp;&nbsp;&nbsp;&nbsp;<a href="jobhistoryAdd?profileId=${profileId}"
										style="font-size: 14px; text-decoration: underline; color: blue;">SKIP EDUCATION</a>
								</c:if>								
							</td>
						</tr>
						</table>
					</form:form>

				<%-- 
				<c:if test="${sessionScope.newusercreated != '1'}">

					<table style="margin-left: 0px; margin-top: -31px;">
						<tr>
							<td><c:url var="profileUrl" value="/education" /> <form:form
									commandName="/education" method="GET" action="${profileUrl}">
	
									<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
									<input type="submit"
										style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
										value="Cancel">
								</form:form></td>
						</tr>
					</table>
				</c:if>
				--%>
								
			</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>