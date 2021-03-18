module Concerns::Findable #set of behaviors

  #uses the .all method defined by the class to find an instance of the class by name.
  def find_by_name(name) # class method
    self.all.detect{|o| o.name == name}
  end

  def create(name)
    new = self.new(name)
    new.save
    new
  end

  #uses the .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found
  def find_or_create_by_name(name)
    if find_by_name(name)
     find_by_name(name)
   else
     create(name)
   end
  end

end
