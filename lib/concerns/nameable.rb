module Nameable
  
  module ClassMethods
    def create(name)
      new(name).tap{|x| x.save}
    end
  end
  
  module InstanceMethods
  end
  
end