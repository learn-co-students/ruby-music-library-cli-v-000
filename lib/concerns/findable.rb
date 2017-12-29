module Concerns::Findable


  def find_by_name(name)
    all.detect{|item| item.name == name}
  end

  def find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x == nil
      self.create(name)
    else
      x
    end
  end


end
