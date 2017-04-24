module Findable
  module InstanceMethods
    def initialize(name)
      self.name=name
    end
    def save
      self.class.all<<self
    end
  end
  module ClassMethods
    def create(name)
      instance = self.new(name)
      instance.save
      instance
    end
    def destroy_all
      self.all.clear
    end
  end
end
