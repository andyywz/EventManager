var createDatestamp = function (date, time) {
	
	
	var dateTime = date + "T" + newtime;
	var timeStamp = Date.parse(dateTime);
}

$(document).ready(function () {	
	$("#event-form").find('input[type="submit"]').on(
		"click",
		function (event) {
		  event.preventDefault();
			var that = this;
		  var formData = $(this.form).serialize();
	
			var time = $(this.form).find("#occurrence_time").val();
			var date = $(this.form).find("#occurrence_time").val();
	
			if (time !== "" && date !== "") {
		    $.ajax({
		      url: "/events.json",
		      type: "POST",
		      data: formData,
		      success: function (eventData) {						
						if (eventData["reccurring"] == true) {
							console.log("passed")
							
							$('.new-event').slideToggle();
							$('.new-event').toggleClass("hide");
							
							$(".reccurring .event").each(function (index, domEl) {
								
								var date = $(that.form).find("#occurrence_date").val();
								var time = $(that.form).find("#occurrence_time").val();
								// var dateTime = date + "T" + time;
								// var timeStamp = Date.parse(dateTime);
								
								var dateStamp = createDatestamp(date, time);
								
								var domDate = $(domEl).find(".event-time").attr("data-datestamp") * 1000;
								
								if (domDate > timeStamp) {
									var realDate = new Date(timeStamp);
									var dateString = realDate.toDateString() + " " + realDate.toLocaleTimeString("en-US",{hour: "numeric", minute: "numeric" })
									
									var prependData = "<li class='event'>                         \
										<div class='event-title group'>                             \
											<h2 class='event-name'>                                   \
												" + eventData['name'] + "                               \
											</h2>                                                     \
											<time class='event-time'>                                 \
												" + dateString + "                                      \
											</time>                                                   \
										</div>                                                      \
                                                                                \
										<div class='event-content hide'>                            \
                                                                                \
											<label>Venue: "+ eventData['place'] +"</label>            \
                                                                                \
											<label>Cover: "+ eventData['cover'] +"</label>            \
                                                                                \
											<label>Age Limit: "+ eventData['age_limit'] +"</label>    \
                                                                                \
											<label>Music: "+ eventData['music'] +"</label>            \
                                                                                \
											<label>Floor: "+ eventData['floor'] +"</label>            \
                                                                                \
											<label>ETC:                                               \
												<div class='etc'>                                       \
													"+ eventData['body'] +"                               \
												</div>                                                  \
											</label>                                                  \
                                                                                \
										</div>                                                      \
									</li>";
									
									$(domEl).before(prependData);
									return false;
								};
								
								
							});
								
						} else {
							console.log("passed special");
							
							$('.new-event').slideToggle();
							$('.new-event').toggleClass("hide");
							
							$(".special .event").each(function (index, domEl) {
								var date = $(that.form).find("#occurrence_date").val();
								var time = $(that.form).find("#occurrence_time").val();
								var dateTime = date + "T" + time;
								var timeStamp = Date.parse(dateTime);
								
								var domDate = $(domEl).find(".event-time").attr("data-datestamp") * 1000;
								
								if (domDate > timeStamp) {
									var realDate = new Date(timeStamp);
									var dateString = realDate.toDateString() + " " + realDate.toLocaleTimeString("en-US",{hour: "numeric", minute: "numeric" })
									
									var prependData = "<li class='event'>                         \
										<div class='event-title group'>                             \
											<h2 class='event-name'>                                   \
												" + eventData['name'] + "                               \
											</h2>                                                     \
											<time class='event-time'>                                 \
												" + dateString + "                                      \
											</time>                                                   \
										</div>                                                      \
                                                                                \
										<div class='event-content hide'>                            \
                                                                                \
											<label>Venue: "+ eventData['place'] +"</label>            \
                                                                                \
											<label>Cover: "+ eventData['cover'] +"</label>            \
                                                                                \
											<label>Age Limit: "+ eventData['age_limit'] +"</label>    \
                                                                                \
											<label>Music: "+ eventData['music'] +"</label>            \
                                                                                \
											<label>Floor: "+ eventData['floor'] +"</label>            \
                                                                                \
											<label>ETC:                                               \
												<div class='etc'>                                       \
													"+ eventData['body'] +"                               \
												</div>                                                  \
											</label>                                                  \
                                                                                \
										</div>                                                      \
									</li>";
									
									$(domEl).before(prependData);
									
									return false;
								};
								
							});
		
						};
		      }
		    });
			} else {
				alert("You missed a field");
			};
		}
	);
		
});