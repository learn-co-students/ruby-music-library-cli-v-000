module Persistable
  module InstanceMethods
    def save #instance
      self.class.all << self
    end
  end

  module ClassMethods
    def create(name)
      new(name).tap{|a| a.save}
    end

    def destroy_all #class
      all.clear
    end

  end
end
