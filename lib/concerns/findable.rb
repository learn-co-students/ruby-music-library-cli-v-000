module Concerns::Findable

  def find_by_name(name)
    # returns the first in all array that matches name, else nil
    self.all.detect { |i|  i.name == name }
  end


  def find_or_create_by_name(name)
   # self.create(name) unless self.all.include?(self)
    self.find_by_name(name) || self.create(name)
  end
  
end