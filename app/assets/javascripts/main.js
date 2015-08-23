
$(document).ready(function(){

	$('.main-layout').on('ajax:error', function(event, xhr, status, error) {
	  $(this).addClass('filter-blur');
	  $('.session-block').fadeIn('slow');
	});

	$('#close').on('click', function(){
		$('.main-layout').removeClass('filter-blur');
		$('.session-block').hide();
	})
})