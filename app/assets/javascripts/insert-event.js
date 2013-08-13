$(document).ready(function () {
	$(".event-form").on("ajax:success", function (event, eventListData) {
		$(".all-events").html(eventListData);
		$(event.target).find("input, textarea").val("");
		$(event.target).find("input[type='submit']").val("Create Event");
		$(event.target).find("#event_recurring_true").val(true);
		$(event.target).find("#event_recurring_false").val(false);
		$(event.target).find("#event_recurring_true").prop('checked', true);
		$('.new-event').slideToggle();
		$('.new-event').toggleClass("hide");
	});
});