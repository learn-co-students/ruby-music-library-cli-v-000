module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|item| item.name == name}
  end

  def find_or_create_by_name(name)
    result = self.all.detect {|item| item.name == name}
    if result
      return result
    else
      return result = self.create(name)
    end
  end
end