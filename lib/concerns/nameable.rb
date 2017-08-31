module Nameable
  module ClassMethods
    def create(name)
      o = self.new(name)
      o.save
      o
    end
  end
end
