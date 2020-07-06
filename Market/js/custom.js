jQuery(document).ready(function() {
  // var navOffset=jQuery(".header").offset().top;
  // jQuery(".header").wrap('<div class="placetaker" ></div>');
  // jQuery("div.placetaker").height(jQuery(".header").outerHeight());
  // $(function () {
  //   $(document).scroll(function () {
  //     var $nav = $(".header");
  //     $nav.toggleClass('scrolled', $(this).scrollTop() > 200 );
  //   });
  // });
  // $('.nav-toggler').on('click', function(){
  //   $('.navs').slideToggle();
  // });

    // products Slider
  $('.products-slider').owlCarousel({
    margin:0,
    dots:true,
    nav:true,
    navText: ["<i class='far fa-chevron-left'></i>","<i class='far fa-chevron-right'></i>"],
    dots:false,
    responsive:{
      0:{
          items:1
      },
      460:{
          items:2
      },
      560:{
          items:2
      },
      760:{
          items:3
      },
      1000:{
          items:4
      },
      1200:{
          items:5
      }
    }
  });
  $(".favorite").click(function() {
    if ($(this).is(":checked")) {
      $(".fa-heart")
        .removeClass("far")
        .addClass("fas");
    } else {
      $(".fa-heart")
        .removeClass("fas")
        .addClass("far");
    }
  });

  $('.filter-box ul li i').on('click', function(){
    $(this).toggleClass('flip');
  });


  // Price Range Slider Start
  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 1000,
      values: [ 175, 800 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  } );
  // Price Range Slider End

  // Mobile Menu Query Start

  $('.nav-toggler').on('click', function(){
    $('.overlay').addClass('show');
    $('.mobile-menu').addClass('open'); 
  });
  $('.overlay').on('click', function(){
    $('.overlay').removeClass('show');
    $('.mobile-menu').removeClass('open'); 
  });
  $('.mobile-menu ul li i').on('click', function(){
    $(this).toggleClass('flip');
  });
  // Mobile Menu Query End

  $('.zoomy').zoom();

  $('.product-view').carousel({
     interval: false
  });
  
  var $star_rating = $('.star-rating .fas');
  var SetRatingStar = function() {
    return $star_rating.each(function() {
      if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
        return $(this).removeClass('far').addClass('fas');
      } else {
        return $(this).removeClass('fas').addClass('far');
      }
    });
  };

  $star_rating.on('click', function() {
    $star_rating.siblings('input.rating-value').val($(this).data('rating'));
    return SetRatingStar();
  });

  SetRatingStar();
  $(document).ready(function() {

  });



});

var topbtn = $('.scroll-btn');

$(window).scroll(function() {
  if ($(window).scrollTop() > 300) {
    topbtn.addClass('show');
  } else {
    topbtn.removeClass('show');
  }
});

topbtn.on('click', function(e) {
  e.preventDefault();
  $('html, body').animate({scrollTop:0}, '300');
});