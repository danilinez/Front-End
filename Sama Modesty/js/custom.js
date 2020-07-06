$(document).ready(function() {

    var $animation_elements_a1 = $('.fadeup-a');
    var $window_a1 = $(window);

    function check_if_in_view_a1() {
        var window_height_a1 = $window_a1.height();
        var window_top_position_a1 = $window_a1.scrollTop();
        var window_bottom_position_a1 = (window_top_position_a1 + window_height_a1);

        $.each($animation_elements_a1, function() {
            var $element_a1 = $(this);
            var element_height_a1 = $element_a1.outerHeight();
            var element_top_position_a1 = $element_a1.offset().top;
            var element_bottom_position_a1 = (element_top_position_a1 + element_height_a1);

            //check to see if this current container is within viewport
            if ((element_bottom_position_a1 >= window_top_position_a1) &&
                (element_top_position_a1 <= window_bottom_position_a1)) {
                $element_a1.addClass('rise-a');
            } else {
                $element_a1.removeClass(null);
            }
        });
    }

    $window_a1.on('scroll resize', check_if_in_view_a1);
    $window_a1.trigger('scroll');

    // -----------------------------------------------------

    
    var $animation_elements_b1 = $('.fadeup-b');
    var $window_b1 = $(window);

    function check_if_in_view_b1() {
        var window_height_b1 = $window_b1.height();
        var window_top_position_b1 = $window_b1.scrollTop();
        var window_bottom_position_b1 = (window_top_position_b1 + window_height_b1);

        $.each($animation_elements_b1, function() {
            var $element_b1 = $(this);
            var element_height_b1 = $element_b1.outerHeight();
            var element_top_position_b1 = $element_b1.offset().top;
            var element_bottom_position_b1 = (element_top_position_b1 + element_height_b1);

            //check to see if this current container is within viewport
            if ((element_bottom_position_b1 >= window_top_position_b1) &&
                (element_top_position_b1 <= window_bottom_position_b1)) {
                $element_b1.addClass('rise-b');
            } else {
                $element_b1.removeClass(null);
            }
        });
    }

    $window_b1.on('scroll resize', check_if_in_view_b1);
    $window_b1.trigger('scroll');

    // -----------------------------------------------------

   
    var $animation_elements_c1 = $('.fadeup-c');
    var $window_c1 = $(window);

    function check_if_in_view_c1() {
        var window_height_c1 = $window_c1.height();
        var window_top_position_c1 = $window_c1.scrollTop();
        var window_bottom_position_c1 = (window_top_position_c1 + window_height_c1);

        $.each($animation_elements_c1, function() {
            var $element_c1 = $(this);
            var element_height_c1 = $element_c1.outerHeight();
            var element_top_position_c1 = $element_c1.offset().top;
            var element_bottom_position_c1 = (element_top_position_c1 + element_height_c1);

            //check to see if this current container is within viewport
            if ((element_bottom_position_c1 >= window_top_position_c1) &&
                (element_top_position_c1 <= window_bottom_position_c1)) {
                $element_c1.addClass('rise-c');
            } else {
                $element_c1.removeClass(null);
            }
        });
    }

    $window_c1.on('scroll resize', check_if_in_view_c1);
    $window_c1.trigger('scroll');

    // -----------------------------------------------------

   
    var $animation_elements_d1 = $('.fadeup-d');
    var $window_d1 = $(window);

    function check_if_in_view_d1() {
        var window_height_d1 = $window_d1.height();
        var window_top_position_d1 = $window_d1.scrollTop();
        var window_bottom_position_d1 = (window_top_position_d1 + window_height_d1);

        $.each($animation_elements_d1, function() {
            var $element_d1 = $(this);
            var element_height_d1 = $element_d1.outerHeight();
            var element_top_position_d1 = $element_d1.offset().top;
            var element_bottom_position_d1 = (element_top_position_d1 + element_height_d1);

            //check to see if this current container is within viewport
            if ((element_bottom_position_d1 >= window_top_position_d1) &&
                (element_top_position_d1 <= window_bottom_position_d1)) {
                $element_d1.addClass('rise-d');
            } else {
                $element_d1.removeClass(null);
            }
        });
    }

    $window_d1.on('scroll resize', check_if_in_view_d1);
    $window_d1.trigger('scroll');

    // -----------------------------------------------------



    var $animation_elements2 = $('.scaleup');
    var $window2 = $(window);

    function check_if_in_view2() {
        var window_height2 = $window2.height();
        var window_top_position2 = $window2.scrollTop();
        var window_bottom_position2 = (window_top_position2 + window_height2);

        $.each($animation_elements2, function() {
            var $element2 = $(this);
            var element_height2 = $element2.outerHeight();
            var element_top_position2 = $element2.offset().top;
            var element_bottom_position2 = (element_top_position2 + element_height2);

            //check to see if this current container is within viewport
            if ((element_bottom_position2 >= window_top_position2) &&
                (element_top_position2 <= window_bottom_position2)) {
                $element2.addClass('zoom');
            } else {
                $element2.removeClass(null);
            }
        });
    }

    $window2.on('scroll resize', check_if_in_view2);
    $window2.trigger('scroll');

    // -----------------------------------------------------

    var $animation_elements3 = $('.fadein');
    var $window3 = $(window);

    function check_if_in_view3() {
        var window_height3 = $window3.height();
        var window_top_position3 = $window3.scrollTop();
        var window_bottom_position3 = (window_top_position3 + window_height3);

        $.each($animation_elements3, function() {
            var $element3 = $(this);
            var element_height3 = $element3.outerHeight();
            var element_top_position3 = $element3.offset().top;
            var element_bottom_position3 = (element_top_position3 + element_height3);

            //check to see if this current container is within viewport
            if ((element_bottom_position3 >= window_top_position3) &&
                (element_top_position3 <= window_bottom_position3)) {
                $element3.addClass('invade');
            } else {
                $element3.removeClass(null);
            }
        });
    }

    $window3.on('scroll resize', check_if_in_view3);
    $window3.trigger('scroll');

     // -----------------------------------------------------

    var $animation_elements4 = $('.leftin');
    var $window4 = $(window);

    function check_if_in_view4() {
        var window_height4 = $window4.height();
        var window_top_position4 = $window4.scrollTop();
        var window_bottom_position4 = (window_top_position4 + window_height4);

        $.each($animation_elements4, function() {
            var $element4 = $(this);
            var element_height4 = $element4.outerHeight();
            var element_top_position4 = $element4.offset().top;
            var element_bottom_position4 = (element_top_position4 + element_height4);

            //check to see if this current container is within viewport
            if ((element_bottom_position4 >= window_top_position4) &&
                (element_top_position4 <= window_bottom_position4)) {
                $element4.addClass('fadeleft');
            } else {
                $element4.removeClass(null);
            }
        });
    }

    $window4.on('scroll resize', check_if_in_view4);
    $window4.trigger('scroll');
});
