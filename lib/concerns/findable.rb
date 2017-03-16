module Findable

  def find_by_name(name)
    self.all.detect {|item| item.name == name}
  end

  def find_or_create_by_name(n)
    if self.find_by_name(n) == nil
      self.create(n)
    else
      self.find_by_name(n)
    end
    # binding.pry
  end

end
