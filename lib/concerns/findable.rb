module Concerns::Findable

  def find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def find_or_create_by_name(name)
    self.create(name) if self.find_by_name(name) == nil
    self.find_by_name(name)
  end

end
