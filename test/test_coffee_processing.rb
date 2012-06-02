#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '../lib')
require 'test-unit'
require 'coffee-processing'

class TestCoffeeProcessing < Test::Unit::TestCase
  def test_indentation
    without_indentation = "
setup = ->
  null

draw = ->
  null"

    with_space_indentation = "
      setup = ->
        null

      draw = ->
        null
    "

    with_tab_indentation = "
			setup = ->
				null

			draw = ->
				null
		"

    assert_equal 1, 
      [without_indentation, with_space_indentation, with_tab_indentation].map { |code|
        CoffeeProcessing.compile 'this.sketch', code
      }.uniq.length
  end

  def test_error
    begin
      CoffeeProcessing.compile 'this.sketch', %w[1 2 3 ? 5].join($/)
      assert false, 'Exception should have been raised'
    rescue ExecJS::ProgramError => e
      assert e.to_s =~ /line 4:/, 'Unadjusted line number'
    end
  end

  def test_preload_font
    require 'fileutils'
    code = "
preload =
  fonts: ['data/Bountiful.ttf']
  images: ['data/header.png']

font = null

setup = ->
  size 300, 300
  frameRate 1
  background 255
  image loadImage('data/header.png'), 0, 0
  fill 0
  font = createFont('data/Bountiful.ttf', 0)
  textFont font, 30
  text 'Hello world', 50, 50

mousePressed = ->
  background random 255
  fill random 255
  text 'Hello world', random(50), random(50)

draw = ->
  console.log 'draw'
"
    output = File.join(File.dirname(__FILE__), 'output')
    output_f = File.join(output, 'data')
    FileUtils.mkdir_p output_f
    FileUtils.cp File.join(File.dirname(__FILE__), 'data/Bountiful.ttf'), output_f
    CoffeeProcessing.generate_template_page 'this.sketch', code, output
  end
end
