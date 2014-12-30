<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Find A Certified Professional Coach - Personal Development Coach | CoachConnecXion</title>
	<meta name="description" content="CoachConnecXion provides an efficient and easy to use online system that will help people find the right coach for self improvement. We offer a list of coaches for different fields such personal development, time management, stress management and sports." />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>

<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<style type="text/css">

</style>


	<script>
		function ShowHideSubCat() {
			
			var mainCombo = document.getElementById ("coachingCategory");

			var subCombo1 = document.getElementById ("coachingSubcategory1");
			var subCombo2 = document.getElementById ("coachingSubcategory2");
			var subCombo3 = document.getElementById ("coachingSubcategory3");
			var subCombo0 = document.getElementById ("coachingSubcategory0");

			subCombo0.style.display = 'none';
			subCombo1.style.display = 'none';
			subCombo2.style.display = 'none';
			subCombo3.style.display = 'none';

			if (mainCombo.value == '1') {
				subCombo1.style.display = '';
			} else if (mainCombo.value == '2') {
				subCombo2.style.display = '';
			} else if (mainCombo.value == '3') {
				subCombo3.style.display = '';
			} else {
				subCombo0.style.display = '';
			}
			
		}
		
		function updateSubcategoryValue(subCatPassed){
			document.getElementById ("coachingSubcategory").value = subCatPassed;
		}
	</script>		
</head>
<body>

<%-- BEGIN BODY No Side test --%>
		
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a><br><br>
	
			<!-- CONTACT FORM -->
		<form:form method="post" commandName="coachSelection" >
			  <table style="border-spacing:2px; border-collapse:separate;">
			  <tbody >
			    <tr>
			    	<td  class="rightalign" ><label>Coaching Category:</label> <form:errors path="coachingCategory" cssClass="error" /></td>
			    	<td class="leftalign">
				        <form:select size="1" path="coachingCategory" id="coachingCategory" onchange="ShowHideSubCat()" >
				          <option selected  value="-1">All Categories</option>
				          <option value="1">ADD & ADHD</option>
				          <option value="2">Business</option>
				          <option value="3">Career Change & Enhancement</option>
				          <option value="4">Couples</option>
				          <option value="5">Diet/Weight Loss</option>
				          <option value="6">Disability</option>
				          <option value="7">Exercise</option>
				          <option value="8">Executive</option>
				          <option value="9">Family</option>
				          <option value="10">Finance</option>
				          <option value="11">Hobby</option>
				          <option value="12">Leadership</option>
				          <option value="13">Life</option>
				          <option value="14">Management</option>
				          <option value="15">Music</option>
				          <option value="16">Motivational</option>
				          <option value="17">Performance</option>
				          <option value="18">Relationship</option>
				          <option value="19">Retirement</option>
				          <option value="20">Sales</option>
				          <option value="21">Stress Management</option>
				          <option value="22">Sports Training</option>
				          <option value="23">Team and Group</option>
				          <option value="24">College Prep. Testing</option>
				        </form:select>			    	
			    	</td>
<!-- 
Bus:Business Management
Bus:Career Change / Enhancement
Bus:Leadership/Executive
Bus:Sales

hlth:Diet/Weight Loss
hlth:Exercise
hlth:Sports Training

Lrn:College Test Prep
Lrn:Learning Disability

Mus:Music

Prs:Couples/Family/Relationship
Prs:Life/Motivational
Prs:Personal Finance
Prs:Retirement
Prs:Stress Management

