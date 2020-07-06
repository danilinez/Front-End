jQuery(document).ready(function() {

    $('.navbar-toggler').on('click', function(){
        $('.title-navs').toggleClass('showit');
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

    // $('.cr-slider').owlCarousel({
    //     margin:10,
    //     dots:false,    
    //     loop:true,
    //     nav:true,
    //     navText: ["<i class='far fa-chevron-left'></i>","<i class='far fa-chevron-right'></i>"],
    //     dots:false,
    //     responsive:{
    //         0:{
    //             items:1
    //         },
    //         430:{
    //             items:2
    //         },
    //         800:{
    //             items:3
    //         },
    //         1200:{
    //             items:4
    //         },
    //         1600:{
    //             items:5
    //         }
    //     }
    // });
    
});