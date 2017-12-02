$(document).ready( function() {
  $('.trumbowyg-textarea').each(function () {
    var options = {
      svgPath: '/assets/active_admin-trumbowyg.svg'
    };
    options = $.extend({}, options, $(this).data( 'options' ));
    $(this).trumbowyg( options );
  });
});
