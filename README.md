coffee-processing
=================

Write a processing.js sketch in concise Coffeescript.

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

Sample sketch in Coffeescript.
```coffee
setup = ->
  size $(window).width(), $(window).height()
  frameRate 30
  background 255

draw = ->
  s = random(100)
  stroke random(255), random(255), random(255)
  ellipse random(width()), random(height()), s, s
```

Ruby code for compiling it into Javascript
```ruby
require 'coffee-processing'

File.open('compiled.js', 'w') do |f|
  f << CoffeeProcessing.compile('this.sample', code)
end
```

coffee-processing script
------------------------

```
usage: coffee-processing [--template] <js object name> <sketch file>

        --template                   Creates a template page for the sketch
    -h, --help                       Show this message
```


Caveats
-------

Non-method instance variables, such as `width`, `frameCount` and `__mousePressed` (among others)
should be accessed through their corresponding shortcut functions.

```coffee
// P3D, __mousePressed, frameCount, width and height are functions, not values.

setup = ->
  size 100, 100, P3D()

draw = ->
  if __mousePressed()
    point frameCount() % width(), frameCount() % height()
```

Or equivalently, you can directly access them as the properties of `processing` object.
This is slightly more efficient since there is no need to invoke shortcut functions.

```coffee
# Alias for processing instance
p5 = processing

setup = ->
  size 100, 100, p5.P3D

draw = ->
  if p5.__mousePressed
    point p5.frameCount % p5.width, p5.frameCount % p5.height
```

Examples
--------

Checkout examples directory.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
