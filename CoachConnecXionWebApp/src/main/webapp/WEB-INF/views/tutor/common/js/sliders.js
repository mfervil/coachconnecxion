var sliderVid = {
	
	init : function() {
		var vidClass = jQuery('.video');
		
		if(sliderVid.sliderCheck()){
			vidClass.each(function(i) {
				var el = jQuery(this),
				p = el.parent(),
				url = el.text();
				sliderVid.sliderDimensions(p);
				p.height(d.h).width(d.w);
				el.remove();
				sliderVid.prepend(p,d.w,d.h,i,url,sliderVid.getVidId(url));
			});
		}
	},
	
	sliderCheck : function() {
		var b = jQuery('#body_block');
		if( (b.hasClass('fading')) || (b.hasClass('tabbed'))) {
			return true;
		}
	},
	
	getVidId : function(url) {
		if(url.toLowerCase().indexOf('vimeo') > 0) {
			var re = new RegExp('/[0-9]+', "g");
			var match = re.exec(url);
			if (match == null) {
				return false;
			}else{
				return v = { id: match[0].substring(1), t: 'v' };
			}
		}
		
		if(url.toLowerCase().indexOf('youtube') > 0) {
			match = url.replace(/^[^v]+v.(.{11}).*/,"$1");
			if(match == null) {
				return false;
			}else{
				return v = { id: match, t: 'y' };
			}
		}
		return false;
	},
	
	sliderDimensions : function (p) {
		if(p.parent().hasClass('staged_slide')) {
			var w=901,h=350;
		}
		if(p.parent().hasClass('partial_staged_slide')) {
			var w=568,h=334;
		}
		if(p.parent().hasClass('full_slide')) {
			var w=981,h=420;
		}
		if(p.parent().hasClass('floating_slide')) {
			var w=901,h=350;
		}
		if(p.parent().hasClass('partial_gradient_slide')) {
			var w=511,h=344;
		}
		return d = { w: w, h: h };
	},
	
	prepend : function(p,w,h,i,url,id,type) {
		if(v.t=='v'){
			p.prepend('<span class="vvqbox vvqvimeo" style="width:'+w+'px;height:'+h+'px;"><span id="vvq-vimeo-'+i+'"><a href="'+url+'">'+url+'</a></span></span>');
			p.prepend('<scr' + 'ipt type="text/javascript">swfobject.embedSWF("http://www.vimeo.com/moogaloop.swf", "vvq-vimeo-'+i+'", "'+w+'", "'+h+'", "9", vvqexpressinstall, { "wmode": "opaque", "allowfullscreen": "true", "allowscriptacess": "always", "server": "www.vimeo.com", "clip_id": "'+v.id+'", "show_portrait": "0", "show_title": "1", "show_byline": "1", "fullscreen": "1" }, vvqparams, vvqattributes);</scr' + 'ipt>');
		}
		if(v.t=='y'){
			p.prepend('<span class="vvqbox vvqyoutube" style="width:'+w+'px;height:'+h+'px;"><span id="vvq-youtube-'+i+'"><a href="'+url+'">'+url+'</a></span></span>');
			p.prepend('<scr' + 'ipt type="text/javascript">swfobject.embedSWF("http://www.youtube.com/v/'+v.id+'&amp;rel=0&amp;fs=1&amp;showsearch=0&amp;showinfo=0", "vvq-youtube-'+i+'", "'+w+'", "'+h+'", "9", vvqexpressinstall, vvqflashvars, vvqparams, vvqattributes);</scr' + 'ipt>');
		}
		return false;
	}
	
}

