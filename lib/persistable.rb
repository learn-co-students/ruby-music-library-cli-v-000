module Concerns::Persistable

  module InstanceMethods
    def save  #Instance method
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all #Class method
      self.all.clear
    end

    def count #Class method
      self.all.size
    end
  end
end
