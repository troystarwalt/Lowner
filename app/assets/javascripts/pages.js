

$( "#learn-more-button").click(function() {
	$( "#hidden-block" ).slideToggle( "slow", "swing", function(){
		$('html, body').animate({scrollTop: $("#hidden-block").offset().top + $('window').height()
	}, 3000);
	})
});

$( "#lowned-button").click(function() {
	$( "#lowned-stuff-table-container").slideToggle( "fast", function (){
	});
});

$( "#borrowed-button").click(function() {
	$( "#borrowed-table-container").slideToggle( "fast", function (){
	});
});

$( "#owned-button").click(function() {
	$( "#owned-table-container").slideToggle( "fast", function (){
	});
});




