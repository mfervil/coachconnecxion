<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/questionDialog.js"></script>

	<script type="text/javascript">

	/** 
	*	Call showQuestionDialog('header text', 'message text', options, function(response){}) to show question dialog
	*
	* 	The options is a object with data for the buttons in the dialog
	*	okButton: 			text of the ok button
	*	okClass: 			class of the ok button (leave blank for standard color)
	*	cancelButton: 		text of the cancel button
	*	cancelClass: 		class of the cancel button (leave blank for standard color)
	*
	*	The next classes are avalible
	*	alert 				color red
	*	save 		 		color green
	*
	*	After the user clicked a button the callback function will be executed and the response could be true or false
	*	True when the user clicked the ok button
	*	False when the user clicked the cancel button
	*/
	function showQuestionDialog(header, message, options, callback) {
		$('body').append('<div id="overlay"></div>');
		$('body').append('<div id="confirm-dialog"><div class="dialog-content"><h2 class="confirm-header-text"></h2><p class="confirm-message-text"></p><button type="button" class="cancel-button"/><button type="button" class="ok-button"/></div></div>')
		$('.confirm-message-text').html(message);
		$('.confirm-header-text').text(header);
		$('.ok-button').text(options.okButton).addClass(options.okClass);
		$('.cancel-button').text(options.cancelButton).addClass(options.cancelClass);

		$('#overlay').bind("click", function() {
			$( ".ok-button" ).unbind();
			$( ".cancel-button" ).unbind();
			$('#overlay').unbind();
			
			hideQuestionDialog();
			callback(false);
		});

		$('.ok-button').bind("click", function() {
			$( ".ok-button" ).unbind();
			$( ".cancel-button" ).unbind();
			$('#overlay').unbind();
			
			hideQuestionDialog();
			callback(true);
		});

		$('.cancel-button').bind("click", function() {
			$( ".ok-button" ).unbind();
			$( ".cancel-button" ).unbind();
			$('#overlay').unbind();
			
			hideQuestionDialog();
			callback(false);
		});
	}

	/**
	*	Cancel button removes the question dialog
	*/
	function hideQuestionDialog() {
		$('#confirm-dialog').remove();
		$('#overlay').fadeOut(350, function() {
			this.remove();
		});
	}	
	
	
	</script>

<style type='text/css'>

/* Css for the example page. u can delete this */
body {
  margin: 0;
  font-family: arial;
}
#example {
  width: 40%;
  margin: auto;
  background: #eee;
  border-radius: 2px;
  margin-top: 120px;
  padding: 20px;
}
#answer {
  float: right;
}

/* Use the css below for the dialog or change it as you wish */
#overlay {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background: black;
  opacity: 0.7;
  z-index: 999;
}

#confirm-dialog {
  position: fixed;
  color: white;
  background-color: rgba(0,0,0,.85);
  z-index: 1000;
  width: 100%;
  top: 50%;
  transform: translate(0%, -50%);
  font-size: 13px;
}

#confirm-dialog .dialog-content {
  padding: 20px;
  padding-left: 10%;
  padding-right: 10%;
  width: 80%;
  float: left;
}

#confirm-dialog button {
  margin-right: 10px;
  float: right;
  padding:  10px;
  border: 0px;
  border-radius: 2px;
}

#confirm-dialog button.alert {
  background: #EB2E15;
}

#confirm-dialog button.save {
  background: #8AC007;
}

</style>

</head>
<body>
	<div id="example">
		<button id="open-dialog">open dialog</button>
		<div id="answer"></div>
	</div>

	<script type="text/javascript">
		$('#open-dialog').click(function() {
			var header = 'Your question header';
			var message = 'The compleet discription of the question.';
			var options = { okButton: 'Yes', okClass: 'save', cancelButton: 'No', cancelClass: 'alert'};
			showQuestionDialog(header, message, options, function(reaction) {
				$('#answer').text(reaction);
			});
		});
	</script>
</body>
</html>