/*!
 * Galleria Classic Theme
 * http://galleria.aino.se
 *
 * Copyright (c) 2010, Aino
 * Licensed under the MIT license.
 */

(function($) {

Galleria.themes.create({
    name: 'classic',
    author: 'Galleria',
    version: '1.2',
    css: 'galleria.classic.css',
    defaults: {
        transition: 'slide',
        show_caption: false
    },
    init: function(options) {
        this.jQuery('loader').show().fadeTo(200, .4);
        this.jQuery('counter').show().fadeTo(200, .4);
        
        this.jQuery('thumbnails').children().hover(function() {
            jQuery(this).not('.active').fadeTo(200, 1);
        }, function() {
            jQuery(this).not('.active').fadeTo(400, .4);
        }).not('.active').css('opacity',.4);
        
        this.jQuery('container').hover(this.proxy(function() {
            this.jQuery('image-nav-left,image-nav-right,counter').fadeIn(200);
        }), this.proxy(function() {
            this.jQuery('image-nav-left,image-nav-right,counter').fadeOut(500);
        }));
        
        this.jQuery('image-nav-left,image-nav-right,counter').hide();
        
        var elms = this.jQuery('info-link,info-close,info-text').click(function() {
            elms.toggle();
        });
        
        if (options.show_caption) {
            elms.trigger('click');
        }
        
        this.bind(Galleria.LOADSTART, function(e) {
            if (!e.cached) {
                this.jQuery('loader').show().fadeTo(200, .4);
            }
            if (this.hasInfo()) {
                this.jQuery('info').show();
            } else {
                this.jQuery('info').hide();
            }
            jQuery(e.thumbTarget).parent().addClass('active').css('opacity',1)
                .siblings('.active').removeClass('active').fadeTo(400,.4);
        });

        this.bind(Galleria.LOADFINISH, function(e) {
            this.jQuery('loader').fadeOut(200);
            jQuery(e.thumbTarget).css('opacity',1)


			var imgWidth = jQuery(e.imageTarget).parent().width() -18;
			var imgHeight = jQuery(e.imageTarget).parent().height() -42;

				jQuery(e.imageTarget).attr( 'width', imgWidth );
				jQuery(e.imageTarget).attr( 'height', imgHeight );
				jQuery(e.imageTarget).addClass('framed galleria-image-inline');
				jQuery(e.imageTarget).parent().css( 'height', imgHeight +18);

        });
    }
});

})(jQuery);