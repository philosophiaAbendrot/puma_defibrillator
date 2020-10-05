module PumaDefibrillator
  class Railtie < ::Rails::Railtie
    initializer 'puma_defibrillator.middleware.rails' do |app|
      require 'puma_defibrillator/rack_timeout_net'
      require 'puma_defibrillator/show_exceptions'

      app.config.middleware.insert_after ActionDispatch::ShowExceptions,
                                         RackTimeoutNet

      ActionDispatch::ShowExceptions.send(:include, ShowExceptions)
    end
  end
end