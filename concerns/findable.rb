module Concerns
  module Findable


    def create(name)
      instance = self.new(name)
      instance.save
      instance
    end

    def find_by_name(name)
      self.all.detect { |a| a.name == name }
    end

    def find_or_create_by_name(name)
      instance = self.find_by_name(name)
      if !instance
        instance = self.create(name)
      end
      instance
    end
  end
  
  module InstanceMethods
    
    def save
      self.class.all << self
    end
    
  end
  
end