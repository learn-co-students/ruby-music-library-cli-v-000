module Concerns::Findable
# remember that modules do not need "self" to define a class method
  def find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
