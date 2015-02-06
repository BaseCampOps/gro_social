module GroSocial
  class Users
    include Enumerable

    def self.[](id)
      result = GroSocial::Client.request('Users', :get, {id: id.to_s})
      return nil if result['result']['user'].nil?
      GroSocial::User.new(result['result']['user'])
    end

    def self.each(&block)

    end
  end
end