module AllForAll
  
  module InstanceMethods
    def save
      self.class.all << self 
    end
  end
  
  module ClassMethods
  
    def destroy_all
      self.all.clear
    end
    
    def create(name)
      newnew = self.new(name)
      newnew.save
      newnew
    end
  end
end