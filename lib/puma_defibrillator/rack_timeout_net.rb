module PumaDefibrillator
  class RackTimeoutNet
    def initialize(app)
      @app = app
    end

    def call(env)
      puts "=================================="
      puts "puma_defibrillator middleware running"
      puts "=================================="
      begin
        response = @app.call(env)
      rescue Exception => e
        puts "caught general Exception"
        puts "exception = #{e.inspect}"
        raise
      end

      response
    end
  end
end