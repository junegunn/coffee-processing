(function() {

  this.sketch = function(processing) {
    var callback, count, draw, exag, mousePressed, offset, setup, status, steps, __sym, _i, _len, _ref, _results;
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

    steps = 5;
    count = 200;
    offset = 0;
    status = 0;
    exag = function(v, times) {
      var i, _i;
      for (i = _i = 0; 0 <= times ? _i < times : _i > times; i = 0 <= times ? ++_i : --_i) {
        v = 6 * pow(v, 5) - 15 * pow(v, 4) + 10 * pow(v, 3);
      }
      return v;
    };
    setup = function() {
      size($(window).width(), $(window).height());
      frameRate(30);
      colorMode(RGB(), 1.0);
      background(1);
      return stroke(0, 0.1);
    };
    mousePressed = function() {
      if (status === 0) {
        return status = 1;
      } else {
        offset = frameCount() * steps % width();
        background(1);
        return status = 0;
      }
    };
    draw = function() {
      var h, i, s, w, x, _i, _j;
      w = width();
      h = height();
      if (status !== 2) {
        for (s = _i = 0; 0 <= steps ? _i < steps : _i > steps; s = 0 <= steps ? ++_i : --_i) {
          x = (frameCount() - 1) * steps + s;
          for (i = _j = 0; 0 <= count ? _j < count : _j > count; i = 0 <= count ? ++_j : --_j) {
            point((x - offset) % w, h / 2 + h * (exag(noise(i / count, x / w), 2) - 0.5));
          }
          if (status === 1 && (x - offset) % w === 0) {
            status = 2;
            break;
          }
        }
      }
      return null;
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
