require "puma_defibrillator/configuration"
require "puma_defibrillator/railtie"
require "puma_defibrillator/heroku_restarter"

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