Remove Team and Group
Remove Hobby
Remove Performance
 -->			    	
			    	
			      <td class="rightalign" >Industry Experience: <form:errors path="industryExperience" cssClass="error" /> </td>
				  <td  class="leftalign">	
			      <!-- Find complete list from job categories in career builder -->
			        <form:select size="1" path="industryExperience" >
			          	<option selected  value="-1">All Industries</option>
						<option value="1">Accounting - Finance</option>
						<option value="2">Advertising</option>
						<option value="3">Agriculture</option>
						<option value="4">Airline - Aviation</option>
						<option value="5">Appliance &amp; Electronics</option>
						<option value="6">Architecture - Building</option>
						<option value="7">Art - Photography - Journalism</option>
						<option value="8">Automotive - Motor Vehicles - Parts</option>
						<option value="9">Banking - Financial Services</option>
						<option value="10">Beauty / Wellness / Grooming</option>
						<option value="11">Biotechnology</option>
						<option value="12">Broadcasting - Radio - TV</option>
						<option value="13">Building Materials</option>
						<option value="14">Call Center / SSO / BPO</option>
						<option value="15">Chemical</option>
						<option value="16">Coffee Shop</option>
						<option value="17">Computer Hardware</option>
						<option value="18">Computer Software</option>
						<option value="19">Construction</option>
						<option value="20">Consulting</option>
						<option value="21">Consumer Products</option>
						<option value="22">Cosmetics &amp; Beauty</option>
						<option value="23">Credit - Loan - Collections</option>
						<option value="24">Defense - Aerospace</option>
						<option value="25">Department Store</option>
						<option value="26">Education - Teaching - Administration</option>
						<option value="27">Electronics</option>
						<option value="28">Employment - Recruiting - Staffing</option>
						<option value="29">Energy - Utilities - Gas - Electric</option>
						<option value="30">Engineering - Machinery</option>
						<option value="31">Engineering - Precision</option>
						<option value="32">Engineering - Services</option>
						<option value="33">Entertainment</option>
						<option value="34">Environmental</option>
						<option value="35">Exercise - Fitness</option>
						<option value="36">Exhibitions / Event Management / MICE</option>
						<option value="37">Eye Care</option>
						<option value="38">Fashion - Apparel - Textile</option>
						<option value="39">Food</option>
						<option value="40">Full Service Restaurant</option>
						<option value="41">Funeral - Cemetery</option>
						<option value="42">Furniture</option>
						<option value="43">Gas / Convenience Store</option>
						<option value="44">Government - Civil Service</option>
						<option value="45">Grocery &amp; Pharmacy</option>
						<option value="46">Hardware / Home Improvement</option>
						<option value="47">Healthcare - Health Services</option>
						<option value="48">Home D&#233;cor and Kitchen</option>
						<option value="49">Homebuilding</option>
						<option value="50">Hospitality</option>
						<option value="51">Hotel - Resort</option>
						<option value="52">HVAC</option>
						<option value="53">Import - Export</option>
						<option value="54">Industrial</option>
						<option value="55">Insurance</option>
						<option value="56">Internet - ECommerce</option>
						<option value="57">Jewelry</option>
						<option value="58">Landscaping</option>
						<option value="59">Law Enforcement</option>
						<option value="60">Legal</option>
						<option value="61">Library Science</option>
						<option value="62">Managed Care</option>
						<option value="63">Manufacturing</option>
						<option value="64">Marine / Maritime</option>
						<option value="65">Maritime - Offshore &amp; Marine Engineering</option>
						<option value="66">Maritime - Port</option>
						<option value="67">Maritime - Shipping</option>
						<option value="68">Mass Merchandiser</option>
						<option value="69">Medical Equipment</option>
						<option value="70">Merchandising</option>
						<option value="71">Military</option>
						<option value="72">Mining / Drilling / Resources</option>
						<option value="73">Mortgage</option>
						<option value="74">Newspaper</option>
						<option value="75">Not for Profit - Charitable</option>
						<option value="76">Office Supplies - Equipment</option>
						<option value="77">Oil Refining - Petroleum - Drilling</option>
						<option value="78">Other</option>
						<option value="79">Other Great Industries</option>
						<option value="80">Packaging</option>
						<option value="81">Pet Store</option>
						<option value="82">Pharmaceutical</option>
						<option value="83">Polymer / Plastic / Rubber</option>
						<option value="84">Printing - Publishing</option>
						<option value="85">Public Relations</option>
						<option value="86">Quick Service or Fast Food Restaurant</option>
						<option value="87">Real Estate - Property Mgt</option>
						<option value="88">Recreation</option>
						<option value="89">Repair / Maintenance Services</option>
						<option value="90">Research &amp; Development</option>
						<option value="91">Restaurant</option>
						<option value="92">Retail</option>
						<option value="93">Retail Bank</option>
						<option value="94">Sales - Marketing</option>
						<option value="95">Science &amp; Technology</option>
						<option value="96">Securities</option>
						<option value="97">Security</option>
						<option value="98">Semiconductor</option>
						<option value="99">Services - Corporate B2B</option>
						<option value="100">Social Services</option>
						<option value="101">Sporting Goods</option>
						<option value="102">Telecommunications</option>
						<option value="103">Training</option>
						<option value="104">Transportation</option>
						<option value="105">Travel</option>
						<option value="106">Wireless</option>
						<option value="107">Wood / Fibre / Paper</option>		
					</form:select>
			     </td>
			     
