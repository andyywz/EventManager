$(document).ready(function () {
	$('.all-events').on("click", '.event-title', function () {
		$(this).next('.event-content').slideToggle();
		$(this).next('.event-content').toggleClass("hide");
	});
	
	$('#new-event-button').on("click", function () {
		$(this).next('.new-event').slideToggle();
		$(this).next('.new-event').toggleClass("hide");
	});
});