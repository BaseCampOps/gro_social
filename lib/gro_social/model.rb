module GroSocial
  class Model
    def initialize(attributes = {})
      attributes.each { |name, value| set name, value }
    end

    private

    def to_h(names)
      Hash[names.map { |name| pair name }]
    end

    def pair(name)
      [name, (get name)]
    end

    def get(name)
      public_send name
    end

    def set(name, value)
      name = setter name
      return unless respond_to? name
      public_send name, value
    end

    def setter(name)
      "#{name}="
    end
  end
end
