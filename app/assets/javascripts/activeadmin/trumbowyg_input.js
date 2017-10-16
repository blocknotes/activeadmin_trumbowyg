$(document).ready( function() {
  $('.trumbowyg-textarea').each(function () {
    var options = {};
    options = $.extend({}, options, $(this).data( 'options' ));
    $(this).trumbowyg( options );
  });
});
