module Concerns::Findable
  def find_by_name(name)
    self.all.each do |i|
      return i if i.name == name
    end
  end

  def find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.new(name)
    else
      self.find_by_name(name)[0]
    end

  end
end
