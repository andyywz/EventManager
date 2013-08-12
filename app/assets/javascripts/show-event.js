$(document).ready(function () {
	$(".post").on("ajax:success", ".occurrence-show", function (event, data) {
		$("article.post-event").html(data);
	});
	
	$(".post").on("ajax:success", ".event-show", function (event, data) {
		$("article.post-event").html(data);
	});
	
	$(".profile-nav").on("click", ".attending-events-button", function () {
		if ($("article.post.created").is(":visible")) {
			$("article.post.created").slideToggle();
		};
		
		$("article.post.attending").slideToggle();
	});
	
	$(".profile-nav").on("click", ".created-events-button", function () {
		if ($("article.post.attending").is(":visible")) {
			$("article.post.attending").slideToggle();
		};
		
		$("article.post.created").slideToggle();
	});
});