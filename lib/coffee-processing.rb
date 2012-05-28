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

    begin
      CoffeeScript.compile(
        Erubis::Eruby.new(
          File.read File.join(
            File.dirname(__FILE__),
            'coffee-processing',
            'boilerplate.coffee.erb'
          )
        ).result(binding)
      )
    rescue ExecJS::ProgramError => e
      message = e.message
      if match = message.match(/line ([1-9][0-9]*):/)
        range = Range.new(*match.offset(1), true)
        message[ range ] = (match[1].to_i - 15).to_s
      end
      raise e, message, e.backtrace
    end
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
