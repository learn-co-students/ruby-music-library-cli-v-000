module Memorable
  module InstanceMethods
   
   def save #instance method
     self.class.all << self 
   end
  end
  
  module ClassMethods
  
  # def count
  #   self.all.size
  # end
 
   def destroy_all
     self.all.clear
   end
  end
end
  
  
    
  #   def initialize
  #     self.class.all << self
  #   end
  # end
  
 