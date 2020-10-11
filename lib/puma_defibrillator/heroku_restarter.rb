module PumaDefibrillator
	class HerokuRestarter
		def initialize(configuration)
			@api_token = configuration.heroku_api_token
			@dyno_list = configuration.dyno_list
			@app_name = configuration.app_name
		end

		def perform
			puts "heroku restarter#call running"
			@dyno_list.each do |dyno|
				uri = URI(dyno_url(dyno))
				req = Net::HTTP::Delete.new(uri.path)
				req["Authorization"] = authorization
				req["Content-type"] = "application/json"
				req["Accept"] = "application/vnd.heroku+json; version=3"
				res = Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.scheme == "https")) { |http| http.request(req) }
			end
			puts "restart request sent to heroku"
		end

		private

		def dyno_url(dyno)
			"https://api.heroku.com/apps/#{@app_name}/dynos/#{dyno}"
		end

		def authorization
			"Basic " + Base64.encode64(":#{@api_token}").gsub("\n", "")
		end
	end
end