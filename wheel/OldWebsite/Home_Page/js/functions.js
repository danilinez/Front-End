
//$("#signin").popover({html: true, animation: 'slide', placement: 'bottom', content: function() {
//  return $('#signin_form').html();
// }});

jQuery('ul.nav li.dropdown').hover(function() {
 jQuery(this).find('.dropdown-menu').stop(true, true).delay(50).fadeIn();
}, function() {
 jQuery(this).find('.dropdown-menu').stop(true, true).delay(50).fadeOut();
});

var url = window.location;
// Will only work if string in href matches with location
$('ul.nav a[href="' + url + '"]').parent().addClass('active');

// Will also work for relative and absolute hrefs
$('ul.nav a').filter(function() {
 return this.href == url;
}).parent().addClass('active');