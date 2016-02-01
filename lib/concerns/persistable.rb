module Persistable
  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def self.extended(base)
      base.class_variable_set(:@@all, [])
    end
    def destroy_all 
      self.all.clear
    end
  end
end
