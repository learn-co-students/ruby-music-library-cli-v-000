

module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|item| item.name == name}
  end

  def find_or_create_by_name(name)
    item = self.find_by_name(name)
    if item == nil
      item = self.create(name)
    end
    item 
  end
end


