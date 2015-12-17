require 'logger'
require 'fileutils'

module DedicatedLogger
  class Base < Logger
    def initialize logger_name, filepath, options = {}
      @logger_name = logger_name
      @options = options
      filename = File.basename(filepath)
      abs_path = File.absolute_path(filepath)
      dir_path = File.dirname(abs_path)

      FileUtils.mkdir_p(dir_path) unless File.exist?(dir_path)

      super File.join(dir_path, filename)
    end

    def format_message severity, timestamp, _progname, msg
      datetime = timestamp.strftime('%Y-%m-%d %H:%M:%S')
      msg = "#{datetime} #{@logger_name} [#{$PROCESS_ID}] #{severity}: #{msg}\n"

      if %w(WARN ERROR FATAL).include?(severity.to_s)
        STDERR.puts(msg)
      else
        STDOUT.puts(msg)
      end

      msg
    end
  end
end
