module Concerns::Findable

  def find_by_name(name)
    self.all.find do |object|
      object.name == name
    end
  end

  def find_or_create_by_name(name)
    instance = self.find_by_name(name)
    if instance == nil
      instance = self.create(name)
    end
    instance
  end
end
