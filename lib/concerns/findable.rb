module Concerns::Findable

  def create(name)
    new_instance = self.new(name)
    all << new_instance
    new_instance
  end

  def find_by_name(name)
    all.detect { |a| a.name == name }
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
