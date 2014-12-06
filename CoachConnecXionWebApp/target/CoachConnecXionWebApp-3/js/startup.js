$(document).ready(function(){


	//RESPONSIVE MENU FUNCTION
	jQuery('#responsive-menu').change(function(){
		//alert(jQuery('option:selected',this).val());
		window.location.href = jQuery('option:selected',this).val();
	})
	
	//ELASTIC SLIDER
	if(jQuery('#ei-slider').length != 0){
		jQuery('#ei-slider').eislideshow({
			easing		: 'easeOutExpo',
			titleeasing	: 'easeOutExpo',
			titlespeed	: 2400 
		});
		
		
		//SET SLIDER HEIGHT BASED ON IMAGE
		if(jQuery(window).width() < 940){
			jQuery('.ei-slider-large img').load(function(){
				var eih = parseInt(jQuery('.ei-slider .ei-slider-large img').css('height'));				
				jQuery('.ei-slider').css('height',eih+'px');
			});			
		}		
		
		
		
	}	
	
	
	//TWITTER FEED
	if(jQuery('#twitter').length != 0){
		jQuery("#twitter").getTwitter({
			userName: 'themeprince',
			numTweets: '2',
			loaderText: "Loading..."
		});
	}
	
	
	
	//FANCYBOX
	if(jQuery('.fancybox').length != 0){
		jQuery('.fancybox').fancybox();
	}
		
	if(jQuery('.fancybox_iframe').length != 0){
		jQuery('.fancybox_iframe').fancybox(
			{
				'width'				: '75%',
				'height'			: '75%',
				'autoScale'     	: false,
				'type'				: 'iframe'
			}
			);
	}
	
	if(jQuery('.fancybox_embed').length != 0){
		jQuery('.fancybox_embed').fancybox(
			{
				'hideOnContentClick': true
			}
		);
	}
	
	if(jQuery('.fancybox_flv').length != 0){
		var vid_id = jQuery('.fancybox_flv').attr('href');
		jQuery('.fancybox_flv').fancybox(
			{				
			'href'	:	'swf/player_flv_maxi.swf',
			'autoScale'     	: true,
			'type'				: 'swf',
			'swf'			: {
			'FlashVars'		: 'showvolume=1&amp;buttonovercolor=d3aa66&amp;sliderovercolor=d3aa66&amp;loadingcolor=ffffff&amp;autoplay=1&amp;flv='+vid_id
			}
			}
		);
	}			
			
			
			


	//TABS
	if(jQuery('.tabs,.tabs-vertical').length != 0){
		jQuery('.tabs,.tabs-vertical').tabs({
			fx: [{opacity:'toggle', duration:'normal'},
			{opacity:'toggle', duration:'normal'}]
		})
	}
					
					

	//TOGGLES
	jQuery('.toggle_box').hide(); 
		//Slide up and down on hover
	jQuery('.toggle').click(function(){
		jQuery(this).next('.toggle_box').slideToggle('slow');
		return false;
	});
		
			
	//CAROUSEL - HORIZONTAL
	if(jQuery('#carousel').length != 0){
		jQuery('#carousel').tinycarousel();
	}			
		
	
});


	//BACK TO TOP FUNCTION
	$(function() {
		jQuery(window).scroll(function() {
			if(jQuery(this).scrollTop() > 400) {
				jQuery('#toTop').fadeIn();	
			} else {
				jQuery('#toTop').fadeOut();
			}
			
			
		});
	 
		jQuery('#toTop').click(function() {
			jQuery('body,html').animate({scrollTop:0},800);
		});	
	});