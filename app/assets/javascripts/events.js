$(document).ready(function () {
	$('.event-title').on("click", function () {
		$(this).next('.event-content').slideToggle();
	});
	
	$('.event-title').on("click", function () {
		$(this).next('.event-content').toggleClass("hide");
	});
	
	$('#new-event-button').on("click", function () {
		$(this).next('.new-event').slideToggle();
	});
	
	$('#new-event-button').on("click", function () {
		$(this).next('.new-event').toggleClass("hide");
	});
});