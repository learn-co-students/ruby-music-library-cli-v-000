module Concerns::Findable

  def create_by_name(name)
    x = self.new(name)
    x.name = name
    x
  end

  def find_by_name(name)
    self.all.detect do |x|
      x.name == name
    end
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : create_by_name(name)
  end

end