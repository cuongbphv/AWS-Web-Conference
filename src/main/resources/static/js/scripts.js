jQuery(function ($) {

    'use strict'; // js version 1.8.5 up

    // --------------------------------------------------------------------
    // PreLoader
    // --------------------------------------------------------------------

    (function () {
        $('#preloader').delay(200).fadeOut('slow');
    }());

    // --------------------------------------------------------------------
    // One Page Navigation
    // --------------------------------------------------------------------
    
    (function () {
    	var pathname = location.pathname;
    	var search = location.search;
    	
    	var query = pathname + search;
       	if(query == "default?id=1")
    		$('nav.navbar').removeClass('sticky-nav');
       	else
       		$('nav.navbar').addClass('sticky-nav');
    }());
    
    	
//
//    (function () {
//        $(window).scroll(function () {
//            if ($(this).scrollTop() >= 50) {
//                $('nav.navbar').addClass('sticky-nav');
//            }
//            else {
//                $('nav.navbar').removeClass('sticky-nav');
//            }
//        });
//    }());

    // --------------------------------------------------------------------
    // jQuery for page scrolling feature - requires jQuery Easing plugin
    // --------------------------------------------------------------------

    (function () {
        $('a.page-scroll').on('click', function (e) {
            e.preventDefault();
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
        });
    }());

    // --------------------------------------------------------------------
    // Closes the Responsive Menu on Menu Item Click
    // --------------------------------------------------------------------

    (function () {
        $('.navbar-collapse ul li a').on('click', function () {
            if ($(this).attr('class') != 'dropdown-toggle active' && $(this).attr('class') != 'dropdown-toggle') {
                $('.navbar-toggle:visible').trigger('click');
            }
        });
    }());

    // --------------------------------------------------------------------
    // jQuery for hover change image source
    // --------------------------------------------------------------------
    $(".edit-more").hover(
        function () {
            $(this).attr('src', '\img/icon/arrow-right-hover.png');
        }, function () {
            $(this).attr('src', '\img/icon/arrow-right.png');
        }
    );

}); // JQuery end