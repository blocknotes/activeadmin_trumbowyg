function initTrumbowygEditors () {
  $('.trumbowyg-textarea').each(function () {
    if (!$(this).hasClass('trumbowyg-textarea--active')) {
      var options = {
        svgPath: '/assets/active_admin-trumbowyg.svg'
      };
      options = $.extend({}, options, $(this).data('options'));
      $(this).trumbowyg(options);
      $(this).addClass('trumbowyg-textarea--active');
    }
  });
}

$(document).on('has_many_add:after', function () {
  initTrumbowygEditors();
});

$(document).ready( function() {
  initTrumbowygEditors();
});
