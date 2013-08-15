var eventsEdit = function () {
	$(".occurrences-edit").on("ajax:success", ".occurrence-edit-form", function (event, data) {
    $(".occurrences-edit").find(".status-container").html(data);
	});
  
  $(".occurrences-edit").on("ajax:success", ".occurrences-list .button_to", function (event, data) {
    $(event.target).parent().fadeOut();
    $(".occurrences-edit").find("status-container").html(data);
  });
};