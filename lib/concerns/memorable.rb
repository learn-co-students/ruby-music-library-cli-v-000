module Memorable
  module ClassMethods
    def destroy_all
      self.all = []
    end

    def create(name)
      obj = self.class.new(name)
      obj.name = name
      obj.save
      obj
    end
  end

  module InstanceMethods
    def initialize(name)
      self.class.name = name
    end

    def save
      self.all << self
    end
  end
end
