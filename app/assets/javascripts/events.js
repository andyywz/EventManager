$(document).ready(function () {
	$('.event-name').on("click", function () {
		$(this).next('.event-content').slideToggle();
	});
	
	$('.event-name').on("click", function () {
		$(this).next('.event-content').toggleClass("hide");
	});
	
	$('#new-event-button').on("click", function () {
		$(this).next('.new-event').slideToggle();
	});
	
	$('#new-event-button').on("click", function () {
		$(this).next('.new-event').toggleClass("hide");
	});
});