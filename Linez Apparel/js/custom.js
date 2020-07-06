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

    $('.faqs .collapse.show').parent().find('.card-header').addClass('blacked');
    $('#accordion').on('shown.bs.collapse', function () {
      $('.faqs .collapse.show').parent().find('.card-header').addClass('blacked');
    });
    $('#accordion').on('hidden.bs.collapse', function () {
      $('.faqs .card-header').removeClass('blacked');
    });
    
    


  $('.banner-slider').owlCarousel({
    margin:0,
    dots:false,
    nav:true,
    navText: ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"],
    dots:false,
    loop:true,
    responsive:{
      0:{
          items:1
      }
    }
  });

  $('.products-slider').owlCarousel({
    margin:30,
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

   // Mobile Menu Query Start

   $('.navbar-toggler').on('click', function(){
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

  // on window load check favs
  
  $(".favorite").each(function() {
    if ($(this).is(":checked")) {
      $(this).parent().find(".fa-heart")
      .removeClass("far")
      .addClass("fas");
    } else {
      $(this).parent().find(".fa-heart")
      .removeClass("fas")
      .addClass("far");
    }
  });
  // on Click Change conditions of check favs

  $(".favorite").each(function() {
    $(this).on('click', function(){
      if ($(this).is(":checked")) {
        $(this).parent().find(".fa-heart")
          .removeClass("far")
          .addClass("fas");
      } else {
        $(this).parent().find(".fa-heart")
          .removeClass("fas")
          .addClass("far");
      }
    });
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

  $('.zoomy').zoom({
    magnify : '.6'
  });

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



$('.show-adr-fields').on('click', function(){
  $('.adr-fields').toggleClass('adr-display');
});


 


$(document.body).click( function(e) {
  closeMenu();
});

    
    
$(".cart-icon").click( function(e) {
  e.stopPropagation(); 
  $('.searchdrop').removeClass('showup');
});
    
    
$('.cart-icon').on('click', function(){
  event.preventDefault();
  $('.cart-menu').toggleClass('showup');
  $('.cart-menu').show();
  
});

function closeMenu(){
  $('.cart-menu').removeClass('showup');
}



// Initilizing Formats for Date Time Picker
// $.fn.datepicker.language['en'] = {
//   days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
//   daysShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
//   daysMin: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
//   months: ['January','February','March','April','May','June', 'July','August','September','October','November','December'],
//   monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
//   today: 'Today',
//   clear: 'Clear',
//   dateFormat: 'dd MM, yyyy',
//   timeFormat: 'hh:ii aa',
//   firstDay: 0
//   };
  
  $('#dob-picker').datepicker({
    language:'en',
    dateFormat: 'dd MM, yyyy',
    timeFormat: '- hh:ii aa',
    timepicker: false,
    maxDate: new Date()
  });



