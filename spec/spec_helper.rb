if ENV['CI']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'gro_social'

RSpec.configure do |c|
  c.before do
    GroSocial::Client.test_mode = true
    GroSocial::Client.api_key = ENV.fetch 'GROSOCIAL_KEY'
    GroSocial::Client.api_password = ENV.fetch 'GROSOCIAL_PASSWORD'
  end
end
