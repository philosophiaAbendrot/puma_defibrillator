require "puma_defibrillator/configuration"
require "puma_defibrillator/rack_timeout_net"
require "puma_defibrillator/railtie"

module PumaDefibrillator
  class PumaDefibrillator
    @@config = Configuration.new

    def self.configure
      yield @@config
    end
  end
end