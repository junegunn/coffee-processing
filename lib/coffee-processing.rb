require "coffee-processing/version"
require 'erubis'
require 'coffee-script'

module CoffeeProcessing
  def self.compile javascript_object, code
    first_line = code.lines.map(&:chomp).find { |line| !line.empty? }

    if first_line && indentation = first_line.scan(/^\s+/).first
      code = code.lines.map { |line| line.sub(/^#{indentation}/, '')}.join
    end

    code = code.lines.map { |line| "#{line}  " }.join
    code = code.strip

    CoffeeScript.compile(
      Erubis::Eruby.new(
        File.read File.join(
          File.dirname(__FILE__),
          'coffee-processing',
          'boilerplate.coffee.erb'
        )
      ).result(binding)
    )
  end
end
