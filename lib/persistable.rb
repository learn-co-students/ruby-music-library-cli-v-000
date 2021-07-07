module Persistable
  module ClassMethods
    def create(name)
      song = self.new(name)
    end

    def count
      self.all.size
    end

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
