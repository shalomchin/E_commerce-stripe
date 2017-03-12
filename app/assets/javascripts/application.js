// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on("turbolinks:load",function() {
  console.log("test")
  $.ajax({
    url: 'https://randomuser.me/api/?results=5000&gender=female',
    dataType: 'json',
    success: function(data) {
      console.log(data.results[0].picture.large);
      for (i = 0; i < 1001; i++) {
      $("#chicks-"+i).append( '<img src="' + data.results[i].picture.large + '">');
      }
    }
  });
})

$(document).on("turbolinks:load",function() {
$.ajax({
    url: 'https://randomuser.me/api/?results=1000&gender=female',
    dataType: 'json',
    success: function(data) {
      console.log(data.results[0].picture.large);
      $("#chicks").append( '<img src="' + data.results[0].picture.large + '">');     
    }
  });
})
