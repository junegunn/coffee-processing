(function() {

  this.sketch = function(processing) {
    var callback, draw, setup, __sym, _i, _len, _ref, _results;
    for (__sym in processing) {
      if (eval("typeof " + __sym + " === 'undefined'")) {
        if (typeof processing[__sym] === 'function') {
          eval("var " + __sym + " = function() { return processing." + __sym + ".apply(processing, arguments) }");
        } else {
          eval("var " + __sym + " = function() { return processing." + __sym + " }");
        }
      }
    }
    null;

    setup = function() {
      size($(window).width(), $(window).height());
      frameRate(30);
      return background(255);
    };
    draw = function() {
      var s;
      s = random(100);
      stroke(random(255), random(255), random(255));
      return ellipse(random(width()), random(height()), s, s);
    };
    _ref = ['setup', 'draw', 'mouseClicked', 'mouseDragged', 'mouseMoved', 'mouseOut', 'mouseOver', 'mousePressed', 'mouseReleased', 'keyPressed', 'keyReleased', 'keyTyped'];
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      callback = _ref[_i];
      if (!eval("typeof " + __sym + " === 'undefined'")) {
        _results.push(eval("processing." + callback + " = " + callback));
      }
    }
    return _results;
  };

}).call(this);
