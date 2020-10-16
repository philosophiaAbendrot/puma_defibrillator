require "puma_defibrillator/configuration"
require "puma_defibrillator/heroku_restarter"
# require "puma_defibrillator/rack_timeout_exception_methods"

module PumaDefibrillator
  @@config = nil

	class << self
		attr_accessor :config

		def config
			@@config
		end

	  def configure
	  	@@config = Configuration.new
	    yield @@config
	  end
	end
end