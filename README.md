# coffee-processing

Write a processing.js sketch in concise Coffeescript.

## Installation

Add this line to your application's Gemfile:

    gem 'coffee-processing'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coffee-processing

## Usage

Sample sketch in Coffeescript.
```coffee
```

Ruby code for compiling it into Javascript
```ruby
require 'coffee-processing'

File.open('sample.js', 'w') do |f|
  f << CoffeeProcessing.compile('this.sample', code)
end
```

HTML template
```html
```

## Caveats

Non-method instance variables, such as width, frameCount and __mousePressed (among others)
should be accessed through their corresponding shortcut functions.

```coffee
// P3D, __mousePressed, frameCount, width and height are functions, not values.

setup = ->
  size 100, 100, P3D()

draw = ->
  if __mousePressed()
    point frameCount() % width(), frameCount() % height()
```

Or equivalently, you can just access them explicitly via Processing object.
This is slightly more efficient. (no need to invoke shortcut functions)

```coffee
setup = (p5) ->
  size 100, 100, p5.P3D

draw = (p5) ->
  if p5.__mousePressed
    point p5.frameCount % p5.width, p5.frameCount % p5.height
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
