(function () {
  'use strict'

  function initTrumbowygEditors() {
    $('[data-aa-trumbowyg]').each(function () {
      if (!$(this).hasClass('trumbowyg-textarea--active')) {
        let options = {
          svgPath: '/assets/trumbowyg/icons.svg'
        }
        options = $.extend({}, options, $(this).data('options'))
        $(this).trumbowyg(options)
        $(this).addClass('trumbowyg-textarea--active')
      }
    })
  }

  $(document).ready(initTrumbowygEditors)
  $(document).on('has_many_add:after', '.has_many_container', initTrumbowygEditors)
  $(document).on('turbolinks:load', initTrumbowygEditors)
})()