<%-- 			    	
			    	<td class="rightalign">Sub-Category:
			    	</td>
			    	<td  class="leftalign">
				        <div id = coachingSubcategory0 >
				        <select>
				          <option  value="0">Select a Subcategory</option>
				        </select>
				        </div>
				        <div id = coachingSubcategory1 style="display: none;">
				        <select onchange="updateSubcategoryValue (this.options[this.selectedIndex].value);" >
				          <option  value="0">All</option>
				          <option value="1">Executive Coaching 1</option>
				          <option value="2">Leadership Coaching 1</option>
				          <option value="3">Business Management Coaching 1</option>
				          <option value="4">International Executive 1</option>
				        </select>
				        </div>
				        <div id = coachingSubcategory2 style="display: none;">
				        <select onchange="updateSubcategoryValue (this.options[this.selectedIndex].value);" >
				          <option  value="0">All</option>
				          <option value="1">Executive Coaching 2</option>
				          <option value="2">Leadership Coaching 2</option>
				          <option value="3">Business Management Coaching 2</option>
				          <option value="4">International Executive 2</option>
				        </select>
				        </div>
				        <div id = coachingSubcategory3 style="display: none;"> 
				        <select onchange="updateSubcategoryValue (this.options[this.selectedIndex].value);" >
				          <option  value="0">All</option>
				          <option value="1">Executive Coaching 3</option>
				          <option value="2">Leadership Coaching 3</option>
				          <option value="3">Business Management Coaching 3</option>
				          <option value="4">International Executive 3</option>
				        </select>
				        </div>
			    	</td>
--%>			    	
				</tr>
				<tr>		
<%-- 				
			      <td class="rightalign" nowrap>Industry Experience: <form:errors path="industryExperience" cssClass="error" /> </td>
				  <td  class="leftalign">	
			      <!-- Find complete list from job categories in career builder -->
			        <form:select size="1" path="industryExperience" >
			          <option selected  value="-1">Select an Industry</option>
			          <option value="1">Accounting</option>
			          <option value="2">Automotive</option>
			          <option value="3">Banking</option>
			          <option value="4">Biotech</option>
			          <option value="5">Business Development</option>
			          <option value="6">Business Opportunity</option>
			        </form:select>
			        </td>
