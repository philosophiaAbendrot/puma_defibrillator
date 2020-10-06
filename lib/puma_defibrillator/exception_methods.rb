module PumaDefibrillator
	module ExceptionMethods
		extend ActiveSupport::Concern

		included do
			rescue_from Rack::Timeout::RequestTimeoutException, with: :handle_rack_timeout

			def handle_rack_timeout
				config = PumaDefibrillator.config
				puts "============================"
	      puts "log-rack-timeout running"
	      puts "config.token = #{config.token}"
	      puts "config.dynos = #{config.dynos}"
	      puts "config.app_name = #{config.app_name}"
	      puts "============================"
	      HerokuRestarter.new(config).call
      end
		end
	end
end