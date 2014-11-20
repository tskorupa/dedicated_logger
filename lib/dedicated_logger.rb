require 'logger'
require 'fileutils'

class DedicatedLogger < Logger

  def initialize logger_name, filename, options={}
    @logger_name = logger_name

    log_dir = File.absolute_path(options[:log_dir] || "log")
    FileUtils.mkdir_p(log_dir) unless File.exists? log_dir

    super File.join(log_dir, "#{filename}.log")
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
