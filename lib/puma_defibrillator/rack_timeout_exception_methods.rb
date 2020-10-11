module PumaDefibrillator
	module RackTimeoutExceptionMethods
		extend ActiveSupport::Concern

		included do
			rescue_from Rack::Timeout::RequestTimeoutException, with: :handle_rack_timeout

			def handle_rack_timeout
				config = PumaDefibrillator.config
				puts "============================"
	      puts "log-rack-timeout running"
	      puts "config.token = #{config.heroku_api_token}"
	      puts "config.dynos = #{config.dyno_list}"
	      puts "config.app_name = #{config.app_name}"
	      puts "============================"
	      Delayed::Job.enqueue(HerokuRestarter.new(config))
      end
		end
	end
end