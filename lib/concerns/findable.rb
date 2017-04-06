module Findable
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def find_by_name(name)
      self.all.detect{|i| i.name == name}
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
    
  end
  module InstanceMethods

  end
end
