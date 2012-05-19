coffee-processing
=================

Helps writing Processing.js sketches in Coffeescript.

Installation
------------

Add this line to your application's Gemfile:

    gem 'coffee-processing'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coffee-processing

Usage
-----

A sample Processing.js sketch written in Coffeescript with the help of coffee-processing.
```coffee
setup = ->
  size $(window).width(), $(window).height()
  frameRate 30
  background 255

draw = ->
  for i in [0..10]
    s = random(100)
    stroke random(255), random(255), random(255)
    ellipse random(width()), random(height()), s, s
```

Ruby code for compiling it into Javascript.
```ruby
require 'coffee-processing'

File.open('compiled.js', 'w') do |f|
  f << CoffeeProcessing.compile('this.sketch', code)
end
```

And the HTML page.
```html
<script src='compiled.js' type='text/javascript'></script>
<canvas id='sketch'></canvas>
<script type='text/javascript'>
  var processing = new Processing(document.getElementById("sketch"), this.sketch)
</script>
```

coffee-processing script
------------------------

```
usage: coffee-processing [--template] <js object name> <sketch file>

        --template                   Create a template page for the sketch
    -h, --help                       Show this message
```


Caveats
-------

Non-constant, instance variables of Processing object,
such as `width`, `frameCount` and `__mousePressed` (among others)
should be accessed through their corresponding shortcut functions as follows.

```coffee
# __mousePressed, frameCount, width and height are functions, not values.

setup = ->
  size 100, 100, P3D

draw = ->
  if __mousePressed()
    point frameCount() % width(), frameCount() % height()
```

Or equivalently, you can access them as the properties of `processing` object.
This is slightly more efficient.

```coffee
# Alias for processing instance
p5 = processing

setup = ->
  size 100, 100, P3D

draw = ->
  if p5.__mousePressed
    point p5.frameCount % p5.width, p5.frameCount % p5.height
```

Examples
--------

Check out [examples](https://github.com/junegunn/coffee-processing/tree/master/examples) directory.

Also check out [a Sinatra demo app](https://github.com/junegunn/coffee-processing-live).

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
