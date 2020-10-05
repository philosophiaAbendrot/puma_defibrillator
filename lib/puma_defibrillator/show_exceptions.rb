module PumaDefibrillator
	module ShowExceptions
		def render_with_exception_with_puma_defib(env, exception)
			key = 'action_dispatch.show_detailed_exceptions'

			if exception.is_a?(ActionController::RoutingError) && env[key]
				puts "===================================="
				puts "caught exception in puma defibrillator"
			end

			render_exception_without_puma_defib
		end

		def call_with_puma_defib(env)
			call_without_puma_defib
		rescue ActionController::RoutingError => exception
			scope = extract_scope_from(env)
			raise exception
		end

		def self.included(base)
			base.send(:alias_method, :call, :call_with_puma_defib)
			base.send(:alias_method, :call_without_puma_defib, :call)
			base.send(:alias_method, :render_exception, :render_exception_with_puma_defib)
			base.send(:alias_method, :render_exception_without_puma_defib, :render_exception)
		end
	end
end