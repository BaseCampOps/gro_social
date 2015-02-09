module GroSocial
  class Users
    include Enumerable

    def self.[](id)
      result = GroSocial::Client.request('Users', :get, {id: id.to_s})
      return nil if result['result']['user'].nil?
      GroSocial::User.new(result['result']['user'])
    end

    def self.<<(user)
      options = { typhoeus: { body: {
          firstname:    user.firstname,
          lastname:     user.lastname,
          email:        user.email,
          password:     user.password,
          phone:        user.phone,
          custom1:      user.custom1,
          custom2:      user.custom2,
          custom3:      user.custom3,
          alertmessage: user.alertmessage
      }}}
      result = GroSocial::Client.request('Users', :post, options)
      user.id = result['result']['User']['id']
      user
    end

    # def self.each(&block)
    #
    # end
  end
end