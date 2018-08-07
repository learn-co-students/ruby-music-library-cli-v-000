module Concerns
  module Findable #Class methods. Findable file nested w/in the concerns folder (typical file organization).
    def find_by_name(name)
      self.all.detect {|n| n.name == name} #Detect will return 1st element from array for which the following block is true. Find (detect) the object whose name matches the name passed into the method.
    end

    def find_or_create_by_name(name) #Use the create and find_by methods I just created above. Either or situation so just use logical or here.
      self.find_by_name(name) || self.create(name) #If name not found, it must be created.
    end
  end

  module InstanceMethods
    def initialize(name)
      @name = name
      @songs = []
    end
  end
end
