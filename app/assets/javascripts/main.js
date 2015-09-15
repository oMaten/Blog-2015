
$(document).ready(function(){
	var ifReturn = true;

	$('.main-layout').on('ajax:error', function(event, xhr, status, error) {
		if (xhr.status == 401) {
			$(this).addClass('filter-blur');
	  	$('.session-block').fadeIn('slow');
		};
	});

	$('#close').on('click', function(){
		$('.main-layout').removeClass('filter-blur');
		$('.session-block').hide();
	})

	$('#home').on('click', function(){
		var icon = $(this).attr('data-turn');
		var i = $(this).children('i').html();
		$(this).children('i').html(icon);
		$(this).attr('data-turn', i);
		if(i == 'reorder'){
			$(this).siblings().css({visibility : "visible"});
		}else{
			$(this).siblings().css({visibility : "hidden"});
		}
	})

	$('#toTop').on('click', function(){
		if(ifReturn){
			ifReturn = false;
			$('.mdl-layout__content').animate({scrollTop:0},
				1000,
				function(){
					ifReturn = true;
				});
		}
	})

	$('#toBottom').on('click', function(){
		if(ifReturn){
			ifReturn = false;
			$('.mdl-layout__content').animate({scrollTop: $('.blog-height').height()},
				1000,
				function(){
					ifReturn = true;
				});
		}
	})
  var currentPage = 1;

  $('.view-more').on('click', function(event){
    event.preventDefault();
    currentPage++;
    $.ajax({
      method: "GET",
      url: "/?page=" + currentPage,
      dataType: "html"
    }).done(function(data){
    	console.log($(data).find('.blog-main__post'))
      //var posts = data.getElementsByClassName('blog-main__post');
      //$('.fork').html(posts);
      $('.posts-depart').append($(data).find('.blog-main__post'));
      if(currentPage >= $('#count').html()){
        $('.blog-view-more').hide();
      }
    })
  })

  var version = $.browser;
  if(version.msie == true){
  	window.location.href = 'browser';
  }

})