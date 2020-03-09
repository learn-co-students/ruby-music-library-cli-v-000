module Namable
  module ClassMethods
    def create_by_name(name)
      self.new.tap do |o|
        o.name = name
      end

      # i = self.new
      # i.name = name
      # i
    end
  end
end
