module Concerns::Findable
  
  def find_by_name(name)
    self.all.detect{|existing| existing.name == name}
    #binding.pry 
  end
  
  def create_by_name(name)
    new_by_name = self.new(name)
    new_by_name.name = name
    #binding.pry
    @@all << new_by_name
    new_by_name
  end
  
  def find_or_create_by_name(name)
    if self.find_by_name(name) != nil 
      self.find_by_name(name)
    else 
      #self.create_by_name(name)
      self.create(name)
      #binding.pry
    end
  end
  
end