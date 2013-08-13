$(document).ready(function () {
	$('a.about-button').on("click", function () {
		$('.shadowbox').toggleClass("hide");
		$('.lightbox').toggleClass("hide");
    $('.about-container').toggleClass("hide");
	});
	
  if ($('.about-container').is(":visible")) {
  	$('.shadowbox').on("click", function () {
  		$('.shadowbox').toggleClass("hide");
  		$('.lightbox').toggleClass("hide");
      $('.about-container').toggleClass("hide");
  	});
  };
});