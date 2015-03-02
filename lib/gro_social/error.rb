module GroSocial
  class Error < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
      super description
    end

    private

    def description
      json = JSON.parse response.response_body
      json['result']['http_status']['message']
    rescue
      'Indescribable error'
    end
  end
end
