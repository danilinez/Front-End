$(window).load(function(){
    
    $('.clients .featured-thumbnail a').BlackAndWhite({
        hoverEffect : true, // default true
        // set the path to BnWWorker.js for a superfast implementation
        webworkerPath : false,
        // for the images with a fluid width and height 
        responsive:true,
        // to invert the hover effect
        invertHoverEffect: false,
        speed: { //this property could also be just speed: value for both fadeIn and fadeOut
            fadeIn: 200, // 200ms for fadeIn animations
            fadeOut: 800 // 800ms for fadeOut animations
        }
    });
    
    $(".latest_projects li:nth-child(4n), .skills li:nth-child(2n), .clients li:nth-child(4n)").addClass("nomargin");

});