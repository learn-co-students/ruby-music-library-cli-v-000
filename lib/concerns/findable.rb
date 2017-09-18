module Concerns::Findable

  def find_by_name(name)
    self.all.each do |item|
      if item.name == name
        return item
      end
    end
    return nil
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    end
    self.create(name)
  end

end
