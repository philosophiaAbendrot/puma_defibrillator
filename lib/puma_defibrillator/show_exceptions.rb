module PumaDefibrillator
	module ShowExceptions
		def render_exception_with_puma_defib(env, exception)
			key = 'action_dispatch.show_detailed_exceptions'

			puts "===================================="
			puts "triggered render_exception_with_puma_defib"

			if exception.is_a?(ActionController::RoutingError) && env[key]
				puts "caught exception in puma defibrillator"
			end

			render_exception_without_puma_defib(env, exception)
		end

		def call_with_puma_defib(env)
			call_without_puma_defib(env)
		rescue ActionController::RoutingError => exception
			scope = extract_scope_from(env)
			puts "================================="
			puts "triggered call_with_puma_defib"
			raise exception
		end

		def self.included(base)
			base.send(:alias_method, :call_without_puma_defib, :call)
			base.send(:alias_method, :call, :call_with_puma_defib)
			base.send(:alias_method, :render_exception_without_puma_defib, :render_exception)
			base.send(:alias_method, :render_exception, :render_exception_with_puma_defib)
		end
	end
end