module GroSocial
  class AuthError < Error
    private

    def description
      'GroSocial credentials not accepted'
    end
  end
end
