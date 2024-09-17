module Persistable
  
  module ClassMethods
    def self.extended(base)
      base.class_variable_set(:@@all, [])
    end
    
    def destroy_all
      self.all.clear
    end
    
    def count
      self.all.size
    end
  end
  
  module InstanceMethods
    def save
      self.class.all << self
    end
  end
  
end