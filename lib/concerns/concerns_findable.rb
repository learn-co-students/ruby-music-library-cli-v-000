module Concerns::Findable
   def find_by_name(name)
    thing = []
    self.all.each do |item|
      if item.name == name
        thing << item
      end
    end
    thing[0]
  end
  
  def find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
      else 
        self.find_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
      self.find_by_name(name)
    else
      self.find_by_name(name)
    end
  end
end
end