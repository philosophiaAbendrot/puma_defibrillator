require "puma_defibrillator/configuration"
require "puma_defibrillator/railtie"
require "puma_defibrillator/heroku_restarter"

module PumaDefibrillator
  @@config = Configuration.new

  def self.configure
    yield @@config
  end

  def initialize
  	@@restarter = HerokuRestarter.new(@@config)
  end
end