require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true

  c.configure_rspec_metadata!

  c.filter_sensitive_data('<API_KEY>') { ENV['GROSOCIAL_KEY'] }
  c.filter_sensitive_data('<API_PASSWORD>') { ENV['GROSOCIAL_PASSWORD'] }
end