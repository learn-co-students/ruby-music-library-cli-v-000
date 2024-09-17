module Concerns::Findable

  def create(name)
    element = new(name)
    element.save
    element
  end

  def find_by_name(name)
    all.detect {|element| element.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
