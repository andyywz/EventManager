$(document).ready(function () {
	$("#event-show").on("ajax:success", function (event, json) {
		$(".all-events").html(eventListData);
		$('#event-form').find("input, textarea").val("");
		$('#event-form').find("input[type='submit']").val("Create Event");
		$('#event-form').find("#event_recurring_true").val(true);
		$('#event-form').find("#event_recurring_false").val(false);
		$('#event-form').find("#event_recurring_true").prop('checked', true);
		$('.new-event').slideToggle();
		$('.new-event').toggleClass("hide");
	});
});