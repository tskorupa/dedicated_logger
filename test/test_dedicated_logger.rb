require 'minitest/autorun'
require 'dedicated_logger'

class DedicatedLoggerTest < MiniTest::Unit::TestCase

  def setup
    @logger = DedicatedLogger.new("TEST", "test/log/test.log")
  end

  def test_instantiation
    assert_kind_of DedicatedLogger, @logger
  end

end
