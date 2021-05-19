let initialize_nav;
initialize_nav = function () {
  'use strict';
  $('.js-menu-toggle').click(function (e) {
    let $this = $(this);
    if ($('body').hasClass('show-sidebar')) {
      $('body').removeClass('show-sidebar');
      $this.removeClass('active');
    } else {
      $('body').addClass('show-sidebar');
      $this.addClass('active');
    }
    e.preventDefault();
  });

  $(document).mouseup(function (e) {
    let container = $(".sidebar");
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      if ($('body').hasClass('show-sidebar')) {
        $('body').removeClass('show-sidebar');
        $('body').find('.js-menu-toggle').removeClass('active');
      }
    }
  });
};

$(document).on("turbolinks:load", initialize_nav);