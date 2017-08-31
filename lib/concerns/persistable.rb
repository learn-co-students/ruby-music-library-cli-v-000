module Persistable
  module InstanceMethods
    def save #this caused a lot of grief 
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def count
      self.all.size
    end
  end
end
