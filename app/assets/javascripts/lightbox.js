$(document).ready(function () {
	$('a.about-button').on("click", function () {
		$('.shadowbox').toggleClass("hide");
		$('.lightbox').toggleClass("hide");
	});
	
	$('.shadowbox').on("click", function () {
		$('.shadowbox').toggleClass("hide");
		$('.lightbox').toggleClass("hide");
	});
});