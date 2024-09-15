
module Concerns::Findable
  def find_by_name(name)
    all.detect do |instance|
      instance.name == name
    end
  end

  def create(name)
    instance = self.new(name)
    instance.save
    instance
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
