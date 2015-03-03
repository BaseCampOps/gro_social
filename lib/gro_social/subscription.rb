module GroSocial
  class Subscription < Model
    ATTRIBUTES = [
      :user_id,
      :subscriptionname,
      :applicationname,
      :extrapagescredits,
      :additionalfanpages,
      :iswhitelabel,
      :nextpaymentdate,
      :expirationdate,
      :status,
      :canceled
    ]

    attr_accessor *ATTRIBUTES

    def save
      options = {
        id: user_id,
        typhoeus: { body: attributes }
      }
      Client.request 'UserSubscriptions', :put, options

      self
    end

    def expirationdate=(value)
      @expirationdate = to_date value
    end

    def nextpaymentdate=(value)
      @nextpaymentdate = to_date value
    end

    def attributes
      to_h ATTRIBUTES
    end

    private

    def to_date(value)
      if value.respond_to? :strftime
      then value.strftime '%Y-%m-%d'
      else value
      end
    end
  end
end
