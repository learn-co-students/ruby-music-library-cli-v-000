module Concerns::Findable
  
 def find_by_name(name)
     all.find do |old_name| 
     old_name.name == name 
    end 
  end 
  
  def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
  end
  

end 

  
