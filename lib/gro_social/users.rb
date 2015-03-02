module GroSocial
  class Users
    include Enumerable

    def self.[](id)
      result = GroSocial::Client.request('Users', :get, {id: id.to_s})
      return unless result['result']['user']['User']
      GroSocial::User.new(result['result']['user']['User'])
    end

    def self.<<(user)
      user.save
    end

    # def self.each(&block)
    #
    # end
  end
end
