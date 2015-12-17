require 'minitest/autorun'
require 'dedicated_logger'

class DedicatedLoggerTest < Minitest::Test
  DummyClass = Class.new
  DummyClassWithIncludedModule = Class.new(DummyClass) { include DedicatedLogger }

  def test_dummy_instance_does_not_define_logger_method
    assert_raises(NoMethodError) do
      DummyClass.new.logger
    end
  end

  def test_dummy_class_does_not_define_logger_method
    assert_raises(NoMethodError) do
      DummyClass.logger
    end
  end

  def test_dummy_instance_with_module_defines_logger_method
    assert_kind_of DedicatedLogger::Base, DummyClassWithIncludedModule.new.logger
  end

  def test_dummy_class_with_module_defines_logger_method
    assert_kind_of DedicatedLogger::Base, DummyClassWithIncludedModule.logger
  end
end
