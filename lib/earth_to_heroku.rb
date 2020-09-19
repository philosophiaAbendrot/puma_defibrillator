require "earth_to_heroku/configuration"
require "earth_to_heroku/rack_timeout_net"
require "earth_to_heroku/railtie"

module EarthToHeroku
  class EarthToHeroku
    @@config = Configuration.new

    def self.configure
      yield @@config
    end
  end
end