$(document).ready(function () {
	$(".content-main").on("ajax:success", ".occurrence-show", function (event, data) {
		$("article.post-event").html(data);
		
		if ($("article.post.created").is(":visible")) {
			$("article.post.created").slideToggle();
		};
		
		if ($("article.post.attending").is(":visible")) {
			$("article.post.attending").slideToggle();
		};
	});
	
	$(".content-main").on("ajax:success", ".event-show", function (event, data) {
		$("article.post-event").html(data);
		
		if ($("article.post.created").is(":visible")) {
			$("article.post.created").slideToggle();
		};
		
		if ($("article.post.attending").is(":visible")) {
			$("article.post.attending").slideToggle();
		};
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