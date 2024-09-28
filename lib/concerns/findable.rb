module Concerns::Findable

  def find_by_name(name)
    x = nil
    all.each do |item|
      if item.name == name
        x = item
      end
    end
    x
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
