module Memorable

  module ClassMethods
    def create(name)
      instance = new(name)
      instance.save
      instance
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end

end
