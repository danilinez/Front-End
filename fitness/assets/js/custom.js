jQuery(document).ready(function () {

    $('.navbar-toggler').on('click', function(){
        if($(this).hasClass('close-menu'))
        {
            $('.mobile-menu').removeClass('slide-in');
            $('.navbar-toggler i').addClass('fa-bars');
            $('.navbar-toggler i').removeClass('fa-times');
            $('.overlay').hide();
            $(this).removeClass('close-menu');
        } else {
            $('.mobile-menu').addClass('slide-in');
            $('.navbar-toggler i').removeClass('fa-bars');
            $('.navbar-toggler i').addClass('fa-times');
            $('.overlay').show();
            $(this).addClass('close-menu');
        }
    });
    $('.overlay').on('click', function(){
        $(this).hide();
        $('.mobile-menu').removeClass('slide-in');
        $('.navbar-toggler i').removeClass('fa-times');
        $('.navbar-toggler i').addClass('fa-bars');
    });
    $('.sa-icons .search a').on('click', function(){
        $('.sa-icons .search-field').fadeIn(100);
    });
    $('.search-toggler').on('click', function(){
        $('.search-toggler ~ .search-field').fadeIn(100);
    });
    $('#load-more-blogs').on('click', function(){
        $('.more-blogs').fadeIn();
        $(this).hide();
    });
});
$(document).mouseup(function(e) 
{
    var container = $('.sa-icons .search-field');
    var container_item = $('.sa-icons .search');
    var mob_search = $('.navbar .search-field');
    if (!container.is(e.target) && container.has(e.target).length === 0) 
    {
        container.hide();
    }
    if (!container_item.is(e.target) && container_item.has(e.target).length === 0) 
    {
        container.hide();
    }
    if (!mob_search.is(e.target) && mob_search.has(e.target).length === 0) 
    {
        mob_search.hide();
    }
});

jQuery(document).ready(function () {
    var navOffset = jQuery(".navbar").offset().top;
    jQuery(".navbar").wrap('<div class="placeholder" ></div>');
    jQuery("div.placeholder").height(jQuery(".navbar").outerHeight());
    
    jQuery(window).scroll(function () {
        var scrollPos = jQuery(window).scrollTop();
        if (scrollPos >= navOffset) {
            jQuery(".navbar").addClass("fixit");
        } else {
            jQuery(".navbar").removeClass("fixit");
        }
    });
});
