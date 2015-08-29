		<form:form method="post" commandName="coachSelection" >
			<form:hidden path="coachingCategory" id="coachingCategory" value="${coachingCategory}"/>
			<form:hidden path="coachingcategoryname" id="coachingcategoryname" value="${coachingcategoryname}"/>

			  <table style="border-spacing:2px; border-collapse:separate;">
			  <tbody >
			    <tr>
			    	<td  class="leftalign" ><br><label>Category: </label><form:errors path="coachingCategory" cssClass="error" /><br>
					${coachingcategoryname}</td>

				  <td class="leftalign" ><br><label>Subject (Ex. math, chemistry, anatomy): </label><form:errors path="subject" cssClass="error" /> <br>
				  <form:input size="35" path="subject" /></td>

				</tr>
				<tr>
			      <td class="leftalign" ><br><label>Max Hourly Rate: </label><form:errors path="maxrate" cssClass="error" /><br> 
			        <form:select size="1" path="maxrate" >
			          	<option selected  value="-1">All</option>
						<option value="10">&lt; 10 </option>
						<option value="20">&lt; 20 </option>
						<option value="30">&lt; 30 </option>
						<option value="40">&lt; 40 </option>
						<option value="50">&lt; 50 </option>
						<option value="60">&lt; 60 </option>
						<option value="70">&lt; 70 </option>
						<option value="80">&lt; 80 </option>
						<option value="90">&lt; 90 </option>
						<option value="100">&lt; 100 </option>
						<option value="110">&lt; 110 </option>
						<option value="120">&lt; 120 </option>
						<option value="130">&lt; 130 </option>
						<option value="140">&lt; 140 </option>
						<option value="150">&lt; 150 </option>
						<option value="160">&lt; 160 </option>
						<option value="170">&lt; 170 </option>
						<option value="180">&lt; 180 </option>
						<option value="190">&lt; 190 </option>
						<option value="200">&lt; 200 </option>
					</form:select>
			      </td>
				
			      <td class="leftalign" ><br><label>Grade Level: </label><form:errors path="gradelevel" cssClass="error" /> <br>
			      <!-- Find complete list from job categories in career builder -->
			        <form:select size="1" path="gradelevel" >
			          	<option selected  value="-1">All Grades</option>
						<option value="a">Elementary (K - 6)</option>
						<option value="b">Junior High (6 - 8)</option>
						<option value="c">High School (8 - 12)</option>
						<option value="d">College</option>
						<option value="e">Professional</option>
						<option value="f">Leisure</option>
					</form:select>
			     </td>
				</tr>
				<tr>		

				  <td class="leftalign" ><br><label>City (Not required for online coaching): </label><form:errors path="city" cssClass="error" /> <br>
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
			    
				<tr>
				      <td class="leftalign" ><br><label>First Name: </label><form:errors path="coachFirstName" cssClass="error" /><br> 
				        <form:input size="35" path="coachFirstName" /></td>
				      <td class="leftalign" ><br><label>Last Name: </label><form:errors path="coachLastName" cssClass="error" /><br> 
				        <form:input size="35" path="coachLastName" /></td>
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

