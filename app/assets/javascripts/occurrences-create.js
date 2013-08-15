var occurrencesCreate = function () {
  $(".occurrences-new").on("ajax:success", ".button_to", function (event, form) {
    $(".form-container").html(form);
  });
  
  $(".occurrences-new").on("ajax:success", ".occurrence-new-form", function (event, data) {
    $(".occurrences-edit").html(data);
    $(".occurrences-new").find(".occurrence-new-form").fadeToggle();
  });
};