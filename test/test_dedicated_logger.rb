require 'minitest/autorun'
require 'dedicated_logger'

class DedicatedLoggerTest < Minitest::Test

  def test_dummy_instance_does_not_define_logger_method
    assert_raises(NoMethodError) do
      dummy_class.new.logger
    end
  end

  def test_dummy_class_does_not_define_logger_method
    assert_raises(NoMethodError) do
      dummy_class.logger
    end
  end

  def test_dummy_instance_with_module_defines_logger_method
    assert_kind_of DedicatedLogger::Base, dummy_class_with_module.new.logger
  end

  def test_dummy_class_with_module_defines_logger_method
    assert_kind_of DedicatedLogger::Base, dummy_class_with_module.logger
  end

  private

  def dummy_class
    Class.new do
      def self.name
        "Dummy"
      end
    end
  end

  def dummy_class_with_module
    Class.new do
      include DedicatedLogger
      def self.name
        "DummyWithModule"
      end
    end
  end

end
