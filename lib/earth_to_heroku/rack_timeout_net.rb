module EarthToHeroku
  class RackTimeoutNet
    def initialize(app)
      @app = app
    end

    def call(env)
      puts "=================================="
      puts "earth_to_heroku middleware running"
      puts "=================================="
      begin
      rescue Rack::Timeout::RequestTimeoutException => e
        puts "caught request timeout exception"
        raise
      end
    end
  end
end