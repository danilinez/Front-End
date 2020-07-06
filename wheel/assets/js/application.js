$(document).ready(function() {

//auto add active class to links
  var url = location.pathname.substring(location.pathname.lastIndexOf('/') + 1);
// Will only work if string in href matches with location
  $('ul a[href="' + url + '"]').parent().addClass('active');

// Will also work for relative and absolute hrefs
  $('ul a').filter(function() {
    return this.href == url;
  }).parent().addClass('active');

  // home page slider
  $("#main-slider").responsiveSlides({
    auto: true,
    speed: 700,
  });

  var mq = window.matchMedia("(min-width: 768px)");
  if (mq.matches) {
    //auto dropdown
    $('.dropdown-toggle').dropdownHover().dropdown();
  }


//bootstrap carousel
  $('.carousel-inner .item:first-child').addClass('active');
  $('.carousel').carousel({interval: 5000});


//jqueryui captcha
  $("#btnSendContact").attr('disabled', 'disabled');
  var slider = $("#slider").slider({
    min: 1,
    max: 2,
    range: "min",
    value: 1,
    slide: function(event, ui) {

      if (ui.value == 2) {
        $("#slideText").text("Unlocked");
        $("#btnSendContact").removeAttr('disabled');
      } else {
        $("#slideText").text("Locked");
        $("#btnSendContact").attr('disabled', 'disabled');
      }
    }
  });


//  back to top
  $(".scrollup").hide();
  $("a:contains('(back to top)')").attr('href', '#none');
  $(function() {
    $(window).scroll(function() {
      if ($(this).scrollTop() > 100) {
        $('.scrollup').fadeIn();
      } else {
        $('.scrollup').fadeOut();
      }
    });
    $('.scrollup').click(function() {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
    $("a:contains('(back to top)')").click(function() {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
  });

});
