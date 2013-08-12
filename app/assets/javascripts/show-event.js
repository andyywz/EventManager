$(document).ready(function () {
	$(".occurrence-show").on("ajax:success", function (event, data) {
		$("article.post").html(data);
	});
});