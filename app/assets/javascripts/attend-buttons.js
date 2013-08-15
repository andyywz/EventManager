var attendButtons = (function () {
  $('#upcoming-events-table').on("ajax:success", ".button_to", function (event) {
    $(event.target).find("input[type='submit'].attending").toggleClass("hide");
    $(event.target).siblings().find("input[type='submit'].attending").toggleClass("hide");
  }); 
  
  $('.all-events').on("ajax:success", ".attend-buttons .button_to", function (event) {
    $(event.target).find("input[type='submit'].attending").toggleClass("hide");
    $(event.target).siblings().find("input[type='submit'].attending").toggleClass("hide");
  }); 
});