module Nameable
  module ClassMethods
    def create_by_name(name)
      self.new.tap do |o| # smaller scope than local variable
        o.name = name
      end
      
      # i = self.new
      # i.name = name
      # i
    end
  end
end
