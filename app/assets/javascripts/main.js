$('.main-layout').on('ajax:error', function(event, xhr, status, error) {
  $(this).addClass('filter-blur');
  $('.session-block').show();
});