jQuery(document).ready(function() {
	
	jQuery('#loading_slider').css('display', 'block');

	sliderVid.init();
	
	if(jQuery('#loading_slider').length){
		var $slider_type = jQuery("meta[name=slider_type]").attr('content');
		var $slider_speed = jQuery("meta[name=slider_speed]").attr('content');
		var $slider_disable = jQuery("meta[name=slider_disable]").attr('content');

		if($slider_type == 'fading'){$slider_img_class = "div[class^='single_fading_slide']";$loadingID = '.fading_slides';}
		if($slider_type == 'tabbed'){$slider_img_class = "div[class^='single_tabbed_slide']";$loadingID = '#tabbed_slides';}

		if($slider_disable == 'true'){$disable_slider = false;}
		if($slider_disable == 'false'){$disable_slider = true;}


		//pause slider on video play
		jQuery('#tabbed_slides .vvqbox').mousedown(function () {
			jQuery('#webtreats_tabbed_slider').data('scrollable').stop();
		});

		jQuery('.fading_slides .vvqbox').mousedown(function () {
			jQuery('.slidetabs').data('slideshow').stop();
		});

		//create slidetabs
		var sliderCount = jQuery('.single_fading_slide');
		sliderCount.each(function(i) {
			jQuery('<a href="#"></a>').appendTo(jQuery('.slidetabs'));
		});
	
	
	
/**
 * Slider Image Preloader
 * 
 */
	jQuery(function () {

		// grab the images
		var $slider_images = jQuery($slider_img_class+' span img');

		// image length
		var $max_slides = $slider_images.length;

		// remove them from DOM to prevent normal load
		jQuery('.rm_slider_img').remove();

		// start loading
		if($max_slides>0) {
			LoadSliderImage(0,$max_slides);
		}

	// loading function handler
	function LoadSliderImage(index,$max_slides) {

		if(index<$max_slides) {

			// add list to div
			jQuery('<span id="slider_img'+(index+1)+'"></span>').each(function() {
			   jQuery(this).appendTo(jQuery($loadingID+' .load_slider_img').eq(index));
			});

			// new image object
			var $img = new Image();
	
			// current image
			var $curr = jQuery("#slider_img"+(index+1));
	
			// load current image
			jQuery($img).load(function () {
		
				// hide it first + .hide() failed in safari
				jQuery(this).css('display','none');
		
				//add alt attr
				jQuery(this).attr({alt: ""});
	 
				// remove loading class from div and insert the image into it
				jQuery($curr).append(this);
		
				// fade it in
				jQuery(this).fadeIn(250,function() {
			
					if(index == ($max_slides-1)) {
							// remove loading div after all images loaded then start slider
							jQuery('#loading_slider').remove();
							
							if($slider_type == 'fading'){fadingStart();}
							
							if($slider_type == 'tabbed'){
								jQuery(".single_tabbed_slide").removeClass("noscript");
								jQuery("#thumbs").removeClass("noscript");
								tabbedStart();
							}
							
							
						}else{
						  // we are loading next item
						  LoadSliderImage(index+1,$max_slides);
						}
				});
		
			}).error(function () {
				// if loading error remove div
				jQuery($curr).remove();
				// try to load next item
				LoadSliderImage(index+1,$max_slides);
			}).attr('src', jQuery($slider_images[index]).attr('src')).attr('class', jQuery($slider_images[index]).attr('class'));
	   	  }
		}
	});
	
/**
 * jQuery Tools Slideshow
 * 
 */
	function fadingStart() {	
		
			jQuery(".slidetabs").tabs(".fading_slides > div.single_fading_slide", {

				// enable "cross-fading" effect
				effect: 'fade',
				fadeOutSpeed: "slow",

				// start from the beginning after the last tab
				rotate: true,
			
				onBeforeClick : function(event,index) {
									var CurrentTab = this.getCurrentPane();
										CurrentTab.next().find('.slider_content').css('display', 'none');
										CurrentTab.find('.slider_content').css('display', 'none');
								},

				onClick : function(event,index) {
									var CurrentTab = this.getCurrentPane();
										CurrentTab.find('.slider_content').css('display', 'block');
								}
			

			// use the slideshow plugin. It accepts its own configuration
			}).slideshow({clickable: false,autoplay: $disable_slider,interval: $slider_speed});
		
		jQuery('.fading_slides').css("display", "block");
	}

/**
 * jQuery Tools Tabbed Slider
 * 
 */
	function tabbedStart() {
	
			// initialize scrollable and return the programming API
			jQuery("#webtreats_tabbed_slider").scrollable({
		
				items: '#tabbed_slides',
				size: 1,
				clickable: false,
				circular: true

			// use the navigator plugin
			}).autoscroll({autoplay: $disable_slider,interval: $slider_speed}).navigator({api: true});
	}
}
	
});