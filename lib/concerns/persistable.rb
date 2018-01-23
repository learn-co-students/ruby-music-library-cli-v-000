module Persistable
  module ClassMethods
    def destroy_all
      self.all.clear
    end
  end
  module InstanceMethods
    def save 
      self.class.all << self
    end
  end
end
