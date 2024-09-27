module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|item| item.name == name}
  end

  def find_or_create_by_name(name)
    if self.all.detect {|item| item.name == name}.nil?
      self.create(name)
    else 
      self.all.detect {|item| item.name == name}
    end
  end

end