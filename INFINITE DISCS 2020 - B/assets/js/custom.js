$(window).on('load', function () {
    var placetaker = "<div class='h-placeholder'></div>"
    var hheight = $('.header').outerHeight();
    $('.header').before(placetaker);
    $('.h-placeholder').css('height', hheight);
});
jQuery(document).ready(function () {

    $('.btn-toggler').on('click', function () {
        $('.mobile-menu').toggleClass('slidein');
        toggleCheck();
    });

    $('#open-search').on('click', function () {
        $('.search-drop').fadeToggle();
    });
    $('.close-search').on('click', function () {
        $('.search-drop').fadeOut();
    });

    $('.blogs-slider').owlCarousel({
        margin: 30,
        dots: false,
        nav: true,
        navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
        dots: false,
        loop: true,
        responsive: {
            0: {
                items: 1
            },
            799: {
                items: 2
            }
        }
    });

    $('.prod-slider').owlCarousel({
        // stagePadding: 50,
        loop: false,
        margin: 10,
        nav: true,
        navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
        dots: false,
        responsive: {
            0: {
                items: 2,
                margin: 0
            },
            900: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    })

    // rating_ = $("#rates").attr('data-value');

    // $("#rates").rateYo({
    //     rating: rating_,
    //     starWidth: "24px",
    //     normalFill: "#bcbcbc",
    //     ratedFill: "#ffb100",
    //     spacing   : "2px",
    //     // readOnly: true,
    //     starSvg:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
    // });

    defaultRate('rates', '4', 'true');
    defaultRate('rate1', '4', 'true');




});

// to initilize it use >>> defaultRate('id','rating value', bolean readonly: true | false ); 
function defaultRate(divId, value, readOnly = false) {
    $("#" + divId).rateYo({
        rating: value,
        starWidth: "18px",
        normalFill: "#bcbcbc",
        ratedFill: "#ffb100",
        spacing: "2px",
        readOnly: readOnly,
        starSvg: '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
    });
}



$(window).scroll(function () {
    if ($(this).scrollTop() > 300) { // this refers to window
        $('.scroll-btn').addClass('visible');
        // $('.header').addClass('solid');
    } else {
        $('.scroll-btn').removeClass('visible');
        // $('.header').removeClass('solid');
    }
});



function toggleCheck() {
    if ($('.mobile-menu').hasClass('slidein')) {
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
$('html').click(function (e) {
    if ((e.target.id != 'open-search' && $(e.target).parents('#open-search').length == 0) && (e.target.id != 'search-boxx' && $(e.target).parents('#search-boxx').length == 0)) {
        $('.search-drop').fadeOut();
    }
});




// window.onload = function () {

//     var options = {
//         animationEnabled: true,
//         title: {
//             text: "Monthly Sales - 2017"
//         },
//         axisX: {
//             valueFormatString: "MMM",
//             title: "FLIGHT PATH POWERED BY INBOUNDS",

//         },
//         axisY: {
//             title: "Sales (in USD)",
//             prefix: "Deg",
//             includeZero: false
//         },
//         data: [{
//             yValueFormatString: "$#,###",
//             xValueFormatString: "MMMM",
//             type: "spline",
//             dataPoints: [
//                 { x: 150, y: 0 },
//             ]
//         }]
//     };
//     $("#chartContainer").CanvasJSChart(options);

// }


window.onload = function () {
    if ($("#chartContainer").length) {
        var options1 = {
            animationEnabled: true,
            title: {
                text: "FLIGHT PATH POWERED BY INBOUNDS",
                fontSize: 14,
                fontFamily: "textbold",
                margin: 10

            },
            axisX: {
                labelFontSize: 14,
                minimum: -150,
                maximum: 100
            },
            axisY: {
                labelFontSize: 14,
                minimum: 0,
                maximum: 400
            },
            data: [{
                type: "spline", markerColor: "red",
                lineColor: "red",
                dataPoints: [
                    { x: 0, y: 0 },
                    { x: 0, y: 50 },
                    { x: 0, y: 100 },
                    { x: -10, y: 150 },
                    { x: -15, y: 200 },
                    { x: -20, y: 250 },
                    { x: -25, y: 300 },
                    { x: 0, y: 350 },
                    { x: 35, y: 380 }
                ]
            }]
        }
        $("#chartContainer").CanvasJSChart(options1);
    }

    if ($("#barChart").length) {

        var chart = new CanvasJS.Chart("barChart", {
            animationEnabled: true,

            axisX: {
                interval: 1
            },
            data: [{
                type: "bar",
                name: "companies",
                axisYType: "secondary",

                dataPoints: [
                    { y: 6, label: "Grip", color: "#009688" },
                    { y: 5, label: "Softness", color: "#03a9f4" },
                    { y: 7, label: "Durability", color: "#673ab7" }
                ]
            }]
        });
        chart.render();
    }


    if ($("#flowChart").length) {

        var chart = new CanvasJS.Chart("flowChart", {
            animationEnabled: true,
            theme: "light2", // "light1", "light2", "dark1", "dark2"
            title: {
                text: "Top Oil Reserves"
            },
            axisY: {
                title: "Reserves(MMbbl)"
            },
            data: [{
                type: "column",
                showInLegend: true,
                legendMarkerColor: "grey",
                legendText: "MMbbl = one million barrels",
                dataPoints: [
                    { y: 300878, label: "Venezuela" },
                    { y: 266455, label: "Saudi" },
                    { y: 169709, label: "Canada" },
                    { y: 158400, label: "Iran" },
                    { y: 142503, label: "Iraq" },
                    { y: 101500, label: "Kuwait" },
                    { y: 97800, label: "UAE" },
                    { y: 80000, label: "Russia" }
                ]
            }]
        });
        chart.render();
    }

};