module Concerns::Findable
  def find_by_name(named)
    self.all.detect do |i|
      i.name == named
    end
  end

  def find_or_create_by_name(named)
    if self.find_by_name(named) == nil
      self.create(named)
    else
      self.find_by_name(named)
    end
  end

end

#class methods
