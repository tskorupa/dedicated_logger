dedicated_logger
================

Used for any ruby class, perhaps running as background tasks, in desperate need of a dedicated log file with event severity and timestamp.

Installation
-----------

    gem install dedicated_logger
    
or by including this line in your Gemfile

    gem "dedicated_logger", :git => "git://github.com/tskorupa/dedicated_logger.git"

Usage
-----

    require 'dedicated_logger'
    
    class Foo
      include DedicatedLogger
      
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
      
    end

TODO
================

* write docs on how to use acts_as_* module
* show how to specify a custom logger file and/or filepath
