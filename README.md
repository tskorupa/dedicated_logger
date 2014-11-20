dedicated_logger
================

Used for any ruby class, perhaps running as background tasks, in desperate need of a dedicated log file with event severity and timestamp.

Installation
-----------

    TODO

Usage
-----

    require 'dedicated_logger'
    
    class Foo
      
      def self.bar
        logger.info "info from class method"
        logger.warn "warn from class method"
        logger.error "error from class method"
        logger.fatal "fatal from class method"
      end
      
      def baz
        logger.info "info"
        logger.warn "warn"
        logger.error "error"
        logger.fatal "fatal"
      end
      
      private
      
      def logger
        self.class.logger
      end
      
      def self.logger
        @logger ||= DedicatedLogger.new(self, "test")
      end
    end

TODO
================

* Add tests
* convert to acts_as_* module
