# will need to use nested modules

module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|index| index.name.eql?(name)}
  end
  
  def find_or_create_by_name(name)
    unless self.find_by_name(name) == nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
end