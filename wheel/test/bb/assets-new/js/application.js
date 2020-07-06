$(document).ready(function () {

//auto add active class to links
  var url = location.pathname.substring(location.pathname.lastIndexOf('/') + 1);
// Will only work if string in href matches with location
  $('ul a[href="' + url + '"]').parent().addClass('active');

// Will also work for relative and absolute hrefs
  $('ul a').filter(function () {
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
//equal heights
    $('.banner-caption p').equalHeights();
    $('.highlight-bar .well').equalHeights();
//    $('.highlight-bar .well h3').equalHeights();

    $('.highlight-bar').each(function () {
      $(this).find('.well h3').equalHeights();
      $(this).find('p').equalHeights();
    })

    var body = $('body').html();
//sticky header for adminpanel
    if (body.indexOf('header-sticky') > -1) {
      if ($("#start-sticky-header").length != 0) {
        var stickyNavTop = $('#start-sticky-header').offset().top;
        var stickyNav = function () {
          var scrollTop = $(window).scrollTop(); // our current vertical position from the top
          if (scrollTop > stickyNavTop) {
            $('.header-sticky').addClass('sticky');
//          $('.header-sticky').removeClass('hidden');
          } else {
            $('.header-sticky').removeClass('sticky');
//          $('.header-sticky').addClass('hidden');
          }
        };
        stickyNav();
        $(window).scroll(function () {
          stickyNav();
        });
      }
    }
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
    slide: function (event, ui) {

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
  $(function () {
    $(window).scroll(function () {
      if ($(this).scrollTop() > 100) {
        $('.scrollup').fadeIn();
      } else {
        $('.scrollup').fadeOut();
      }
    });
    $('.scrollup').click(function () {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
    $("a:contains('(back to top)')").click(function () {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
  });

});
