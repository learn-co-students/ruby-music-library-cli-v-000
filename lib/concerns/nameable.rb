module Nameable
  module ClassMethods
    def create(name)
      self.new(name).tap do |o|
        o.save
      end
    end
  end
end
