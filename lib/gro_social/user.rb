module GroSocial
  class User < Model
    ATTRIBUTES = [
      :id,
      :firstname,
      :lastname,
      :email,
      :phone,
      :created,
      :custom1,
      :custom2,
      :custom3,
      :alertmessage,
      :password
    ]

    attr_accessor *ATTRIBUTES

    def save
      options = { typhoeus: { body: attributes } }
      options[:id] = id if id
      result = GroSocial::Client.request('Users', :post, options)
      self.id = result['result']['User']['id'] unless id

      self
    end

    def subscriptions
      response = Client.request 'UserSubscriptions', :get, id: id
      response = response['result']['usersubscriptions']
      response.map do |subscription|
        Subscription.new subscription['Usersubscription']
      end
    end

    def subscription
      subscriptions.first
    end

    def attributes
      to_h ATTRIBUTES
    end
  end
end
