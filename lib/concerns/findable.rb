module Concerns 
  
  module Findable
    def find_by_name(name) # class method
      # searches the extended class' @@all array for an instance that matches the provided name
      @@all.collect do |m|
        binding.pry
        self.name
      end
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