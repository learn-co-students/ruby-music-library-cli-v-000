module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|k| k.name.include?(name)}
  end

  def find_or_create_by_name(name)
    if self.all.detect {|k| k.name == name}
      self.all.detect {|k| k.name == name}
    else
      object = self.new(name)
      self.all << object
      object
    end
  end
end
