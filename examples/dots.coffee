# Author: Junegunn Choi (junegunn.c@gmail.com)

setup = ->
  size $(window).width(), $(window).height()
  frameRate 30
  background 255

draw = ->
  for i in [0..10]
    s = random(100)
    stroke random(255), random(255), random(255)
    ellipse random(width()), random(height()), s, s
