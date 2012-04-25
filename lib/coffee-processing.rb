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

  def self.generate_template_page javascript_object, code, output_dir
    require 'fileutils'
    FileUtils.mkdir_p output_dir
    File.open(File.join(output_dir, 'sketch.js'), 'w') do |f|
      f << compile(javascript_object, code)
    end
    File.open(File.join(output_dir, 'index.html'), 'w') do |f|
      f <<
        Erubis::Eruby.new(
          File.read File.join(
            File.dirname(__FILE__),
            'coffee-processing',
            'template.html.erb'
          )
        ).result(binding)
    end
  end
end
