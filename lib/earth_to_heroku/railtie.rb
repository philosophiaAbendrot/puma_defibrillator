module EarthToHeroku
  class Railtie < ::Rails::Railtie
    initializer 'earthtoheroku.middleware.rails' do |app|
      require 'earth_to_heroku/rack_timeout_net'

      app.config.middleware.insert_before ActionDispatch::ShowExceptions,
                                          EarthToHeroku::RackTimeoutNet
    end
  end
end