module Concerns::Findable
  # Module code here
  module InstanceMethods
  end
  module ClassMethods
  end

    def find_by_name(name)
      self.all.detect{|s| s.name == name}
    end
    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      return found ? found : self.create(name)
    end


end
