module Concerns
  
  module Findable
    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create(name) 
      else
        self.find_by_name(name)
      end
    end
  end

  module ClassMethods
    def count
      self.all.count
    end

    def reset_all
      self.all.clear
    end
  end

  module InstanceMethods
    def initialize
      self.class.all << self
    end
  end

end