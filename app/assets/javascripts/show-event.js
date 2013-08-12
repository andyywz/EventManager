$(document).ready(function () {
	$("#event-show").on("ajax:success", function (event, json) {
		$("article.post").html(eventListData);
		$('.new-event').slideToggle();
		$('.new-event').toggleClass("hide");
	});
});