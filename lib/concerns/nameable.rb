module Nameable
  module ClassMethods
    def create(name)
      self.new(name).tap{|o|o.save}
    end
  end
end
