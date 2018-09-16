module Concerns::Findable


  def find_or_create_by_name(name)
    found_object = find_by_name(name)
    if found_object
      found_object
    else
      self.create(name)
    end
  end

  def find_by_name(name)
    self.all.detect {|a| a.name == name}
  end
end
