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
  end
end