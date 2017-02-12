HTMLWidgets.widget({

  name: 'countup',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

      var options = x.options;

      var count = new CountUp(el.id, x.start, x.count, 0, x.duration, options);
      count.start();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
