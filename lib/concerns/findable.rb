module Concerns 
  
  module Findable
    def find_by_name(name) # class method
      # searches the extended class' @@all array for an instance that matches the provided name
    end
    
    def find_or_create_by_name(name) # class method
      # finds an existing instance with the name provided if one exists in @@all array
    end 
  end
  
#  extend Findable::ClassMethods
#  include Memorable::InstanceMethods
#  
#  extend Findable 
#  
#  include Paramable
#  
  
end 