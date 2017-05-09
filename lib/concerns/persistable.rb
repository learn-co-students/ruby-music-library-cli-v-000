module Concerns::Persistable

  module InstanceMethods
    def save          #Instance Method
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all  #Class Method
      self.all.clear
    end
  end
end
