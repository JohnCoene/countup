HTMLWidgets.widget({

  name: 'countup',

  type: 'output',

  factory: function(el, width, height) {

    let count;

    return {

      renderValue: function(x) {

        count = new countUp.CountUp(el.id, x.count, x.options || {});

        if (x.start) count.start();
      },

      resize: function(width, height) {

      },

      getCounter: function() {
        return count;
      },

    };
  }
});

function get_counter(id, variable) {

  var htmlWidgetsObj = HTMLWidgets.find("#" + id);

  var cnt;

  if (typeof htmlWidgetsObj != 'undefined') {
    cnt = htmlWidgetsObj.getCounter(variable);
  }

  return (cnt);
}

if (HTMLWidgets.shinyMode) {
  Shiny.addCustomMessageHandler('counter_start',
    function(data) {
      var counter = get_counter(data.id);
      if (typeof counter != 'undefined')
        counter.start()

    });

  Shiny.addCustomMessageHandler('counter_update',
    function(data) {
      var counter = get_counter(data.id);
      if (typeof counter != 'undefined')
        counter.update(data.update)

    });

  Shiny.addCustomMessageHandler('counter_pause_resume',
    function(data) {
      var counter = get_counter(data.id);
      if (typeof counter != 'undefined')
        counter.pauseResume()

    });
}

