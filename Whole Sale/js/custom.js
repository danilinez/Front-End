jQuery(document).ready(function() {

    $(".dropdown-toggle").dropdown();

    $('.menu-toggler').on('click', function(){
        $('.menu ul').toggleClass('showit');
    });


    $('.op-slider').owlCarousel({
        margin:10,
        dots:true,    
        loop:false,
        nav:false,
        responsive:{
            0:{
                items:2
            },
            800:{
                items:3
            },
            1200:{
                items:4
            }
        }
    });

    $(".group1").colorbox({rel:'group1', retinaImage:true, retinaUrl:true});
    
});
