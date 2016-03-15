module Concerns::Findable

  def find_by_name(name)
    self.all.find{|instance| instance.name == name}
  end

  def find_or_create_by_name(name)
    instance = self.find_by_name(name)
    instance = self.create(name) if instance.nil?
    instance
  end

end