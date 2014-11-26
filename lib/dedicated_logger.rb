require 'active_support/concern'
require 'active_support/inflector'
require 'dedicated_logger/base'

module DedicatedLogger
  extend ActiveSupport::Concern

  included do
    def logger
      self.class.logger
    end
  end

  module ClassMethods
    def acts_as_dedicated_logger options={}
      name = options[:name] || self.name.to_s.underscore
      filepath = options[:filepath] || File.join("log", "#{name}.log")
      @logger = DedicatedLogger::Base.new(name, filepath)
    end

    def logger
      @logger || acts_as_dedicated_logger
    end

  end
end
