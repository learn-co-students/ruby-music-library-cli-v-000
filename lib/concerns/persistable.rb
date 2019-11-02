module Concerns::Persistable
  module InstanceMethods
    def save #Instance Method
      self.class.all << self
    end
  end

 module ClassMethods
    def destroy_all#Class Method
      self.all.clear
    end

    def count#Class Method
      self.all.size
    end
  end
end
