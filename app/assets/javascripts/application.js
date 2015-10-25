// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function(){
  $('.datepicker').datepicker({
      format: 'mm/dd/yyyy'
  })
  $("#customer_user_attributes_password_confirmation").keyup(checkPasswordMatchCustomer);
  $("#business_user_attributes_password_confirmation").keyup(checkPasswordMatchBusiness);
});

function checkPasswordMatchCustomer() {
    var password = $("#customer_user_attributes_password").val();
    var confirmPassword = $("#customer_user_attributes_password_confirmation").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}

function checkPasswordMatchBusiness() {
    var password = $("#business_user_attributes_password").val();
    var confirmPassword = $("#business_user_attributes_password_confirmation").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}
