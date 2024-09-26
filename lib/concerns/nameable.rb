module Concerns::Nameable
  module ClassMethods
    def create_by_name(name)
      self.new.tap {|o| o.name = name}
    end
  end
end
