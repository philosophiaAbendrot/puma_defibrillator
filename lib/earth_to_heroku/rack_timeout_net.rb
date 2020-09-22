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
        response = @app.call(env)
        response
      rescue Exception => e
        puts "caught general Exception"
        puts "exception = #{e.inspect}"
        raise
      end
    end
  end
end