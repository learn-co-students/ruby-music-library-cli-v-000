module Concerns::Findable
 
 
   def find_by_name(name) 
     self.all.detect {|a| a.name == name}
   end 
  
   def create(name)
     self.new(name).tap do |n|
       n.name = name 
    end
   end
 
   def find_or_create_by_name(name)
      x = self.find_by_name(name)
      if x == nil 
      self.create(name)
    else
     x
    end
   end
   
  #   def alphabetical
  #   self.all.sort_by{|s| s.name}
  # end
   
end

