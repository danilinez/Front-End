jQuery(document).ready(function () {

    $('.btn-toggler').on('click', function () {
        $('.navs').toggleClass('slidein');
        toggleCheck();
    });
    
    $('#open-search').on('click', function () {
        $('.search-drop').fadeToggle();
    });
    $('.close-search').on('click', function () {
        $('.search-drop').fadeOut();
    });

    $('.blogs-slider').owlCarousel({
        margin:30,
        dots:false,
        nav:true,
        navText: ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"],
        dots:false,
        loop:true,
        responsive:{
          0:{
              items:1
          },
          799:{
              items:2
          }
        }
    });


});



$(window).scroll(function () {
    if ($(this).scrollTop() > 300) { // this refers to window
        $('.scroll-btn').addClass('visible');
        $('.header').addClass('solid');
    } else {
        $('.scroll-btn').removeClass('visible');
        $('.header').removeClass('solid');
    }
});

$(window).on('load', function () {
    if ($('body').width() <= 991) {
        $(".categories .main-ctgs").insertAfter($(".header .navs .navigation").after());
    }
});

$(window).resize(function () {
    if ($('body').width() <= 1020) {
        $(".categories .main-ctgs").insertAfter($(".header .navs .navigation").after());
    } else {
        $(".categories .container").append($(".header .navs .main-ctgs"));
    }
});

function toggleCheck() {
    if ($('.navs').hasClass('slidein')){
        $('.btn-toggler i').removeClass('fa-bars').addClass('fa-times');
        $('.btn-toggler').addClass('red');
        $('html').css('overflow-y', 'hidden')
    } else {
        $('.btn-toggler').removeClass('red');
        $('.btn-toggler i').addClass('fa-bars').removeClass('fa-times');
        $('html').css('overflow-y', 'scroll');
    }
}
// searc 
$('html').click(function(e) {
    if ((e.target.id != 'open-search' && $(e.target).parents('#open-search').length == 0) && (e.target.id != 'search-boxx' && $(e.target).parents('#search-boxx').length == 0)) {
        $('.search-drop').fadeOut();
    }
});

