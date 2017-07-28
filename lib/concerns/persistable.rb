module Persistable
  module InstanceMethods
    def save #instance
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all #class method
      self.all.clear
    end

    def count #clas
      self.all.size
    end
  end


end
