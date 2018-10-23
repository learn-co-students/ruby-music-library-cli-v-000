module Persistable
  module InstanceMethods
    def save # Instance Method
      self.class.all << self
    end
  end
  
  module ClassMethods
    def self.extended(base) # Hook
      puts "#{base} has been extended by #{self}"
      # Song has been extended by Persistable::ClassMethods
      base.class_variable_set(:@@all, [])
    end
    
    def create(name) # Class Method
      i = self.new(name)
      i.save
      i
    end
    
    def destroy_all # Class Method
      self.all.clear
    end
    
    def count # Class Method
      self.all.size
    end
  end
end