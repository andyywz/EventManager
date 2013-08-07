$(document).ready(function () {
	$('.event-name').on("click", function () {
		$(this).next('.event-content').slideToggle();
	});
	
	$('.event-name').on("click", function () {
		$(this).next('.event-content').toggleClass("hide");
	});
});