--%>			        

				  <td class="rightalign" >City: <form:errors path="city" cssClass="error" /> </td>
				  <td class="leftalign"><form:input size="35" path="city" /></td>
				  
				  <td class="rightalign" ><form:errors path="state"><form:errors path="state" cssClass="error" /><br></form:errors><span class="required">*</span><label>State/Province:</label> <%-- <form:input size="20" path="state" /> --%> </td>
				  <td  class="leftalign">
							<form:select size="1" path="state" id="state" ><option value="">All States</option>
								${userProfile.state =='AL' ? "<option value='AL' selected>ALABAMA</option>" : "<option value='AL' >ALABAMA</option>"}
								${userProfile.state =='AK' ? "<option value='AK' selected>ALASKA</option>" :  "<option value='AK' >ALASKA</option>"}
								${userProfile.state =='AZ' ? "<option value='AZ' selected>ARIZONA</option>" :  "<option value='AZ' >ARIZONA</option>"}
								${userProfile.state =='AR' ? "<option value='AR' selected>ARKANSAS</option>" :  "<option value='AR' >ARKANSAS</option>"}
								${userProfile.state =='CA' ? "<option value='CA' selected>CALIFORNIA</option>" :  "<option value='CA' >CALIFORNIA</option>"}
								${userProfile.state =='CO' ? "<option value='CO' selected>COLORADO</option>" :  "<option value='CO' >COLORADO</option>"}
								${userProfile.state =='CT' ? "<option value='CT' selected>CONNECTICUT</option>" :  "<option value='CT' >CONNECTICUT</option>"}
								${userProfile.state =='DE' ? "<option value='DE' selected>DELAWARE</option>" :  "<option value='DE' >DELAWARE</option>"}
								${userProfile.state =='DC' ? "<option value='DC' selected>DISTRICT OF COLUMBIA</option>" :  "<option value='DC' >DISTRICT OF COLUMBIA</option>"}
								${userProfile.state =='FL' ? "<option value='FL' selected>FLORIDA</option>" :  "<option value='FL' >FLORIDA</option>"}
								${userProfile.state =='GA' ? "<option value='GA' selected>GEORGIA</option>" :  "<option value='GA' >GEORGIA</option>"}
								${userProfile.state =='HI' ? "<option value='HI' selected>HAWAII</option>" :  "<option value='HI' >HAWAII</option>"}
								${userProfile.state =='IL' ? "<option value='IL' selected>ILLINOIS</option>" :  "<option value='IL' >ILLINOIS</option>"}
								${userProfile.state =='ID' ? "<option value='ID' selected>IDAHO</option>" :  "<option value='ID' >IDAHO</option>"}
								${userProfile.state =='IN' ? "<option value='IN' selected>INDIANA</option>" :  "<option value='IN' >INDIANA</option>"}
								${userProfile.state =='IA' ? "<option value='IA' selected>IOWA</option>" :  "<option value='IA' >IOWA</option>"}
								${userProfile.state =='KS' ? "<option value='KS' selected>KANSAS</option>" :  "<option value='KS' >KANSAS</option>"}
								${userProfile.state =='KY' ? "<option value='KY' selected>KENTUCKY</option>" :  "<option value='KY' >KENTUCKY</option>"}
								${userProfile.state =='LA' ? "<option value='LA' selected>LOUISIANA</option>" :  "<option value='LA' >LOUISIANA</option>"}
								${userProfile.state =='ME' ? "<option value='ME' selected>MAINE</option>" :  "<option value='ME' >MAINE</option>"}
								${userProfile.state =='MD' ? "<option value='MD' selected>MARYLAND</option>" :  "<option value='MD' >MARYLAND</option>"}
								${userProfile.state =='MA' ? "<option value='MA' selected>MASSACHUSETTS</option>" :  "<option value='MA' >MASSACHUSETTS</option>"}
								${userProfile.state =='MI' ? "<option value='MI' selected>MICHIGAN</option>" :  "<option value='MI' >MICHIGAN</option>"}
								${userProfile.state =='MN' ? "<option value='MN' selected>MINNESOTA</option>" :  "<option value='MN' >MINNESOTA</option>"}
								${userProfile.state =='MS' ? "<option value='MS' selected>MISSISSIPPI</option>" :  "<option value='MS' >MISSISSIPPI</option>"}
								${userProfile.state =='MO' ? "<option value='MO' selected>MISSOURI</option>" :  "<option value='MO' >MISSOURI</option>"}
								${userProfile.state =='MI' ? "<option value='MT' selected>MONTANA</option>" :  "<option value='MI' >MONTANA</option>"}
								${userProfile.state =='NE' ? "<option value='NE' selected>NEBRASKA</option>" :  "<option value='NE' >NEBRASKA</option>"}
								${userProfile.state =='NV' ? "<option value='NV' selected>NEVADA</option>" :  "<option value='NV' >NEVADA</option>"}
								${userProfile.state =='NH' ? "<option value='NH' selected>NEW HAMPSHIRE</option>" :  "<option value='NH' >NEW HAMPSHIRE</option>"}
								${userProfile.state =='NJ' ? "<option value='NJ' selected>NEW JERSEY</option>" :  "<option value='NJ' >NEW JERSEY</option>"}
								${userProfile.state =='NM' ? "<option value='NM' selected>NEW MEXICO</option>" :  "<option value='MN' >NEW MEXICO</option>"}
								${userProfile.state =='NY' ? "<option value='NY' selected>NEW YORK</option>" :  "<option value='NY' >NEW YORK</option>"}
								${userProfile.state =='NC' ? "<option value='NC' selected>NORTH CAROLINA</option>" :  "<option value='NC' >NORTH CAROLINA</option>"}
								${userProfile.state =='ND' ? "<option value='ND' selected>NORTH DAKOTA</option>" :  "<option value='ND' >NORTH DAKOTA</option>"}
								${userProfile.state =='OH' ? "<option value='OH' selected>OHIO</option>" :  "<option value='OH' >OHIO</option>"}
								${userProfile.state =='OK' ? "<option value='OK' selected>OKLAHOMA</option>" :  "<option value='OK' >OKLAHOMA</option>"}
								${userProfile.state =='OR' ? "<option value='OR' selected>OREGON</option>" :  "<option value='OR' >OREGON</option>"}
								${userProfile.state =='PA' ? "<option value='PA' selected>PENNSYLVANIA</option>" :  "<option value='PA' >PENNSYLVANIA</option>"}
								${userProfile.state =='RI' ? "<option value='RI' selected>RHODE ISLAND</option>" :  "<option value='RI' >RHODE ISLAND</option>"}
								${userProfile.state =='SC' ? "<option value='SC' selected>SOUTH CAROLINA</option>" :  "<option value='SC' >SOUTH CAROLINA</option>"}
								${userProfile.state =='SD' ? "<option value='SD' selected>SOUTH DAKOTA</option>" :  "<option value='SD' >SOUTH DAKOTA</option>"}
								${userProfile.state =='TN' ? "<option value='TN' selected>TENNESSE</option>" :  "<option value='TN' >TENNESSE</option>"}
								${userProfile.state =='TX' ? "<option value='TX' selected>TEXAS</option>" :  "<option value='TX' >TEXAS</option>"}
								${userProfile.state =='UT' ? "<option value='UT' selected>UTAH</option>" :  "<option value='UT' >UTAH</option>"}
								${userProfile.state =='VI' ? "<option value='VT' selected>VERMONT</option>" :  "<option value='VT' >VERMONT</option>"}
								${userProfile.state =='VA' ? "<option value='VA' selected>VIRGINIA</option>" :  "<option value='VA' >VIRGINIA</option>"}
								${userProfile.state =='WA' ? "<option value='WA' selected>WASHINGTON</option>" :  "<option value='WA' >WASHINGTON</option>"}
								${userProfile.state =='WV' ? "<option value='WV' selected>WEST VIRGINIA</option>" :  "<option value='WV' >WEST VIRGINIA</option>"}
								${userProfile.state =='WI' ? "<option value='WI' selected>WISCONSIN</option>" :  "<option value='WI' >WISCONSIN</option>"}
								${userProfile.state =='WY' ? "<option value='WY' selected>WYOMING</option>" :  "<option value='WY' >WYOMING</option>"}
								${userProfile.state =='AB' ? "<option value='AB' selected>ALBERTA</option>" :  "<option value='AB' >ALBERTA</option>"}
								${userProfile.state =='AS' ? "<option value='AS' selected>AMERICAN SAMOA</option>" :  "<option value='AS' >AMERICAN SAMOA</option>"}
								${userProfile.state =='BC' ? "<option value='BC' selected>BRITISH COLUMBIA</option>" :  "<option value='BC' >BRITISH COLUMBIA</option>"}
								${userProfile.state =='GU' ? "<option value='GU' selected>GUAM</option>" :  "<option value='GU' >GUAM</option>"}
								${userProfile.state =='LB' ? "<option value='LB' selected>LABRADOR</option>" :  "<option value='LB' >LABRADOR</option>"}
								${userProfile.state =='MB' ? "<option value='MB' selected>MANITOBA</option>" :  "<option value='MB' >MANITOBA</option>"}
								${userProfile.state =='MM' ? "<option value='MM' selected>MEXICO</option>" :  "<option value='MM' >MEXICO</option>"}
								${userProfile.state =='NB' ? "<option value='NB' selected>NEW BRUNSWICK</option>" :  "<option value='NB' >NEW BRUNSWICK</option>"}
								${userProfile.state =='NF' ? "<option value='NF' selected>NEWFOUNDLAND</option>" :  "<option value='NF' >NEWFOUNDLAND</option>"}
								${userProfile.state =='NT' ? "<option value='NT' selected>NORTHWEST TERRITORY</option>" :  "<option value='NT' >NORTHWEST TERRITORY</option>"}
								${userProfile.state =='NS' ? "<option value='NS' selected>NOVA SCOTIA</option>" :  "<option value='NS' >NOVA SCOTIA</option>"}
								${userProfile.state =='ON' ? "<option value='ON' selected>ONTARIO</option>" :  "<option value='ON' >ONTARIO</option>"}
								${userProfile.state =='CZ' ? "<option value='CZ' selected>PANAMA CANAL ZONE</option>" :  "<option value='CZ' >PANAMA CANAL ZONE</option>"}
								${userProfile.state =='PE' ? "<option value='PE' selected>PRINCE EDWARD ISLAND</option>" :  "<option value='PE' >PRINCE EDWARD ISLAND</option>"}
								${userProfile.state =='PR' ? "<option value='PR' selected>PUERTO RICO</option>" :  "<option value='PR' >PUERTO RICO</option>"}
								${userProfile.state =='PQ' ? "<option value='PQ' selected>QUEBEC</option>" :  "<option value='PQ' >QUEBEC</option>"}
								${userProfile.state =='SK' ? "<option value='SK' selected>SASKATCHEWAN</option>" :  "<option value='SK' >SASKATCHEWAN</option>"}
								${userProfile.state =='VI' ? "<option value='VI' selected>VIRGIN ISLANDS</option>" :  "<option value='VI' >VIRGIN ISLANDS</option>"}
								${userProfile.state =='YT' ? "<option value='YT' selected>YUKEN</option>" :  "<option value='YT' >YUKEN</option>"}
						</form:select>					
					</td>
				  
				  
			    </tr>
			    
				<tr>
				      <td class="rightalign" >Coach First Name: <form:errors path="coachFirstName" cssClass="error" /><br> </td>
				      <td class="leftalign">
				        <form:input size="35" path="coachFirstName" /></td>
				      <td class="rightalign" >Coach Last Name: <form:errors path="coachLastName" cssClass="error" /><br> </td>
				      <td class="leftalign">
				        <form:input size="35" path="coachLastName" /></td>
				</tr>		
				
				<tr>
				  <td class="rightalign" >Company Experience: <form:errors path="companyExperience" cssClass="error" /> </td>
				  <td class="leftalign"><form:input size="35" path="companyExperience" /></td>
				</tr>
			  </tbody>
			  </table>
			   	
			  <table>
			  <tbody >
			    <tr>
