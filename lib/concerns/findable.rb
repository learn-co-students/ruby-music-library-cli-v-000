module Concerns::Findable

  def find_by_name(name)
    item = self.all.select {|item| item.name == name}
    if item.length() > 0
      item[0]
    end
  end

  def find_or_create_by_name(name)
    item = self.find_by_name(name)
    if !item
      self.create(name)
    else
      item
    end
  end

end
