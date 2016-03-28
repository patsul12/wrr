$(document).on("page:change", function() {
  $("#question-form-toggle").on("click", function() {
    $("#new-question-form").toggle();
  });
});
