
var miEntryPage = {renderFunction: function() {
  var $this = $(this);

  if ($('#flash-card-container').length > 0) {
   var flashCardAttributes = new Array();
   $('#flash-card-container').addClass("loaded");
   if ($('#flash-card-container .flash-card').length === 4) {
    $('#flash-card-container .flash-card-4').addClass('flash-card-6').removeClass('flash-card-4');
   }
   $('#flash-card-container .flash-card:first-child').addClass('front-card');
   var i = 1;
   $('#flash-card-container .flash-card').each(function() {
    if ($(this).children('input.fc-text-color').attr('value')) {
     $(this).css('color', $(this).children('input.fc-text-color').attr('value'));
    }
    if ($(this).hasClass('fc-layout-4') || $(this).hasClass('fc-layout-5') || $(this).hasClass('fc-layout-6')) {
     $(this).children('.card-content').css({'margin-top': (354 - $(this).children('.card-content').height() - $(this).children('h2').height()) / 2 + 'px'});
    }
    else if ($(this).hasClass('fc-layout-7') || $(this).hasClass('fc-layout-8') || $(this).hasClass('fc-layout-9')) {
     $(this).children('.card-content').css({'margin-top': 354 - $(this).children('.card-content').height() - $(this).children('h2').height() + 'px'});
    }
    if (i === 1 || i === 2 || i === 4) {
     $(this).data('header-align', 'card-header-1');
     $(this).find('h2').addClass('card-header-1');
    } else if (i === 3 || i === 5) {
     $(this).data('header-align', 'card-header-2');
     $(this).find('h2').addClass('card-header-2');
    }
    flashCardAttributes["flash-card-" + i] = new Object();
    flashCardAttributes["flash-card-" + i].pos = {top: $(this).position().top, left: $(this).position().left};
    flashCardAttributes["flash-card-" + i].grown = {top: $(this).position().top - 10, left: $(this).position().left - 10};
    flashCardAttributes["flash-card-" + i].zIndex = $(this).css('zIndex');
    i++;
   });
   function eatMe() {
    if (!$(this).hasClass('front-card')) {
     $(this).dequeue().animate({top: flashCardAttributes[$(this).attr("id")].pos.top - 5}, 200);
    }
   }
   function drinkMe() {
    if (!$(this).hasClass('front-card')) {
     $(this).dequeue().animate(flashCardAttributes[$(this).attr("id")].pos, 200);
    }
   }
   function killLink(event) {
    event.preventDefault();
   }
   $('#flash-card-container .flash-card a').click(killLink);
   $('#flash-card-container .front-card a').unbind('click', killLink);
   function cardSwapper(event) {
    $('#flash-card-container .flash-card').unbind('mouseenter', eatMe);
    $('#flash-card-container .flash-card').unbind('mouseleave', drinkMe);
    $('#flash-card-container .flash-card').dequeue();
    if (!$(this).hasClass('front-card')) {
     var clickedCard = $(this);
     var clickedCardAtts = flashCardAttributes[clickedCard.attr('id')];
     var currentFrontCard = $(this).siblings('.front-card');
     var currentFrontCardAtts = flashCardAttributes[currentFrontCard.attr('id')];
     $.blockUI.defaults.message = null;
     $.blockUI.defaults.overlayCSS.opacity = 0;
     $.blockUI.defaults.overlayCSS.cursor = 'pointer';
     if ($(clickedCard).position().left > 310) {
      $(currentFrontCard).find('div.card-content').css("text-align", "right");
      $(currentFrontCard).find('h2').removeClass().addClass('card-header-2');
     }
     flashCardAttributes[clickedCard.attr('id')] = currentFrontCardAtts;
     flashCardAttributes[currentFrontCard.attr('id')] = clickedCardAtts;
     if ($(currentFrontCard).hasClass('search-flash-card')) {
      $(currentFrontCard).find('h3.active').each(function() {
       $(this).data('toggle-state', 'open');
      }).click();
     }
     clickedCard.css('zIndex', flashCardAttributes[clickedCard.attr('id')].zIndex).animate(flashCardAttributes[clickedCard.attr('id')].pos, 600, function() {
      if ($(clickedCard).hasClass('search-flash-card')) {
       $('.search-card .search-swappable-tabs, #search-saved').unblock();
      }
      $(clickedCard).find('h3.toggle').each(function() {
       if ($(this).data("toggle-state") === "open") {
        $(this).click();
        $(this).data("toggle-state") === "";
       }
      });
     });
     currentFrontCard.css('zIndex', flashCardAttributes[currentFrontCard.attr("id")].zIndex).animate(flashCardAttributes[currentFrontCard.attr('id')].pos, 600, function() {
      if ($(currentFrontCard).hasClass('search-flash-card')) {
       $('.search-card .search-swappable-tabs, #search-saved').block();
      }
      $('#flash-card-container .flash-card').mouseenter(eatMe);
      $('#flash-card-container .flash-card').mouseleave(drinkMe);
     });
     $(currentFrontCard).removeClass('front-card');
     $(clickedCard).addClass('front-card');
     $(clickedCard).find('div.card-content').css("text-align", "left");
     $(clickedCard).find('h2').removeClass().addClass('card-header-1');
     $('#flash-card-container .flash-card a').click(killLink);
     $('#flash-card-container .front-card a').unbind('click', killLink);
    } else {
     if ($(this).children('.fc-link').length === 1) {
      window.location = $(this).children('.fc-link').attr('href');
     }
    }
   }
   $('#homepage #layout-body').css('background', 'none');
   $('#homepage #layout-body-container').css('background', 'none');
   if (document.getElementById("homepage")) {
    $('.flash-card').animate(flashCardAttributes[$('.front-card').attr("id")].pos, 0, function() {
     $('#flash-card-container').css('display', 'none');
     $('#flash-card-container').css('left', '0');
    });
    if (jQuery.support.opacity) {
     $('#flash-card-container:hidden').fadeIn(1500, function() {
      $('.flash-card').each(function() {
       $(this).animate(flashCardAttributes[$(this).attr("id")].pos, 1700, function() {
        $('#flash-card-container .flash-card').mouseenter(eatMe);
        $('#flash-card-container .flash-card').mouseleave(drinkMe);
        $('#flash-card-container .flash-card').click(cardSwapper);
       });
      });
     });
    }
    else {
     $('#flash-card-container').css('display', 'block');
     $('.flash-card').each(function() {
      $(this).animate(flashCardAttributes[$(this).attr("id")].pos, 1700, function() {
       $('#flash-card-container .flash-card').mouseenter(eatMe);
       $('#flash-card-container .flash-card').mouseleave(drinkMe);
       $('#flash-card-container .flash-card').click(cardSwapper);
      });
     });
    }
   }
   else {
    $('#flash-card-container').css('left', '0');
    $('#flash-card-container .flash-card').mouseenter(eatMe);
    $('#flash-card-container .flash-card').mouseleave(drinkMe);
    $('#flash-card-container .flash-card').click(cardSwapper);
   }
   if (typeof(DD_belatedPNG) !== 'undefined') {
    DD_belatedPNG.fix('.flash-card.search-flash-card');
   }
  }

 }};

jQuery(document).ready(function($) {
 miEntryPage.renderFunction();
});