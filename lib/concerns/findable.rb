module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|a| a.name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      new_item = self.find_by_name(name)
    else
      new_item = self.create(name)
    end
    new_item
  end

end
