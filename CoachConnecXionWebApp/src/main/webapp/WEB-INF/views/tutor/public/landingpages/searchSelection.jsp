		<form:form method="post" commandName="coachSelection" >
	    	<c:if test="${empty general}">
	    		<%-- 
				<form:hidden path="coachingCategory" id="coachingCategory" value="${coachingCategory}"/>
				<form:hidden path="coachingcategoryname" id="coachingcategoryname" value="${coachingcategoryname}"/>
				--%>
			</c:if>

			  <table style="border-spacing:2px; border-collapse:separate;">
			  <tbody >
			    <tr>
			    	<c:if test="${empty general}">
				    	<td  class="leftalign" ><label>Category: </label><form:errors path="coachingCategory" cssClass="error" /><br>
					        <form:select size="1" path="coachingCategory" id="coachingCategory" >
					          <option selected  value="-1">All Categories</option>
					          ${coachingCategory =='1010' ? "<option value='1010' selected>Art Tutors</option>" : "<option value='1010'>Art Tutors</option>"}
					          ${coachingCategory =='1020' ? "<option value='1020' selected>Business/Finance/Accounting</option>" : "<option value='1020'>Business/Finance/Accounting</option>"}
					          ${coachingCategory =='1030' ? "<option value='1030' selected>Computer Business (Word/Excel/PPT/etc..)</option>" : "<option value='1030'>Computer Business (Word/Excel/PPT/etc..)</option>"}
					          ${coachingCategory =='1040' ? "<option value='1040' selected>Compute Programming (Java/.Net/etc..)</option>" : "<option value='1040'>Compute Programming (Java/.Net/etc..)</option>"}
					          ${coachingCategory =='1050' ? "<option value='1050' selected>Communication/Presentation</option>" : "<option value='1050'>Communication/Presentation</option>"}
					          ${coachingCategory =='1060' ? "<option value='1060' selected>English Tutors</option>" : "<option value='1060'>English Tutors</option>"}
					          ${coachingCategory =='1070' ? "<option value='1070' selected>History Tutors</option>" : "<option value='1070'>History Tutors</option>"}
					          ${coachingCategory =='1080' ? "<option value='1080' selected>Homeschool Tutors</option>" : "<option value='1080'>Homeschool Tutors</option>"}
					          ${coachingCategory =='1090' ? "<option value='1090' selected>Language Tutors</option>" : "<option value='1090'>Language Tutors</option>"}
					          ${coachingCategory =='1100' ? "<option value='1100' selected>Math</option>" : "<option value='1100'>Math</option>"}
					          ${coachingCategory =='1110' ? "<option value='1110' selected>Music</option>" : "<option value='1110'>Music</option>"}
					          ${coachingCategory =='1120' ? "<option value='1120' selected>Science</option>" : "<option value='1120'>Science</option>"}
					          ${coachingCategory =='1130' ? "<option value='1130' selected>Special Needs (ADD/ADHD/etc..)</option>" : "<option value='1130'>Special Needs (ADD/ADHD/etc..)</option>"}
					          ${coachingCategory =='1140' ? "<option value='1140' selected>Test Prep(SAT/ACT/GMAT/LSAT/etc..)</option>" : "<option value='1140'>Test Prep(SAT/ACT/GMAT/LSAT/etc..)</option>"}
					        </form:select>			    	
					</c:if>
					<%-- 
			    	<c:if test="${not empty general}">
			    		<td  class="leftalign" ><label>Category: </label><form:errors path="coachingCategory" cssClass="error" /><br>
					        <form:select size="1" path="coachingCategory" id="coachingCategory" >
					          <option selected  value="-1">All Categories</option>
					          ${coachingCategory =='1010' ? "<option value='1010' selected>Art Tutors</option>" : "<option value='1010'>Art Tutors</option>"}
					          ${coachingCategory =='1020' ? "<option value='1020' selected>Business/Finance/Accounting</option>" : "<option value='1020'>Business/Finance/Accounting</option>"}
					          ${coachingCategory =='1030' ? "<option value='1030' selected>Computer Business (Word/Excel/PPT/etc..)</option>" : "<option value='1030'>Computer Business (Word/Excel/PPT/etc..)</option>"}
					          ${coachingCategory =='1040' ? "<option value='1040' selected>Compute Programming (Java/.Net/etc..)</option>" : "<option value='1040'>Compute Programming (Java/.Net/etc..)</option>"}
					          ${coachingCategory =='1050' ? "<option value='1050' selected>Communication/Presentation</option>" : "<option value='1050'>Communication/Presentation</option>"}
					          ${coachingCategory =='1060' ? "<option value='1060' selected>English Tutors</option>" : "<option value='1060'>English Tutors</option>"}
					          ${coachingCategory =='1070' ? "<option value='1070' selected>History Tutors</option>" : "<option value='1070'>History Tutors</option>"}
					          ${coachingCategory =='1080' ? "<option value='1080' selected>Homeschool Tutors</option>" : "<option value='1080'>Homeschool Tutors</option>"}
					          ${coachingCategory =='1090' ? "<option value='1090' selected>Language Tutors</option>" : "<option value='1090'>Language Tutors</option>"}
					          ${coachingCategory =='1100' ? "<option value='1100' selected>Math</option>" : "<option value='1100'>Math</option>"}
					          ${coachingCategory =='1110' ? "<option value='1110' selected>Music</option>" : "<option value='1110'>Music</option>"}
					          ${coachingCategory =='1120' ? "<option value='1120' selected>Science</option>" : "<option value='1120'>Science</option>"}
					          ${coachingCategory =='1130' ? "<option value='1130' selected>Special Needs (ADD/ADHD/etc..)</option>" : "<option value='1130'>Special Needs (ADD/ADHD/etc..)</option>"}
					          ${coachingCategory =='1140' ? "<option value='1140' selected>Test Prep(SAT/ACT/GMAT/LSAT/etc..)</option>" : "<option value='1140'>Test Prep(SAT/ACT/GMAT/LSAT/etc..)</option>"}
					        </form:select>			    	
						</td>
					</c:if>
					--%>
					
				  <td class="leftalign" ><br><label>Subject (Ex. Algebra, chemistry, anatomy): </label><form:errors path="subject" cssClass="error" /> <br>
				  <form:input size="35" path="subject" /><br>&nbsp;</td>
				</tr>
				<tr>
			      <td class="leftalign" ><label>Max Hourly Rate: </label><form:errors path="maxrate" cssClass="error" /><br> 
			        <form:select size="1" path="maxrate" >
			          	${maxrate =='-1' ? "<option selected  value='-1'>All</option>" :  "<option value='-1'>All</option>"} 
						${maxrate =='10' ? "<option value='10' selected>10</option>" : "<option value='10'>10</option>"}
						${maxrate =='15' ? "<option value='15' selected>15</option>" : "<option value='15'>15</option>"}
						${maxrate =='20' ? "<option value='20' selected>20</option>" : "<option value='20'>20</option>"}
						${maxrate =='25' ? "<option value='25' selected>25</option>" : "<option value='25'>25</option>"}
						${maxrate =='30' ? "<option value='30' selected>30</option>" : "<option value='30'>30</option>"}
						${maxrate =='35' ? "<option value='35' selected>35</option>" : "<option value='35'>35</option>"}
						${maxrate =='40' ? "<option value='40' selected>40</option>" : "<option value='40'>40</option>"}
						${maxrate =='45' ? "<option value='45' selected>45</option>" : "<option value='45'>45</option>"}
						${maxrate =='50' ? "<option value='50' selected>50</option>" : "<option value='50'>50</option>"}
						${maxrate =='55' ? "<option value='55' selected>55</option>" : "<option value='55'>55</option>"}
						${maxrate =='60' ? "<option value='60' selected>60</option>" : "<option value='60'>60</option>"}
						${maxrate =='65' ? "<option value='65' selected>65</option>" : "<option value='65'>65</option>"}
						${maxrate =='70' ? "<option value='70' selected>70</option>" : "<option value='70'>70</option>"}
						${maxrate =='75' ? "<option value='75' selected>75</option>" : "<option value='75'>75</option>"}
						${maxrate =='80' ? "<option value='80' selected>80</option>" : "<option value='80'>80</option>"}
						${maxrate =='85' ? "<option value='85' selected>85</option>" : "<option value='85'>85</option>"}
						${maxrate =='90' ? "<option value='90' selected>90</option>" : "<option value='90'>90</option>"}
						${maxrate =='95' ? "<option value='95' selected>95</option>" : "<option value='95'>95</option>"}
						${maxrate =='100' ? "<option value='100' selected>100</option>" : "<option value='100'>100</option>"}
						${maxrate =='105' ? "<option value='105' selected>105</option>" : "<option value='105'>105</option>"}
						${maxrate =='110' ? "<option value='110' selected>110</option>" : "<option value='110'>110</option>"}
						${maxrate =='115' ? "<option value='115' selected>115</option>" : "<option value='115'>115</option>"}
						${maxrate =='120' ? "<option value='120' selected>120</option>" : "<option value='120'>120</option>"}
						${maxrate =='125' ? "<option value='125' selected>125</option>" : "<option value='125'>125</option>"}
						${maxrate =='130' ? "<option value='130' selected>130</option>" : "<option value='130'>130</option>"}
						${maxrate =='135' ? "<option value='135' selected>135</option>" : "<option value='135'>135</option>"}
						${maxrate =='140' ? "<option value='140' selected>140</option>" : "<option value='140'>140</option>"}
						${maxrate =='145' ? "<option value='145' selected>145</option>" : "<option value='145'>145</option>"}
						${maxrate =='150' ? "<option value='150' selected>150</option>" : "<option value='150'>150</option>"}
						${maxrate =='155' ? "<option value='155' selected>155</option>" : "<option value='155'>155</option>"}
						${maxrate =='160' ? "<option value='160' selected>160</option>" : "<option value='160'>160</option>"}
						${maxrate =='165' ? "<option value='165' selected>165</option>" : "<option value='165'>165</option>"}
						${maxrate =='170' ? "<option value='170' selected>170</option>" : "<option value='170'>170</option>"}
						${maxrate =='175' ? "<option value='175' selected>175</option>" : "<option value='175'>175</option>"}
						${maxrate =='180' ? "<option value='180' selected>180</option>" : "<option value='180'>180</option>"}
						${maxrate =='185' ? "<option value='185' selected>185</option>" : "<option value='185'>185</option>"}
						${maxrate =='190' ? "<option value='190' selected>190</option>" : "<option value='190'>190</option>"}
						${maxrate =='195' ? "<option value='195' selected>195</option>" : "<option value='195'>195</option>"}
						${maxrate =='200' ? "<option value='200' selected>200</option>" : "<option value='200'>200</option>"}
					</form:select>
			      <br>&nbsp;</td>
				
			      <td class="leftalign" ><label>Grade Level: </label><form:errors path="gradelevel" cssClass="error" /> <br>
			      <!-- Find complete list from job categories in career builder -->
			        <form:select size="1" path="gradelevel" >
			          	<option selected  value="-1">All Grades</option>
						${gradelevel =='a' ? "<option value='a' selected>Elementary (K - 6)</option>" : "<option value='a'>Elementary (K - 6)</option>"}
						${gradelevel =='b' ? "<option value='b' selected>Junior High (6 - 8)</option>" : "<option value='b'>Junior High (6 - 8)</option>"}
						${gradelevel =='c' ? "<option value='c' selected>High School (8 - 12)</option>" : "<option value='c'>High School (8 - 12)</option>"}
						${gradelevel =='d' ? "<option value='d' selected>College</option>" : "<option value='d'>College</option>"}
						${gradelevel =='e' ? "<option value='e' selected>Professional</option>" : "<option value='e'>Professional</option>"}
						${gradelevel =='f' ? "<option value='f' selected>Leisure</option>" : "<option value='f'>Leisure</option>"}
					</form:select>
			     <br>&nbsp;</td>
				</tr>
				<%-- 
				<tr>		
				  <td class="leftalign" ><label>City (Not required for online coaching): </label><form:errors path="city" cssClass="error" /> <br>
				  <form:input size="35" path="city" /></td>
				  
				  <td class="leftalign" ><br><label>State/Prov. (Not required for online coaching):</label> <br> 
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
			    --%>
				<tr>
				      <td class="leftalign" ><label>Tutor First Name: </label><form:errors path="coachFirstName" cssClass="error" /><br> 
				        <form:input size="35" path="coachFirstName" /><br>&nbsp;</td>
				      <td class="leftalign" ><label>Tutor Last Name: </label><form:errors path="coachLastName" cssClass="error" /><br> 
				        <form:input size="35" path="coachLastName" /><br>&nbsp;</td>
				</tr>
			    <tr>
				      <td class="leftalign" ><label>Preferred Tutoring Type: </label><form:errors path="coachstyleonline" cssClass="error" /><br> 
				            <form:radiobutton path="coachstyle" id="coachstyleinperson" value="coachstyleinperson" /> In-Person Tutoring
				            <form:radiobutton path="coachstyle" id="coachstyleonline" value="coachstyleonline" /> Online Tutoring
				      </td>
				      <td class="leftalign" >
						<div id='showzipecode' style='display:block'>
						      <label>Zipcode: </label><form:errors path="zipcode" cssClass="error" /><br> 
							<form:input size="10" path="zipcode" />
						</div>
					</td>
			    </tr>
				<tr style="background-color: white">
					<td colspan="4" style="text-align: left;">
						<br>	<input type="submit" class="input-button" value="Start Your Search" />
					</td>
				</tr>
				
			  </tbody>
			  </table>
			   	
		<form:hidden path="coachingSubcategory" id="coachingSubcategory" value="-1"/>
		<form:hidden path="industryExperience" id="industryExperience" value="-1"/>
		</form:form>