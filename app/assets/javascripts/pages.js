// $( document ).ready(function(){
// 	console.log("shit");
// });

$( "#learn-more-button").click(function() {
	$( "#hidden-block" ).slideToggle( "slow", "swing", function(){
		$('html, body').animate({scrollTop: $(".footer").offset().top + $('window').height()
	}, 3000);
	})
});

var clickEvents = $._data($('#learn-more-button')[0], "events").click;
jQuery.each(clickEvents, function(key, handlerObj) {
  console.log(handlerObj.handler) // prints "function() { console.log('clicked!') }"
})