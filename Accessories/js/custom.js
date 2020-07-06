jQuery(document).ready(function() {

    $('.search-a').on('click', function(){
        $('.s-bar').addClass('showit');
    });
    $('.sclose').on('click', function(){
        $('.s-bar').removeClass('showit');
    });


    $('.c-slider').owlCarousel({
        margin:10,
        dots:false,    
        loop:true,
        nav:true,
        navText: ["<i class='far fa-chevron-left'></i>","<i class='far fa-chevron-right'></i>"],
        dots:false,
        responsive:{
            0:{
                items:1
            },
            430:{
                items:2
            },
            800:{
                items:3
            },
            1200:{
                items:4
            },
            1600:{
                items:5
            }
        }
    });
    
});



$('.zoomy').zoom();

    // -----------------------------------------------------
      
    var $animation_elements_b18 = $('.ifade');
    var $window_b18 = $(window);
    
    function check_if_in_view_b18() {
        var window_height_b18 = $window_b18.height();
        var window_top_position_b18 = $window_b18.scrollTop();
        var window_bottom_position_b18 = (window_top_position_b18 + window_height_b18);
    
        $.each($animation_elements_b18, function() {
            var $element_b18 = $(this);
            var element_height_b18 = $element_b18.outerHeight();
            var element_top_position_b18 = $element_b18.offset().top;
            var element_bottom_position_b18 = (element_top_position_b18 + element_height_b18);
    
            //check to see if this current container is within viewport
            if ((element_bottom_position_b18 >= window_top_position_b18) &&
                (element_top_position_b18 <= window_bottom_position_b18)) {
                $element_b18.addClass('irise');
            } else {
                $element_b18.removeClass('irise');
            }
        });
    }
    
    $window_b18.on('scroll resize', check_if_in_view_b18);
    $window_b18.trigger('scroll');
    
    // -----------------------------------------------------
      

  
