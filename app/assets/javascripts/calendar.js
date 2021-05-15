let initialize_calendar;
initialize_calendar = function () {
  $('#calendar').fullCalendar({
    selectable: true,
    dayMaxEvents: true,
    header: {
      right: 'prev,next today',
      center: '',
      left: 'title'
    },
    selectable: true,
    selectHelper: true,
    eventLimit: true,
    editable: true,
    disableDragging: true,
    events: "/trades.json",
    eventColor: '#d8f3dc',

    select: function (start) {
      $.getScript("/trades/new", function () {
        let str = moment(start).format('YYYY-MM-DD');
        $(".start_hidden").val(str);
        $('#new_trade').modal('show');
      })
    },

    eventClick: function (event, jsEvent, view) {
      $.getScript(event.edit_url, function () {
        $('#edit_trade').modal('show');
      })
    },
  })
};

$(document).on("turbolinks:load", initialize_calendar);