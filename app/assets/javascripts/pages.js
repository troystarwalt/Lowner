// $( document ).ready(function(){
// 	console.log("shit");
// });

$( "#learn-more-button").click(function() {
	$( "#hidden-block" ).slideToggle( "slow", "swing", function(){
		$('html, body').animate({scrollTop: $(".footer").offset().top + $('window').height()
	}, 3000);
	})
});