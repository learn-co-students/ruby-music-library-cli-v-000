#module Nameable
#  module ClassMethods
#    def find_or_create_by_name(name)
#      self.new.tap do |object|
#        object.name = name
#      end
#      # the code above is equivalent to the code below:
#      # object = self.new
#      # object.name = name
#      # object
#    end
#  end

#  module InstanceMethods

#  end


#end
