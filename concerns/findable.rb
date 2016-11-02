

module Concerns::Findable
  def find_by_name(name)
    self.all.detect { |object| object.name == name }
  end

  def find_or_create_by_name(name)
    result = self.all.detect { |object| object.name == name }
    if result == nil
      self.create(name)
    else
      result
    end
  end
end
