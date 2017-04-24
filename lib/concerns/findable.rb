module Findable
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end
  module ClassMethods
    def create(name)
      model = self.new(name)
      model.save
      model
    end
    def destroy_all
      self.all.clear
    end
  end
end
