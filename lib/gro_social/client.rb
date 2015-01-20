require 'singleton'
require 'typhoeus'

module GroSocial
  class Client
    include Singleton

    def self.api_key=(key)
      self.instance.instance_variable_set(:@api_key, key.to_s)
    end

    def self.api_key
      self.instance.instance_variable_get(:@api_key)
    end

    def self.api_password=(password)
      self.instance.instance_variable_set(:@api_password, password.to_s)
    end

    def self.api_password
      self.instance.instance_variable_get(:@api_password)
    end

    def self.api_url
      test_mode ? 'https://apidev.grosocial.com' : 'https://api.grosocial.com'
    end

    def self.request(resource_name, http_verb, options = {})
      url = build_resource_url(resource_name, options)
      response = Typhoeus.send(http_verb.to_s.downcase.to_sym, url, options_for_typhoeus(options[:typhoeus]))
      parsed_results = JSON.parse(response.response_body)
      raise RuntimeError, 'GroSocial credentials not accepted' if parsed_results['result']['http_status']['code'] == 401
      parsed_results
    end

    def self.test_mode=(value)
      self.instance.instance_variable_set(:@test_mode, (value ? true : false))
    end

    def self.test_mode
      self.instance.instance_variable_get(:@test_mode)
    end

    private

    def self.build_resource_url(resource_name, options)
      url = "#{api_url}/#{resource_name}"
      url += "/#{options[:id]}" if options[:id]

      url += "?key=#{api_key}&p=#{api_password}"

      # unless options[:query_params].nil?
      #   options[:query_params].each do |query_param, value|
      #     url += "&#{query_param}=#{value}"
      #   end
      # end

      url
    end

    def self.options_for_typhoeus(options = {})
      options = {} if options.nil?
      {}.merge(options)
    end
  end
end