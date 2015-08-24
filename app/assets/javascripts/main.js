
$(document).ready(function(){
	var ifReturn = true;

	$('.main-layout').on('ajax:error', function(event, xhr, status, error) {
	  $(this).addClass('filter-blur');
	  $('.session-block').fadeIn('slow');
	});

	$('#close').on('click', function(){
		$('.main-layout').removeClass('filter-blur');
		$('.session-block').hide();
	})

	$('#returnTop').on('click', function(){
		if(ifReturn){
			ifReturn = false;
			$('.mdl-layout__content').animate({scrollTop:0},
				1000,
				function(){
					ifReturn = true;
				});
		}
	})
})