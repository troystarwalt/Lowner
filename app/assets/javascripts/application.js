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
//= require turbolinks
//= require pages
//= require jquery.tablesorter.min
//= require tablesorter
//= require_tree .
//= require tether
//= require bootstrap-sprockets

$(document).ready(function() {
	$('.delete-item').click('ajax:success', function(event) {
		// event.preventDefault();
    	$(this).closest('tr').fadeOut();
    	console.log("..............deleted item and reloaded")
	});
});


$(function () {
  $('#find-out-more').popover({
    container: 'body',
    trigger: 'focus'
  })
})

$('#show-hide-about').click(function(){
	$('#popup-about-page').show("fast", function() {
	});
});

$('#close-about').click(function(){
	$('#popup-about-page').hide("fast", function(){

	});
});

