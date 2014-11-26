require 'minitest/autorun'
require 'dedicated_logger/base'

class BaseTest < Minitest::Test

  def setup
    @logger = DedicatedLogger::Base.new("TEST", "test/log/test.log")
  end

  def test_instantiation
    assert_kind_of DedicatedLogger::Base, @logger
  end

end
