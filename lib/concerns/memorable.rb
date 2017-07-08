module Memorable

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      newInst = self.new(name)
      newInst.save
      newInst
    end

  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end

end
