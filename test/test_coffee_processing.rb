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
    pend('Need to adjust line number (-8) in exception message') do
      CoffeeProcessing.compile 'this.sketch', '-> = ->'
    end
  end
end
