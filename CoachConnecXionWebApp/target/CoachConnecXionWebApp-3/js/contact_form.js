jQuery(document).ready(function(){
	
	//get generated random number and post it to captcha image

	var chars = "123456789ABCDEFGHIJKLMNPQRSTUVWXTZ";
	var string_length = 4;
	var randomstring = '';
	for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		randomstring += chars.substring(rnum,rnum+1);
	}

	jQuery('#captcha').attr('src','captcha.php?c='+randomstring);
	
	
	
	//ONPAGE CONTACT FORM
	jQuery("#page_contact_form").submit(	
		function(){	
			var error_found = 0;
			var ub_w_cf_error = "0";
			
			
			//SET BASIC BACKGROUND IMAGE ON SUBMIT
			jQuery("#cf1").css("border-left","1px solid #dedede");
			jQuery("#cf2").css("border-left","1px solid #dedede");
			jQuery("#cf3").css("border-left","1px solid #dedede");
			jQuery("#cf4").css("border-left","1px solid #dedede");
			
			
			//IF ERROR > DISPLAY COLORED BORDERS
			if(jQuery("#cf1").val() == ""){
				ub_w_cf_error = "1";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
					
			if(jQuery("#cf2").val() == ""){
				ub_w_cf_error = "2";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
					
			if(jQuery("#cf3").val() == ""){
				ub_w_cf_error = "3";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
			
			//check if captcha matches with user posted value (#cf-4)
			if(jQuery('#cf4').val().toUpperCase() != randomstring){
				ub_w_cf_error = "4";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
			
			
			if(error_found == 0){
				//sending, add preloader
				jQuery('.page_contact_form li:last').append('<span style="float: left; margin-left: 10px; line-height: 27px;">Sending...</span>');
				
				//AJAX > send mail
				var dataString = "name="+ jQuery("#cf1").val() + "&email=" + jQuery("#cf2").val() + "&msg=" + jQuery("#cf3").val();
				jQuery.ajax({
						type: 'POST',
						url: 'sendmail.php',
						data: dataString,
						success: function(msg) {
							jQuery('.page_contact_form li:last span').remove();
							
							//display message to user
							if(msg == '1'){
								//success
								jQuery('.page_contact_form').replaceWith('Your message has been sent!<br />Thank you!');
							}else{
								//error
								alert(msg);	
								alert(dataString);
							}
						}
					});
			}
			
					
			
			return false;
		}				
	);
	
	
	
	//FOOTER CONTACT FORM
	jQuery("#contact_form").submit(	
		function(){	
			var error_found = 0;
			var ub_w_cf_error = "0";
			
			
			//SET BASIC BACKGROUND IMAGE ON SUBMIT
			
			jQuery("#cf1").css("border-left","1px solid #dedede");
			jQuery("#cf2").css("border-left","1px solid #dedede");
			jQuery("#cf3").css("border-left","1px solid #dedede");
			jQuery("#cf4").css("border-left","1px solid #dedede");
			
			
			//IF ERROR > DISPLAY COLORED BORDERS
			if(jQuery("#cf1").val() == ""){
				ub_w_cf_error = "1";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
					
			if(jQuery("#cf2").val() == ""){
				ub_w_cf_error = "2";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
					
			if(jQuery("#cf3").val() == ""){
				ub_w_cf_error = "3";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
			
			//check if captcha matches with user posted value (#cf-4)
			if(jQuery('#cf4').val().toUpperCase() != randomstring){
				ub_w_cf_error = "4";
				jQuery("#cf"+ub_w_cf_error).css("border-left","2px solid #970000");
				error_found = 1;
			}
			
			
			if(error_found == 0){
				//sending, add preloader
				jQuery('.contact_form li:last').append('<span style="float: left; margin-left: 10px; line-height: 24px; font-size: 11px;">Sending...</span>');
				
				//AJAX > send mail
				var dataString = "name="+ jQuery("#cf1").val() + "&email=" + jQuery("#cf2").val() + "&msg=" + jQuery("#cf3").val();
				jQuery.ajax({
						type: 'POST',
						url: 'sendmail.php',
						data: dataString,
						success: function(msg) {
							jQuery('.contact_form li:last span').remove();
							
							//display message to user
							if(msg == '1'){
								//success
								jQuery('.contact_form').replaceWith('Your message has been sent!<br />Thank you!');
							}else{
								//error
								alert(msg);	
								alert(dataString);
							}
						}
					});
			}
			
					
			
			return false;
		}				
	);
});	