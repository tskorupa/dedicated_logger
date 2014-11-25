require 'logger'
require 'fileutils'

class DedicatedLogger < Logger

  def initialize logger_name, filepath, options={}
    @logger_name = logger_name
    filename = File.basename filepath
    dir_path = File.dirname(File.absolute_path(filepath))

    FileUtils.mkdir_p(dir_path) unless File.exists? dir_path

    super File.join(dir_path, filename)
  end

  def format_message severity, timestamp, progname, msg
    msg = "#{timestamp.strftime("%Y-%m-%d %H:%M:%S")} #{@logger_name} [#{$$}] #{severity}: #{msg}\n"

    if %w(WARN ERROR FATAL).include?(severity.to_s)
      STDERR.puts(msg)
    else
      STDOUT.puts(msg)
    end

    msg
  end

end
