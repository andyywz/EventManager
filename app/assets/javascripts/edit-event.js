$(document).ready(function () {
	$(".occurrence-edit-form").on("ajax:success", function (event, occurrenceStatusInfo) {
    $(".status-container").html(occurrenceStatusInfo);
	});
});