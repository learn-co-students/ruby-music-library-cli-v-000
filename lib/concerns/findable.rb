module Concerns 
  module Findable
    
    def self.find_or_create_by_name(instance_name)
      if self.all.detect{|a| a.name == instance_name}
        self.all.detect{|a| a.name == instance_name}
      else
        new_instance = self.new(instance_name)
        new_instance
      end
    end
    
    def find_by_name(instance_name)
      self.all.detect{|a| a.name == instance_name}
    end
  
  end
end