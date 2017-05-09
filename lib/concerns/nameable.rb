module Concerns::Nameable
  module ClassMethods
    def create(name)
      self.new.tap do |o|
        o.name = name
        o.save
      end
    end
  end
end
