module Persistable
  module InstanceMethods
    def save
      self.class.all << self #Instance Method // Include
    end
  end

  module ClassMethods
    def all
      self.all
    end
    
    def destroy_all #Class Method //Extend
      self.all.clear
    end

    def count  #Class Method
      self.all.size
    end
  end
end