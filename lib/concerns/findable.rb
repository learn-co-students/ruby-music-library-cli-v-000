module Concerns::Findable
  def find_by_name(name)
    all.find { |a| a.name == name }
  end

  def find_or_create_by_name(name)
    if item = self.find_by_name(name)
      item
    else
      self.create(name)
    end
  end
end
