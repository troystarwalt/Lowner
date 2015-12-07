
$( document ).ready(function(){
	$( "#learn-more-button").click(function() {

		$( "#hidden-block" ).slideToggle( "slow", function(){
			$("#taco-town").css("bottom", "-100px")	
			$('html, body').animate({scrollTop: $("footer").offset().top + $('window').height()
		}, 2000);
		})
	});
});