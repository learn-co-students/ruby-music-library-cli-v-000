module Memorable
  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      self.new(name).save
    end
  end

  module InstanceMethods
    def initialize(name)
      self.name = name
    end

    def save
      self.class.all << self
    end
  end
end
