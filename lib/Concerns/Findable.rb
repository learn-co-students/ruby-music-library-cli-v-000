module Concerns::Findable

  def find_by_name(name)
  self.all.each do |instance|
     if instance.name == name
       return instance
     end
   end
   return false
  end

  def find_or_create_by_name(name)
    output = self.find_by_name(name)
    if output != false
    return output
  else
    self.create(name)
  end
  end

end
