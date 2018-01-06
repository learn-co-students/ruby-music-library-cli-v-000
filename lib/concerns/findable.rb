module Concerns::Findable
  def create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def find_by_name(name)
    self.all.find { |instance| instance.name == name }
  end

  def find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end
end
