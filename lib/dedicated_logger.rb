class DedicatedLogger < Logger

  def initialize klass, filename
    @klass = klass
    super Rails.root.join("log", "#{filename}.log")
  end

  def format_message severity, timestamp, progname, msg
    msg = "#{timestamp.strftime("%Y-%m-%d %H:%M:%S")} #{@klass.name} [#{$$}] #{severity}: #{msg}\n"

    unless Rails.env.test?
      if %w(WARN ERROR FATAL).include?(severity.to_s)
        STDERR.puts(msg)
      else
        STDOUT.puts(msg)
      end
    end

    msg
  end

end
