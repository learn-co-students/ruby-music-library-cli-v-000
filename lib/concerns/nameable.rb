module Concerns::Nameable
  module ClassMethods

    def create(name)
      self.new(name).tap do |o|
        o.name = name
      end
    end
    
  end
end
