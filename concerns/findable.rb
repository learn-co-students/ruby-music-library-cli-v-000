module Concerns::Findable  
  def find_by_name(name)
    return self.all.find{|s| s.name == name}
  end
  
  def find_or_create_by_name(name)
    if self.find_by_name(name) 
      return self.find_by_name(name) 
    else
      return self.create(name)
    end
  end
  
end