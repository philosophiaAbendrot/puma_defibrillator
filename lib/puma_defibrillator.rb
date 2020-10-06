require "puma_defibrillator/configuration"
require "puma_defibrillator/railtie"
require "puma_defibrillator/heroku_restarter"

module PumaDefibrillator
	class << self
		attr_accessor :config

		def self.config
			@@config
		end

	  @@config = Configuration.new
	  @@instance = nil

	  def self.configure
	    yield @@config
	  end
	end
end