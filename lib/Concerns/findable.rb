module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|p| p.name == name}
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      self.create(name)
    end
  end

  def sort_by_name
    self.all.sort_by{|object| object.name}
  end

end
