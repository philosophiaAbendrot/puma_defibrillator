module EarthToHeroku
  class Railtie < ::Rails::Railtie
    initializer 'earthtoheroku.middleware.rails' do |app|
      app.config.middleware.insert_before ActionDispatch::ShowExceptions,
                                          EarthToHeroku::RackTimeoutNet
    end
  end
end