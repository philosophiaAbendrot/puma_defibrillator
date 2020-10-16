# module PumaDefibrillator
# 	module RackTimeoutExceptionMethods
# 		extend ActiveSupport::Concern

# 		included do
# 			rescue_from Exception, with: :handle_rack_timeout

# 			def handle_rack_timeout(exception)
# 				puts "============================"
# 				puts "rescued exception = #{exception.to_s}"

# 				if exception.is_a?(Rack::Timeout::RequestTimeoutException)
# 					config = PumaDefibrillator.config
# 		      puts "log-rack-timeout running"
# 		      puts "config.token = #{config.heroku_api_token}"
# 		      puts "config.dynos = #{config.dyno_list}"
# 		      puts "config.app_name = #{config.app_name}"
# 		      puts "============================"
# 		      Delayed::Job.enqueue(HerokuRestarter.new(config))
# 				end
				
# 	      raise
#       end
# 		end
# 	end
# end
module PumaDefibrillator
	class Activate
		def initialize(exception)
			@exception = exception
		end

		def self.call(exception)
			new(exception).call
		end

		def call
			puts "==================================="
			puts "rescued exception = #{@exception.to_s}"

			if @exception.is_a?(Rack::Timeout::RequestTimeoutException)
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