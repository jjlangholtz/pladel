$(function(){
	$('#sleep').addClass('animated fadeInUp');
	$('#movement').addClass('animated fadeInLeft');
	$('#nutrition').addClass('animated fadeInRight');
	$('#overallDial').addClass('animated fadeInDown');

	$('.signUp').addClass('animated zoomIn');
	$('header h1').addClass('animated fadeInRightBig');
	$('.scoresWrapper').addClass('animated bounceInUp');

	$('.js-menu-trigger').on('click touchstart', function(e){
    $('.js-menu').toggleClass('is-visible');
    $('.js-menu-screen').toggleClass('is-visible');
    e.preventDefault();
  });

  $('.js-menu-screen').on('click touchstart', function(e){
    $('.js-menu').toggleClass('is-visible');
    $('.js-menu-screen').toggleClass('is-visible');
    e.preventDefault();
  });
});



