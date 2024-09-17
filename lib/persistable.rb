module Persistable

  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def count
      self.all.size
    end

    def destroy_all
      self.all.clear
    end
  end
end