<%--
			      <td class="leftalign">Coaching Category 1: <form:errors path="coachingCategory" cssClass="error" nowrap="true" />
			        <form:select size="1" path="coachingCategory" id="coachingCategory" onchange="ShowHideSubCat()" >
			          <option selected  value="-1">Select a Category</option>
			          <option value="1">Accounting</option>
			          <option value="2">Automotive</option>
			          <option value="3">Banking</option>
			          <option value="4">Biotech</option>
			          <option value="5">Business Development</option>
			          <option value="6">Business Opportunity</option>
			        </form:select></td>
			      <td class="leftalign">Coaching Sub-Category: 
			        <div id = coachingSubcategory0 >
			        <select>
			          <option  value="0">Select a Subcategory</option>
			        </select>
			        </div>
			        <div id = coachingSubcategory1 style="display: none;">
			        <select onchange="updateSubcategoryValue (this.options[this.selectedIndex].value);" >
			          <option  value="0">All</option>
			          <option value="1">Executive Coaching 1</option>
			          <option value="2">Leadership Coaching 1</option>
			          <option value="3">Business Management Coaching 1</option>
			          <option value="4">International Executive 1</option>
			        </select>
			        </div>
			        <div id = coachingSubcategory2 style="display: none;">
			        <select onchange="updateSubcategoryValue (this.options[this.selectedIndex].value);" >
			          <option  value="0">All</option>
			          <option value="1">Executive Coaching 2</option>
			          <option value="2">Leadership Coaching 2</option>
			          <option value="3">Business Management Coaching 2</option>
			          <option value="4">International Executive 2</option>
			        </select>
			        </div>
			        <div id = coachingSubcategory3 style="display: none;"> 
			        <select onchange="updateSubcategoryValue (this.options[this.selectedIndex].value);" >
			          <option  value="0">All</option>
			          <option value="1">Executive Coaching 3</option>
			          <option value="2">Leadership Coaching 3</option>
			          <option value="3">Business Management Coaching 3</option>
			          <option value="4">International Executive 3</option>
			        </select>
			        </div>
			        </td>

			    </tr>
				<tr>		
			      <td class="leftalign">Industry Experience: <form:errors path="industryExperience" cssClass="error" />
			      <!-- Find complete list from job categories in career builder -->
			        <form:select size="1" path="industryExperience" >
			          <option selected  value="-1">Select an Industry</option>
			          <option value="1">Accounting</option>
			          <option value="2">Automotive</option>
			          <option value="3">Banking</option>
			          <option value="4">Biotech</option>
			          <option value="5">Business Development</option>
			          <option value="6">Business Opportunity</option>
			        </form:select></td>
				  <td class="leftalign">Company Experience: <form:errors path="companyExperience" cssClass="error" />
				    <form:input size="35" path="companyExperience" /></td>
			    </tr>
				<tr>
				      <td class="leftalign">Coach First Name: <form:errors path="coachFirstName" cssClass="error" /><br>
				        <form:input size="35" path="coachFirstName" /></td>
				      <td class="leftalign">Coach Last Name: <form:errors path="coachLastName" cssClass="error" /><br>
				        <form:input size="35" path="coachLastName" /></td>
				</tr>		
 --%>			        
				
			</tbody>
			</table>
			<br /> <br />
			<input type="submit" class="input-button" value="NEXT >>" />
			
			<%--
			<table>
					<thead>
						<tr>
						<th>Business</th>
						<th>Leadership Projects</th>
						<th>Executive Projects</th>
						<th>Corporate Projects</th>
						</tr>
					</thead>
					<tbody>
						<tr> <td> Business 1</td> 
							 <td> Leadership 1</td> 
							 <td> Executive 1</td> 
							 <td> Corporate Projects 1 </td> 
						 </tr>
						<tr> <td> Business 2</td> 
							 <td> Leadership 2</td> 
							 <td> Executive 2</td> 
							 <td> Corporate Projects 2 </td> 
						 </tr>
						<tr> <td> Business 3</td> 
							 <td> Leadership 3</td> 
							 <td> Executive 3</td> 
							 <td> Corporate Projects 3 </td> 
						 </tr>
						<tr> <td> Business 4</td> 
							 <td> Leadership 4</td> 
							 <td> </td> 
							 <td> Corporate Projects 4 </td> 
						 </tr>
						<tr> <td> Business 5</td> 
							 <td> Leadership 5</td> 
							 <td> </td> 
							 <td> Corporate Projects 5 </td> 
						 </tr>

					</tbody>
					
					<thead>
						<tr>
						<th>Business A</th>
						<th>Leadership Projects A</th>
						<th>Executive Projects A</th>
						<th>Corporate Projects A</th>
						</tr>
					</thead>
					<tbody>
						<tr> <td> Business 1</td> 
							 <td> Leadership 1</td> 
						 </tr>
						<tr> <td> Business 2</td> 
							 <td> Leadership 2</td> 
						 </tr>
						<tr> <td> Business 3</td> 
							 <td> Leadership 3</td> 
						 </tr>
						<tr> <td> Business 4</td> 
							 <td> Leadership 4</td> 
						 </tr>
						<tr> <td> Business 5</td> 
							 <td> Leadership 5</td> 
						 </tr>

					</tbody>	
			</table>
			 --%>
		<!--  This section is opened in header_no_side.jsp -->
		<form:hidden path="coachingSubcategory" id="coachingSubcategory" value="-1"/>
		</form:form>

	</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	

<%-- BEGIN Footer No Side test --%>
<%-- End Footer No Side test --%>
