module PumaDefibrillator
	module ShowExceptions
		def call_with_puma_defib(env)
			puts "=========================================="
			puts "call with puma_defib checkpoint 1"
			@app.call(env)
		rescue Exception => exception
			if exception.is_a?(Rack::Timeout::RequestTimeoutException)
				puts "call with puma_defib checkpoint 2"
			end

			if env['action_dispatch.show_exceptions'] == false
				puts "call with puma_defib checkpoint 3"
        raise exception
      else
      	puts "call_with_puma_defib checkpoint 4"
        render_exception(env, exception)
      end
		end

		def self.included(base)
			base.send(:alias_method, :call, :call_with_puma_defib)
		end
	end
end