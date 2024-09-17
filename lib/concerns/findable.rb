module Concerns::Findable

  def find_by_name(name)
    all.detect {|item| item.name == name}
  end

  def find_or_create_by_name(name)
    findable = self.find_by_name(name)
    if findable == nil
      return self.create(name)
    end
    findable
  end

end
