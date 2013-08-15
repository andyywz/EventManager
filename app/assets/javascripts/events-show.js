var eventsShow = function () {
	$(".content-main").on("ajax:success", ".occurrence-show", function (event, data) {
		$("article.post-event").html(data);
	});

	$(".content-main").on("ajax:success", ".event-show", function (event, data) {
		$("article.post-event").html(data);
	});

	$(".profile-nav").on("click", ".attending-events-button", function () {
    hideCreated();

		$("article.post.attending").slideToggle();
	});

	$(".profile-nav").on("click", ".created-events-button", function () {
    hideAttending();

		$("article.post.created").slideToggle();
	});

  $("#upcoming-events-table").on("ajax:success", ".button_to", function (event) {
    console.log(event.target)
    $(event.target).find("input[type='submit'].attending").toggleClass("hide");
    $(event.target).siblings().find("input[type='submit'].attending").toggleClass("hide");
  });
};

var hideCreated = function () {
  if ($("article.post.created").is(":visible")) {
    $("article.post.created").slideToggle();
  };
};

var hideAttending = function () {
  if ($("article.post.attending").is(":visible")) {
    $("article.post.attending").slideToggle();
  };
};