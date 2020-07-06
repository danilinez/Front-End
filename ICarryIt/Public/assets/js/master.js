 $(document).ready(function(){
    $(".collapse.in").each(function(){
      $(this).siblings(".panel-heading").find(".fa").addClass("fa fa-chevron-down").removeClass("fa fa-chevron-down");
  });

  // Toggle plus minus icon on show hide of collapse element
  $(".collapse").on('show.bs.collapse', function(){
      $(this).parent().find(".fa").removeClass("fa fa-chevron-down").addClass("fa fa-chevron-up");
  }).on('hide.bs.collapse', function(){
      $(this).parent().find(".fa").removeClass("fa fa-chevron-up").addClass("fa fa-chevron-down");
  });

  $('.modal').on('hidden.bs.modal', function () {
    $('.carry_video')[0].pause();
  });
  
});
// Mobile Fade in animation
var $animation_elements = $('.phone-holder');
var $window = $(window);

function check_if_in_view() {
  var window_height = $window.height();
  var window_top_position = $window.scrollTop();
  var window_bottom_position = (window_top_position + window_height);

  $.each($animation_elements, function() {
    var $element = $(this);
    var element_height = $element.outerHeight();
    var element_top_position = $element.offset().top;
    var element_bottom_position = (element_top_position + element_height);

    //check to see if this current container is within viewport
    if ((element_bottom_position >= window_top_position) &&
        (element_top_position <= window_bottom_position)) {
      $element.addClass('bumpin');
    } else {
      $element.removeClass(null);
    }
  });
}

$window.on('scroll resize', check_if_in_view);
$window.trigger('scroll');

// Mobile Fade in animation end


(function($) {
  //Function to animate slider captions
  function doAnimations(elems) {
    //Cache the animationend event in a variable
    var animEndEv = "webkitAnimationEnd animationend";

    elems.each(function() {
      var $this = $(this),
        $animationType = $this.data("animation");
      $this.addClass($animationType).one(animEndEv, function() {
        $this.removeClass($animationType);
      });
    });
  }

  //Variables on page load
  var $myCarousel = $("#testimonials"),
    $firstAnimatingElems = $myCarousel
      .find(".carousel-item:first")
      .find("[data-animation ^= 'animated']");

  //Initialize carousel
  $myCarousel.carousel();

  //Animate captions in first slide on page load
  doAnimations($firstAnimatingElems);

  //Other slides to be animated on carousel slide event
  $myCarousel.on("slide.bs.carousel", function(e) {
    var $animatingElems = $(e.relatedTarget).find(
      "[data-animation ^= 'animated']"
    );
    doAnimations($animatingElems);
  });
})(jQuery);

$('#video_popup').on('shown.bs.modal', function () {
  $('.carry_video')[0].play();
})
$('#video_popup').on('hidden.bs.modal', function () {
  $('.carry_video')[0].pause();
})
