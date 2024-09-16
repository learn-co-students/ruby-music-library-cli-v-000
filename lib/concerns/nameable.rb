module Nameable

  module ClassMethods
    def create(name)
      self.new.tap do |o|
        o.name = name
      end
    end
  end

end
