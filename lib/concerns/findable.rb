module Concerns::Findable
  

  def find_by_name(name)
    self.all.find{|a| a.name == name}
  end
  
  def find_or_create_by_name(name)
     a = self.find_by_name(name)
          return a if a
          a = self.create(name)
  end
  
end