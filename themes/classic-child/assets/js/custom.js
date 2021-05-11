/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */


$(document).ready(function(){

//page produit p description
$('.product-description').children().css( "background-color", "#fcf2ef" );

//Open / close fullscreen Menu
 $("#menu-icon, .menu-open").on("click",function(){
 	$("#fullscreenMenu").fadeIn();
 });
  $("#closeMenu").on("click",function(){
 	$("#fullscreenMenu").fadeOut();
 });



// Animation event::Hover a
  $(".a_underline").each(function() {
      $(this).on("mouseover", function(e){
      	$(this).find(".underline").stop(true, false).animate({width : "100%"}, 500);
  	});
      $(this).on("mouseleave", function(e){
      	$(this).find(".underline").stop(true, false).animate({width : "0%"}, 500);
  	});

});

// Réglage + instanciation du Js scroll::catégories

if ( $('#index').length ) {
	new Splide( '.splide', {
		perPage: 4,
		breakpoints: {
			'1000': {
				perPage: 3,
				gap    : '1rem',
			},
			'768': {
				perPage: 2,
				gap    : '1rem',
			},
			'480': {
				perPage: 1,
				gap    : '1rem',
			},
		}
	} ).mount();
}


});

