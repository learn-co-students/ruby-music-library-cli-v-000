module Concerns::Findable 
  
  def find_by_name(name)
  self.all.detect{|find_name| find_name.name == name} 
end 



 def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  
end 