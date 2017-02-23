HTMLWidgets.widget({

  name: 'countup',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

      var options = x.c.options;

      var count = new CountUp(el.id, x.c.start, x.c.count, 0, x.c.duration, options);
      
      var waypoint = new Waypoint({
        element: document.getElementById(el.id),
        handler: function() {
          count.start();
        },
        offset: x.offset
      });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
