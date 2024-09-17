module Nameable
  module ClassMethods
    def create_by_name(name)
      self.new.tap do |o|
      o.name = name
    end
  end
end
end
