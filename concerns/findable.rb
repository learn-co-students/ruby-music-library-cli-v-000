module Concerns::Findable

  def find_by_name(name)
    all.detect { |i| i.name == name }
  end

  def create_by_name(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
end