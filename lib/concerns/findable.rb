module Concerns::Findable #set of behaviors

  def find_by_name(name) # class method
    self.all.detect{|artist| artist.name == name}
  end

  def create(name)
    new = self.new(name)
    new.save
    new
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
     find_by_name(name)
   else
     create(name)
   end
  end

end
