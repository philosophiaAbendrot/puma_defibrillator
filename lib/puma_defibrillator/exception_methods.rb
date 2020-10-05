module PumaDefibrillator
	module ExceptionMethods
		included do
			rescue_from Rack::Timeout::RequestTimeoutException, with: :handle_rack_timeout

			def handle_rack_timeout
				puts "============================"
	      puts "log-rack-timeout running"
	      puts "============================"
			end
		end
	end
end