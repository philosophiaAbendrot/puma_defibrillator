module EarthToHeroku
  class Railtie < ::Rails::Railtie
    initializer 'earthtoheroku.middleware.rails' do |app|
      require 'earth_to_heroku/rack_timeout_net'

      app.config.middleware.insert_after ActionDispatch::ShowExceptions,
                                         RackTimeoutNet
    end
  end
end