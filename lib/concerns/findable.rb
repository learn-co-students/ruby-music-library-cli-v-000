module Concerns::Findable

  def find_by_name(name)
    all.detect {|item| item.name == name}
  end

  def create(name)
    item = self.new(name)
    item.save
    item
  end

  def find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
