HTMLWidgets.widget({

  name: 'countup',

  type: 'output',

  factory: function(el, width, height) {

    var count;

    return {

      renderValue: function(x) {
        
        var options = x.options;
      
        count = new CountUp(el.id, x.start, x.count, 0, x.duration, options);
      
        count.start(); 

      },

      resize: function(width, height) {

      }

    };
  }
});
