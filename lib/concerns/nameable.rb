module Nameable
  module ClassMethods
    def create_by_name
      self.new.tap do |o|
        o.name = name
      end
    end
  end
  module InstanceMethods
    def self.create(name)
      new(name).tap{|s| s.save}
    end
  end
  
end
