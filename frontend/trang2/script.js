function showCreateForm() {
  var $createForm = $("#create-form");
  var $searchTrip = $("#searchTrip");

  $createForm.css({
    opacity: "1",
    "pointer-events": "all",
  });

  $searchTrip.css({
    opacity: "0.2",
    "pointer-events": "none",
  });
}

function turnOffCreateForm() {
  var $createForm = $("#create-form");
  var $searchTrip = $("#searchTrip");

  $createForm.css({
    opacity: "0",
    "pointer-events": "none",
  });

  $searchTrip.css({
    opacity: "1",
    "pointer-events": "all",
  });
}

function showModifyForm() {
  var $modfiyForm = $("#modify-form");
  var $searchTrip = $("#searchTrip");

  $modfiyForm.css({
    opacity: "1",
    "pointer-events": "all",
  });

  $searchTrip.css({
    opacity: "0.2",
    "pointer-events": "none",
  });
}

function turnOffModifyForm() {
  var $modfiyForm = $("#modify-form");
  var $searchTrip = $("#searchTrip");

  $modfiyForm.css({
    opacity: "0",
    "pointer-events": "none",
  });

  $searchTrip.css({
    opacity: "1",
    "pointer-events": "all",
  });
}

function customer() {
  $(".admin").css({
    display: "none",
  });
}

function admin() {
  $(".admin").show();
}

$(document).ready(function() {
  turnOffCreateForm();
  turnOffModifyForm();
});



