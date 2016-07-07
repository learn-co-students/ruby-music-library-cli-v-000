module Concerns
  
  module ClassMethods
    def find_by_name(name)
      self.all.detect{|a| a.name}
    end
    
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