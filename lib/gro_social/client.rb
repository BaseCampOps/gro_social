require 'singleton'

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

    def self.request(resource_name, options = {})

    end

    def self.test_mode=(value)
      self.instance.instance_variable_set(:@test_mode, (value ? true : false))
    end

    def self.test_mode
      self.instance.instance_variable_get(:@test_mode)
    end
  end
end