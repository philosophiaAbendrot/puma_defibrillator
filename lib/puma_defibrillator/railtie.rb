module PumaDefibrillator
  class Railtie < ::Rails::Railtie
    initializer 'puma_defibrillator.middleware.rails' do |app|
      require 'puma_defibrillator/rack_timeout_net'

      app.config.middleware.insert_after ActionDispatch::ShowExceptions,
                                         RackTimeoutNet
    end
  end
end