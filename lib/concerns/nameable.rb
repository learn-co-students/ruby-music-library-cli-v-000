module Concerns::Nameable

  module ClassMethods
    def create(name)
      self.new(name).tap { |o| o.save }
      # o = self.new(name)
      # o.save
      # o
    end
  end

end
