module Concerns 
  
module Findable 

    
     def find_by_name(name)
    self.all.find {|a| a.name == name}
    end 
    
    def create(name)
   new_instance= self.class.new(name)
   new_instance.save
   new_instance
   end 
    
    def find_or_create_by_name(name)
     
    if song = self.find_by_name(name)
      song
    else 
      song = self.create(name) 
    end 
  end 
  
end
end 