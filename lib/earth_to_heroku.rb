require "earth_to_heroku/configuration"
require "earth_to_heroku/middleware"

module EarthToHeroku
  class EarthToHeroku
    @@config = Configuration.new

    def self.configure
      yield @@config
    end
  end
end