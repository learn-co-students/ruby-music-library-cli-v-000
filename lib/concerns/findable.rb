module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|instance| instance.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.new(name).tap {|instance| self.all << instance}
    end
  end
end
