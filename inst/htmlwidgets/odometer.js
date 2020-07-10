HTMLWidgets.widget({

  name: 'odometer',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
    var od;

    return {

      renderValue: function(x) {

        x.opts.el = el;

        od = new Odometer(x.opts);

        el.innerHTML = x.value;

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      },
      
      getOdometer: function(){
        return od;
      }

    };
  }
});