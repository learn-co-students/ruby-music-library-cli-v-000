module Concerns::Findable

  def find_by_name(name)
    self.all.find {|elt| elt.name == name}
  end

  def find_or_create_by_name(name)
    if elt = self.find_by_name(name)
      return elt
    else
      return self.create(name)
    end
  end

end
