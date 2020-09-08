require File.expand_path('../lib/earth_to_heroku/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = %q{earth_to_heroku}
  gem.version = "0.0.0"
  gem.date = EarthToHeroku::VERSION
  gem.authors = %w{Tony\ Ha}
  gem.email = %q{tony@86network.com}
  gem.description = <<-HEREDOC
    Restarts Heroku dynos when a Rack::Timeout error is detected
  HEREDOC
  gem.files = %w{ lib/earth_to_heroku.rb }
  gem.require_paths = %w{ lib }
  gem.required_ruby_version = '>= 2.0.0'
end