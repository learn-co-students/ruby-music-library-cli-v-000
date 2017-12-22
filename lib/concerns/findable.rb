module Concerns::Findable
    
   def find_by_name(name)
      self.class_variable_get(:@@all).detect {|song| song.name == name}
   end
   
   def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
   end
   
    
end