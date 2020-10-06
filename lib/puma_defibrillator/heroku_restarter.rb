module PumaDefibrillator
	class HerokuRestarter
		def initialize(configuration)
			@token = configuration.heroku_api_token
			@dynos = configuration.dyno_list
			@app_name = configuration.app_name
		end

		def call
			puts "heroku restarter#call running"
			# @dynos.each do |dyno|
			# 	uri = URI(dyno_url(process))
			# 	req = Net::HTTP::Delete.new(uri.path)
			# 	req["Authorization"] = authorization
			# 	req["Content-type"] = "application/json"
			# 	req["Accept"] = "application/vnd.heroku+json; version=3"
			# 	res = Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.scheme == "https")) { |http| http.request(req) }
			# end
		end

		private

		def dyno_url(dyno)
			"https://api.heroku.com/apps/#{@app_name}/dynos/#{process}"
		end

		def authorization
			"Basic " + Base64.encode64(":#{@api_token}").gsub("\n", "")
		end
	end
end