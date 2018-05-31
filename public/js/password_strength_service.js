$('input[type="password"]').each(function() {
  var elem = $(this)
  $(this).parent().append('<div class="strength"></div>')
  $(this).on('keyup', function() {
    $.get('/password/' + encodeURIComponent($(this).val()), function(result) {
      console.log(result)
      elem.siblings('.strength').text(result)
    });
  });
});