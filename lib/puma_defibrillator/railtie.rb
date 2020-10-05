module PumaDefibrillator
  class Railtie < ::Rails::Railtie
    initializer 'puma_defibrillator.middleware.rails' do |app|
      require 'puma_defibrillator/exception_methods'

      ActionController::Base.send(:include, ExceptionMethods)
    end
  end
end