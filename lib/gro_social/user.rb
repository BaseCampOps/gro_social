module GroSocial
  class User
    attr_accessor :id, :firstname, :lastname, :email, :phone, :created,
                  :custom1, :custom2, :custom3, :alertmessage, :password

    def initialize(attributes = {})
      attributes.each do |attr_name, value|
        begin
          self.send(:"#{attr_name}=", value)
        rescue NoMethodError
          next
        end
      end
    end
  end
end