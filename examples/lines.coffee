# Author: Junegunn Choi (junegunn.c@gmail.com)

steps  = 5
count  = 200
offset = 0
status = 0

exag = (v, times) ->
  v = 6 * pow(v, 5) -
      15 * pow(v, 4) +
      10 * pow(v, 3) for i in [0...times]
  v

setup = ->
  size $(window).width(), $(window).height()
  frameRate 30
  colorMode RGB(), 1.0
  background 1
  stroke 0, 0.1

mousePressed = ->
  if status == 0
    status = 1
  else
    offset = frameCount() * steps % width()
    background 1
    status = 0

draw = ->
  w = width()
  h = height()

  if status != 2
    for s in [0...steps]
      x = (frameCount() - 1) * steps + s
      for i in [0...count]
        point(
          (x - offset) % w,
          h / 2 +
          h * (exag(noise(i / count, x / w), 2) - 0.5)
        )

      if status == 1 && (x - offset) % w == 0
        status = 2
        break
  null

