jQuery(document).ready(function() {

  $('.menu-btn').on('click', function(){
    $('.header-links').slideToggle(100);
  });

  // Slider
  $('.ig-slider').owlCarousel({
    margin:0,
    dots:true,
    nav:true,
    navText: ["<i class='fas fa-caret-left'></i>","<i class='fas fa-caret-right'></i>"],
    dots:false,
    responsive:{
      0:{
          items:1
      }
    }
  });
  
  // Slider
  $('.tm-slider').owlCarousel({
    margin:0,
    dots:true,
    nav:true,
    navText: ["<i class='fas fa-caret-left'></i>","<i class='fas fa-caret-right'></i>"],
    dots:false,
    responsive:{
      0:{
          items:1
      },
      1000:{
          items:2
      }
    }
  });
  // Slider
  $('.news-slider').owlCarousel({
    margin:0,
    dots:true,
    nav:true,
    navText: ["<i class='fas fa-caret-left'></i>","<i class='fas fa-caret-right'></i>"],
    dots:false,
    responsive:{
      0:{
          items:1
      }
    }
  });
  
  $('.zoomy').zoom();

// Date Time Picker

  $('#pick-date').bootstrapMaterialDatePicker({ format : 'MMMM Do YYYY, h:mm a', shortTime : true, minDate : new Date() });

// Date Time Picker End


  $('[data-toggle="tooltip"]').tooltip(); 


});