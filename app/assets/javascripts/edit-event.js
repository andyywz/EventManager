var editEvent = function () {
	$(".occurrence-edit-form").on("ajax:success", function (event, data) {
    $(".status-container").html(data);
	});
  
  $(".occurrences-edit > .occurrences-list").on("ajax:success", ".button_to", function (event, data) {
    $(event.target).parent().fadeOut();
    $(".status-container").html(data);
  });
};