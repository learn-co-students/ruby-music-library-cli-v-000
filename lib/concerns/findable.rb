module Concerns::Findable

  def find_by_name(item_name)
    all.find{|item| item.name == item_name}
  end

  def find_or_create_by_name(item_name)
    result = self.find_by_name(item_name)
    if result
      result
    else
      self.create(item_name)
    end
  end

end
